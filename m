Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34F4C17C0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:51:18 +0100 (CET)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMtvB-0007aW-2h
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wliang@stu.xidian.edu.cn>)
 id 1nMsm2-00051M-Vu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:37:47 -0500
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81]:50601
 helo=azure-sdnproxy-1.icoremail.net)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wliang@stu.xidian.edu.cn>) id 1nMslr-0006G9-5r
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:37:46 -0500
Received: by ajax-webmail-sr0414.icoremail.net (Coremail) ; Wed, 23 Feb 2022
 22:37:24 +0800 (GMT+08:00)
X-Originating-IP: [39.130.79.173]
Date: Wed, 23 Feb 2022 22:37:24 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: wliang@stu.xidian.edu.cn
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Fix a potential Use-after-free in
 test_blockjob_common_drain_node() (v6.2.0).
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210401(fdb522e2)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
Content-Type: multipart/mixed; 
 boundary="----=_Part_34312_489414039.1645627044081"
MIME-Version: 1.0
Message-ID: <21fd23f8.25ce.17f2703f0f8.Coremail.wliang@stu.xidian.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBXSwKkRhZiLccKAA--.4020W
X-CM-SenderInfo: pzolt0vj6v33wo0lvxldqovvfxof0/1tbiAQMMA1wR-vU9jgACs6
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=52.237.72.81;
 envelope-from=wliang@stu.xidian.edu.cn; helo=azure-sdnproxy-1.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Feb 2022 10:48:08 -0500
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

------=_Part_34312_489414039.1645627044081
Content-Type: multipart/alternative; 
	boundary="----=_Part_34314_1059547730.1645627044081"

------=_Part_34314_1059547730.1645627044081
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgYWxsLAoKSSBmaW5kIGEgcG90ZW50aWFsIFVzZS1hZnRlci1mcmVlIGluIFFFTVUgNi4yLjAs
IHdoaWNoIGlzIGluIHRlc3RfYmxvY2tqb2JfY29tbW9uX2RyYWluX25vZGUoKSAoLi90ZXN0cy91
bml0L3Rlc3QtYmRydi1kcmFpbi5jKS4KClNwZWNpZmljYWxseSwgYXQgbGluZSA4ODAsIHRoZSB2
YXJpYWJsZSAnc2NyJyBpcyByZWxlYXNlZCBieSB0aGUgYmRydl91bnJlZigpLiBIb3dldmVyLCBh
dCBsaW5lIDg4MSwgaXQgaXMgc3Vic2VxdWVudGx5IHVzZWQgYXMgdGhlIDFzdCBwYXJhbWV0ZXIg
b2YgdGhlIGZ1bmN0aW9uIGJkcnZfc2V0X2JhY2tpbmdfaGQoKS4gQXMgYSByZXN1bHQsIGFuIFVB
RiBidWcgbWF5IGJlIHRyaWdnZXJlZC4KCgoKCgo4ODAgICAgYmRydl91bnJlZihzcmMpOwoKCjg4
MSAgICBiZHJ2X3NldF9iYWNraW5nX2hkKHNyYywgc3JjX2JhY2tpbmcsICZlcnJvcl9hYm9ydCk7
CgoKCgoKSSBiZWxpZXZlIHRoYXQgdGhlIHByb2JsZW0gY2FuIGJlIGZpeGVkIGJ5IGludm9raW5n
IGJkcnZfdW5yZWYoKSBhZnRlciB0aGUgY2FsbCBvZiBiZHJ2X3NldF9iYWNraW5nX2hkKCkgcmF0
aGVyIHRoYW4gYmVmb3JlIGl0LgoKCi0tLSAgICBiZHJ2X3VucmVmKHNyYyk7Cjg4MSAgICBiZHJ2
X3NldF9iYWNraW5nX2hkKHNyYywgc3JjX2JhY2tpbmcsICZlcnJvcl9hYm9ydCk7CisrK2JkcnZf
dW5yZWYoc3JjKTsKCgpJJ20gbG9va2luZyBmb3J3YXJkIHRvIHlvdXIgY29uZmlybWF0aW9uLgoK
QmVzdCwKV2VudGFvCg==
------=_Part_34314_1059547730.1645627044081
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oztmb250
LXNpemU6MTZweDsiPkhpIGFsbCw8L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
U2ltU3VuOyI+PC9zcGFuPjxicj4KPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVz
IE5ldyBSb21hbiZxdW90Oztmb250LXNpemU6MTZweDsiPkkgZmluZCBhIHBvdGVudGlhbCBVc2Ut
YWZ0ZXItZnJlZSBpbiBRRU1VIDYuMi4wLCB3aGljaCBpcyBpbiB0ZXN0X2Jsb2Nram9iX2NvbW1v
bl9kcmFpbl9ub2RlKCkgKC4vdGVzdHMvdW5pdC90ZXN0LWJkcnYtZHJhaW4uYykuPC9zcGFuPjxi
cj4KPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPjwvc3Bhbj48YnI+CjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Zm9udC1zaXplOjE2
cHg7Ij5TcGVjaWZpY2FsbHksIGF0IGxpbmUgODgwLCB0aGUgdmFyaWFibGUgJ3NjcicgaXMgcmVs
ZWFzZWQgYnkgdGhlIGJkcnZfdW5yZWYoKS4gSG93ZXZlciwgYXQgbGluZSA4ODEsIGl0IGlzIHN1
YnNlcXVlbnRseSB1c2VkIGFzIHRoZSAxc3QgcGFyYW1ldGVyIG9mIHRoZSBmdW5jdGlvbiBiZHJ2
X3NldF9iYWNraW5nX2hkKCkuIEFzIGEgcmVzdWx0LCBhbiBVQUYgYnVnIG1heSBiZSB0cmlnZ2Vy
ZWQuPC9zcGFuPjxicj4KPHA+Cgk8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+PC9z
cGFuPgo8L3A+CjxwPgoJPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPjxicj4KPC9z
cGFuPgo8L3A+CjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47Ij48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQtc2l6ZToxNnB4OyI+
ODgwPC9zcGFuPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmU7Ij4gPC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Zm9udC1zaXplOjE2
cHg7Ij4mbmJzcDsgJm5ic3A7IGJkcnZfdW5yZWYoc3JjKTs8L3NwYW4+PC9zcGFuPjxicj4KPHA+
Cgk8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oztmb250LXNpemU6MTZweDsiPjg4MTwvc3Bh
bj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlOyI+IDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQtc2l6ZToxNnB4OyI+Jm5i
c3A7ICZuYnNwOyBiZHJ2X3NldF9iYWNraW5nX2hkKHNyYywgc3JjX2JhY2tpbmcsICZhbXA7ZXJy
b3JfYWJvcnQpOzwvc3Bhbj48L3NwYW4+CjwvcD4KPHA+Cgk8c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6U2ltU3VuOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21h
biZxdW90Oztmb250LXNpemU6MTZweDsiPjxicj4KPC9zcGFuPjwvc3Bhbj4KPC9wPgo8YnI+Cjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Zm9udC1z
aXplOjE2cHg7Ij5JIGJlbGlldmUgdGhhdCB0aGUgcHJvYmxlbSBjYW4gYmUgZml4ZWQgYnkgaW52
b2tpbmcgYmRydl91bnJlZigpIGFmdGVyIHRoZSBjYWxsIG9mIGJkcnZfc2V0X2JhY2tpbmdfaGQo
KSByYXRoZXIgdGhhbiBiZWZvcmUgaXQuPC9zcGFuPjxicj4KPHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OlNpbVN1bjsiPjxicj4KPC9zcGFuPjxicj4KPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OlNp
bVN1bjsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVv
dDs7Zm9udC1zaXplOjE2cHg7Ij4tLS08L3NwYW4+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnBy
ZTsiPiA8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21h
biZxdW90Oztmb250LXNpemU6MTZweDsiPiZuYnNwOyAmbmJzcDsgYmRydl91bnJlZihzcmMpOzwv
c3Bhbj48L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oztmb250LXNpemU6
MTZweDsiPjg4MTwvc3Bhbj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlOyI+IDwvc3Bhbj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQt
c2l6ZToxNnB4OyI+Jm5ic3A7ICZuYnNwOyBiZHJ2X3NldF9iYWNraW5nX2hkKHNyYywgc3JjX2Jh
Y2tpbmcsICZhbXA7ZXJyb3JfYWJvcnQpOzwvc3Bhbj48L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6U2ltU3VuOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O1RpbWVz
IE5ldyBSb21hbiZxdW90Oztmb250LXNpemU6MTZweDsiPisrKzwvc3Bhbj48c3BhbiBzdHlsZT0i
d2hpdGUtc3BhY2U6cHJlOyI+IDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7
VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQtc2l6ZToxNnB4OyI+YmRydl91bnJlZihzcmMpOzwv
c3Bhbj48L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6U2ltU3VuOyI+PGJyPgo8
L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFu
JnF1b3Q7O2ZvbnQtc2l6ZToxNnB4OyI+SSdtIGxvb2tpbmcgZm9yd2FyZCB0byB5b3VyIGNvbmZp
cm1hdGlvbi48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OlNpbVN1bjsiPjxicj4KPC9z
cGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpTaW1TdW47Ij48L3NwYW4+PGJyPgo8c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQtc2l6ZTox
NnB4OyI+QmVzdCw8L3NwYW4+PGJyPgo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7VGlt
ZXMgTmV3IFJvbWFuJnF1b3Q7O2ZvbnQtc2l6ZToxNnB4OyI+V2VudGFvPC9zcGFuPjxicj4=
------=_Part_34314_1059547730.1645627044081--

