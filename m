Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651163DB0D7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 03:59:58 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Hob-0000Sq-5q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 21:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <AIERPATIJIANG1@kingsoft.com>)
 id 1m9Hng-00088c-AB
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:59:00 -0400
Received: from [114.255.44.146] (port=39573 helo=mail.kingsoft.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <AIERPATIJIANG1@kingsoft.com>) id 1m9Hnd-0007aT-3B
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:58:59 -0400
X-AuditID: 0a580157-e15ff7000006309b-29-61035cd15bb9
Received: from mail.kingsoft.com (localhost [10.88.1.79])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-1-NODE-87) with SMTP id 2B.0D.12443.2DC53016;
 Fri, 30 Jul 2021 09:58:42 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL4.kingsoft.cn
 (10.88.1.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 30 Jul
 2021 09:58:41 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b]) by
 KSBJMAIL3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b%6]) with mapi id
 15.01.2176.014; Fri, 30 Jul 2021 09:58:41 +0800
From: =?utf-8?B?QUlFUlBBVElKSUFORzEgW+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb?=
 =?utf-8?B?5Lmw5o+QXQ==?= <AIERPATIJIANG1@kingsoft.com>
To: "lvivier@redhat.com" <lvivier@redhat.com>, "amit@kernel.org"
 <amit@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>
Subject: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Topic: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Index: AQHXfhCIoeZCoIzDgkWI30flJ82In6tWICuAgASwioA=
Date: Fri, 30 Jul 2021 01:58:41 +0000
Message-ID: <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
 <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
In-Reply-To: <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.2.22]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4592EBBE170B6A4C8AA901D4B726320F@kingsoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LhimD0170Uw5xo0L6O0eLz3TnsFp8apCz+
 /3rFanG8dweLxetJ/1kdWD02repk83hybTOTx/t9V9kCmKO4bFJSczLLUov07RK4Ms5du8Ne
 0CJesa1xLXsD4w6xLkZODgkBE4m/t1ezdjFycQgJTGeSOPLjOzOE84JRYuumPqjMHkaJD8e/
 sIE4bALtjBKHD08Hy4gI3GSUOLf0OBPIMGGBYomnv/8D9XMAJSokbv1JAQmLCFhJtFxdywZi
 swioSpzZdYYRpIRXwF5i42l+kLCQQKlE3/5uVhCbU8BB4uaxbSwgNqOArMS0R/fBpjMLiEvM
 nTaLFeJsAYkle84zQ9iiEi8f/4OKy0lsONHJDjKeWUBTYv0ufYhWa4mdeyYxQtiKElO6H7KD
 2LwCghInZz5hmcAoNgvJhlkI3bOQdM9C0j0LSfcCRtZVjCzFuemGmxghsRW+g3Fe00e9Q4xM
 HIyHGCU4mJVEeF//+J8gxJuSWFmVWpQfX1Sak1p8iFGag0VJnLfk4L8EIYH0xJLU7NTUgtQi
 mCwTB6dUA5Pd/DcFqd3GPekJnBfiuf67PjJUNshRdu1Rrux8dMg8ob2qUXF9ml1vd0TOk0Bl
 nXDuufudYu7WcRuv/xCvxOs86dN9wznhGRZl33Wbne1j4urrLgsfKnXsXNFpfkOyyfa/6euo
 5btObTZUe+q4si/lescezr9yj5n5Vgkdu/JeZjbbhNMhoWJlffcL+H9bfLZ/2ryf1WNSl+3E
 s+ofv0z69jFwtX6xLgtT4tXk03fjomL/JZ+dmlgTulw7Wd1To9aoNup0cnbIlmTj0BqNr36v
 f9W/crhQfNTurUpgV1vV0vzgiPQl2pcl0qZOE9Ur4JfoPOmxt6d+d+6fxe8XVNjV6nKdWK1t
 Z5y06akSS3FGoqEWc1FxIgAW9PPNHAMAAA==
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.44.146 (failed)
Received-SPF: pass client-ip=114.255.44.146;
 envelope-from=AIERPATIJIANG1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

