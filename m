Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92837642A55
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:24:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN1-00016H-IX; Mon, 05 Dec 2022 09:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1p24Zw-0008PQ-24
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:03:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangming73@huawei.com>)
 id 1p24Zt-0001jP-0h
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 01:03:47 -0500
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NQXtf4GWTzqSs0;
 Mon,  5 Dec 2022 13:59:22 +0800 (CST)
Received: from dggpemm500010.china.huawei.com (7.185.36.134) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Dec 2022 14:03:30 +0800
Received: from dggpemm500010.china.huawei.com ([7.185.36.134]) by
 dggpemm500010.china.huawei.com ([7.185.36.134]) with mapi id 15.01.2375.031;
 Mon, 5 Dec 2022 14:03:30 +0800
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
CC: "wangzhigang (O)" <wangzhigang17@huawei.com>, "zhangliang (AG)"
 <zhangliang5@huawei.com>
Subject: [PATCH] net: Fix qemu crash when hot-pluging a vhost-net failed. 
Thread-Topic: [PATCH] net: Fix qemu crash when hot-pluging a vhost-net failed.
Thread-Index: AdkIXMCHd4gjC00QRBiCtntBSKqU3w==
Date: Mon, 5 Dec 2022 06:03:30 +0000
Message-ID: <0357c2371db0438eac0de474db2b8ddc@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.41]
Content-Type: multipart/mixed;
 boundary="_004_0357c2371db0438eac0de474db2b8ddchuaweicom_"
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
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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

--_004_0357c2371db0438eac0de474db2b8ddchuaweicom_
Content-Type: multipart/alternative;
	boundary="_000_0357c2371db0438eac0de474db2b8ddchuaweicom_"

--_000_0357c2371db0438eac0de474db2b8ddchuaweicom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear all:

I found a bug of qemu: hot-pluging a vhost-net may cause virtual machine cr=
ash in following steps:
1. Starting a vm without any net device.
2. Hot-pluging 70 memory devices.
3. Hot-pluging a vhost-net device.

After the 3rd step, the qemu crashed with following messages:

vhost backend memory slots limit is less than current number of present mem=
ory slots
warning: vhost-net requested but could not be initialized
qemu-system-x86_64: ../net/net.c:1106: net_client_init1: Assertion `nc' fai=
led.
2022-12-05 03:14:08.794+0000: shutting down, reason=3Dcrashed

This commit is used to fix the mentioned problem. It is based on commit a33=
c25399f9bc3dcf83064adeba2a82e61bf4608 of master branch.

Kind regards.


--_000_0357c2371db0438eac0de474db2b8ddchuaweicom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear all:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found a bug of qemu: hot-plug=
ing a vhost-net may cause virtual machine crash in following steps:<br>
1. Starting a vm without any net device.<br>
2. Hot-pluging 70 memory devices.<br>
3. Hot-pluging a vhost-net device.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After the 3<sup>rd</sup> step, =
the qemu crashed with following messages:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">vhost backend memory slots limi=
t is less than current number of present memory slots<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">warning: vhost-net requested bu=
t could not be initialized<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">qemu-system-x86_64: ../net/net.=
c:1106: net_client_init1: Assertion `nc' failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2022-12-05 03:14:08.794&#43;000=
0: shutting down, reason=3Dcrashed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This commit is used to fix the =
mentioned problem. It is based on commit a33c25399f9bc3dcf83064adeba2a82e61=
bf4608 of master branch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_0357c2371db0438eac0de474db2b8ddchuaweicom_--

--_004_0357c2371db0438eac0de474db2b8ddchuaweicom_
Content-Type: application/octet-stream;
	name="0001-net-net.c-do-not-assert-nc-as-hotplug-vhost-net-may-.patch"
Content-Description: 0001-net-net.c-do-not-assert-nc-as-hotplug-vhost-net-may-.patch
Content-Disposition: attachment;
	filename="0001-net-net.c-do-not-assert-nc-as-hotplug-vhost-net-may-.patch";
	size=2112; creation-date="Mon, 05 Dec 2022 03:49:23 GMT";
	modification-date="Mon, 05 Dec 2022 03:49:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMmJjYTQ4MzIxMmYwNGI5YjAyMTc1M2FlYzFmY2FlYWY0MTM4NWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaW5nIFlhbmcgPHlhbmdtaW5nNzNAaHVhd2VpLmNvbT4KRGF0
