Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0D539350
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:48:46 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3Ar-0006zb-1U
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nw39d-00062d-T1
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:47:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nw39b-0007Hp-N9
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:47:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id r129so2881641wmr.3
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XEghIOWS/SpUWzYSR8ao8AiWDacwRBzOQZVfxKvO904=;
 b=KPDmvRkNQA3yg6lrRyKvAk+PXL8Sez1LbJ4G5zjubq1CcW9/Epz6qDDiCJoZEZin2S
 NyNtRQYHQr5esKApWogzuRvTDc4BpvqXCqofBPM6gudku0ias4zFMg63giij8S87+ynM
 iTiRXUZZJjMm2dy67Owr9CpSNnooMc5h35fmz8qJ0BCTLtVsKX1lqKGXv+Whcz1ScCtA
 6fshzkCAqQWdisZv3yBvs66xcd90Y82oLgvtsikA+PZ0MnGrDWJsZXPNvfYW8K0Le36P
 8qC6gQybxu37IJWw4iATAMcY2UlNgNmvH4FVJ+j4MT0uELaRg0i2ajTkHQOwtW2gbmiy
 VIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XEghIOWS/SpUWzYSR8ao8AiWDacwRBzOQZVfxKvO904=;
 b=kcfHhPiQTEIz1xS0cVLpb/ZCi9MLcWRS9StSWrm/XIu8zg7TkIV1+8TjtF13ggCeMs
 27gr4qjs5EX9pnO8PEXDj2Hy5mjGUKGUXHOKzvtUINa1fYeRKIXC3RsH8Ag8fr4PE0Ku
 ZuUQ6FUPY220F1+cb8KSKDuWUQ5ToQ01KLRhUNG300uTZp0Xa0JcbrjRqukhUrqlZNzd
 iywNaRnCc9fm/D59eqzmkW1dq0fgSDpAhdh60SUhO0nH9AfLxTp0a5wuGdBBCl00R6S6
 vvAI9IrVIkbE6viU47//8j/i0EtmjzLb2jCklgHihkVgFp/0+qFoxjy8+VXHP6qI5hHl
 dX/g==
X-Gm-Message-State: AOAM532mq2JLYeEyicGYNUq15vt7nEuRuaEA9tweZivs0DTODtvhaDZV
 eFpI97eQ0CltFXmAuL3ggE5D4hmkiL9WuQ==
X-Google-Smtp-Source: ABdhPJzlrAlmb8qP25VV/9WNgC6201ircg2FK1PYovyYF50UmAm4F4LwRW33tW8Fnmyahcx1cdOdGQ==
X-Received: by 2002:a05:600c:3ac3:b0:399:323:3a8d with SMTP id
 d3-20020a05600c3ac300b0039903233a8dmr10620031wms.101.1654008445145; 
 Tue, 31 May 2022 07:47:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056000168400b0020fd392df33sm11659112wrd.29.2022.05.31.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 07:47:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88DC21FFB7;
 Tue, 31 May 2022 15:47:23 +0100 (BST)
References: <20220525125540.50979-1-changpeng.liu@intel.com>
User-agent: mu4e 1.7.25; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Changpeng Liu <changpeng.liu@intel.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized variable
Date: Tue, 31 May 2022 15:45:57 +0100
In-reply-to: <20220525125540.50979-1-changpeng.liu@intel.com>
Message-ID: <87ee09wyh0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Changpeng Liu <changpeng.liu@intel.com> writes:

> Variable `vdev` in `struct vhost_dev` will not be ready
> until start the device, so let's not use it for the error
> output here.

This seems to be one of the areas where vhost_user_backend_dev_init and
vhost_dev_init do things differently. Is there any particular reason why
we couldn't initialise hdev->vdev consistently at init time?

>
> Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when suppo=
rted")
>
> Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
> ---
>  hw/virtio/vhost-user.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index b040c1ad2b..0594178224 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2031,18 +2031,16 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque,
>          if (supports_f_config) {
>              if (!virtio_has_feature(protocol_features,
>                                      VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                error_setg(errp, "vhost-user device %s expecting "
> +                error_setg(errp, "vhost-user device expecting "
>                             "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-u=
ser backend does "
> -                           "not support it.", dev->vdev->name);
> +                           "not support it.");
>                  return -EPROTO;
>              }
>          } else {
>              if (virtio_has_feature(protocol_features,
>                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
>                  warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
> -                                 "device %s but QEMU does not.",
> -                                 dev->vdev->name);
> +                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU =
does not.");
>                  protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_C=
ONFIG);
>              }
>          }


--=20
Alex Benn=C3=A9e

