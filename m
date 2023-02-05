Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2768AEB9
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 08:45:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOZh7-0004Kt-HV; Sun, 05 Feb 2023 02:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wnliu@stu.xmu.edu.cn>)
 id 1pOY62-0002Vw-Nr
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:01:50 -0500
Received: from azure-sdnproxy.icoremail.net ([52.229.205.26])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <wnliu@stu.xmu.edu.cn>) id 1pOY5y-0001WC-Ug
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 01:01:49 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwA3A+cfRt9jvuKJDQ--.42561S2;
 Sun, 05 Feb 2023 14:01:03 +0800 (CST)
Received: from wnliu$stu.xmu.edu.cn ( [117.28.181.52] ) by ajax-webmail-mail
 (Coremail) ; Sun, 5 Feb 2023 14:01:25 +0800 (GMT+08:00)
X-Originating-IP: [117.28.181.52]
Date: Sun, 5 Feb 2023 14:01:25 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Weinan Liu" <wnliu@stu.xmu.edu.cn>
To: "Weinan Liu" <liu-weinan@qq.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH] KVM: dirty ring: check if vcpu is created before
 dirty_ring_reap_one
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220506(458b1948)
 Copyright (c) 2002-2023 www.mailtech.cn
 mispb-ac60dc67-ddbe-4478-9127-1d3314495f10-icoremail.net
In-Reply-To: <tencent_4154FDEB122B79E7FB824E2941708C7B0106@qq.com>
References: <tencent_4154FDEB122B79E7FB824E2941708C7B0106@qq.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3877ce37.83.186202a4218.Coremail.wnliu@stu.xmu.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwAnu4A1Rt9jVBQAAA--.124W
X-CM-SenderInfo: astqjiyssrikaurwmqhvwxh5lpxovvfxof0/1tbiAQANEmPeo1wBg
	QAAsc
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wnliu@stu.
 xmu.edu.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ar47ZrWfAF1kZr48Xr1UJrb_yoW8trWfpr
 ZxC3s3Zr4rZr1093y3tw12vr1UWw47WanrJ3yDt3WSy347CF4fJFWrKFyxWrZ8uFyxJr45
 tr15XFyDZF17Xr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=52.229.205.26; envelope-from=wnliu@stu.xmu.edu.cn;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Feb 2023 02:44:06 -0500
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

