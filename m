Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CA4E4BFC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 06:01:40 +0100 (CET)
Received: from localhost ([::1]:40908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWt7q-000341-UF
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 01:01:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nWt5d-0001r2-8C
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 00:59:21 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:54534
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nWt5b-0001Ak-1R
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 00:59:20 -0400
HMM_SOURCE_IP: 172.18.0.48:50320.1667362596
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A8E4A2800A6;
 Wed, 23 Mar 2022 12:59:04 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 996d344867a84d0798a992201e810c8a for
 wucy11@chinatelecom.cn; Wed, 23 Mar 2022 12:59:08 CST
X-Transaction-ID: 996d344867a84d0798a992201e810c8a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <70f26e05-1db7-2bb4-9b8d-8dc6869c7256@chinatelecom.cn>
Date: Wed, 23 Mar 2022 12:59:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/5] kvm,memory: Optimize dirty page collection for
 dirty ring
To: wucy11@chinatelecom.cn, qemu-devel@nongnu.org
References: <cover.1648002359.git.wucy11@chinatelecom.cn>
 <1c2c18ab43ec43959c3464d216e6a3144b802a53.1648002360.git.wucy11@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <1c2c18ab43ec43959c3464d216e6a3144b802a53.1648002360.git.wucy11@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: tugy@chinatelecom.cn, David Hildenbrand <david@redhat.com>,
 yuanmh12@chinatelecom.cn, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 yubin1@chinatelecom.cn, dengpc12@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>, baiyw2@chinatelecom.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/3/23 11:18, wucy11@chinatelecom.cn 写道:
> From: Chongyun Wu <wucy11@chinatelecom.cn>
> 
> When log_sync_global of dirty ring is called, it will collect
> dirty pages on all cpus, including all dirty pages on memslot,
> so when memory_region_sync_dirty_bitmap collects dirty pages
> from KVM, this interface needs to be called once, instead of
> traversing every dirty page. Each memslot is called once,
> which is meaningless and time-consuming. So only need to call
> log_sync_global once in memory_region_sync_dirty_bitmap.
> 
> Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
> ---
>   softmmu/memory.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 8060c6d..46c3ff9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2184,6 +2184,12 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
>                */
>               listener->log_sync_global(listener);
>               trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
> +            /*
> +             * The log_sync_global of the dirty ring will collect the dirty
> +             * pages of all memslots at one time, so there is no need to
> +             * call log_sync_global once when traversing each memslot.
> +             */
> +            break;
To the code logic itself, if a listener does not implement the 
log_sync_global callback, it never go there. If not, it should not break 
because we never know which callback is what dirty ring want.
IMHO, maybe the modification should remove from the common logic and 
implemented somewhere else, i havn't think it through yet.
>           }
>       }
>   }

-- 
Best regard

Hyman Huang(黄勇)

