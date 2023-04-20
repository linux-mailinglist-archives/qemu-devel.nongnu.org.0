Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E86E9805
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:06:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVpw-0005O9-OI; Thu, 20 Apr 2023 11:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVpm-0004xV-Bf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:04:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVpi-00058H-8J
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:04:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso3212389wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682003061; x=1684595061;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXNgiLAdjhZrxeJy7+uY3Jku8v8PpI9N0AslL6ih2cs=;
 b=elXseRyqeMjazOLSKwv3TZHRMMUwc+eaKcn38mj+j46F7GOKN0q4kAut76W/EyYg/r
 3UYGPfGHyx3D0eA4PYHRx2PNB8hvs9fMrSKABfj4I339AOGtAWwnFgs4T6SwPQMR44wC
 /+QUVKAaqIpD7/v4AVx9jlp4a8ZxSCpmoKhNanXMGvMz8MpuMa/UFoxubDbufsiTaVKu
 CiqotEQcRyqPSIzq+upW1tXbJyyTlhxi6Dcl67kGPauVGsHVGXwyXqr2UnDD0wp068+9
 qOYCZ3jnn1dfl6z7j16bC+4G1s8naOyqOyFLAmgvNlv6rHgHs8CyfAmVGVmGpJ/NnuC1
 Eo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003061; x=1684595061;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CXNgiLAdjhZrxeJy7+uY3Jku8v8PpI9N0AslL6ih2cs=;
 b=SZwrtsYRoSMCRiUFb/4qqGXSzKHMkAGArZU5joe/Eh2Dn5IrkmornhNN67bSG3vXWf
 /sR07lI55bG41D2cJBYB5zbA93afP6Ygnrb9neyGG9edCjo0zNsFkUrQAdESPVPwbWiG
 D3ocEt8n1JZhAvC2HgLV/8ZpVefnSgE8uUSX+bOvEVWqEnvpdXIY5rTSR97OuXqrRjvi
 OSZV+xdcqcGpcE9YXv2V94CBVOwKvdJNM5ix9hpBryPP2tyCWI4Qv+8+vltTsw84v+Vb
 mvBT1R2btmgXmppSBiwlHZ/WxSERgyr2Ksbu39mYS7UutYcFb1t5WgoE2VeKjleeQzKv
 adng==
X-Gm-Message-State: AAQBX9d2/WsN19cgszu0Ye0qUq7Cfh/EL00OwbFNWhhXF4GwjLe2yIcT
 DN8EeRhHPEXTQL37UlWnuyPdQUDSI9HPEfsa6ZI=
X-Google-Smtp-Source: AKy350br3FyWOPdkiqX2rHsg2QH7DtCBKfQRy/mnYHwlSBfLoWE5aFN2tiUpWoCvVfRqGzbJvmJTLA==
X-Received: by 2002:a05:600c:378b:b0:3ee:6cdf:c357 with SMTP id
 o11-20020a05600c378b00b003ee6cdfc357mr1408447wmr.20.1682003060841; 
 Thu, 20 Apr 2023 08:04:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003f16932fe7dsm5742715wmq.38.2023.04.20.08.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:04:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16BB81FFB7;
 Thu, 20 Apr 2023 16:04:20 +0100 (BST)
References: <20230419163457.17175-1-quintela@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add Juan Quintela to developer guides review
Date: Thu, 20 Apr 2023 16:04:14 +0100
In-reply-to: <20230419163457.17175-1-quintela@redhat.com>
Message-ID: <87bkjid28b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Juan Quintela <quintela@redhat.com> writes:

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c2068ea5c..24154f5721 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -70,6 +70,7 @@ R: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  R: Thomas Huth <thuth@redhat.com>
>  R: Markus Armbruster <armbru@redhat.com>
>  R: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> +R: Juan Quintela <quintela@redhat.com>
>  W: https://www.qemu.org/docs/master/devel/index.html
>  S: Odd Fixes
>  F: docs/devel/style.rst

Queued to docs/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

