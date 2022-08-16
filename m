Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E509C595605
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:19:09 +0200 (CEST)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsj6-0008P6-Is
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNsgw-0006iz-0H
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:16:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNsgt-0002QE-2U
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:16:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31f445bd486so135080587b3.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=BEWbrk13B8dUUcS/iloltDDXvYcOYwRvmnKjiW12DIU=;
 b=CfdmB1weWZxVie73busfr8yjsc9DQ/1i0bAg7YtF7EE0cpp1CE3kpX+aV3kwRWh4yB
 SQzFRIz9Xkqakt9zdBgET1DayeaA8OExj/SsR4+IUDsT3t1xDXUVfia4abYx280mWfVC
 UnX+SxLWh2jBAbbiMJGofNGwMmtWNljlnnQ9zO3Q2U9h6TZMNplM5JQvsCMnI3GskKCV
 ciDwUq3ycV6IU6LeudC8uly2+UANrrGSjWGaoKLJFP71LNB0liO5KzNxqAG/tqFc5JrU
 j5Tw8MeO1fy7EpS1ANGnKfagreUgHudGqrcPPzgMuyGyrPjrUG911BNj4T3Ux4cf+jaA
 r56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=BEWbrk13B8dUUcS/iloltDDXvYcOYwRvmnKjiW12DIU=;
 b=mxm6gt4tOSOsP4aIVJX4dPIHcvuOHTovfAR2XLywlt9k+gipvXi+XcHh9zyDJU3StP
 mDH313MyPNcw0DxXS7olVOkYs18SVYnk2PLM4XGd6fH5+CZeFJX/noUdo3eZ90gbtTR1
 IEGAGdFMzdcEoUT45lLD//sy55wnWpRepPyW1lN+bIKQ35INJTzHCB7jF3339Oc1he1C
 4qtFjzofigbkmdMVJwAgr8m+k1Asar7KrofbZk/HOuohFB2OTO6fM5pI9cGzFnYkG63V
 qAfWfDKNLngFIu+hBTdafXZFySiKLHpguW1bQD3JjmICaei7A7z6FKUWZ6j00POqGzgq
 Q/GQ==
X-Gm-Message-State: ACgBeo1F699HZMvPcQ2PNuwO77PsjhO7711XoqcoWOnZ5q/gl+N/LIIg
 NN9mMp1qO5KoYgRlLLQGqkSvOCpL+rb6R2TEvMw=
X-Google-Smtp-Source: AA6agR7fbcSxsKRG0P+T5jc3+4bkRCCvWZgNofpSFUsLQLkV/0h687Mmmkd4DVnTjfnN2zuw8ErehwVZfjQBtVCYgcI=
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr13647958ybt.365.1660641409782; Tue, 16
 Aug 2022 02:16:49 -0700 (PDT)
MIME-Version: 1.0
From: Paul Schlacter <wlfightup@gmail.com>
Date: Tue, 16 Aug 2022 17:16:38 +0800
Message-ID: <CADak6y6U=jBXWWBtPruGrPxkwYZZwk5GekSG2n8DsGOvpQMh_A@mail.gmail.com>
Subject: [PATCH v2] xio3130_upstream: Add ACS (Access Control Services)
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>, marcel.apfelbaum@gmail.com,
 fam@euphon.net, 
 kwolf@redhat.com, stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, 
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com, 
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org, 
 hreitz@redhat.com, ani@anisinha.ca
Content-Type: multipart/alternative; boundary="000000000000545bd405e65835d8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x1136.google.com
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

--000000000000545bd405e65835d8
Content-Type: text/plain; charset="UTF-8"

v1 -> v2:
- Allow ACS to be disabled.
- Suggested by Michael S. Tsirkin, use disable-acs to set property.

v1:
- Add ACS (Access Control Services) capability.

If it is a pcie device, check that all devices on the path from

the device to the root complex have ACS enabled, and then the

device will become an iommu_group.

it will have the effect of isolation



Signed-off-by: wangliang <wlfightup@gmail.com>

Signed-off-by: wangliang <wangliang40@baidu.com>



