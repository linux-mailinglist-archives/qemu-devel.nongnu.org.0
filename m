Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5C569F79
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 12:20:19 +0200 (CEST)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9OcM-0004dP-Gn
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 06:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o9OZM-0003kC-VP; Thu, 07 Jul 2022 06:17:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:32759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.gao@intel.com>)
 id 1o9OZK-0005HF-Ee; Thu, 07 Jul 2022 06:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657189030; x=1688725030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=13Nq2C2Rkle5/rl12xTGb+ANrD53a9pZ7Uvg6TOkznA=;
 b=ar08qND6R0pb1/CvVqE954p51j4FswaBcTtFVzIwd7tr1IluyDblXCTT
 Z2JmU9UWOMSosydJ7JJzjuwv50Fplb5tHs2jK8UOSC2tWOZS5BCH/6moS
 ZyUyvBC96Np0/DALxRaRWdhIB/fJaeEy35FMQzeQ4auR9w7RWLmjMSRuc
 lP+j4a9M/urjnJgJI5ns+PTtjNfXHyLADpMcWo3P7h8lsnwc/k/45zFrh
 L3kwC39GBjPSTbaS7hsnizUAg6E/zwV3/VDE1LjozIxcJ+Sy7/31diRwX
 gQXs7UkWAbO4U+SkM7euRjEkqMGN/3rBj2hyOoE+nWbDHQ0s0Xn8HX66e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="264403636"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="264403636"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 03:17:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="651077083"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 03:17:05 -0700
Date: Thu, 7 Jul 2022 18:16:48 +0800
From: Chao Gao <chao.gao@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC v1] util/aio: Keep notification disabled as much as possible
Message-ID: <20220707101641.GA5461@gao-cwp>
References: <20220701091348.215320-1-chao.gao@intel.com>
 <YsV5IYtyaqKoqRZ5@stefanha-x1.localdomain>
 <20220706141208.GA9972@gao-cwp>
 <Ysahl6A7ZDyt7TFX@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysahl6A7ZDyt7TFX@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chao.gao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 10:04:23AM +0100, Stefan Hajnoczi wrote:
>
>Does this patch solve the issue? The idea is to defer
>poll_set_started(false) for as long as possible.

Good idea! It is straightforward.

>
>diff --git a/util/aio-posix.c b/util/aio-posix.c
>index 731f3826c0..536f8b2534 100644
>--- a/util/aio-posix.c
>+++ b/util/aio-posix.c
>@@ -591,12 +591,6 @@ static bool try_poll_mode(AioContext *ctx, AioHandlerList *ready_list,
>             return true;
>         }
>     }
>-
>-    if (poll_set_started(ctx, ready_list, false)) {
>-        *timeout = 0;
>-        return true;
>-    }
>-
>     return false;
> }
>
>@@ -657,6 +651,11 @@ bool aio_poll(AioContext *ctx, bool blocking)
>      * system call---a single round of run_poll_handlers_once suffices.
>      */
>     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
>+        if (poll_set_started(ctx, &ready_list, false)) {
>+            timeout = 0;
>+            progress = true;

In this case, is it ok to skip the call of ->wait() below? If yes, maybe put
the call in the "else" path.

>+        }
>+
>         ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
>     }
>

Anyway,
Reviewed-by: Chao Gao <chao.gao@intel.com>

And my tests show your change works well. The number of notifications is
significantly reduced from ~80K/s to tens.

Tested-by: Chao Gao <chao.gao@intel.com>

