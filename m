Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C725D5BEC6F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 19:58:51 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahWE-0004Vm-8B
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 13:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oadVr-0002NO-JW
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:42:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oadVp-0005de-AI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=r+ZXMros/GAAUAGQOejXBCxsHU3SmHV1uY4yX1bvEvU=; b=kWzxGz6zZm/KYcJ9eIt3Uuti7S
 QKbmwIlLjFE+IU84TGEOhD1JynO6/8PnLDDa03h+XUDPCvfEjct4/Nsqj/+8Iwd+Hfyx2LQQjgV9m
 /4O9XU70fQh+bHAXidv6hk1Xa6eRxol8t/mB1T1y3Qhddfht5uoomTSn4rhJJjYdcqRDQoYf6u/DA
 1HShDR3PkYllVeMDk9Gtb77F8TgNNt2BpHhyBcv+lFmhhlSJmdI6jFo9E4dfGbBH5lrBUVD/X/teC
 n88wd0pOKKtKP352VJ3HKFteEhzS6z9Im8VdvVFURPEw3pvGR1AGW+06mfyhjywxAr7HQsH131z+g
 f7jwTyy0FqYAyyZs/0TOUh7S9YvBmdO3F/zcmZo6z27b3YN8rRPf4euDdKEsTChuSssUYkzDsi+Sj
 XAK86ECYCkn/3h+TuDphHpjDS1smiw3U04XJZ7vH7fsHO1UU04rxnj1vOZ4OWLGlMp/nQNLuFVMht
 VotqzEKGRgB5q2lK1d2eCbY88ByA1rgjrz/m9fE3JNKvRfy2eJFl9bqV53z+v2wl8H0Rx0rHhtMX+
 ms33QfnY34cucD6XXEZbpB0f321hN0+x7FPgsxs1gXzbDcjzaKitfDydPLtnJsn7P3ok1PC89cmRR
 7vOIAhl0oiIAN1YOh4iTL659zfHt9AFW7Y75vUc60=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 09/39] fsdev/virtfs-proxy-helper: Use g_mkdir()
Date: Tue, 20 Sep 2022 15:42:04 +0200
Message-ID: <2671892.QiIBn78v1A@silver>
In-Reply-To: <20220920103159.1865256-10-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-10-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Dienstag, 20. September 2022 12:31:29 CEST Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_mkdir() to create a directory on all platforms.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> 
> Changes in v2:
> - Change to use g_mkdir()
> 
>  fsdev/virtfs-proxy-helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 2dde27922f..5cafcd7703 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -10,6 +10,7 @@
>   */
> 
>  #include "qemu/osdep.h"
> +#include <glib/gstdio.h>
>  #include <sys/resource.h>
>  #include <getopt.h>
>  #include <syslog.h>
> @@ -639,7 +640,7 @@ static int do_create_others(int type, struct iovec
> *iovec) if (retval < 0) {
>              goto err_out;
>          }
> -        retval = mkdir(path.data, mode);
> +        retval = g_mkdir(path.data, mode);
>          break;
>      case T_SYMLINK:
>          retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);




