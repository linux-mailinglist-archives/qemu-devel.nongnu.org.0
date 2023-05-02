Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A56F472C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrvC-0004nQ-IG; Tue, 02 May 2023 11:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptrvA-0004mu-4t
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:28:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptrv5-0008KG-QQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:28:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so39703555e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683041274; x=1685633274;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d03YR8DaCuNiHMQHUFK3NbQq45SZ5bbruRCwDt6rk0=;
 b=jrdyAZG8cDSG8UqsvpzmT8f8OpquHd9goAoS4AhNn5swxpOCsN2H8s9uAyZp04eopM
 DxLbqTnqR6jlAcUQwVcXSbbwJEBluVZPL8VpeyyM28NvnhEEF697Oh3ClxjIAtKGmwDC
 cFKpzMNI6mg1gKZPJdGAEIC93RKLAeXdJknYCLDdnmc/hsISTvsWbi2g5Pf+KKwCHhRZ
 YVr4FoYFLAs6hMd0s0Gh/5pgXr+nfmVeetb2KuIIC2dsS8fB+FWFVNGsb/+NbTdKQkJF
 nLXT0RMoo4raFJo9AJlgi3pnYCQzGJlBvGYvM53+duofKL5p4BMx0LFhkaGsIN3cJxIy
 edeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683041274; x=1685633274;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5d03YR8DaCuNiHMQHUFK3NbQq45SZ5bbruRCwDt6rk0=;
 b=bBpZQl6h8FcLqtmd+0SRDD+MonmdHB8dyOe9DSuRcUOER1CrNdmZtGmqx8VXO85TsM
 RhjKIYb5YuUV0Lq9nKqRZYjSUryIMtva+ecB66YQWQtYm/N53e+qbGf6rhjkL9YjM118
 NboppQvNfuamKsf2XJP7pvGgSPzxbvbR/jbPdBcHdxsspxZEGvY6OR8fq4TbQC8oxJJD
 PF3zrma2bT03QoQwPFbyixS0H8+tLdJRHuyQdMcapVTK4QfKLee2ogX4IbZvjXokCcfZ
 T20FjqnK4XKPSWOA4X2Wdp4obG/Yqc+aHR8ktkPdH4Xn7qNE198jwpFRkTMCWWaSdNQh
 S85A==
X-Gm-Message-State: AC+VfDwfeyWw0w5hwEy7874ZY6xhjCOP3QlNmTGkSecHNwfoGVIMRCZh
 IHSBf5U4Jm6kqesl1AoLIplVaxfmz6EgDXrJKTwGRw==
X-Google-Smtp-Source: ACHHUZ4MES/byXDudLBIwC2DtVH3cHa40AUHJIesIleLG93oJK8f4meIrgCrsUK66Eusz60+gA3huA==
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id
 m5-20020a7bcb85000000b003f17136dd45mr12393906wmi.30.1683041274309; 
 Tue, 02 May 2023 08:27:54 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003f339b2d06fsm7428351wmi.4.2023.05.02.08.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:27:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58B6B1FFBA;
 Tue,  2 May 2023 16:27:53 +0100 (BST)
References: <20230208192654.8854-1-farosas@suse.de>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/10] Kconfig vs. default devices
Date: Tue, 02 May 2023 16:26:56 +0100
In-reply-to: <20230208192654.8854-1-farosas@suse.de>
Message-ID: <87bkj2u51i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

> v2:
> Applying the feedback received, all small tweaks.
>
> Patch 6 still needs consensus on whether to apply the fix to Kconfig
> or elsewhere. Link to the previous version:
> https://lore.kernel.org/r/461ba038-31bf-49c4-758b-94ece36f136f@redhat.com
>
> changelog:
>
> - patch 1: moved isa-parallel to a build time check like the other
>            patches;
> - patch 3: tweaked commit message;
> - patch 7: removed the default from XLNX_USB_SUBSYS.

I've queued the ARM tweaks to testing/next where I can add a test for it
in the end. I'll leave the x86 stuff for discussion of the more complete
solution that avoids hacky downstream patching.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

