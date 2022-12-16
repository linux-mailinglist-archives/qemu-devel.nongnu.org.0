Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2C64E5CD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 03:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p602X-0002cE-40; Thu, 15 Dec 2022 21:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p602U-0002bk-1S
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 21:01:31 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1p602R-0006S2-0G
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 21:01:29 -0500
Received: by mail-lf1-x131.google.com with SMTP id z26so1287820lfu.8
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpT2VxaqzE+ebvVqyUdNG1r1J2GHyLskyB8LZMUFvCg=;
 b=lKK06erl4KLkwD8OTtriVvZqefs4RU4MtQnRPFoT4QJb4tCgf/RETiGbt1KMYSS5gr
 glEquNwHyA3mQORL9ZU6xDGwgQC4gJEhiNmy6Ai3O/yQTvwo4UKrhXNjKSaqXcatq7JR
 5v+uW293df5eXNeL4PqO9FAuDILrKKUsx5UzZN9VES43aTLRjbwMv0yS0JhwlFOGoPCo
 Mb3OVnG1RbGWjyLQnY3Au5RGfXC6tm1ThroORBCJLHNqXK7va8ZvIMBsDay+S9b3G1ve
 6iDwQurgEgl0SkszacFPN7M8CxzkjIhcdkLm6WVUxrxE9eLxMhwqTPkRFbwaoEUmTZOx
 amLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpT2VxaqzE+ebvVqyUdNG1r1J2GHyLskyB8LZMUFvCg=;
 b=wTXX32ME+OIxinRmuPFLBrClzOXvI0F/EM4rvGot/zSH9QvlQMBQEK9aVPezlRiY9+
 6uZVfa9V5LFfVu5lmWwvPxj/tPriV45MJj1YssEaVSHESNVitYy6sheCHDJU4YXtlxK4
 BcKKfofzFBrTgsXq4sUFPJnEZsE6jW1/jjxPS7dEIXxXDi/aYXVSHghZuSlAazcjVpQU
 vOJWsyj5EEYcwcMOB9C/5gaOzmuCXkWLIDcnfOWwTmjhvP+iNrgoFiCKO6f7c5S+LPui
 H3Yl2dVOjvyAZKPebTwSewXY76glCQHyUBbFwd1TM6z55p39x8Q4lAqy3Lb81Mhz/Ami
 0iBw==
X-Gm-Message-State: ANoB5pk0HGptkFkCZEpKgfR2p3T8u8psQZYkN6+bqhYe7F9Y4EfmtgPJ
 5+/lFasEQu7TTE8NnrWKBwDPcTO2Tpon6MgKF8L+p56ulm5XBnWvS5ThkY7XKc18WX/EWokINzI
 y5VfNWRWueUyozE8EtXm6w0zkQlnKS1MAu/DelOUHdI2q7EyNZsBO9bRn2kqe9eS4PoK7xF3cbS
 o=
X-Google-Smtp-Source: AA0mqf6IvdyCxz3bYaD/c2tXoPOX1n9p/mW6a0rF9smbZ9Gbg6LkqACROXJ00XSJidTvcET4oJmAEA==
X-Received: by 2002:ac2:4c51:0:b0:4a4:8a04:4b37 with SMTP id
 o17-20020ac24c51000000b004a48a044b37mr11429526lfk.32.1671156084151; 
 Thu, 15 Dec 2022 18:01:24 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 x17-20020ac259d1000000b0049e9122bd0esm73375lfn.114.2022.12.15.18.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 18:01:23 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id g7so1306386lfv.5;
 Thu, 15 Dec 2022 18:01:23 -0800 (PST)
X-Received: by 2002:ac2:44c6:0:b0:4b5:7640:1a with SMTP id
 d6-20020ac244c6000000b004b57640001amr6455033lfm.140.1671156082892; 
 Thu, 15 Dec 2022 18:01:22 -0800 (PST)
MIME-Version: 1.0
References: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
In-Reply-To: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 16 Dec 2022 10:01:12 +0800
X-Gmail-Original-Message-ID: <CANzO1D0du4TSza=-bnqZ+N9cGVfZ6P4xwYaiJg6doTzo7_MdYg@mail.gmail.com>
Message-ID: <CANzO1D0du4TSza=-bnqZ+N9cGVfZ6P4xwYaiJg6doTzo7_MdYg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: Fix elen check
To: Elta <503386372@qq.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, palmer <palmer@dabbelt.com>, 
 "alistair.francis" <alistair.francis@wdc.com>,
 "bin.meng" <bin.meng@windriver.com>, qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000af689805efe858b3"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000af689805efe858b3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Dec 15, 2022 at 11:09 PM Elta <503386372@qq.com> wrote:

> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..1e8032c969 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -870,7 +870,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports
> ELEN "
>                          "in the range [8, 64]");
> --
> 2.17.1
>
>

--000000000000af689805efe858b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 15, 2022 at 11:09 PM=
 Elta &lt;<a href=3D"mailto:503386372@qq.com">503386372@qq.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Sho=
uld be cpu-&gt;cfg.elen in range [8, 64].</div><div><br></div><div>Signed-o=
ff-by: Dongxue Zhang &lt;<a href=3D"mailto:elta.era@gmail.com" target=3D"_b=
lank">elta.era@gmail.com</a>&gt;</div><div>---</div><div>=C2=A0target/riscv=
/cpu.c | 2 +-</div><div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)=
</div><div><br></div><div>diff --git a/target/riscv/cpu.c b/target/riscv/cp=
u.c</div><div>index d14e95c9dc..1e8032c969 100644</div><div>--- a/target/ri=
scv/cpu.c</div><div>+++ b/target/riscv/cpu.c</div><div>@@ -870,7 +870,7 @@ =
static void riscv_cpu_realize(DeviceState *dev, Error **errp)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;Vector extension ELEN must be power of 2&quot;);</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div>-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.elen &gt; 64 || cpu-&gt=
;cfg.vlen &lt; 8) {</div><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (cpu-&gt;cfg.elen &gt; 64 || cpu-&gt;cfg.elen &lt; 8) {</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;Vector extension implementation only supports=
 ELEN &quot;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;in the range [8, 64]&quot;);</d=
iv><div>--=C2=A0</div><div>2.17.1</div></div><div><br></div></blockquote></=
div>

--000000000000af689805efe858b3--

