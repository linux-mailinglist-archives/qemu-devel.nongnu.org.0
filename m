Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D96691B5C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 10:31:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQPju-0005SY-LZ; Fri, 10 Feb 2023 04:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pQPjq-0005S6-2A
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:30:39 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1pQPjn-0000ye-0D
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 04:30:37 -0500
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PCpLY02C0z16Lt4;
 Fri, 10 Feb 2023 17:28:05 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 10 Feb 2023 17:30:18 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2375.034;
 Fri, 10 Feb 2023 17:30:18 +0800
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "ani@anisinha.ca" <ani@anisinha.ca>
CC: "wangzhigang (O)" <wangzhigang17@huawei.com>, "zhangliang (AG)"
 <zhangliang5@huawei.com>
Subject: VM crashed while hot-plugging memory
Thread-Topic: VM crashed while hot-plugging memory
Thread-Index: Adk9MaURjdan2NllRa6742+cZL6pyA==
Date: Fri, 10 Feb 2023 09:30:18 +0000
Message-ID: <d9e62d4914a24b63af9f94a0e99b32c9@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.184.140]
Content-Type: multipart/alternative;
 boundary="_000_d9e62d4914a24b63af9f94a0e99b32c9huaweicom_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangming73@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

--_000_d9e62d4914a24b63af9f94a0e99b32c9huaweicom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all:

I found VM crashed while hot-plugging memory.

Base infomation:
qemu version: qemu-master
requirements: hugepages, virtio-gpu

It happens by the following steps:
1. Booting a VM with hugepages and a virtio-gpu device.
2. Connecting VNC of the VM.
3. After the VM booted, hot-plugging 512G memory.
4. Then you can find that the image in vnc is blocked and the worse thing i=
s that the VM crashed.

Actually the vcpu is blocked because of dead lock.

Analysis:
As when hot-pluging the BQL is held, at the meanwhile, virtio-gpu is trying=
 to hold the BQL for writing date. Then a vcpu is blocked waiting for hugep=
ages hot-plugging, specifically, waiting for touching pages. If the blocked=
 vcpu stops for several seconds, the soft lockup will happen, if it stops f=
or a long time, e.g. 30s, the VM will crash.

I am wandering if there are some ideas to avoid VM soft lockup and even VM =
crash ?

Thank you!
kind regards!

--_000_d9e62d4914a24b63af9f94a0e99b32c9huaweicom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1369138801;
	mso-list-type:hybrid;
	mso-list-template-ids:33180052 925635800 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello all:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found VM crashed while hot-pl=
ugging memory.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Base infomation:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu version: qemu-master<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">requirements: hugepages, virtio=
-gpu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It happens by the following ste=
ps:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. Booting a VM with hugepages =
and a virtio-gpu device.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2. Connecting VNC of the VM.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">3. After the VM booted, hot-plu=
gging 512G memory.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">4. Then you can find that the i=
mage in vnc is blocked and the worse thing is that the VM crashed.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Actually the vcpu is blocked be=
cause of dead lock.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Analysis:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As when hot-pluging the BQL is =
held, at the meanwhile, virtio-gpu is trying to hold the BQL for writing da=
te. Then a vcpu is blocked waiting for hugepages hot-plugging, specifically=
, waiting for touching pages. If the
 blocked vcpu stops for several seconds, the soft lockup will happen, if it=
 stops for a long time, e.g. 30s, the VM will crash.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am wandering if there are som=
e ideas to avoid VM soft lockup and even VM crash ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you!<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">kind regards!<o:p></o:p></span>=
</p>
</div>
</body>
</html>

--_000_d9e62d4914a24b63af9f94a0e99b32c9huaweicom_--

