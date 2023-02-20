Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D869C3F9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 02:35:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTv3z-0001XD-S6; Sun, 19 Feb 2023 20:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pTv3x-0001Ww-Up
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 20:33:53 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pTv3u-0007lZ-Js
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 20:33:53 -0500
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PKlHb3r85znWDT;
 Mon, 20 Feb 2023 09:31:07 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 20 Feb 2023 09:33:34 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2507.017;
 Mon, 20 Feb 2023 09:33:34 +0800
To: "mst@redhat.com" <mst@redhat.com>, "david@redhat.com" <david@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "wangzhigang (O)" <wangzhigang17@huawei.com>, "zhangliang (AG)"
 <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
Subject: Optimization for the virtio-balloon feature on the ARM platform
Thread-Topic: Optimization for the virtio-balloon feature on the ARM platform
Thread-Index: AdlEyiq0ho6dn5EQSS65n1CEKd/bMgAALcjg
Date: Mon, 20 Feb 2023 01:33:34 +0000
Message-ID: <0a0e1f05073d44a38a35e270ca735819@huawei.com>
References: <8c6d264163574d8b886afdd3e4b77a2d@huawei.com>
In-Reply-To: <8c6d264163574d8b886afdd3e4b77a2d@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.184.140]
Content-Type: multipart/alternative;
 boundary="_000_0a0e1f05073d44a38a35e270ca735819huaweicom_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangming73@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Yangming <yangming73@huawei.com>
From:  Yangming via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_0a0e1f05073d44a38a35e270ca735819huaweicom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear QEMU maintainers,

I am writing to discuss a possible optimization for the virtio-balloon feat=
ure on the ARM platform. The 'virtio_balloon_set_config' function is called=
 frequently during the balloon inflation process, and its subfunction 'get_=
current_ram_size' needs to traverse the virtual machine's memory modules in=
 order to count the current virtual machine's memory (i.e initial ram size =
+ hotplugged memory). This can be very time consuming on the ARM platform, =
as the ARM virtual machine has much more complex memory modules than the x8=
6 virtual machine.

Therefore, I suggest introducing a global variable, 'total_ram_size', that =
would be updated only when the balloon is initialized and hotplug memory ha=
s completed. This would increase the efficiency of balloon inflation by mor=
e than 60% on the ARM platform.

The following code is part of the optimization for balloon:

--- a/qemu/hw/virtio/virtio-balloon.c
+++ b/qemu/hw/virtio/virtio-balloon.c
static void virtio_balloon_set_config(...)
...
-    ram_addr_t vm_ram_size =3D get_current_ram_size();
+   ram_addr_t vm_ram_size =3D total_ram_size;
...
I hope this suggestion could be considered or discussed by QEMU developers.=
 I would love to seeing this improvement added to QEMU in the future.

Best regards,
Qi

--_000_0a0e1f05073d44a38a35e270ca735819huaweicom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	line-height:150%;
	layout-grid-mode:char;
	text-autospace:none;
	font-size:10.5pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:DengXian;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">Dear QEMU maintainers,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">I am writing to discuss a possible optimization for the virtio=
-balloon feature on the ARM platform. The &#8216;virtio_balloon_set_config&=
#8217; function is called frequently during the balloon
 inflation process, and its subfunction &#8216;get_current_ram_size&#8217; =
needs to traverse the virtual machine's memory modules in order to count th=
e current virtual machine's memory (i.e initial ram size &#43; hotplugged m=
emory). This can be very time consuming on the ARM
 platform, as the ARM virtual machine has much more complex memory modules =
than the x86 virtual machine.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">Therefore, I suggest introducing a global variable, &#8216;tot=
al_ram_size&#8217;, that would be updated only when the balloon is initiali=
zed and hotplug memory has completed. This would increase
 the efficiency of balloon inflation by more than 60% on the ARM platform. =
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">The following code is part of the optimization for balloon:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">--- a/qemu/hw/virtio/virtio-balloon.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">&#43;&#43;&#43; b/qemu/hw/virtio/virtio-balloon.c<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">static void virtio_balloon_set_config(&#8230;)<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">-&nbsp;&nbsp;&nbsp; ram_addr_t vm_ram_size =3D get_current_ram=
_size();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">&#43;&nbsp;&nbsp; ram_addr_t vm_ram_size =3D total_ram_size;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">I hope this suggestion could be considered or discussed by QEM=
U developers. I would love to seeing this improvement added to QEMU in the =
future.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;line-=
height:150%">Qi</span><span lang=3D"EN-US" style=3D"font-family:DengXian"><=
o:p></o:p></span></p>
</div>
</body>
</html>

--_000_0a0e1f05073d44a38a35e270ca735819huaweicom_--

