Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F86D90D0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 09:55:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKRr-0004Wp-B1; Thu, 06 Apr 2023 03:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkKRp-0004Wd-Fs
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:54:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkKRn-0005MK-Ne
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 03:54:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id h17so38564099wrt.8
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680767657;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGV4tozpuEk7VdzN/GQK99VKnoWs55uKd7KcB0u28rw=;
 b=NrelfUivsclA2Wa67d5YwMWttb6wDH13JdXlI+7IkbCRbZr+i70LhxmtJ1+3+X5/oi
 +cLdOWh8y1bzDmIJMLue3p0CUdBIuEXHFz71Ft9P6kWFXFJGjKKvLwQRh7I/+1ZSlWxr
 47HATfZCSFM+xEwlnfZgrzoAkd6bzzSnm1SNRXQXZ13G8g/Cz/6uu+tmit6dxMEdtvFD
 NaeoKttVC4sJV7waSVFZtDYtmuPCvEZFHYsiSDdac6ZpDXNFG350gB667yeLs2JTMp40
 U8ipSwC/oBobZhpAp52FyeK3CAiccU9zru5Ef9wd0cWC9OmhKDuoQdVYN4reQnDoOrWc
 Anug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680767657;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rGV4tozpuEk7VdzN/GQK99VKnoWs55uKd7KcB0u28rw=;
 b=wUjTdCiLQw1w37aO0yBe2hv4OyX2suWJdBUfYelR/cwf+BDOv6zAV9mwgbHVBXq49Y
 0QsPty7OzisY+xaB7lwkEzbVSRYy8MCYdGmXvuzFjNBFR9Fxa1olcDXM+5iFFn9y6MVP
 Je6AoekmGrC5xrB3jXuuQgmfBFpb8HlafsQx5BrPY+4Jt7AGoijKyHOFM8U9P+hzeqhq
 uMBjwCspCyVUhU526i7IUrIEhdPLBuDcrUPA1daEd3sD/FHSX663b8EnFG/0lwMd7B7E
 JvaJPiQuN8o5ywlybB3BHMdig7BULluAZG9EkhHpK0juQopJchOdml7MZHtg1YtozkqP
 zjZg==
X-Gm-Message-State: AAQBX9dt3aq4OILnqeXM+e3iJj8wZnuyOEc/+GtL3d5y7wCZZ60Y/igS
 XMi1QkaETTOfM+HbsHHp21aNUw==
X-Google-Smtp-Source: AKy350adhXlCLmXj6RJxtl31O2B3/idAhbc1kIyxTLWvJsK4XpTdwo4AeaBTdvYQav9Oc9iARbiZWQ==
X-Received: by 2002:adf:db81:0:b0:2ce:a093:6fd3 with SMTP id
 u1-20020adfdb81000000b002cea0936fd3mr6276678wri.16.1680767656997; 
 Thu, 06 Apr 2023 00:54:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002c55ec7f661sm1024731wru.5.2023.04.06.00.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 00:54:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DFD61FFB7;
 Thu,  6 Apr 2023 08:54:16 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-2-fei2.wu@intel.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fei Wu <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, erdnaxe@crans.org,
 ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] accel/tcg/plugin: export host insn size
Date: Thu, 06 Apr 2023 08:46:35 +0100
In-reply-to: <20230406022751.757980-2-fei2.wu@intel.com>
Message-ID: <87v8i9jviv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


Fei Wu <fei2.wu@intel.com> writes:

> The translation ratio of host to guest instruction count is one of the
> key performance factor of binary translation. TCG doesn't collect host
> instruction count at present, it does collect host instruction size
> instead, although they are not the same thing as instruction size might
> not be fixed, instruction size is still a valid estimation.

I'm not so sure about exposing this information to plugins because we
try to avoid leaking internal implementation details to plugins. Aside
from that the very act of instrumenting will increase the size of the
target buffer.

If your aim is to examine JIT efficiency what is wrong with the current
"info jit" that you can access via the HMP? Also I'm wondering if its
time to remove the #ifdefs from CONFIG_PROFILER because I doubt the
extra data it collects is that expensive.

Richard, what do you think?

>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>  accel/tcg/plugin-gen.c       | 1 +
>  include/qemu/plugin.h        | 2 ++
>  include/qemu/qemu-plugin.h   | 8 ++++++++
>  plugins/api.c                | 5 +++++
>  plugins/qemu-plugins.symbols | 1 +
>  5 files changed, 17 insertions(+)
>
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 5efb8db258..4a3ca8fa2f 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -881,6 +881,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const DisasCo=
ntextBase *db,
>          ptb->haddr2 =3D NULL;
>          ptb->mem_only =3D mem_only;
>          ptb->mem_helper =3D false;
> +        ptb->host_insn_size =3D &db->tb->tc.size;
>=20=20
>          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>      }
> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> index bc0781cab8..b38fd139e1 100644
> --- a/include/qemu/plugin.h
> +++ b/include/qemu/plugin.h
> @@ -151,6 +151,8 @@ struct qemu_plugin_tb {
>      /* if set, the TB calls helpers that might access guest memory */
>      bool mem_helper;
>=20=20
> +    uint64_t *host_insn_size;
> +
>      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>  };
>=20=20
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 50a9957279..2397574a21 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -336,6 +336,14 @@ void qemu_plugin_register_vcpu_insn_exec_inline(stru=
ct qemu_plugin_insn *insn,
>   */
>  size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
>=20=20
> +/**
> + * qemu_plugin_tb_n_insns() - query helper for host insns size in TB
> + * @tb: opaque handle to TB passed to callback
> + *
> + * Returns: address of host insns size of this block

If we went ahead with this we need to be very clear when you can call
this helper because the data will only be valid at certain points (which
is another argument against this).

> + */
> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb);
> +
>  /**
>   * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
>   * @tb: opaque handle to TB passed to callback
> diff --git a/plugins/api.c b/plugins/api.c
> index 2078b16edb..0d70cb1f0f 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -188,6 +188,11 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plug=
in_tb *tb)
>      return tb->n;
>  }
>=20=20
> +void *qemu_plugin_tb_host_insn_size(const struct qemu_plugin_tb *tb)
> +{
> +    return tb->host_insn_size;
> +}
> +
>  uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb)
>  {
>      return tb->vaddr;
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index 71f6c90549..3e92c3b8ba 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -39,6 +39,7 @@
>    qemu_plugin_start_code;
>    qemu_plugin_tb_get_insn;
>    qemu_plugin_tb_n_insns;
> +  qemu_plugin_tb_host_insn_size;
>    qemu_plugin_tb_vaddr;
>    qemu_plugin_uninstall;
>    qemu_plugin_vcpu_for_each;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

