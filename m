Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87A680C94
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSlY-0007fC-0q; Mon, 30 Jan 2023 06:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pMSlV-0007ez-08
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:56:01 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pMSlT-0005OR-8A
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:56:00 -0500
Received: by mail-oi1-x236.google.com with SMTP id j21so868218oie.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GpbvWoTV379hDDcyqgOVPY+L6jTqa642mAafpw+FMHc=;
 b=mML2L+B1a/XRttntZBBix8wb1ae5Us5pdZeVc+fx4JH4P5WPAcueTlGRTEHJ+h5XOt
 aMbgGFwZNm0ZAjYQIdG5dGsfhrDsim2RRlodlD/2pfpG4/bNgn7BmBv5xB44qwH7QvrI
 HhBZmhC+eox3jAZslUjhsTrn+g/LzkSBPGSl2ItzZTMWTWlMoiHNoWWpEbzBr05lIQT9
 9PO95Gtt30zy0tl7fbXuUwlGRaZfsFXvv3/JRJtaK3ANTt9uHWO72CxLigXwUxjYholN
 wc8M0ktOS1US5TAqbKtOMay6vGPs1mBbqodBADzdYoxr48L2wA0On4YVft88232sX2AX
 jGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GpbvWoTV379hDDcyqgOVPY+L6jTqa642mAafpw+FMHc=;
 b=P8I9SOThPiRu0ozHKyPe6A1OLlvL4LLO9zD+3GkqUp1pP6p7owzQMI8v4hBFo8xrqN
 Zix2kZioyTtVeCFSgKF4IMww3z2WaEBCg+TIdjZjW3spa6jgccY4YKqnXcBIJHbEa9lT
 yXIBcZEyqfpDNVh+VEG2rXDCOPgNKpSZG/qHvHEtp1/rUZ/0E/o1MXDRuyZk1thmcG84
 qAqD2BHvPSyXjtj/TY2oj8CkqvoJu3Kn2DTbmJEYqQHug0Nb7QiKuS4CFl5gmFv5G8bj
 TMH5RWrir4x94JRJGlhQxuKJfRVfXiCVzX2sQr1yNLpIHq2aqo4blPtz3629/N1FqHz7
 hbpQ==
X-Gm-Message-State: AO0yUKWRi1e3hCTysIcAv9znK9zLbdNzc1AxUXKt6zYP0b1rmK3UbCGK
 M09tN2KYJJYKX4BCm7p/8F40AXcbSZ/droiDoFw=
X-Google-Smtp-Source: AK7set85FGEFvfDTpaXCS41KymDdFNORX9JkRUOSEPKzP63gQ8hVN0bYNG3/Z1z1krrvbM32BY2RawI3nSMAznDPwLY=
X-Received: by 2002:a05:6808:2096:b0:378:15b:a49e with SMTP id
 s22-20020a056808209600b00378015ba49emr581481oiw.134.1675079757108; Mon, 30
 Jan 2023 03:55:57 -0800 (PST)
MIME-Version: 1.0
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Mon, 30 Jan 2023 19:55:45 +0800
Message-ID: <CAAKa2j=a6Se_aUAUnkg822gtEC9UhbQZ2Dq9+NLX8u8NotkpcA@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/core: fix inconsistent ep and pid (UBS_TOKEN_SETUP)
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paul Zimmerman <pauldzim@gmail.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Gaoning Pan <pgn@zju.edu.cn>, Yan Zhiqiang <yanz3q@gmail.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Hajin Jang <1882123@bugs.launchpad.net>, 
 Bug Syssec <bugs-syssec@rub.de>
Content-Type: multipart/alternative; boundary="000000000000e49bba05f379e5b2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000e49bba05f379e5b2
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm sure this patch will prevent the assertion failure due to the
inconsistent ep and pid (UBS_TOKEN_SETUP) (
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07179.html).

