Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552A690408
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:43:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3SQ-0001HX-H0; Thu, 09 Feb 2023 04:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pQ3SO-0001Fk-QC
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:43:08 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pQ3SN-0000F9-44
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:43:08 -0500
Received: by mail-lf1-x133.google.com with SMTP id b3so2417829lfv.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n8d/fYltp+/X4xCRNIXoxNPZwkXqf7Qw4+XXRLApH6E=;
 b=mtthG+A2JqrS1KrDYiHHsdr7dq2v2YLOKw5u3EuWmxIxgkiStewsMDFtMML1Y1NU0z
 PgXtT2IQjjxi8mNGjpvtr9Nw7Kfy9UP7dYy2r3JBg0t3BgncbD5kYDBkgSt3Hjvh9AeN
 3BMuUJJ2Ra7+8feqmfVZFuB/385ESdLKK2BzJ+JLOy3JhEU5lkjh0YRODiOU9SM6wUJv
 KzPd7Dos/NuTR3YB4EOSy4j9B+yiZqyzSq3u80Y5wu+ZOMTuf5BbWiBIwiRn7qdoxMPW
 fi6cTDQVCaGvTLx1mV8o1Q7oWU23riAp0uzzfJqcfwyQbCSXeGu9c/oSjpphpVBwZgPg
 NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8d/fYltp+/X4xCRNIXoxNPZwkXqf7Qw4+XXRLApH6E=;
 b=YkhlXoKztRtixa4bPyt9ptW6j8pB0iIhdq3vfi0A7vjFwkBVKcrpZ8LE9YrO93elot
 ijv3Q2PbSnlrGn/SdnCtX97LqMvU7B/9+JkhxOp4caZGUfpi+cLy+WGIOVYvp+j8OIpR
 9cA9ZNAaFDZEMwDLmd+M1FbmfdujiBWUMFYT4BgnwLhJWIbHhbC7rAQKvkPMZk0Sb/gF
 kwLXSrJ31iHWaoqQcliT0ORTg8SznOSwsuGhIsYjg3jmW4jG7DfK4A2nJyQQ9vQjCd/o
 NCTbPm6Z7RCfLCxAGGvo3GLeECq1tktfI3WVIZBe5pFEMrL4pJJIxBEdirRCFGzZC/Cc
 8/QQ==
X-Gm-Message-State: AO0yUKU/OAmyxwGYEoocPK7g746WbZ0vnYcg8BHZn1T1nGmNLdAfpals
 JOkDii4tGFsTFD/tDiU62KZvogKg5v+GfUWh
X-Google-Smtp-Source: AK7set+cmv/8jNSjC7Mwqh5Jgyd3xtC2e7TLcG/7io+zdFal4n7DHP6nNSkvIxP1hNSF5kChbVr1Sg==
X-Received: by 2002:ac2:54bb:0:b0:4da:f5e1:749a with SMTP id
 w27-20020ac254bb000000b004daf5e1749amr1604408lfk.29.1675935784864; 
 Thu, 09 Feb 2023 01:43:04 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 w15-20020a05651204cf00b004d3f0f20b98sm103069lfq.40.2023.02.09.01.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:43:04 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id cf42so2423124lfb.1;
 Thu, 09 Feb 2023 01:43:04 -0800 (PST)
X-Received: by 2002:ac2:5fc4:0:b0:4d5:76af:f890 with SMTP id
 q4-20020ac25fc4000000b004d576aff890mr1724620lfg.228.1675935783770; Thu, 09
 Feb 2023 01:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 9 Feb 2023 17:42:52 +0800
X-Gmail-Original-Message-ID: <CANzO1D3Tan5h14R4Pqt0MtxafGPrWXwv5j5a5xfqv7FEG5H6Pg@mail.gmail.com>
Message-ID: <CANzO1D3Tan5h14R4Pqt0MtxafGPrWXwv5j5a5xfqv7FEG5H6Pg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com, 
 alistair23@gmail.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="0000000000000ee0d105f44135f3"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000000ee0d105f44135f3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Feb 9, 2023 at 8:34 AM Alistair Francis <
alistair.francis@opensource.wdc.com> wrote:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e25f62ac..847bc7f131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -287,6 +287,9 @@ RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <alistair.francis@wdc.com>
>  M: Bin Meng <bin.meng@windriver.com>
> +R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> +R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/
> --
> 2.39.1
>
>
>

--0000000000000ee0d105f44135f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang=
@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 8:34 AM A=
listair Francis &lt;<a href=3D"mailto:alistair.francis@opensource.wdc.com">=
alistair.francis@opensource.wdc.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Alistair Francis &lt;<a href=3D"ma=
ilto:alistair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</=
a>&gt;<br>
<br>
This patch adds some active RISC-V members as reviewers to the<br>
MAINTAINERS file.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 96e25f62ac..847bc7f131 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -287,6 +287,9 @@ RISC-V TCG CPUs<br>
=C2=A0M: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@dabbelt.com" target=3D=
"_blank">palmer@dabbelt.com</a>&gt;<br>
=C2=A0M: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" t=
arget=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
=C2=A0M: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_=
blank">bin.meng@windriver.com</a>&gt;<br>
+R: Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn" target=3D"_blank"=
>liweiwei@iscas.ac.cn</a>&gt;<br>
+R: Daniel Henrique Barboza &lt;<a href=3D"mailto:dbarboza@ventanamicro.com=
" target=3D"_blank">dbarboza@ventanamicro.com</a>&gt;<br>
+R: Liu Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.alibaba.com" target=
=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<br>
=C2=A0L: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-ri=
scv@nongnu.org</a><br>
=C2=A0S: Supported<br>
=C2=A0F: target/riscv/<br>
-- <br>
2.39.1<br>
<br>
<br>
</blockquote></div>

--0000000000000ee0d105f44135f3--

