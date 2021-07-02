Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33403BA3D6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 20:07:58 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzNa1-000756-3W
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 14:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lzNYw-0006HY-U9; Fri, 02 Jul 2021 14:06:52 -0400
Received: from relay68.bu.edu ([128.197.228.73]:35153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lzNYv-0008GW-5d; Fri, 02 Jul 2021 14:06:50 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 162I60eq023758
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 2 Jul 2021 14:06:03 -0400
Date: Fri, 2 Jul 2021 14:06:00 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] hw/sd: When card is in wrong state, log which state
 it is
Message-ID: <20210702180600.3lstch3cqoi55iwe@mozz.bu.edu>
References: <20210702155900.148665-1-f4bug@amsat.org>
 <20210702155900.148665-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702155900.148665-2-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Michael Olbrich <m.olbrich@pengutronix.de>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210702 1758, Philippe Mathieu-Daudé wrote:
> We report the card is in an inconsistent state, but don't precise
> in which state it is. Add this information, as it is useful when
> debugging problems.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  hw/sd/sd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 282d39a7042..d8fdf84f4db 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1504,7 +1504,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          return sd_illegal;
>      }
>  
> -    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
> +    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
> +                  req.cmd, sd_state_name(sd->state));
>      return sd_illegal;
>  }
>  
> -- 
> 2.31.1
> 