------=_Part_34312_489414039.1645627044081
Content-Type: text/x-patch; name=test-bdrv-drain.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="test-bdrv-drain.patch"

LS0tIC4vdGVzdHMvdW5pdC90ZXN0LWJkcnYtZHJhaW4uYwkyMDIyLTAyLTIzIDE1OjA2OjMyLjM4
NDc4NjA3MCArMDgwMAorKysgLi90ZXN0cy91bml0L3Rlc3QtYmRydi1kcmFpbi1QQVRDSC5jCTIw
MjItMDItMjMgMjE6MTY6NDMuNDQ0OTI4OTkyICswODAwCkBAIC04NzcsOCArODc3LDggQEAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJEUlZfT19SRFdSLCAmZXJyb3Jf
YWJvcnQpOwogCiAgICAgYmRydl9zZXRfYmFja2luZ19oZChzcmNfb3ZlcmxheSwgc3JjLCAmZXJy
b3JfYWJvcnQpOwotICAgIGJkcnZfdW5yZWYoc3JjKTsKICAgICBiZHJ2X3NldF9iYWNraW5nX2hk
KHNyYywgc3JjX2JhY2tpbmcsICZlcnJvcl9hYm9ydCk7CisgICAgYmRydl91bnJlZihzcmMpOwog
ICAgIGJkcnZfdW5yZWYoc3JjX2JhY2tpbmcpOwogCiAgICAgYmxrX3NyYyA9IGJsa19uZXcocWVt
dV9nZXRfYWlvX2NvbnRleHQoKSwgQkxLX1BFUk1fQUxMLCBCTEtfUEVSTV9BTEwpOwo=
------=_Part_34312_489414039.1645627044081--


