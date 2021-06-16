Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF53A9261
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:28:34 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltP2O-0000lR-S7
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltP12-0008TC-O7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:27:08 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:55676
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltP0z-0002U6-Ih
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:27:08 -0400
HMM_SOURCE_IP: 172.18.0.218:36190.76432716
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.242?logid-b2513e812f98422aa1aff9052a1fb307
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8A3EB28010C;
 Wed, 16 Jun 2021 14:26:47 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id b2513e812f98422aa1aff9052a1fb307 for
 dgilbert@redhat.com; Wed Jun 16 14:26:47 2021
X-Transaction-ID: b2513e812f98422aa1aff9052a1fb307
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH 1/2] tests/migration: parse the thread-id key of
 CpuInfoFast
To: qemu-devel@nongnu.org
References: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <7ca552b7-4011-0d3e-6e0f-332794bb0db7@chinatelecom.cn>
Date: Wed, 16 Jun 2021 14:26:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/3 22:19, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> thread_id in CpuInfoFast is deprecated, parse thread-id instead
> after execute qmp query-cpus-fast. fix this so that test can
> go smoothly.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   tests/migration/guestperf/engine.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 208e095794..9e16fa92d2 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -113,7 +113,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>           vcpus = src.command("query-cpus-fast")
>           src_threads = []
>           for vcpu in vcpus:
> -            src_threads.append(vcpu["thread_id"])
> +            src_threads.append(vcpu["thread-id"])
>   
>           # XXX how to get dst timings on remote host ?
>   
> 

- ping

this patch fix thread_id so that guestperf can run successfully

please review, thanks : ) !

-- 
Best regard

Hyman Huang(黄勇)