U29ycnksIHRoaXMgcGF0Y2ggaXMgd3JvbmcuCmt2bV9kaXJ0eV9yaW5nX3JlYXBfbG9ja2VkIGhv
bGRzIHNsb3RzX2xvY2ssIHdoaWNoIG1heSByZXN1bHQgaW4gZGVhZGxvY2sgYXQgdGhlIG1vbWVu
dCB3aGVuIG1vZGlmeWluZyBtZW1vcnlfcmVnaW9uLgoKSSBhbSBmaW5kaW5nIGEgYmV0dGVyIHdh
eSB0byBnZXQga25vd24gdGhlIGZpbmlzaGluZyBvZiBhbGwgdmNwdXMnIGNyZWF0aW9ucyBiZWZv
cmUgd2FraW5nIHJlYXBlciB1cC4KCgo+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS3lj5Hku7bkuro6
IldlaW5hbiBMaXUiIDxsaXUtd2VpbmFuQHFxLmNvbT7lj5HpgIHml7bpl7Q6MjAyMy0wMi0wNSAw
MDowODowOCAo5pif5pyf5pelKeaUtuS7tuS6ujpxZW11LWRldmVsQG5vbmdudS5vcmfmioTpgIE6
cGV0ZXJ4QHJlZGhhdC5jb20sIGRnaWxiZXJ0QHJlZGhhdC5jb20sICJXZWluYW4gTGl1IiA8d25s
aXVAc3R1LnhtdS5lZHUuY24+5Li76aKYOltQQVRDSF0gS1ZNOiBkaXJ0eSByaW5nOiBjaGVjayBp
ZiB2Y3B1IGlzIGNyZWF0ZWQgYmVmb3JlIGRpcnR5X3JpbmdfcmVhcF9vbmUKPiAKPiBGcm9tOiBX
ZWluYW4gTGl1IDx3bmxpdUBzdHUueG11LmVkdS5jbj4KPiAKPiBGYWlsZWQgdG8gYXNzZXJ0ICco
ZGlydHlfZ2ZucyAmJiByaW5nX3NpemUpJyBpbiBrdm1fZGlydHlfcmluZ19yZWFwX29uZSBpZgo+
IHRoZSB2Y3B1IGhhcyBub3QgYmVlbiBmaW5pc2hlZCB0byBjcmVhdGUgeWV0LiBUaGlzIGJ1ZyBv
Y2Nhc2lvbmFsbHkgb2NjdXJzCj4gd2hlbiBJIG9wZW4gMjAwKyBxZW11IGluc3RhbmNlcyBvbiBt
eSAxNkcgNi1jb3JlcyB4ODYgbWFjaGluZS4gQW5kIGl0IG11c3QKPiBiZSB0cmlnZ2VyZWQgaWYg
aW5zZXJ0aW5nIGEgJ3NsZWVwKDEwKScgaW50byBrdm1fdmNwdV90aHJlYWRfZm4gYXMgYmVsb3ct
LQo+IAo+ICBzdGF0aWMgdm9pZCAqa3ZtX3ZjcHVfdGhyZWFkX2ZuKHZvaWQgKmFyZykKPiAgewo+
ICAgICAgQ1BVU3RhdGUgKmNwdSA9IGFyZzsKPiAgICAgIGludCByOwo+IAo+ICAgICAgcmN1X3Jl
Z2lzdGVyX3RocmVhZCgpOwo+IAo+ICsgICAgc2xlZXAoMTApOwo+ICAgICAgcWVtdV9tdXRleF9s
b2NrX2lvdGhyZWFkKCk7Cj4gICAgICBxZW11X3RocmVhZF9nZXRfc2VsZihjcHUtPnRocmVhZCk7
Cj4gICAgICBjcHUtPnRocmVhZF9pZCA9IHFlbXVfZ2V0X3RocmVhZF9pZCgpOwo+ICAgICAgY3B1
LT5jYW5fZG9faW8gPSAxOwo+IAo+IHdoZXJlIGRpcnR5IHJpbmcgcmVhcGVyIHdpbGwgd2FrZXVw
IGJ1dCB0aGVuIGEgdmNwdSBoYXMgbm90IGJlZW4gZmluaXNoZWQKPiB0byBjcmVhdGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogV2VpbmFuIExpdSA8d25saXVAc3R1LnhtdS5lZHUuY24+Cj4gLS0tCj4g
IGFjY2VsL2t2bS9rdm0tYWxsLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FjY2VsL2t2bS9rdm0tYWxsLmMgYi9hY2Nl
bC9rdm0va3ZtLWFsbC5jCj4gaW5kZXggN2U2YTYwNzZiMS4uODQwZGE3NjMwZSAxMDA2NDQKPiAt
LS0gYS9hY2NlbC9rdm0va3ZtLWFsbC5jCj4gKysrIGIvYWNjZWwva3ZtL2t2bS1hbGwuYwo+IEBA
IC03MTksNiArNzE5LDE1IEBAIHN0YXRpYyB1aW50NjRfdCBrdm1fZGlydHlfcmluZ19yZWFwX2xv
Y2tlZChLVk1TdGF0ZSAqcywgQ1BVU3RhdGUqIGNwdSkKPiAgICAgICAgICB0b3RhbCA9IGt2bV9k
aXJ0eV9yaW5nX3JlYXBfb25lKHMsIGNwdSk7Cj4gICAgICB9IGVsc2Ugewo+ICAgICAgICAgIENQ
VV9GT1JFQUNIKGNwdSkgewo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgKiBNdXN0
IGVuc3VyZSBrdm1faW5pdF92Y3B1IGlzIGZpbmlzaGVkLCBzbyBjcHUtPmt2bV9kaXJ0eV9nZm5z
IGlzCj4gKyAgICAgICAgICAgICAqIGF2YWlsYWJsZS4KPiArICAgICAgICAgICAgICovCj4gKyAg
ICAgICAgICAgIHdoaWxlIChjcHUtPmNyZWF0ZWQgPT0gZmFsc2UpIHsKPiArICAgICAgICAgICAg
ICAgIHFlbXVfbXV0ZXhfdW5sb2NrX2lvdGhyZWFkKCk7Cj4gKyAgICAgICAgICAgICAgICBxZW11
X211dGV4X2xvY2tfaW90aHJlYWQoKTsKPiArICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAg
ICAgdG90YWwgKz0ga3ZtX2RpcnR5X3JpbmdfcmVhcF9vbmUocywgY3B1KTsKPiAgICAgICAgICB9
Cj4gICAgICB9Cj4gLS0gCj4gMi4yNS4xCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CldlaW5hbiBMaXUg77yI5YiY54Kc5qWg77yJCgpEZXBhcnRtZW50IG9mIENvbXB1dGVyIFNjaWVu
Y2UgYW5kIFRlY2hub2xvZ3kKU2Nob29sIG9mIEluZm9ybWF0aWNzIFhpYW1lbiBVbml2ZXJzaXR5


