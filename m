Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA776F1677
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:17:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psM67-00069m-J0; Fri, 28 Apr 2023 07:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1psM65-00069P-Kl
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:17:05 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1psM63-0000jQ-Nv
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:17:05 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-51f597c975fso9591518a12.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682680622; x=1685272622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzrspL1471cDql5QniaJMLPGzFb/3iO/hAgimLwLa7U=;
 b=awUM9ZCpfL5No+KJOyaR/tQsFJnZpafekuEnFOBz6HleAEIaic4ykcxLMTMiTxle5z
 K2NqIw4QkqZSCWVAiQ5WQ57E1SNVlKqJpUTTvaeCJPrnFRMLEgoQalxU+snE3tiw5Mqn
 Bk4hSE6BvlC0mMP5QXAI1ol1XV0RXOK+DQG65CP5tG5hT6ZCHqS9YGIPTNYdHBeSJi4r
 iQ8OifDwNUr/CRevBlSKAs2+20vIQ2cpZMzpSAzw8ZqGLptejRNmbnEiwFsTkGGGepyw
 5MoDoFvu6TD5P24okG7qgACMhHWB/9ImkgpBLI7f5CfcK9ocmnPY2NGfeKZvUMgiDR/9
 hvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682680622; x=1685272622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzrspL1471cDql5QniaJMLPGzFb/3iO/hAgimLwLa7U=;
 b=AbtphXZEgQAw+atKu7nGv0ZOmoBMB7nIKHNoFw6i8bJuolwcRLOh+ZUojDZlwGoXzY
 5o281mOXGF1rXIG0bRGdQDNSF+Z6OeFAePMmJQeZKt4WUqd9v2E263K2RugcnpZ6t3l5
 7zkbPXJ2RFYCMuI2Xi1QSXsRUf2efXTbxUQ6i3MhGr1Xbukfio86LFYftWtqibbtvztj
 3crVskftCwRx/VR/J67+5oU3jCLJHVvOmt81DgkPt6iZ24O/e7JrmTk/cIIvUlk8FHFV
 JDFWbROBnyorkFSg2IPtJQqmkFk3kTr4OicMuF3FfXs2v05oh3zPHKi8Tj1U3UvKlMqU
 M4fg==
X-Gm-Message-State: AC+VfDxkZNSTHakU50keQynTiV28HnXU+EWZ+skH1KErH4OCUOWSklKk
 a6eXSMadBqSlN549o70mElRvKjkzHViCTa6oIVPTHQ==
X-Google-Smtp-Source: ACHHUZ5DHOORQK7u3f5JLeIimr1pQq6+phQ6+f0yuGgUtu4n+e2jGO6BTpl0qnXnnyXpNCs3bYpgoKCFt/llT56ZZIM=
X-Received: by 2002:a17:90a:bc92:b0:239:ea16:5b13 with SMTP id
 x18-20020a17090abc9200b00239ea165b13mr5083811pjr.14.1682680621870; Fri, 28
 Apr 2023 04:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230421082028.53579-1-lwp_1994@163.com>
 <CAGoVJZx2T6C37UTiaO5xL78vMKweJYyEVZse72t0LNv3-kV3_Q@mail.gmail.com>
In-Reply-To: <CAGoVJZx2T6C37UTiaO5xL78vMKweJYyEVZse72t0LNv3-kV3_Q@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 28 Apr 2023 13:58:33 +0300
Message-ID: <CABcq3pEtn7yvJNg1AB1_L7V0H_9_xTFDVtNHA4fC8GtxNtEO+w@mail.gmail.com>
Subject: Re: [PATCH] tools/ebpf: Fix IPv4 fragmentation identify
To: Yan Vugenfirer <yvugenfi@redhat.com>, lwp_1994@163.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=andrew@daynix.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,
I don't think that checking DF flag is a case for figuring out that
the packet is a fragment of some big datagram.
For nonfragmented packets, DF may not be set.
We need to check that the fragment offset is 0.
Actually, it's a good idea to check that MF flag is not set too. So we
can find the first fragment that doesn't require steering.
So the code may look something like this:
```
info->is_fragmented =3D !!(bpf_ntohs(ip.frag_off) & (0x2000 | 0x1fff));
// checking MF and frag offset.
 OR
info->is_fragmented =3D !!(bpf_ntohs(ip.frag_off) & ~0x4000); // if we
consider that CE always 0(which is always should be)
```

On Sun, Apr 23, 2023 at 9:12=E2=80=AFAM Yan Vugenfirer <yvugenfi@redhat.com=
> wrote:
>
> FYI
>
> ---------- Forwarded message ---------
> From: luwenpeng <lwp_1994@163.com>
> Date: Fri, Apr 21, 2023 at 3:21=E2=80=AFPM
> Subject: [PATCH] tools/ebpf: Fix IPv4 fragmentation identify
> To: <qemu-devel@nongnu.org>
> Cc: <jasowang@redhat.com>, luwenpeng <lwp_1994@163.com>
>
>
> The meaning of the bit flag in ip.frag_off is Don`t fragmented
> When judging IPv4 is_fragmented according to ip.frag_off,
> should use !(bpf_ntohs(ip.frag_off) & 0x4000) instead of !!ip.frag_off
>
> Signed-off-by: WenPeng Lu <lwp_1994@163.com>
> ---
>  tools/ebpf/rss.bpf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
> index 20f227e2ac..e77b764f3d 100644
> --- a/tools/ebpf/rss.bpf.c
> +++ b/tools/ebpf/rss.bpf.c
> @@ -317,7 +317,7 @@ static inline int parse_packet(struct __sk_buff *skb,
>
>          info->in_src =3D ip.saddr;
>          info->in_dst =3D ip.daddr;
> -        info->is_fragmented =3D !!ip.frag_off;
> +        info->is_fragmented =3D !(bpf_ntohs(ip.frag_off) & 0x4000);
>
>          l4_protocol =3D ip.protocol;
>          l4_offset =3D ip.ihl * 4;
> --
> 2.30.1 (Apple Git-130)
>
>