UG9ydHMgZW50ZXIgYSAidGhyb3R0bGVkIiBzdGF0ZSB3aGVuIHdyaXRpbmcgdG8gdGhlIGNoYXJk
ZXYgd291bGQgYmxvY2suDQpUaGUgY3VycmVudCBvdXRwdXQgVmlydFF1ZXVlRWxlbWVudCBpcyBr
ZXB0IGFyb3VuZCB1bnRpbCB0aGUgY2hhcmRldg0KYmVjb21lcyB3cml0YWJsZSBhZ2Fpbi4NCg0K
QmVjYXVzZSBjbG9zaW5nIHRoZSB2aXJ0aW8gc2VyaWFsIGRldmljZSBkb2VzIG5vdCByZXNldCB0
aGUgcXVldWUsIHdlIGNhbm5vdA0KZGlyZWN0bHkgZGlzY2FyZCB0aGlzIGVsZW1lbnQsICBvdGhl
cndpc2UgdGhlIGNvbnRyb2wgdmFyaWFibGVzIG9mIHRoZSBmcm9udA0KYW5kIGJhY2sgZW5kcyBv
ZiB0aGUgcXVldWUgYXJlIGluY29uc2lzdGVudCBzdWNoIGFzIHVzZWRfaW5kZXguIFdlIHNob3Vs
ZCB1bnBvcCB0aGUNClZpcnRRdWV1ZUVsZW1lbnQgdG8gcXVldWUsIGxldCBkaXNjYXJkX3ZxX2Rh
dGEgcHJvY2VzcyBpdC4NCg0KVGhlIHRlc3QgZW52aXJvbm1lbnQ6DQprZXJuZWw6IGxpbnV4LTUu
MTINClFlbXUgY29tbWFuZDoNClFlbXUtc3lzdGVtLXg4NiAtbWFjaGluZSBwYyxhY2NlbD1rdm0g
XA0KICAgIC1jcHUgaG9zdCxob3N0LXBoeXMtYml0cyBcDQogICAgLXNtcCA0IFwNCiAgICAtbSA0
RyBcDQogICAgLWtlcm5lbCAuL2tlcm5lbCBcDQogICAgLWRpc3BsYXkgbm9uZSBcDQogICAgLW5v
ZGVmYXVsdHMgXA0KICAgIC1zZXJpYWwgbW9uOnN0ZGlvIFwNCiAgICAtYXBwZW5kICJwYW5pYz0x
IG5vX3RpbWVyX2NoZWNrIG5vcmVwbGFjZS1zbXAgcm9vdGZsYWdzPWRhdGE9b3JkZXJlZCByb290
ZnN0eXBlPWV4dDQgY29uc29sZT10dHlTMCByZWJvb3Q9ayByb290PS9kZXYvdmRhMSBydyIgXA0K
ICAgIC1kcml2ZSBpZD1vcyxmaWxlPS4vZGlzayxpZj1ub25lIFwNCiAgICAtZGV2aWNlIHZpcnRp
by1ibGstcGNpLGRyaXZlPW9zIFwNCiAgICAtZGV2aWNlIHZpcnRpby1zZXJpYWwtcGNpLGlkPXZp
cnRpby1zZXJpYWwwLGJ1cz1wY2kuMCxhZGRyPTB4NCBcDQogICAgLWNoYXJkZXYgc29ja2V0LGlk
PWNoYXJjaGFubmVsMCxwYXRoPS90bXAvY2hhci1kZXYtdGVzdCxzZXJ2ZXIsbm93YWl0IFwNCiAg
LWRldmljZSB2aXJ0c2VyaWFscG9ydCxidXM9dmlydGlvLXNlcmlhbDAuMCxucj0xLGNoYXJkZXY9
Y2hhcmNoYW5uZWwwLGlkPWNoYW5uZWwwLG5hbWU9b3JnLnFlbXUuZ3Vlc3RfYWdlbnQuMA0KDQpm
dWxsIHVwIHZpcnRpbyBxdWV1ZSBhZnRlciBWTSBzdGFydGVkOg0KQ2F0IC9sYXJnZS1maWxlID4g
L2Rldi92cG9ydDFwMQ0KDQpIb3N0IHNpZGU6DQpPcGVuIGFuZCBjbG9zZSBjaGFyYWN0ZXIgZGV2
aWNlIHNvY2tldHMgcmVwZWF0ZWRseQ0KDQpBZnRlciBhd2hpbGUgd2UgY2Fu4oCZdCB3cml0ZSBh
bnkgcmVxdWVzdCB0byAvZGV2L3Zwb3J0MXAxIGF0IFZNIHNpZGUsIFZNIGtlcm5lbCBzb2Z0IGxv
Y2t1cCBhdCBkcml2ZXJzL2NoYXIvdmlydGlvX2NvbnNvbGUuYzogX19zZW5kX3RvX3BvcnQNCg0K
DQpTaWduZWQtb2ZmLWJ5OiBBcmFmYXRtcyA8YWllcnBhdGlqaWFuZzFAa2luZ3NvZnQuY29tPg0K
DQpkaWZmIC0tZ2l0IGEvaHcvY2hhci92aXJ0aW8tc2VyaWFsLWJ1cy5jIGIvaHcvY2hhci92aXJ0
aW8tc2VyaWFsLWJ1cy5jDQppbmRleCBkZDZiYzI3YjNiLi4zNjIzNmRlZmRmIDEwMDY0NA0KLS0t
IGEvaHcvY2hhci92aXJ0aW8tc2VyaWFsLWJ1cy5jDQorKysgYi9ody9jaGFyL3ZpcnRpby1zZXJp
YWwtYnVzLmMNCkBAIC0xNTAsOCArMTUwLDEyIEBAIHN0YXRpYyB2b2lkIGRpc2NhcmRfdnFfZGF0
YShWaXJ0UXVldWUgKnZxLCBWaXJ0SU9EZXZpY2UgKnZkZXYpDQoNCnN0YXRpYyB2b2lkIGRpc2Nh
cmRfdGhyb3R0bGVfZGF0YShWaXJ0SU9TZXJpYWxQb3J0ICpwb3J0KQ0Kew0KKyAgICBpZiAoIXZp
cnRpb19xdWV1ZV9yZWFkeShwb3J0LT5vdnEpKSB7DQorICAgICAgICByZXR1cm47DQorICAgIH0N
CisNCiAgICAgaWYgKHBvcnQtPmVsZW0pIHsNCi0gICAgICAgIHZpcnRxdWV1ZV9kZXRhY2hfZWxl
bWVudChwb3J0LT5vdnEsIHBvcnQtPmVsZW0sIDApOw0KKyAgICAgICAgdmlydHF1ZXVlX3VucG9w
KHBvcnQtPm92cSwgcG9ydC0+ZWxlbSwgMCk7DQogICAgICAgICBnX2ZyZWUocG9ydC0+ZWxlbSk7
DQogICAgICAgICBwb3J0LT5lbGVtID0gTlVMTDsNCiAgICAgfQ0KDQoNCg0K

