Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E855956B5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 11:39:37 +0200 (CEST)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNt2u-0003gk-Gw
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 05:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNt0s-0001Wd-PJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:37:32 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:39678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1oNt0q-0005bS-0u
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:37:29 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-32fd97c199fso111401437b3.6
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=F9l/Lza+GcuQ/N6yTTp2h8rEGkAGDZZo0keA34OVn7g=;
 b=pxmi8GWC2LYXgrU9p3G+Jg2rHsH8f5AQCGBn1QV51hJ6QXYvo7dUVjHT6ek/ZiE/Cl
 IFIJz1hScpU4zX/71hh6BqPzGrJwY0j673av8lPKxNOAtrcG7FJnF9yo0jOL1UqVZquu
 yqC52lPp78yLyZZrBDZGAlJ0lCkrn+ttxkblRMbu36/+IkgGaTBaGYiNJZI7fqyER3Lf
 Iv24Q+mq0xBBm3eZ5QSGhpTkHV5DsLbIvvZhyASIFu1dAZTDq8Qn7c+LJsPKsB7fnrl4
 +6oeeeErVrd7izPI5fcmqCz/rB8UP+ROPq8Gv3aUTaRp815rSTJ4MJwB5nrU9JQwe+sD
 aezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=F9l/Lza+GcuQ/N6yTTp2h8rEGkAGDZZo0keA34OVn7g=;
 b=2Iq2LU3n4jqFYR73TzLLb384m9kIa9hIRmWAJHbIOsvaLGEBnA0oNmTf4X72nfvjaw
 ZADB/xiKtmanuZwoSEMmg97ZVEtXM6mnUnInuaHcbb18+/BmbGKCl9tFCH2kreKAEuZN
 jbSfTJkeWkD0SUq5KhfWjpbZpIRSoyhRc39kaCNDj4jP71YaS6cY84dMVZ3PRA0V/zSH
 ZZohhugmKrQrQnr8XBXTiPHjrHRAZpS0oqdu4LDmcp9WaNrfhrgQdx6WeG1T39nE0jk/
 3GQV8/Y1KvJtcYNaqhn2OmZaHW9jTibj3QwuGCvG03+9bw6x8LA7Zk2Q6PvC8sTO6nzx
 Tlxg==
X-Gm-Message-State: ACgBeo0hmLZNHcZwOAUj1ESHVM/OL5uuztwd7n3k+fiKtIl2JWVQdxgr
 H+UKeCDPmuyImpp5bdvY1hkamTt8xFshwYdPK30=
X-Google-Smtp-Source: AA6agR4suT0btzNxb268GYujKMFCKimokkf38uxioyAs0/jIIgc/lV3q9P9UkOuvUyg3WhxXMp1aJ9nYwlbWXmrSHoE=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr17035960ywd.138.1660642646000; Tue, 16
 Aug 2022 02:37:26 -0700 (PDT)
MIME-Version: 1.0
From: Paul Schlacter <wlfightup@gmail.com>
Date: Tue, 16 Aug 2022 17:37:14 +0800
Message-ID: <CADak6y7h9fyQnbfka3MLXhSKFJC+d=d5_Kmu0g_gaHQ_L1XUOg@mail.gmail.com>
Subject: [PATCH v3] xio3130_upstream: Add ACS, Access Control Services,
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>, marcel.apfelbaum@gmail.com,
 fam@euphon.net, 
 kwolf@redhat.com, stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org, 
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com, 
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org, 
 hreitz@redhat.com, ani@anisinha.ca
Content-Type: multipart/alternative; boundary="00000000000003893805e6587f91"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=wlfightup@gmail.com; helo=mail-yw1-x112a.google.com
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

--00000000000003893805e6587f91
Content-Type: text/plain; charset="UTF-8"

v2 -> v3:
- Add the missing code in V2.

v1 -> v2:
- Allow ACS to be disabled.
- Suggested by Michael S. Tsirkin, use disable-acs to set property.

v1:
- Add ACS (Access Control Services) capability.

