Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7973532148
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 04:59:25 +0200 (CEST)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntKlY-0004dm-HO
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 22:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ntKk9-0003wd-4m
 for qemu-devel@nongnu.org; Mon, 23 May 2022 22:57:57 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ntKk7-0003QZ-Il
 for qemu-devel@nongnu.org; Mon, 23 May 2022 22:57:56 -0400
Received: by mail-ua1-x92b.google.com with SMTP id g14so5843408uan.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 19:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=s2EPYTFe4LrnjkvtDVusqQyjYeDIDkSZ1B0oxPTZ6rI=;
 b=Vj2JFl2xVAFJ+7VNdd03eUQKOwVtXToDORPsDmj1yPKBRNM5VHAp+LCWboSqAfxOmH
 vY+89f7sklJRxUN+XmL6zcQ51IPNNVwy7C3besNk02bj+Ec5TV9Uuwy5X0AGfRYFWgRd
 uG4i5i0HPCH5AOze8NHlD6JSQKgeyf1/zp6ZrxauGa9I9QKaXYIFikSXsSsVEwqWdtgL
 HnMr51Ql5rexasHVBfgajt6hrTIZCsUX8VAesrUQzINtQXWpKdncfLwsCQJh5KVHnAQa
 vZUhCPfAFM9/L+TksW21CJ+kIFOPna0yzip5Psa09Le4M5HdfpGxuaVeEpyxhetubTOr
 i4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=s2EPYTFe4LrnjkvtDVusqQyjYeDIDkSZ1B0oxPTZ6rI=;
 b=jyRF18CKpf0xKUvZIPAwnYxNQuOnjNotWryjbMJH40ykgofcn7DeYpWz7RMQYg/Xc/
 c46M/XXCvS/eq2CCDX+L1LBfSPxUqUlXQU6/y9HQMGzLm5PaKVnUJNWnJ+bCAvtLPsRT
 gIqYKGGz9nggZdp8wON6vXtvLbnS12rM525LULerG3IM2qCU5xpmMjkgPShv5NDPORVx
 RhCuZXfIda+XMjRscVUs7dVIxsc0YkzXR+qtGKPao/fPhPKUo+ZvFr3MEfmmfQW45WZ1
 dGOSwCmI9nGr4kcqz9lMxZkhwBpokVZk1OwV9Mf8ZiaiPl4Sm0VTT6h8nML1xoziAbLW
 R/iQ==
X-Gm-Message-State: AOAM532z4Ygc+KgclLPtmTO2gNZbJmQl+1QBBnRsNRemBxQPCkJjQVRa
 MIqHzUOvF+HJGfKrA/dKuaS4RnPtAco6LafR+RPTesxcSwfxSg==
X-Google-Smtp-Source: ABdhPJyb773KQ6QEjE+TNJUrOner7fEkFvxxeup0KJGhIN7NYeP2u6oDY7xlGW0+d+yu+fGwtPelrlG/+rW8T0O8wss=
X-Received: by 2002:ab0:160b:0:b0:35c:ca56:6e85 with SMTP id
 k11-20020ab0160b000000b0035cca566e85mr8124404uae.20.1653361073468; Mon, 23
 May 2022 19:57:53 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 23 May 2022 19:57:42 -0700
Message-ID: <CAO=notydyzbKGEY+GhsC-ch8itPxcCiQDdLaJTg7SO26aR7Lug@mail.gmail.com>
Subject: Npcm7xx emac tap networking hitting 75MiB limit
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="00000000000078b58e05dfb91f3a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=venture@google.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078b58e05dfb91f3a
Content-Type: text/plain; charset="UTF-8"

Hey;

I wanted to ask if anyone has seen this before.  When we try to download a
file larger than 75MB from within an Ncpm7xx board using TAP networking
(versus user) it just fails there.

using wget it reports null                 75.0M  - stalled -\rnull
        75.0M  - stalled -\rnull                 75.0M  - stalled -\rnull
              75.0M  - stalled -\rnull                 75.0M  - stalled
-\rnull                 75.0M  -

I haven't yet dug into what could be going wrong here, but I wanted to ask
if any of y'all have seen some weird stuff here?

Thanks,
Patrick

--00000000000078b58e05dfb91f3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey;<div><br></div><div>I wanted to ask if anyone has seen=
 this before.=C2=A0 When we try to download=C2=A0a file larger than 75MB fr=
om within an Ncpm7xx=C2=A0board using TAP networking (versus user) it just =
fails there.</div><div><br></div><div>using=C2=A0<span style=3D"color:rgb(3=
2,33,36);font-family:WorkAroundWebKitAndMozilla,monospace;font-size:13px;le=
tter-spacing:0.185714px">wget it reports=C2=A0</span>null =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 75.0M =C2=A0- stalled -\rnull =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 75.0M =C2=A0- stalled -\r=
null =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 75.0M =C2=A0- =
stalled -\rnull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 75.=
0M =C2=A0- stalled -\rnull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 75.0M =C2=A0- stalled -\rnull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 75.0M =C2=A0-</div><div><br></div><div>I haven&#39;t y=
et dug into what could be going wrong here, but I wanted to ask if any of y=
&#39;all have seen some weird stuff here?</div><div><br></div><div>Thanks,<=
/div><div>Patrick</div></div>

--00000000000078b58e05dfb91f3a--

