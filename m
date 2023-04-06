Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C46D9102
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 10:02:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkKYS-0006Cz-T0; Thu, 06 Apr 2023 04:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkKYM-0006AX-Vj
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:01:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pkKYK-0007tM-T8
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 04:01:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id v1so38601768wrv.1
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680768063;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rC7T51oJUAEvDMhKoe2KU4JQ5os89UllKPg0c8I6IaA=;
 b=nPCoHIJx3H+2DSomb/+Lt9OyQSPaxewgW7efOd+oVAA7H4/+2zsIjoYCUESUrC+su+
 LNoMNUOhCimqB60Qf/h4Fwrl3G2wfERQkOU+vvQOzjxW9HF6Ucfg4zCdZA01dNS9KFbh
 WsH9V/44E5WgjqOQEaf7lbpRIggpkALW1d6x3PZU88KF8xPh649hjj4aOy3Ge89pl5rL
 EECp82LppVU5aVw/Pel0on/uSlmapCWoFCny5lAl+h7tVAQAHPw2GtmntmA3mqKk/lvX
 rpU54uS6ZepBKvhVBaR9XYWqn8UnMczqkZPGvYONSFXkI64lyZ3FcqEq47qsCmxZA127
 P1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680768063;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rC7T51oJUAEvDMhKoe2KU4JQ5os89UllKPg0c8I6IaA=;
 b=7fckCED5+6iX4dJqgKV3/J3LiFSexXID7RPXWXFIJ5jsGltHcJcGjrMB4RqGvkhOUe
 0Nx6UJAV6aGgyDc+Mn3swgJsW9GFfaxqViDLZ0cL9eaNuPP2uRkxTwGT16PDy0Q/1X6q
 r3CJ0BUWxe/ghVOQpSuKeNIK89TBTkFhH7hgixeA4o4Pb9go96TfehWqL3fRa9gbX0mq
 5ZEnqlh9LkD/XKM2NokxcrOTI4rDMazzfi7JR1bTPbS6R7hk+1uUB1L+Tfm7ItOBkmR2
 T5H2Sx83PAT8BAq/++emRtty/KZwDnTWVyqD08FT8g8/JLSNiu43W1BQsYN5/0EZ3I+L
 u9PA==
X-Gm-Message-State: AAQBX9eSyA23Z3gpE3dssLDcKheWFa2eXTo6P0HFdh/7Km5sZg949Cvg
 mWjCD6dMAjK75Ar/SDK2rXw86Q==
X-Google-Smtp-Source: AKy350Zc48gXiU9SWY8iuJ8A/gb6unyUyB6qd5Dv/Apnj4da9QijKQdqtAKWjxevNbXCEu1oHHEO2A==
X-Received: by 2002:adf:df0a:0:b0:2cf:ee28:5024 with SMTP id
 y10-20020adfdf0a000000b002cfee285024mr5744234wrl.42.1680768062419; 
 Thu, 06 Apr 2023 01:01:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adfdc43000000b002c5691f13eesm1006880wrj.50.2023.04.06.01.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:01:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93C4F1FFB7;
 Thu,  6 Apr 2023 09:01:01 +0100 (BST)
References: <20230406022751.757980-1-fei2.wu@intel.com>
 <20230406022751.757980-3-fei2.wu@intel.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fei Wu <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, erdnaxe@crans.org,
 ma.mandourr@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] plugins/hotblocks: add host insn size
Date: Thu, 06 Apr 2023 08:54:54 +0100
In-reply-to: <20230406022751.757980-3-fei2.wu@intel.com>
Message-ID: <87r0sxjv7m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> It's only valid when inline=3Dfalse, otherwise it's default to 0.
>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>  contrib/plugins/hotblocks.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
> index 062200a7a4..c9716da7fe 100644
> --- a/contrib/plugins/hotblocks.c
> +++ b/contrib/plugins/hotblocks.c
> @@ -37,6 +37,8 @@ typedef struct {
>      uint64_t exec_count;
>      int      trans_count;
>      unsigned long insns;
> +    void    *p_host_insn_size;
> +    uint64_t host_insn_size;
>  } ExecCount;
>=20=20
>  static gint cmp_exec_count(gconstpointer a, gconstpointer b)
> @@ -59,13 +61,17 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
>      it =3D g_list_sort(counts, cmp_exec_count);
>=20=20
>      if (it) {
> -        g_string_append_printf(report, "pc, tcount, icount, ecount\n");
> +        g_string_append_printf(report,
> +                               "host isize is only valid when inline=3Df=
alse\n"
> +                               "pc, tcount, icount, ecount, host isize\n=
");
>=20=20
>          for (i =3D 0; i < limit && it->next; i++, it =3D it->next) {
>              ExecCount *rec =3D (ExecCount *) it->data;
> -            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"P=
RId64"\n",
> +            g_string_append_printf(report, "0x%016"PRIx64", %d, %ld, %"P=
RId64
> +                                   ", %"PRIu64"\n",
>                                     rec->start_addr, rec->trans_count,
> -                                   rec->insns, rec->exec_count);
> +                                   rec->insns, rec->exec_count,
> +                                   rec->host_insn_size);
>          }
>=20=20
>          g_list_free(it);
> @@ -82,14 +88,13 @@ static void plugin_init(void)
>=20=20
>  static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
>  {
> -    ExecCount *cnt;
> -    uint64_t hash =3D (uint64_t) udata;
> +    ExecCount *cnt =3D (ExecCount *) udata;
>=20=20
>      g_mutex_lock(&lock);
> -    cnt =3D (ExecCount *) g_hash_table_lookup(hotblocks, (gconstpointer)=
 hash);
> -    /* should always succeed */
> -    g_assert(cnt);
>      cnt->exec_count++;
> +    if (cnt->host_insn_size =3D=3D 0) {
> +        cnt->host_insn_size =3D *((uint64_t *)cnt->p_host_insn_size);

No - passing an internal TCG pointer across different phases of
translation/execution is a definite no no. We explicitly state that
handles are only valid for callbacks in the docs:

  Lifetime of the query handle
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Each callback provides an opaque anonymous information handle which
  can usually be further queried to find out information about a
  translation, instruction or operation. The handles themselves are only
  valid during the lifetime of the callback so it is important that any
  information that is needed is extracted during the callback and saved
  by the plugin.

to avoid this sort of tangling of implementation details into the
plugins.


> +    }
>      g_mutex_unlock(&lock);
>  }
>=20=20
> @@ -114,6 +119,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct=
 qemu_plugin_tb *tb)
>          cnt->start_addr =3D pc;
>          cnt->trans_count =3D 1;
>          cnt->insns =3D insns;
> +        cnt->p_host_insn_size =3D qemu_plugin_tb_host_insn_size(tb);
>          g_hash_table_insert(hotblocks, (gpointer) hash, (gpointer) cnt);
>      }
>=20=20
> @@ -125,7 +131,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct=
 qemu_plugin_tb *tb)
>      } else {
>          qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
>                                               QEMU_PLUGIN_CB_NO_REGS,
> -                                             (void *)hash);
> +                                             (void *)cnt);
>      }
>  }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