If it is a pcie device, check that all devices on the path from

the device to the root complex have ACS enabled, and then the

device will become an iommu_group.

it will have the effect of isolation




Signed-off-by: wlfightup <wlfightup@gmail.com>

Signed-off-by: wangliang <wangliang40@baidu.com>

---

 hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++

 1 file changed, 13 insertions(+)


diff --git a/hw/pci-bridge/xio3130_upstream.c
b/hw/pci-bridge/xio3130_upstream.c

index 5ff46ef050..5433d06fb3 100644

--- a/hw/pci-bridge/xio3130_upstream.c

+++ b/hw/pci-bridge/xio3130_upstream.c

@@ -24,6 +24,7 @@

 #include "hw/pci/msi.h"

 #include "hw/pci/pcie.h"

 #include "hw/pci/pcie_port.h"

+#include "hw/qdev-properties.h"

 #include "migration/vmstate.h"

 #include "qemu/module.h"



@@ -37,6 +38,8 @@

 #define XIO3130_SSVID_SSID              0

 #define XIO3130_EXP_OFFSET              0x90

 #define XIO3130_AER_OFFSET              0x100

+#define XIO3130_ACS_OFFSET \

+        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)



 static void xio3130_upstream_write_config(PCIDevice *d, uint32_t address,

                                           uint32_t val, int len)

@@ -57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)

 static void xio3130_upstream_realize(PCIDevice *d, Error **errp)

 {

     PCIEPort *p = PCIE_PORT(d);

+    PCIESlot *s = PCIE_SLOT(d);

     int rc;



     pci_bridge_initfn(d, TYPE_PCIE_BUS);

@@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
**errp)

         goto err;

     }



+    if (!s->disable_acs) {

+        pcie_acs_init(d, XIO3130_ACS_OFFSET);

+    }

     return;



 err:

@@ -110,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)

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

@@ -139,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass
*klass, void *data)

     dc->desc = "TI X3130 Upstream Port of PCI Express Switch";

     dc->reset = xio3130_upstream_reset;

     dc->vmsd = &vmstate_xio3130_upstream;