ZTogRnJpLCAyNSBOb3YgMjAyMiAxMDo0NTo1MiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIG5ldC9u
ZXQuYzogRml4IHFlbXUgY3Jhc2ggd2hlbiBob3QtcGx1Z2luZyBhIHZob3N0LW5ldCBmYWlsZWQu
IAoKSG90LXBsdWdpbmcgYSB2aG9zdC1uZXQgbWF5IGNhdXNlIHZpcnR1YWwgbWFjaGluZSBjcmFz
aCBpbiBmb2xsb3dpbmcgc3RlcHM6CjEuIFN0YXJ0aW5nIGEgdm0gd2l0aG91dCBuZXQgZGV2aWNl
cy4KMi4gSG90LXBsdWdpbmcgNzAgbWVtb3J5IGRldmljZXMuCjMuIEhvdC1wbHVnaW5nIGEgdmhv
c3QtbmV0IGRldmljZS4KClRoZSByZWFzb24gaXMgOiBpZiBob3RwbHVnIGEgdmhvc3QtbmV0IGZh
aWxlZCwgdGhlIG5jIGNhbm5vdCBiZSBmb3VuZCB2aWEgZnVuY3Rpb24gcWVtdV9maW5kX25ldGRl
diwgYXMKaXQgaGFzIGJlZW4gY2xlYW5lZCB1cCB0aHJvdWdoIGZ1bmN0aW9uIHFlbXVfY2xlYW51
cF9uZXRfY2xpZW50LiBXaGljaCBsZWFkcyB0byB0aGUgcmVzdWx0CnRoYXQgYXNzZXJ0KG5jKSBm
YWlsZWQsIHRoZW4gcWVtdSBjcmFzaGVkLgoKV2hpbGUsIHRoZSByb290IHJlYXNvbiBpcyB0aGF0
LCBpbiBjb21taXQgNDZkNGQzNmQwYmYyIGlmIG5vdCBib3RoIGhhc192aG9zdGZvcmNlIGFuZCB2
aG9zdGZvcmNlIGZsYWdzCmFyZSB0cnVlLCB0aGUgZXJycCB3b3VsZCBub3QgYmUgc2V0LiBUaGVu
IG5ldF9pbml0X3RhcCB3b3VsZCBub3QgcmV0dXJuIGEgbmVnYXRpdmUgdmFsdWUsIGZhbGxvd2Vk
IGJ5IGZvdW5kaW5nIG5jCmFuZCBhc3NlcnQgbmMuCgpJbiB0aGlzIHBhdGNoLCBhc3NlcnRpbmcg
bmMgaXMgcmVwbGFjZWQgd2l0aCBzZXR0aW5nIGFuIGVycm9yIG1lc3NhZ2UuCgpGaXhlczogNDZk
NGQzNmQwYmYyKCJ0YXA6IHNldHRpbmcgZXJyb3IgYXBwcm9wcmlhdGVseSB3aGVuIGNhbGxpbmcg
bmV0X2luaXRfdGFwX29uZSgpIikKU2lnbmVkLW9mZi1ieTogTWluZyBZYW5nIDx5YW5nbWluZzcz
QGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IExpYW5nIFpoYW5nIDx6aGFuZ2xpYW5nNUBodWF3
ZWkuY29tPgotLS0KIG5ldC9uZXQuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC9uZXQuYyBi
L25ldC9uZXQuYwppbmRleCA4NDBhZDlkY2E1Li4xZDFkN2U1NGM0IDEwMDY0NAotLS0gYS9uZXQv
bmV0LmMKKysrIGIvbmV0L25ldC5jCkBAIC0xMTAzLDcgKzExMDMsMTYgQEAgc3RhdGljIGludCBu
ZXRfY2xpZW50X2luaXQxKGNvbnN0IE5ldGRldiAqbmV0ZGV2LCBib29sIGlzX25ldGRldiwgRXJy
b3IgKiplcnJwKQogCiAgICAgaWYgKGlzX25ldGRldikgewogICAgICAgICBuYyA9IHFlbXVfZmlu
ZF9uZXRkZXYobmV0ZGV2LT5pZCk7Ci0gICAgICAgIGFzc2VydChuYyk7CisgICAgICAgIC8qCisg
ICAgICAgICAqIElmIHRoZSB0YXAgb2YgaG90cGx1Z2VkIG5ldCBkZXZpY2UgZG8gbm90IGhhcyBi
b3RoIGhhc192aG9zdGZvcmNlIGZsYWcgYW5kIHZob3N0Zm9yY2UgZmxhZ3MsCisgICAgICAgICAq
IHdoZW4gZXJyb3Igb2NjdXJzLCB0aGUgZXJyb3IgbWVzc2FncyB3aWxsIGJlIHJlcG9ydCBidXQg
bm90IHNldCB0byBlcnJwLiBUaHVzIG5ldF9jbGllbnRfaW5pdF9mdW4KKyAgICAgICAgICogd2ls
bCBub3QgcmV0dXJuIGEgbmVnYXRhdmUgdmFsdWUuIFRoZXJlZm9yZSB0aGUgdmFsdWUgb2YgbmMg
bWlnaHQgYmUgTlVMTC4gVG8gbWFrZSBxZW11IHJvYnVzdCwKKyAgICAgICAgICogaXQgaXMgYmV0
dGVyIHRvIGp1ZGdlIGlmIG5jIGlzIE5VTEwuCisgICAgICAgICAqLworICAgICAgICBpZiAoIW5j
KSB7CisgICAgICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJEZXZpY2UgJyVzJyBjb3VsZCBub3Qg
YmUgaW5pdGlhbGl6ZWQiLCBuZXRkZXYtPmlkKTsKKyAgICAgICAgICAgIHJldHVybiAtMTsKKyAg
ICAgICAgfQogICAgICAgICBuYy0+aXNfbmV0ZGV2ID0gdHJ1ZTsKICAgICB9CiAKLS0gCjIuMzMu
MAoK

--_004_0357c2371db0438eac0de474db2b8ddchuaweicom_--

