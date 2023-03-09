Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC456B27A7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHXB-0004YI-31; Thu, 09 Mar 2023 09:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paHX2-0004Vv-II
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:46:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paHWz-0000fl-90
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:46:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so3761834wmb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678373167;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6MkCoRNlpy9D0RnanYFnTwYvFUOTcywSy3+75wLfc4=;
 b=k7egjx0X1jrh0KzMaraa7HljID6vc8LsvX0DP4FteF/fB/EgbwTn854dHWhfGyNV3f
 oBWEsKeQNAIMAON0/3dTlTnzveiellW5hriTjQl5eIqzluMndGmMAmQVeOLfpl3l8zyG
 OqxEHaAOMQeeG+7oatzJeCGk3c2+l6G15vnvFcYSLVDOjgBMnlAIfdjcah0DdGe+3cA7
 tWmZZCGZlTNNI8fNboSAvd/F3CItlevl+Y8L9SKpAVts2LDuB0ikYN0iBIDFxo7nkhH7
 phlKdaIXOwF99/TiTy7c4yz1zNCUj3KrKglkRXMN2Cz2nTFQGZ5K9WDV7G1YWojQTV5O
 SL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373167;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A6MkCoRNlpy9D0RnanYFnTwYvFUOTcywSy3+75wLfc4=;
 b=xf6B7/5fpVBtm1LlrzsDAq3F0nyqZlvGyXaO9YjN18HpMpeDAofW3m76L3Hci/Ja7s
 6pfZpfhJCVtnwDpTbkYCEcamn2Op4sPiWeFL4n8D07FoW2W8BMeycnFhldUxJZBle67P
 kAOFNS47H1GqY+cLtfuecg2BY8l+4xbC5Vtm0LHWIe6CowxFgnSzgpfMDZRkCXiunN2X
 FoCkHTWQfqVdFtMUFkIMaEERj4jLcrKAVWoOTAXksfEfUBj5LET2kmTF9JdAYX17vjOY
 TAnx9KSYABhIXO3EvWbl3KhUbpo5NHPVtCACEHQPuHiWA6l6Mx+gyClylLxyvXiyQC8I
 6wbg==
X-Gm-Message-State: AO0yUKWaBozYCJ+cnpZHL3wLgdksJcziU+526roESm3rLESxod08GN56
 dSAi4tLoV+lxdVo5SctHu6nMGQ==
X-Google-Smtp-Source: AK7set/RbvILAbxF0NeS9sc1kYm0zPIlveZPJp80JrylgL0VVujDHAlGivBjcQF571UdtONdyU4dpw==
X-Received: by 2002:a05:600c:468e:b0:3eb:2de8:b72a with SMTP id
 p14-20020a05600c468e00b003eb2de8b72amr18999426wmo.7.1678373167111; 
 Thu, 09 Mar 2023 06:46:07 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm18114870wrm.67.2023.03.09.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:46:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75C181FFB7;
 Thu,  9 Mar 2023 14:46:06 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-4-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 3/8] plugins: add id_to_plugin_name
Date: Thu, 09 Mar 2023 14:45:51 +0000
In-reply-to: <20221213213757.4123265-4-fasano@mit.edu>
Message-ID: <87r0tym18x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Andrew Fasano <fasano@mit.edu> writes:

> From: Elysia Witham <elysia.witham@ll.mit.edu>
>
> Plugins will pass their unique id when creating callbacks to
> ensure they are associated with the correct plugin. This
> internal function resolves those ids to the declared names.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  plugins/core.c   | 12 ++++++++++++
>  plugins/plugin.h |  2 ++
>  2 files changed, 14 insertions(+)
>
> diff --git a/plugins/core.c b/plugins/core.c
> index 5fbdcb5768..6a50b4a6e6 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -248,6 +248,18 @@ int name_to_plugin_version(const char *name)
>      return -1;
>  }
>=20=20
> +const char *id_to_plugin_name(qemu_plugin_id_t id)
> +{
> +    const char *plugin =3D plugin_id_to_ctx_locked(id)->name;
> +    if (plugin) {
> +        return plugin;
> +    } else {
> +        warn_report("Unnamed plugin cannot use QPP, not supported in plu=
gin "
> +                    "version. Please update plugin.");
> +        return NULL;
> +    }
> +}
> +

I don't see this function being used in this series.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