+    device_class_set_props(dc, xio3130_upstream_props);

 }



 static const TypeInfo xio3130_upstream_info = {

-- 

2.24.3 (Apple Git-128)

--00000000000003893805e6587f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>v2 -&gt; v3:<br>- Add the missing code in V2.<br></di=
v><div><br></div>v1 -&gt; v2:<br>- Allow ACS to be disabled.<br>- Suggested=
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
-common-ligatures"><br></span></p><p style=3D"font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:11px;line-heigh=
t:normal;font-family:Menlo;margin:0px;color:rgb(0,0,0)"><span style=3D"font=
-variant-ligatures:no-common-ligatures"><br></span></p><p style=3D"font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font=
-size:11px;line-height:normal;font-family:Menlo;margin:0px;color:rgb(0,0,0)=
"><span style=3D"font-variant-ligatures:no-common-ligatures"><br></span></p=
><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">Signed-off-by: wlfightup &lt;<a href=3D"mailto:wlfightup@gmail.com">wl=
fightup@gmail.com</a>&gt;</span></p><p class=3D"gmail-p1" style=3D"margin:0=
px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font=
-variant-ligatures:no-common-ligatures">Signed-off-by: wangliang &lt;<a hre=
f=3D"mailto:wangliang40@baidu.com">wangliang40@baidu.com</a>&gt;</span></p>=
<p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"=
><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatur=
es">---</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo=
;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures=
:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</s=
pan>hw/pci-bridge/xio3130_upstream.c | 13 +++++++++++++</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0</span>1 file changed, 13 ins=
ertions(+)</span></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11px Me=
nlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D"fon=
t-variant-ligatures:no-common-ligatures"></span><br></p><p class=3D"gmail-p=
1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">diff --git a/hw=
/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c</span></p=
><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">index 5ff46ef050..5433d06fb3 100644</span></p><p class=3D"gmail-p1" st=
yle=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures">--- a/hw/pci-bridge/=
xio3130_upstream.c</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-varian=
t-ligatures:no-common-ligatures">+++ b/hw/pci-bridge/xio3130_upstream.c</sp=
an></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(=
0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-=
ligatures">@@ -24,6 +24,7 @@</span></p><p class=3D"gmail-p1" style=3D"margi=
n:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"f=
ont-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conve=
rted-space">=C2=A0</span>#include &quot;hw/pci/msi.h&quot;</span></p><p cla=
ss=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span=
 class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><s=
pan class=3D"gmail-Apple-converted-space">=C2=A0</span>#include &quot;hw/pc=
i/pcie.h&quot;</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11p=
x Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-li=
gatures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=
=C2=A0</span>#include &quot;hw/pci/pcie_port.h&quot;</span></p><p class=3D"=
gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=
=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">+#includ=
e &quot;hw/qdev-properties.h&quot;</span></p><p class=3D"gmail-p1" style=3D=
"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" styl=
e=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple=
-converted-space">=C2=A0</span>#include &quot;migration/vmstate.h&quot;</sp=
an></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(=
0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-=
ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>#includ=
e &quot;qemu/module.h&quot;</span></p><p class=3D"gmail-p2" style=3D"margin=
:0px;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gmail=
-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gm=
ail-Apple-converted-space">=C2=A0</span></span></p><p class=3D"gmail-p1" st=
yle=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures">@@ -37,6 +38,8 @@</s=
pan></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb=
(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common=
-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>#defin=
e XIO3130_SSVID_SSID<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0</span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=
=3D"gmail-Apple-converted-space">=C2=A0</span>#define XIO3130_EXP_OFFSET<sp=
an class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span>0x90</span></p><p class=3D"gmail-p1" style=3D"margin:=
0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"fon=
t-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-convert=
ed-space">=C2=A0</span>#define XIO3130_AER_OFFSET<span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0=
x100</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;co=
lor:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no=
-common-ligatures">+#define XIO3130_ACS_OFFSET \</span></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"=
gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">+<span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>(XIO313=
0_AER_OFFSET + PCI_ERR_SIZEOF)</span></p><p class=3D"gmail-p2" style=3D"mar=
gin:0px;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gm=
ail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D=
"gmail-Apple-converted-space">=C2=A0</span></span></p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail=
-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gm=
ail-Apple-converted-space">=C2=A0</span>static void xio3130_upstream_write_=
config(PCIDevice *d, uint32_t address,</span></p><p class=3D"gmail-p1" styl=
e=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-A=
pple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>uint32_t val, int len)</span></p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span =
class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">@@ =
-57,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)</span>=
</p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0=
,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-lig=
atures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>static voi=
d xio3130_upstream_realize(PCIDevice *d, Error **errp)</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0</span>{</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>PCIEPort=
 *p =3D PCIE_PORT(d);</span></p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-var=
iant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 </span>PCIESlot *s =3D PCIE_SLOT(d);</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>int rc;<=
/span></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11px Menlo;color:r=
gb(0,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=
=C2=A0</span></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px=
 Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=A0=C2=A0 =C2=A0 </span>pci_bridge_initfn(d, TYPE_PCIE_BUS);</span></p><p c=
lass=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><sp=
an class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">=
@@ -92,6 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Error =
**errp)</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo=
;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures=
:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>goto err;</span></p><p class=3D"gmail-p1" s=
tyle=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s=
1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmai=
l-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>}</span></p><p class=3D=
"gmail-p2" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0);min-height:=
13px"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-li=
gatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></=
p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0=
)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligat=
ures">+<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>if =
(!s-&gt;disable_acs) {</span></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-va=
riant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-=
space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>pcie_acs_init(d, XIO3130_ACS_OFFS=
ET);</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;co=
lor:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no=
-common-ligatures">+<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 </span>}</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px =
Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-liga=
tures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=A0=C2=A0 =C2=A0 </span>return;</span></p><p class=3D"gmail-p2" style=3D"ma=
rgin:0px;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p><p class=3D"gmail-=
p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gm=
ail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D=
"gmail-Apple-converted-space">=C2=A0</span>err:</span></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures">@@ -110,6 +11=
7,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)</span></p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span =
class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><sp=
an class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>pci_bri=
dge_exitfn(d);</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11p=
x Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-li=
gatures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=
=C2=A0</span>}</span></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11p=
x Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D=
"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-con=
verted-space">=C2=A0</span></span></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"fo=
nt-variant-ligatures:no-common-ligatures">+static Property xio3130_upstream=
_props[] =3D {</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11p=
x Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-li=
gatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 </span>DEFINE_PROP_BOOL(&quot;disable-acs&quot;, PCIESlot, di=
sable_acs, false),</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-varian=
t-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-spac=
e">=C2=A0 =C2=A0 </span>DEFINE_PROP_END_OF_LIST()</span></p><p class=3D"gma=
il-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D=
"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">+};</span><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,=
0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-liga=
tures">+</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menl=
o;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligature=
s:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</=
span>static const VMStateDescription vmstate_xio3130_upstream =3D {</span><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,=
0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-liga=
tures"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </sp=
an>.name =3D &quot;xio3130-express-upstream-port&quot;,</span></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span c=
lass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>.priorit=
y =3D MIG_PRI_PCI_BUS,</span></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-va=
riant-ligatures:no-common-ligatures">@@ -139,6 +151,7 @@ static void xio313=
0_upstream_class_init(ObjectClass *klass, void *data)</span></p><p class=3D=
"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span clas=
s=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span c=
lass=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>dc-&gt;desc=
 =3D &quot;TI X3130 Upstream Port of PCI Express Switch&quot;;</span></p><p=
 class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><=
span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures=
"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>dc=
-&gt;reset =3D xio3130_upstream_reset;</span></p><p class=3D"gmail-p1" styl=
e=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" =
style=3D"font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-A=
pple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>dc-&gt;vmsd =3D &amp;vmsta=
te_xio3130_upstream;</span></p><p class=3D"gmail-p1" style=3D"margin:0px;fo=
nt:11px Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-vari=
ant-ligatures:no-common-ligatures">+<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 =C2=A0 </span>device_class_set_props(dc, xio3130_upstream_props=
);</span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;colo=
r:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-c=
ommon-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=A0</span>}=
</span></p><p class=3D"gmail-p2" style=3D"margin:0px;font:11px Menlo;color:=
rgb(0,0,0);min-height:13px"><span class=3D"gmail-s1" style=3D"font-variant-=
ligatures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=
=C2=A0</span></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font:11px=
 Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=A0</span>static const TypeInfo xio3130_upstream_info =3D {</span></p><p cl=
ass=3D"gmail-p1" style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><spa=
n class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">-=
-<span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p><p sty=
le=3D"font-variant-numeric:normal;font-variant-east-asian:normal;font-stret=
ch:normal;font-size:11px;line-height:normal;font-family:Menlo;margin:0px;co=
lor:rgb(0,0,0)">







































































</p><div class=3D"gmail-gs" style=3D"margin:0px;padding:0px 0px 20px;width:=
1024px;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Ari=
al,sans-serif;font-size:medium"><div class=3D"gmail-"><div id=3D"gmail-:1o0=
" class=3D"gmail-ii gmail-gt" style=3D"direction:ltr;margin:8px 0px 0px;pad=
ding:0px;font-size:0.875rem"><div id=3D"gmail-:18z" class=3D"gmail-a3s gmai=
l-aiL" style=3D"font-variant-numeric:normal;font-variant-east-asian:normal;=
font-stretch:normal;font-size:small;line-height:1.5;font-family:Arial,Helve=
tica,sans-serif;overflow:hidden"><div dir=3D"ltr"><p style=3D"margin:0px;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norma=
l;font-size:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">2.24.3 (Apple Git-1=
28)</span></p></div></div></div></div></div></div>

--00000000000003893805e6587f91--

