Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50595B8516
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 11:35:43 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYOo2-00082w-ER
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYOkF-000656-H3
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 05:31:47 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYOkA-0007Lu-86
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 05:31:45 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 63C402E125C;
 Wed, 14 Sep 2022 12:31:27 +0300 (MSK)
Received: from 2a02:6b8:c0c:3ad:0:640:89df:0 (2a02:6b8:c0c:3ad:0:640:89df:0
 [2a02:6b8:c0c:3ad:0:640:89df:0])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 GVX1Se0KamI1-VRKCJpIp; Wed, 14 Sep 2022 12:31:27 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663147887; bh=VdGIdHMSluB7kws+UdcWaJ3KRfY8eCC73yK1DsvXPXQ=;
 h=Cc:Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=yvsrGYIGnbpYLVufTgmtd/YOWCh+HS4N2mPi0e3Izfo6i12YST6zV3/o9+D3QEHQJ
 RK2C3MkBVA+q41Tf+eTrJWGr2GGGjjOGQKwoF/GTpL9iFaSqXoL7vkG7v4IHqfYzld
 plfhBGWeUh/r6Jk+C79X3jaX1atSObNsN/fXB+EM=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from ij3urkvf4buhbqq7.myt.yp-c.yandex.net
 (ij3urkvf4buhbqq7.myt.yp-c.yandex.net [2a02:6b8:c12:3b24:0:640:4e1a:0])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 xUXcYf0Jc8c1-rQw5mXjA
 for <davydov-max@yandex-team.ru>; Wed, 14 Sep 2022 12:31:17 +0300
Received: by ij3urkvf4buhbqq7.myt.yp-c.yandex.net with HTTP;
 Wed, 14 Sep 2022 12:31:17 +0300
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 =?utf-8?B?0JLQu9Cw0LTQuNC80LjRgCDQodC10LzQtdC90YbQvtCyLdCe0LPQuNC10LLRgdC60LjQuQ==?=
 <vsementsov@yandex-team.ru>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
In-Reply-To: <CAJ+F1CKj5zELJ=HHOde4FMk_q9P3-o4qD+0J0iO-LaSKJZievw@mail.gmail.com>
References: <20220825165247.33704-1-davydov-max@yandex-team.ru>
 <CAJ+F1CKj5zELJ=HHOde4FMk_q9P3-o4qD+0J0iO-LaSKJZievw@mail.gmail.com>
Subject: Re: [PATCH] chardev: fix segfault in finalize
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 14 Sep 2022 12:31:27 +0300
Message-Id: <58041663147784@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