---

 hw/pci-bridge/xio3130_upstream.c | 12 +++++++++++-

 1 file changed, 11 insertions(+), 1 deletion(-)


diff --git a/hw/pci-bridge/xio3130_upstream.c
b/hw/pci-bridge/xio3130_upstream.c

index 2df952222b..5433d06fb3 100644

--- a/hw/pci-bridge/xio3130_upstream.c

+++ b/hw/pci-bridge/xio3130_upstream.c

@@ -24,6 +24,7 @@

 #include "hw/pci/msi.h"

 #include "hw/pci/pcie.h"

 #include "hw/pci/pcie_port.h"

+#include "hw/qdev-properties.h"

 #include "migration/vmstate.h"

 #include "qemu/module.h"



@@ -59,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)

 static void xio3130_upstream_realize(PCIDevice *d, Error **errp)

 {

     PCIEPort *p = PCIE_PORT(d);

+    PCIESlot *s = PCIE_SLOT(d);

     int rc;



     pci_bridge_initfn(d, TYPE_PCIE_BUS);

@@ -94,7 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
**errp)

         goto err;

     }



-    pcie_acs_init(d, XIO3130_ACS_OFFSET);

+    if (!s->disable_acs) {

+        pcie_acs_init(d, XIO3130_ACS_OFFSET);

+    }

     return;



 err:

@@ -113,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)

     pci_bridge_exitfn(d);

 }



+static Property xio3130_upstream_props[] = {

+    DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),

+    DEFINE_PROP_END_OF_LIST()

+};

+

 static const VMStateDescription vmstate_xio3130_upstream = {

     .name = "xio3130-express-upstream-port",

     .priority = MIG_PRI_PCI_BUS,

@@ -142,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass
*klass, void *data)

     dc->desc = "TI X3130 Upstream Port of PCI Express Switch";

     dc->reset = xio3130_upstream_reset;

     dc->vmsd = &vmstate_xio3130_upstream;