For UHCI (https://gitlab.com/qemu-project/qemu/-/issues/119) and OHCI (
https://gitlab.com/qemu-project/qemu/-/issues/303), this patch may be
right.

For EHCI, I found another way to trigger this assertion even with my patch
because ehci_get_pid() returns 0 if qtd->token.QTD_TOKEN_PID is not
valid[0]. In this case, the patch cannot capture it because pid is zero[2].
This case is specific to EHCI as far as I know. It seems we want to drop
the operation if ehci_get_pid() returns 0.

```static int ehci_get_pid(EHCIqtd *qtd)
{
    switch (get_field(qtd->token, QTD_TOKEN_PID)) {
    case 0:
        return USB_TOKEN_OUT;
    case 1:
        return USB_TOKEN_IN;
    case 2:
        return USB_TOKEN_SETUP;
    default:
        fprintf(stderr, "bad token\n"); //
---------------------------------------------> [0]
        return 0;
    }
}

static int ehci_execute(EHCIPacket *p, const char *action)
{
    p->pid = ehci_get_pid(&p->qtd); //
--------------------------------------------> [1]
    p->queue->last_pid = p->pid;
    endp = get_field(p->queue->qh.epchar, QH_EPCHAR_EP);
    ep = usb_ep_get(p->queue->dev, p->pid/*=0*/, endp); //
-----------------------> [2]
```

A qtest sequence is like
```
writel 0x1011b000 0x10124000
writel 0x10124004 0x358cbd80
writel 0x10124018 0x9e4bba36
writel 0x10124014 0x10139000
writel 0xfebd5020 0x1c4a5135
writel 0x10139008 0x3d5c4b84
clock_step 0xb17b0
writel 0xfebd5064 0x5f919911
clock_step 0xa9229
writel 0xfebd5064 0x5431e207
writel 0xfebd5038 0x1b2034b5
writel 0x1b2034a0 0x10100000
writel 0x10100000 0x10109000
writel 0x10109000 0x1011b000
clock_step 0xa9229
```

Best,
Qiang

--000000000000e49bba05f379e5b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>=C2=A0<br></div><div>I&#39;m sure t=
his patch will prevent the assertion failure due to the inconsistent ep and=
 pid (UBS_TOKEN_SETUP) (<a href=3D"https://lists.gnu.org/archive/html/qemu-=
devel/2021-06/msg07179.html">https://lists.gnu.org/archive/html/qemu-devel/=
2021-06/msg07179.html</a>).</div><div><br></div><div>For UHCI (<a href=3D"h=
ttps://gitlab.com/qemu-project/qemu/-/issues/119">https://gitlab.com/qemu-p=
roject/qemu/-/issues/119</a>) and OHCI (<a href=3D"https://gitlab.com/qemu-=
project/qemu/-/issues/303">https://gitlab.com/qemu-project/qemu/-/issues/30=
3</a>), this patch may be right.=C2=A0</div><div><br></div><div>For EHCI, I=
 found another way to trigger this assertion even with my patch because ehc=
i_get_pid() returns 0 if qtd-&gt;token.QTD_TOKEN_PID is not valid[0]. In th=
is case, the patch cannot capture it because pid is zero[2]. This case is s=
pecific to EHCI as far as I know. It seems we want to drop the operation if=
 ehci_get_pid() returns 0.</div><div><br></div><div>```static int ehci_get_=
pid(EHCIqtd *qtd)</div>{<br>=C2=A0 =C2=A0 switch (get_field(qtd-&gt;token, =
QTD_TOKEN_PID)) {<br>=C2=A0 =C2=A0 case 0:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn USB_TOKEN_OUT;<br>=C2=A0 =C2=A0 case 1:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return USB_TOKEN_IN;<br>=C2=A0 =C2=A0 case 2:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return USB_TOKEN_SETUP;<br>=C2=A0 =C2=A0 default:<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fprintf(stderr, &quot;bad token\n&quot;); // ----------------=
-----------------------------&gt; [0]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return=
 0;<br>=C2=A0 =C2=A0 }<br>}<div><br></div><div>static int ehci_execute(EHCI=
Packet *p, const char *action)<br>{<br>=C2=A0 =C2=A0 p-&gt;pid =3D ehci_get=
_pid(&amp;p-&gt;qtd); // --------------------------------------------&gt; [=
1]<br>=C2=A0 =C2=A0 p-&gt;queue-&gt;last_pid =3D p-&gt;pid;<br>=C2=A0 =C2=
=A0 endp =3D get_field(p-&gt;queue-&gt;qh.epchar, QH_EPCHAR_EP);<br>=C2=A0 =
=C2=A0 ep =3D usb_ep_get(p-&gt;queue-&gt;dev, p-&gt;pid/*=3D0*/, endp); // =
-----------------------&gt; [2]<br></div><div>```</div><div><br></div><div>=
A qtest sequence is like</div><div>```</div><div>writel 0x1011b000 0x101240=
00<br>writel 0x10124004 0x358cbd80<br>writel 0x10124018 0x9e4bba36<br>write=
l 0x10124014 0x10139000<br>writel 0xfebd5020 0x1c4a5135<br>writel 0x1013900=
8 0x3d5c4b84<br>clock_step 0xb17b0<br>writel 0xfebd5064 0x5f919911<br>clock=
_step 0xa9229<br>writel 0xfebd5064 0x5431e207<br>writel 0xfebd5038 0x1b2034=
b5<br>writel 0x1b2034a0 0x10100000<br>writel 0x10100000 0x10109000<br>write=
l 0x10109000 0x1011b000<br>clock_step 0xa9229<br></div><div>```</div><div><=
br></div><div>Best,</div><div>Qiang</div><div><br></div><div><br></div></di=
v>

--000000000000e49bba05f379e5b2--

