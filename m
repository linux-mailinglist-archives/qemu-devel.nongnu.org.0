Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED857591EFC
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 09:52:19 +0200 (CEST)
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oN8Py-0002e4-Id
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 03:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oN8Ls-00089m-LX
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 03:48:04 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oN8Lr-00041w-3C
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 03:48:04 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31e7ca45091so43708457b3.3
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 00:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=eR+yCSVjXAWVDFLB4FMgLtjT6WdNXTZcdApKfvzPFuc=;
 b=eNv1FSnRc9b2yGdb37ht/IolTAsMMHoi1DJQKO/yPfv1eLfyZAKbKKf8fnZh6BUjzH
 8krCqp1aW3g5SLZ2ho7DMZZ8xPp1NR89rMocLvh6od/hPp7/FJjbmVgt117TbzlpQ5J0
 DHOnZLXjcWTNuRoilalVVNvKCH4y8gc/af/CExueOZ/oeMpem4mu9SNCUzkDRPmHsFlC
 CQe5ZiQSNmFyZt6g85hQhTyx3vW7+KFv+XbGa6E+Z7fjrR7+BCwaVBcWmTBE5njU7N1k
 54b962uHkFUgvNEOwy+olKbhBaQXH0eyhQg2NljSAjGUDG2VEXouGchEolULrrt8bCrV
 GLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=eR+yCSVjXAWVDFLB4FMgLtjT6WdNXTZcdApKfvzPFuc=;
 b=fRmM1DBcZNapS3kwlevQS1XZmE3AVfdXkA2VDvFikGbuBuXzAXm23/JLsKCJIconMq
 U3n/LBnBtpcwkb0gZSXy51LeeBa3/gOHNMy9hHaVKXYyrvABWSP/pGB8XOZrIUPX+eB5
 /52RHVCZsRt8n1OfYdlNys19cMBg6nzt16vJvfHN1T2xE6bzMptFg/6NhimzDPfZuN56
 trV7Up+NYWuh7ta92SuW6Nf97urasvQVHw6boNoGjeZeQejESYsAxDhS0gpnvZoiINYm
 jfj1vTvzLvmOASj9MLiIl2YXbtxixx6Y2ReOuyLkZxX5pSAq09waeqtv5zMO78Yu+F12
 52eA==
X-Gm-Message-State: ACgBeo0lrGLgxUmFgou72fpXrUFRyXISoPlDMkqWzcklAVVR/pWh7kHB
 UYIyqM9kore8dV0BVC9hfQrxwPOByg71+jSJJdQ=
X-Google-Smtp-Source: AA6agR5KyIgsa8K3aQytYad4lIKhGyYCiqeUhDaZvNhhhW9lp/FkxSeOTR8BAcFaP4zeT3Qx9RxCt+xsq3nxsGHSl+w=
X-Received: by 2002:a81:1b83:0:b0:328:a7be:ec81 with SMTP id
 b125-20020a811b83000000b00328a7beec81mr9540994ywb.398.1660463281228; Sun, 14
 Aug 2022 00:48:01 -0700 (PDT)
MIME-Version: 1.0
From: Paul Schlacter <wlfightup@gmail.com>
Date: Sun, 14 Aug 2022 15:47:49 +0800
Message-ID: <CADak6y5OdAgSwCmsdghy9JarwFqeR7GtaK2pz+TSLvSiAy8PQA@mail.gmail.com>
Subject: [PATCH] xio3130_upstream: Add ACS (Access Control Services) capability
To: mst@redhat.com, marcel.apfelbaum@gmail.com, fam@euphon.net, 
 kwolf@redhat.com, stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, 
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com, 
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org, 
 hreitz@redhat.com, ani@anisinha.ca
Content-Type: multipart/alternative; boundary="0000000000000a506805e62ebc00"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000000a506805e62ebc00
Content-Type: text/plain; charset="UTF-8"

If it is a pcie device, check that all devices on the path from

the device to the root complex have ACS enabled, and then the

device will become an iommu_group.

it will have the effect of isolation


Signed-off-by: wlfightup <wlfightup@gmail.com>

---

 hw/pci-bridge/xio3130_upstream.c | 3 +++

 1 file changed, 3 insertions(+)


diff --git a/hw/pci-bridge/xio3130_upstream.c
b/hw/pci-bridge/xio3130_upstream.c

index 5ff46ef050..2df952222b 100644

--- a/hw/pci-bridge/xio3130_upstream.c

+++ b/hw/pci-bridge/xio3130_upstream.c

