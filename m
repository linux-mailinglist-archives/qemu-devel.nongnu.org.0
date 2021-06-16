Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54853A92B3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:34:53 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltP8X-0002u8-0U
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltP7i-00023A-Gn
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:34:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:37883
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltP7f-0006lH-IH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:34:02 -0400
HMM_SOURCE_IP: 172.18.0.48:53936.493117200
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.242?logid-1a0be69562734c21bda614a00f904064
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 4FC08280093;
 Wed, 16 Jun 2021 14:33:55 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 1a0be69562734c21bda614a00f904064 for
 dgilbert@redhat.com; Wed Jun 16 14:33:54 2021
X-Transaction-ID: 1a0be69562734c21bda614a00f904064
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH 2/2] tests/migration: fix "downtime_limit" type when
 "migrate-set-parameters"
To: qemu-devel@nongnu.org
References: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
 <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <813111fe-2cd8-4a84-bbcb-56730bf65ef6@chinatelecom.cn>
Date: Wed, 16 Jun 2021 14:33:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
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



在 2021/6/3 22:20, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> migrate-set-parameters parse "downtime_limit" as integer type when
> execute "migrate-set-parameters" before migration, and, the unit
> dowtime_limit is milliseconds, fix this two so that test can go
> smoothly.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   tests/migration/guestperf/engine.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 9e16fa92d2..7c991c4407 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -153,7 +153,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
>                              max_bandwidth=scenario._bandwidth * 1024 * 1024)
>   
>           resp = src.command("migrate-set-parameters",
> -                           downtime_limit=scenario._downtime / 1024.0)
> +                           downtime_limit=scenario._downtime)
>   
>           if scenario._compression_mt:
>               resp = src.command("migrate-set-capabilities",
> 
- ping

this patch fix the downtime_limit setting when guestperf start 
migration, qemu can not accept down_time parameter with float type. when 
running guestperf to test migration, it'll report error.
i think it's resonable for apply this patch

please review，thanks, :) !

-- 
Best regard

Hyman Huang(黄勇)

