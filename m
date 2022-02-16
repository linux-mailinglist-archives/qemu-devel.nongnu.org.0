Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E54B8271
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:01:26 +0100 (CET)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFFd-0001K3-11
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nKF7Y-0004Rd-Ox
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:53:06 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:57336
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nKF7W-0006oE-7N
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 02:53:04 -0500
HMM_SOURCE_IP: 172.18.0.188:48520.1623726263
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5AE492800BF;
 Wed, 16 Feb 2022 15:52:50 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 7c632eb60100450ba83a55ebb9406208 for
 peterx@redhat.com; Wed, 16 Feb 2022 15:52:53 CST
X-Transaction-ID: 7c632eb60100450ba83a55ebb9406208
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <2b217e9a-8ea0-5972-3abf-d66d75f50756@chinatelecom.cn>
Date: Wed, 16 Feb 2022 15:52:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v15 0/7] support dirty restraint on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1644976045.git.huangy81@chinatelecom.cn>
 <Ygyq5FcRVNa+Lzk+@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Ygyq5FcRVNa+Lzk+@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/2/16 15:42, Peter Xu 写道:
> On Wed, Feb 16, 2022 at 12:13:31PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> v15
>> - rebase on master
>> - drop the 'init_time_ms' parameter in function vcpu_calculate_dirtyrate
>> - drop the 'setup' field in dirtylimit_state and call dirtylimit_process
>>    directly, which makes code cleaner.
>> - code clean in dirtylimit_adjust_throttle
>> - fix miss dirtylimit_state_unlock() in dirtylimit_process and
>>    dirtylimit_query_all
>> - add some comment
> 
> This version overally looks good to me, thanks.
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> 
> Please remember to pick up review-by or ack-by in the future when the content
> didn't change corresponds to the tag. That's not only a way to provide credits
> but also a hint to reviewers so that they can skip patches that they have read
> so as to save time.
> 
> Thanks,
> 
Ok, i'll keep that in mind and thanks for reviewing very much. :)

-- 
Best regard

Hyman Huang(黄勇)