PGRpdj4rIHZzZW1lbnRzb3ZAPC9kaXY+PGRpdj4tIHBib256aW5pQDwvZGl2PjxkaXY+wqA8L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MjYuMDguMjAyMiwgMTE6MjEsICJNYXJj
LUFuZHLDqSBMdXJlYXUiICZsdDttYXJjYW5kcmUubHVyZWF1QGdtYWlsLmNvbSZndDs6PC9kaXY+
PGJsb2NrcXVvdGU+PGRpdj5IaTxkaXY+wqA8L2Rpdj7CoDxkaXY+PGRpdj5PbiBUaHUsIEF1ZyAy
NSwgMjAyMiBhdCA5OjAyIFBNIE1ha3NpbSBEYXZ5ZG92ICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2
eWRvdi1tYXhAeWFuZGV4LXRlYW0ucnUiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+ZGF2eWRv
di1tYXhAeWFuZGV4LXRlYW0ucnU8L2E+Jmd0OyB3cm90ZTo8L2Rpdj48YmxvY2txdW90ZSBzdHls
ZT0iYm9yZGVyLWxlZnQtY29sb3I6cmdiKCAyMDQgLCAyMDQgLCAyMDQgKTtib3JkZXItbGVmdC1z
dHlsZTpzb2xpZDtib3JkZXItbGVmdC13aWR0aDoxcHg7bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O3BhZGRpbmctbGVmdDoxZXgiPklmIGZpbmFsaXplIGNoYXJkZXYtbXNtb3VzZSBvciBjaGFyZGV2
LXdjdGFibGUgaXMgY2FsbGVkIGltbWVkaWF0ZWx5IGFmdGVyPGJyIC8+aW5pdCBpdCBjYXNlcyBR
RU1VIHRvIGNyYXNoIHdpdGggc2VnZmF1bHQuIFRoaXMgaGFwcGVucyBiZWNhdXNlIG9mPGJyIC8+
UVRBSUxRX1JFTU9WRSBpbiBxZW11X2lucHV0X2hhbmRsZXJfdW5yZWdpc3RlciB0cmllcyB0byBk
ZXJlZmVyZW5jZTxiciAvPk5VTEwgcG9pbnRlci48YnIgLz5Gb3IgaW5zdGFuY2UsIHRoaXMgZXJy
b3IgY2FuIGJlIHJlcHJvZHVjZWQgdmlhIGBxb20tbGlzdC1wcm9wZXJ0aWVzYDxiciAvPmNvbW1h
bmQuPGJyIC8+PGJyIC8+U2lnbmVkLW9mZi1ieTogTWFrc2ltIERhdnlkb3YgJmx0OzxhIGhyZWY9
Im1haWx0bzpkYXZ5ZG92LW1heEB5YW5kZXgtdGVhbS5ydSIgcmVsPSJub29wZW5lciBub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+ZGF2eWRvdi1tYXhAeWFuZGV4LXRlYW0ucnU8L2E+Jmd0Ozwv
YmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+PGRpdj5SZXZpZXdlZC1ieTogTWFyYy1BbmRyw6kgTHVy
ZWF1ICZsdDs8YSBocmVmPSJtYWlsdG86bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tIiByZWw9
Im5vb3BlbmVyIG5vcmVmZXJyZXIiPm1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbTwvYT4mZ3Q7
PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXItbGVmdC1jb2xvcjpy
Z2IoIDIwNCAsIDIwNCAsIDIwNCApO2JvcmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0
LXdpZHRoOjFweDttYXJnaW46MHB4IDBweCAwcHggMC44ZXg7cGFkZGluZy1sZWZ0OjFleCI+LS0t
PGJyIC8+wqBjaGFyZGV2L21zbW91c2UuY8KgIHwgNCArKystPGJyIC8+wqBjaGFyZGV2L3djdGFi
bGV0LmMgfCA0ICsrKy08YnIgLz7CoDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKTxiciAvPjxiciAvPmRpZmYgLS1naXQgYS9jaGFyZGV2L21zbW91c2UuYyBi
L2NoYXJkZXYvbXNtb3VzZS5jPGJyIC8+aW5kZXggZWI5MjMxZGNkYi4uMmNjMWIxNjU2MSAxMDA2
NDQ8YnIgLz4tLS0gYS9jaGFyZGV2L21zbW91c2UuYzxiciAvPisrKyBiL2NoYXJkZXYvbXNtb3Vz
ZS5jPGJyIC8+QEAgLTE0Niw3ICsxNDYsOSBAQCBzdGF0aWMgdm9pZCBjaGFyX21zbW91c2VfZmlu
YWxpemUoT2JqZWN0ICpvYmopPGJyIC8+wqB7PCEtLSAtLT48YnIgLz7CoCDCoCDCoE1vdXNlQ2hh
cmRldiAqbW91c2UgPSBNT1VTRV9DSEFSREVWKG9iaik7PGJyIC8+PGJyIC8+LcKgIMKgIHFlbXVf
aW5wdXRfaGFuZGxlcl91bnJlZ2lzdGVyKG1vdXNlLSZndDtocyk7PGJyIC8+K8KgIMKgIGlmICht
b3VzZS0mZ3Q7aHMpIHs8IS0tIC0tPjxiciAvPivCoCDCoCDCoCDCoCBxZW11X2lucHV0X2hhbmRs
ZXJfdW5yZWdpc3Rlcihtb3VzZS0mZ3Q7aHMpOzxiciAvPivCoCDCoCB9PGJyIC8+wqB9PGJyIC8+
PGJyIC8+wqBzdGF0aWMgUWVtdUlucHV0SGFuZGxlciBtc21vdXNlX2hhbmRsZXIgPSB7PCEtLSAt
LT48YnIgLz5kaWZmIC0tZ2l0IGEvY2hhcmRldi93Y3RhYmxldC5jIGIvY2hhcmRldi93Y3RhYmxl
dC5jPGJyIC8+aW5kZXggZThiMjkyYzQzYy4uNDNiZGY2YjYwOCAxMDA2NDQ8YnIgLz4tLS0gYS9j
aGFyZGV2L3djdGFibGV0LmM8YnIgLz4rKysgYi9jaGFyZGV2L3djdGFibGV0LmM8YnIgLz5AQCAt
MzE5LDcgKzMxOSw5IEBAIHN0YXRpYyB2b2lkIHdjdGFibGV0X2Nocl9maW5hbGl6ZShPYmplY3Qg
Km9iaik8YnIgLz7CoHs8IS0tIC0tPjxiciAvPsKgIMKgIMKgVGFibGV0Q2hhcmRldiAqdGFibGV0
ID0gV0NUQUJMRVRfQ0hBUkRFVihvYmopOzxiciAvPjxiciAvPi3CoCDCoCBxZW11X2lucHV0X2hh
bmRsZXJfdW5yZWdpc3Rlcih0YWJsZXQtJmd0O2hzKTs8YnIgLz4rwqAgwqAgaWYgKHRhYmxldC0m
Z3Q7aHMpIHs8IS0tIC0tPjxiciAvPivCoCDCoCDCoCDCoCBxZW11X2lucHV0X2hhbmRsZXJfdW5y
ZWdpc3Rlcih0YWJsZXQtJmd0O2hzKTs8YnIgLz4rwqAgwqAgfTxiciAvPsKgfTxiciAvPjxiciAv
PsKgc3RhdGljIHZvaWQgd2N0YWJsZXRfY2hyX29wZW4oQ2hhcmRldiAqY2hyLDxiciAvPi0tPGJy
IC8+Mi4yNS4xPGJyIC8+PGJyIC8+wqA8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIC8+PGJyIC8+LS08
ZGl2Pk1hcmMtQW5kcsOpIEx1cmVhdTwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2PlRoYW5r
cyBmb3IgcmV2aWV3aW5nPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVz
dCByZWdhcmRzLDwvZGl2PjxkaXY+TWFrc2ltIERhdnlkb3Y8L2Rpdj48ZGl2PsKgPC9kaXY+