+    device_class_set_props(dc, xio3130_upstream_props);

 }



 static const TypeInfo xio3130_upstream_info = {

-- 

2.24.3 (Apple Git-128)

--000000000000545bd405e65835d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v1 -&gt; v2:<br>- Allow ACS to be disabled.<br>- Suggested=
 by Michael S. Tsirkin, use disable-acs to set property.<br><br>v1:<br>- Ad=
d ACS (Access Control Services) capability.<br><br><p style=3D"font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:11px;line-height:normal;font-family:Menlo;margin:0px;color:rgb(0,0,0)"><s=
pan style=3D"font-variant-ligatures:no-common-ligatures">If it is a pcie de=
vice, check that all devices on the path from</span></p><p style=3D"font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fon=
t-size:11px;line-height:normal;font-family:Menlo;margin:0px;color:rgb(0,0,0=
)"><span style=3D"font-variant-ligatures:no-common-ligatures">the device to=
 the root complex have ACS enabled, and then the</span></p><p style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:11px;line-height:normal;font-family:Menlo;margin:0px;color:rgb(0,=
0,0)"><span style=3D"font-variant-ligatures:no-common-ligatures">device wil=
l become an iommu_group.</span></p><p style=3D"font-variant-numeric:normal;=
font-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heig=
ht:normal;font-family:Menlo;margin:0px;color:rgb(0,0,0)"><span style=3D"fon=
t-variant-ligatures:no-common-ligatures">it will have the effect of isolati=
on</span></p><p style=3D"font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;margin:0px;color:rgb(0,0,0)"><span style=3D"font-variant-ligatures:no=
-common-ligatures"><br></span></p><div><br></div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Signed-off-by: wangliang &lt;<a=
 href=3D"mailto:wlfightup@gmail.com">wlfightup@gmail.com</a>&gt;</span></p>=
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">Signed-off-by: wangliang &lt;</=
span><span style=3D"font-variant-ligatures:no-common-ligatures"><a href=3D"=
mailto:wangliang40@baidu.com">wangliang40@baidu.com</a>&gt;</span></p><p cl=
ass=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-stretch:normal;font-size:11px;line-height:normal;=
font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-=
variant-ligatures:no-common-ligatures"><br></span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligature=
s:no-common-ligatures"><br></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">---</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>hw/pci-bridge/xio3130_upstream.c | 12 +++++++++++=
-</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>1 file changed, 11 insertions(+), 1 deletion(-)</=
span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">diff --git a/hw/pci-bridge/xio3=
130_upstream.c b/hw/pci-bridge/xio3130_upstream.c</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">index 2df952222b..5433d06fb3 10=
0644</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">--- a/hw/pci-bridge/xio3130_ups=
tream.c</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+++ b/hw/pci-bridge/xio3130_ups=
tream.c</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -24,6 +24,7 @@</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>#include &quot;hw/pci/msi.h&quot;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>#include &quot;hw/pci/pcie.h&quot;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>#include &quot;hw/pci/pcie_port.h&quot;</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+#include &quot;hw/qdev-propert=
ies.h&quot;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>#include &quot;migration/vmstate.h&quot;</span></=
p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>#include &quot;qemu/module.h&quot;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -59,6 +60,7 @@ static void x=
io3130_upstream_reset(DeviceState *qdev)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>static void xio3130_upstream_realize(PCIDevice *d=
, Error **errp)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>{</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>PCIEPort *p =3D PCIE_PORT(d);</span=
></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>PCIESlot *s =3D PCIE_SLOT(d);</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>int rc;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>pci_bridge_initfn(d, TYPE_PCIE_BUS)=
;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -94,7 +96,9 @@ static void x=
io3130_upstream_realize(PCIDevice *d, Error **errp)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>goto err;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>}</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">-<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>pcie_acs_init(d, XIO3130_ACS_OFFSET);</s=
pan></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>if (!s-&gt;disable_acs) {</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>pcie_acs_init(d, XIO3130_A=
CS_OFFSET);</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>}</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>return;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>err:</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -113,6 +117,11 @@ static voi=
d xio3130_upstream_exitfn(PCIDevice *d)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>pci_bridge_exitfn(d);</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>}</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+static Property xio3130_upstre=
am_props[] =3D {</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>DEFINE_PROP_BOOL(&quot;disable-acs&quot;=
, PCIESlot, disable_acs, false),</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>DEFINE_PROP_END_OF_LIST()</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+};</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>static const VMStateDescription vmstate_xio3130_u=
pstream =3D {</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>.name =3D &quot;xio3130-express-ups=
tream-port&quot;,</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>.priority =3D MIG_PRI_PCI_BUS,</spa=
n></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">@@ -142,6 +151,7 @@ static void=
 xio3130_upstream_class_init(ObjectClass *klass, void *data)</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>dc-&gt;desc =3D &quot;TI X3130 Upst=
ream Port of PCI Express Switch&quot;;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>dc-&gt;reset =3D xio3130_upstream_r=
eset;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0=C2=A0 =C2=A0 </span>dc-&gt;vmsd =3D &amp;vmstate_xio313=
0_upstream;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 </span>device_class_set_props(dc, xio3130_upstr=
eam_props);</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>}</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"=
gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0</span>static const TypeInfo xio3130_upstream_info =3D {=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">--<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0</span></span></p>
<div class=3D"gmail-gs" style=3D"margin:0px;padding:0px 0px 20px;width:1024=
px;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,s=
ans-serif;font-size:medium"><div class=3D"gmail-"><div id=3D"gmail-:1o0" cl=
ass=3D"gmail-ii gmail-gt" style=3D"direction:ltr;margin:8px 0px 0px;padding=
:0px;font-size:0.875rem"><div id=3D"gmail-:18z" class=3D"gmail-a3s gmail-ai=
L" style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font=
-stretch:normal;font-size:small;line-height:1.5;font-family:Arial,Helvetica=
,sans-serif;overflow:hidden"><div dir=3D"ltr"><p style=3D"margin:0px;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;fo=
nt-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span s=
tyle=3D"font-variant-ligatures:no-common-ligatures">2.24.3 (Apple Git-128)<=
/span></p></div></div></div></div></div></div>

--000000000000545bd405e65835d8--