@@ -37,6 +37,8 @@

 #define XIO3130_SSVID_SSID              0

 #define XIO3130_EXP_OFFSET              0x90

 #define XIO3130_AER_OFFSET              0x100

+#define XIO3130_ACS_OFFSET \

+        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)


 static void xio3130_upstream_write_config(PCIDevice *d, uint32_t address,

                                           uint32_t val, int len)

@@ -92,6 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
**errp)

         goto err;

     }


+    pcie_acs_init(d, XIO3130_ACS_OFFSET);

     return;


 err:

--

2.24.3 (Apple Git-128)

--0000000000000a506805e62ebc00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"=
><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatur=
es">If it is a pcie device, check that all devices on the path from</span><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,=
0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-liga=
tures">the device to the root complex have ACS enabled, and then the</span>=
</p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0=
,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-lig=
atures">device will become an iommu_group.</span></p><p class=3D"gmail-p1" =
style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-=
s1" style=3D"font-variant-ligatures:no-common-ligatures">it will have the e=
ffect of isolation</span></p><p class=3D"gmail-p2" style=3D"margin:0px;font=
:11px Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures"></span><br></p><p class=3D=
"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span clas=
s=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">Signed-=
off-by: wlfightup &lt;<a href=3D"mailto:wlfightup@gmail.com">wlfightup@gmai=
l.com</a>&gt;</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px=
 Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">---</span></p><p class=3D"gmail-p1" style=3D"ma=
rgin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-=
converted-space">=C2=A0</span>hw/pci-bridge/xio3130_upstream.c | 3 +++</spa=
n></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0=
,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>1 file c=
hanged, 3 insertions(+)</span></p><p class=3D"gmail-p2" style=3D"margin:0px=
;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1"=
 style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p><p cla=
ss=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span=
 class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">di=
ff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstrea=
m.c</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;col=
or:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-=
common-ligatures">index 5ff46ef050..2df952222b 100644</span></p><p class=3D=
"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span clas=
s=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">--- a/h=
w/pci-bridge/xio3130_upstream.c</span></p><p class=3D"gmail-p1" style=3D"ma=
rgin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">+++ b/hw/pci-bridge/xio3130=
_upstream.c</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px M=
enlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligat=
ures:no-common-ligatures">@@ -37,6 +37,8 @@</span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail=
-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gm=
ail-Apple-converted-space">=C2=A0</span>#define XIO3130_SSVID_SSID<span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>0</span></p><p class=3D"gmail-p1" style=3D"margin:0px;fon=
t:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-varia=
nt-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-converted-spac=
e">=C2=A0</span>#define XIO3130_EXP_OFFSET<span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x90</sp=
an></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(=
0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-=
ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>#define=
 XIO3130_AER_OFFSET<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0x100</span></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">+#define=
 XIO3130_ACS_OFFSET \</span></p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-var=
iant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>(XIO3130_AER_OFFSET + PCI_ERR_SIZE=
OF)</span></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11px Menlo;col=
or:rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D"font-varia=
nt-ligatures:no-common-ligatures"></span><br></p><p class=3D"gmail-p1" styl=
e=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-A=
pple-converted-space">=C2=A0</span>static void xio3130_upstream_write_confi=
g(PCIDevice *d, uint32_t address,</span></p><p class=3D"gmail-p1" style=3D"=
margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-=
converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>uint32_t val, int len)</span></p><p class=3D"gm=
ail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">@@ -92,6=
 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)<=
/span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:r=
gb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-comm=
on-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>goto err;</span></p><p class=3D"gmail-p1" style=3D=
"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple=
-converted-space">=C2=A0=C2=A0 =C2=A0 </span>}</span></p><p class=3D"gmail-=
p2" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
"></span><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;=
color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:=
no-common-ligatures">+<span class=3D"gmail-Apple-converted-space">=C2=A0 =
=C2=A0 </span>pcie_acs_init(d, XIO3130_ACS_OFFSET);</span></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>return;</spa=
n></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11px Menlo;color:rgb(0=
,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D"font-variant-ligat=
ures:no-common-ligatures"></span><br></p><p class=3D"gmail-p1" style=3D"mar=
gin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D=
"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-con=
verted-space">=C2=A0</span>err:</span></p><p class=3D"gmail-p1" style=3D"ma=
rgin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">--</span></p><p class=3D"gm=
ail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-fami=
ly:Menlo;color:rgb(0,0,0)">





































</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=
=3D"font-variant-ligatures:no-common-ligatures">2.24.3 (Apple Git-128)</spa=
n></p></div>

--0000000000000a506805e62ebc00--

