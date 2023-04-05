Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC056D7E3C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:59:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk3e5-0008AU-TC; Wed, 05 Apr 2023 09:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pk3e3-00089d-P1
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:57:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pk3e2-0006bS-2U
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 09:57:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id p34so20941609wms.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680703067;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NetuLM1YNy+KIDJo2AuRwk1MQSAg78qWWaqODIp3uM=;
 b=STRahmuuUI8KQBpKkK6/PybRdBaAfHp1W+GWkva9949DvsniQ47A/YBs4/K6otGmIQ
 A7oHq5QZml8oDY9OkaJYXNIDicXknAlahrTy0t885QBs0Lt5BGqY/X1A5hzP+3cG4jyG
 hqExCPaaG4YfjYDF2Lvk4KZCMdUASYLq+3mofYtWUXbekaC+KANqj/gZ2+SaWy51z2Gx
 IK4y7wRVW/r+5NSnoD08WImnjxGuzAjZRzafDn3YXT4lhfyMCg0hk6YePHsX9rGEZ0yO
 5bbeqBjbAXiB4zUJZFVItGQ8ztZK7Dl/a/IVEwL731YIWMclVzlyNQOD4tFezaYuIqhf
 O8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680703067;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7NetuLM1YNy+KIDJo2AuRwk1MQSAg78qWWaqODIp3uM=;
 b=4e+XKFFrALoiqjhtq717UuAbNifxMfwVcusjxbcgwwN5oalCJvKQMxgzHM8TOq73wF
 Vl5pRQdyPfINeTHhYmOyV5sjchUX5K0SZq80k/xTxhGG0k6LfwjvdqjizNzrCyfmvlqO
 moOFO89b4yfbsQbarh7m2BfQeJql8OUE688Luou2UrZ5t3kBLUzk6u/AhccQjUJ4EnDm
 Aw2Uff2EA8674o1pIJfCCSGPX/naVR4bvMhNuwx8MmWUSqEw3v3HVX/EM3DsnKGt57Ds
 /DQwMGuDZZSAGw36/kvBzb4FwBxaiJEDI07CABTtmMe2O3sgf213fSGQ/UsVzCmu57N0
 9FkA==
X-Gm-Message-State: AAQBX9ekeY5WCgi9Yl3b8GxSs742H3knwNe7FBpi9iC2CmAmX+fERzrc
 5oumhWdIT0uqtciZ0jdwal2gDg==
X-Google-Smtp-Source: AKy350amvRA+LsVe3Qrc1qOw8K7TS5SLWtfzWAgqhDokCIDVgX46fW59a21dzTrAyh+jdrLxrPgnHA==
X-Received: by 2002:a1c:e916:0:b0:3f0:4f83:22f4 with SMTP id
 q22-20020a1ce916000000b003f04f8322f4mr4568690wmc.20.1680703067664; 
 Wed, 05 Apr 2023 06:57:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a7bc3cc000000b003ee42696acesm2281079wmj.16.2023.04.05.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:57:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0D531FFB7;
 Wed,  5 Apr 2023 14:57:46 +0100 (BST)
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-10-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org, Reinoud Zandijk
 <reinoud@netbsd.org>
Subject: Re: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Date: Wed, 05 Apr 2023 14:55:41 +0100
In-reply-to: <20230405101811.76663-10-philmd@linaro.org>
Message-ID: <874jpul9d1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> g_malloc0() can not fail. Use g_try_malloc0() instead.
>
> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#g=
lib-Memory-Allocation.description
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/nvmm/nvmm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 3c7bdd560f..45fd318d23 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
>          }
>      }
>=20=20
> -    qcpu =3D g_malloc0(sizeof(*qcpu));
> +    qcpu =3D g_try_malloc0(sizeof(*qcpu));
>      if (qcpu =3D=3D NULL) {
>          error_report("NVMM: Failed to allocate VCPU context.");
>          return -ENOMEM;

Why - if we fail to allocate the vCPU context its game over anyway any
established QEMU practice is its ok to assert fail on a malloc when
there isn't enough memory. IOW keep the g_malloc0 and remove the error
handling case.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

