Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5783AC6C7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:05:07 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAR0-0000LW-Nt
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1luAPd-0006ur-Rw
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:03:41 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1luAPa-00032f-Fq
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:03:41 -0400
Received: by mail-lj1-x236.google.com with SMTP id 131so13071594ljj.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OT8zkFqLAIwunKE4gNa0CISY8U10OsFTcWgyAvfRYpc=;
 b=ltfRuf7wMBsKCg9e0zxQbszp1Zoq5k4TjBu/TktK37fQysoRyZRMJOwqRNMaOeQ4JE
 +cFtDT8ywNbvf8WVbh8gkSMugIvOKFvjt9mh4JdDMZKByov25v1FdlTM6FGNaIIS0wbj
 +i7eUTLPijR3q7NivxV3cIkkKjvEMhwCJkeWbaF+BnK8awAUw8QM3eVCiIkN4QtbENPW
 y1d5drsXuSqx0eXvyo5WpCRNG9zSw0lyredgpHAYXco4VfgYQFgYKr7T2GxNjgS1Y6Mf
 7ZiyF2nxpc8WvxwQrqVSiqoHBt9r+8ReKhEDWSmvHRjWRjeNQtQqgvt9+tPM7TiFlUQR
 EepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OT8zkFqLAIwunKE4gNa0CISY8U10OsFTcWgyAvfRYpc=;
 b=lmv8eNJ81GftJFO7XnVJi63L7ZVdQW3ZzIUIv+YUm0v2LJ6XxWZ7wyaeAwW5HdG1n2
 myqL+Gwp9p85LwCJFsMrHcAAQ7yBZP+n51CSXLOrsFZdyiAx82zcPq+xrCRrcTz7k1v7
 xbgr5AqkZXA3atYy2AL6R/cRlRocQA8nDr+sGGV8UQ/s13x7cVpkHlHSDdzeS2h7SX1p
 vjHk/m5dNM5UiEAYM6Rx8dqJ7yh1rRUv1xo8hnYbYr+twrHV6S1Iq+SO1lCZmPuHvn1Q
 ATtyWVXSajfHo1wKEXunsDYbuIh/NdLAjFRiRQX0yehe2/0KTfh6ALq18yCQBLDi3SzZ
 dYzA==
X-Gm-Message-State: AOAM530KbaXD3fiHSfnWslx7+CgApGalJkn6iIYIwBtRJjjS/Z0QVr14
 Cl5pCjNYMQeiNCSVo5tMI3FqW6jVJJDosEnrvgY=
X-Google-Smtp-Source: ABdhPJySDcP0PC0bYl0VKcnk2e3Lt9TR1yPNEJ0qOj1A1ozj6tUh2ORbOcx4tkNC+O6pAHmeFZjgYQr6zQ2e11SGoYA=
X-Received: by 2002:a05:651c:1697:: with SMTP id
 bd23mr8574195ljb.148.1624007014698; 
 Fri, 18 Jun 2021 02:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
In-Reply-To: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Fri, 18 Jun 2021 12:03:25 +0300
Message-ID: <CAMPkWoP7t2SPGm=agSpnG7ZDEEMbrQE0xz7mccdnUTn1m7iGVw@mail.gmail.com>
Subject: Re: [PATCH] hw/rdma: Fix possible mremap overflow in the pvrdma
 device (CVE-2021-3582)
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003953b905c50699a2"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vv474172261@gmail.com, pjp@fedoraproject.org, mcascell@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003953b905c50699a2
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>

On Wed, 16 Jun 2021 at 14:06, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
wrote:

> From: Marcel Apfelbaum <marcel@redhat.com>
>
> Ensure mremap boundaries not trusting the guest kernel to
> pass the correct buffer length.
>
> Fixes: CVE-2021-3582
> Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index f59879e257..dadab4966b 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -38,6 +38,12 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev,
> uint64_t pdir_dma,
>          return NULL;
>      }
>
> +    length = ROUND_UP(length, TARGET_PAGE_SIZE);
> +    if (nchunks * TARGET_PAGE_SIZE != length) {
> +        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks,
> length);
> +        return NULL;
> +    }
> +
>      dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
>      if (!dir) {
>          rdma_error_report("Failed to map to page directory");
> --
> 2.17.2
>
>

--0000000000003953b905c50699a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia=
.ml@gmail.com">yuval.shaia.ml@gmail.com</a>&gt;<br><div>Tested-by: Yuval Sh=
aia &lt;<a href=3D"mailto:yuval.shaia.ml@gmail.com">yuval.shaia.ml@gmail.co=
m</a>&gt;=C2=A0=C2=A0<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 16 Jun 2021 at 14:06, Marcel Apfelba=
um &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com">marcel.apfelbaum@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.com" target=
=3D"_blank">marcel@redhat.com</a>&gt;<br>
<br>
Ensure mremap boundaries not trusting the guest kernel to<br>
pass the correct buffer length.<br>
<br>
Fixes: CVE-2021-3582<br>
Reported-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.c=
om" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Tested-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.com=
" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.com" ta=
rget=3D"_blank">marcel@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c<br>
index f59879e257..dadab4966b 100644<br>
--- a/hw/rdma/vmw/pvrdma_cmd.c<br>
+++ b/hw/rdma/vmw/pvrdma_cmd.c<br>
@@ -38,6 +38,12 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_=
t pdir_dma,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 length =3D ROUND_UP(length, TARGET_PAGE_SIZE);<br>
+=C2=A0 =C2=A0 if (nchunks * TARGET_PAGE_SIZE !=3D length) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report(&quot;Invalid nchunks/length=
 (%u, %lu)&quot;, nchunks, length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0dir =3D rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SI=
ZE);<br>
=C2=A0 =C2=A0 =C2=A0if (!dir) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;Failed to map to =
page directory&quot;);<br>
-- <br>
2.17.2<br>
<br>
</blockquote></div>

--0000000000003953b905c50699a2--

