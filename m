Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B84168DBC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:54:42 +0100 (CET)
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5QYb-0001tQ-JZ
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j5QWQ-0007FR-Ar
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j5QWO-0000WT-TD
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:52:26 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56088
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j5QWO-0000WH-Pc
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582361544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHKEz5FhYIXrQh0HYKD2y/dcpIfjGELVJCwvc48/IVQ=;
 b=Xo7pKasL48Mg27RdJ6HkXscHV+1Kgx8AdtkNn9CFocajFjX6oj13jlrwaWI5JGRtUhu9pg
 9gvWaRd47H6EQOL3My4OBARfBWxaQpfmXujHqJXtQl4ODLxgb7C1pyiASkdDd7twuZe4PF
 16XXI/HUn8Nl2aw7A/7QknQ9RDSkbB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-EDio9AOuP1GRb672zDpu9w-1; Sat, 22 Feb 2020 03:52:22 -0500
X-MC-Unique: EDio9AOuP1GRb672zDpu9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972CC801E5C;
 Sat, 22 Feb 2020 08:52:20 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDFA75D9CD;
 Sat, 22 Feb 2020 08:52:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] softmmu: move vl.c to softmmu/
Date: Sat, 22 Feb 2020 08:50:09 +0000
Message-Id: <20200222085030.1760640-11-stefanha@redhat.com>
In-Reply-To: <20200222085030.1760640-1-stefanha@redhat.com>
References: <20200222085030.1760640-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Darren Kenny <darren.kenny@oracle.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpNb3ZlIHZsLmMgdG8gYSBz
ZXBhcmF0ZSBkaXJlY3RvcnksIHNpbWlsYXIgdG8gbGludXgtdXNlci8KVXBkYXRlIHRoZSBjaGVj
aHBhdGNoIGFuZCBnZXRfbWFpbnRhaW5lciBzY3JpcHRzLCBzaW5jZSB0aGV5IHJlbGllZCBvbgov
dmwuYyBmb3IgdG9wX29mX3RyZWUgY2hlY2tzLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEJ1
bGVrb3YgPGFseG5kckBidS5lZHU+ClJldmlld2VkLWJ5OiBEYXJyZW4gS2VubnkgPGRhcnJlbi5r
ZW5ueUBvcmFjbGUuY29tPgpNZXNzYWdlLWlkOiAyMDIwMDIyMDA0MTExOC4yMzI2NC0yLWFseG5k
ckBidS5lZHUKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQu
Y29tPgotLS0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgfCAyICstCiBNYWtlZmlsZS5vYmpz
ICAgICAgICAgICAgIHwgMiAtLQogTWFrZWZpbGUudGFyZ2V0ICAgICAgICAgICB8IDEgKwogc2Ny
aXB0cy9jaGVja3BhdGNoLnBsICAgICB8IDIgKy0KIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwg
fCAzICsrLQogc29mdG1tdS9NYWtlZmlsZS5vYmpzICAgICB8IDIgKysKIHZsLmMgPT4gc29mdG1t
dS92bC5jICAgICAgfCAwCiA3IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb2Z0bW11L01ha2VmaWxlLm9ianMKIHJlbmFt
ZSB2bC5jID0+IHNvZnRtbXUvdmwuYyAoMTAwJSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBi
L01BSU5UQUlORVJTCmluZGV4IDE3NDBhNGZkZGMuLjZlMjZkMmVjMmEgMTAwNjQ0Ci0tLSBhL01B
SU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0yMDMxLDcgKzIwMzEsNyBAQCBGOiBpbmNs
dWRlL3FlbXUvbWFpbi1sb29wLmgKIEY6IGluY2x1ZGUvc3lzZW11L3J1bnN0YXRlLmgKIEY6IHV0
aWwvbWFpbi1sb29wLmMKIEY6IHV0aWwvcWVtdS10aW1lci5jCi1GOiB2bC5jCitGOiBzb2Z0bW11
L3ZsLmMKIEY6IHFhcGkvcnVuLXN0YXRlLmpzb24KIAogSHVtYW4gTW9uaXRvciAoSE1QKQpkaWZm
IC0tZ2l0IGEvTWFrZWZpbGUub2JqcyBiL01ha2VmaWxlLm9ianMKaW5kZXggMjZiOWNmZjk1NC4u
OGExY2JlODAwMCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUub2JqcworKysgYi9NYWtlZmlsZS5vYmpz
CkBAIC01OCw4ICs1OCw2IEBAIGNvbW1vbi1vYmoteSArPSB1aS8KIGNvbW1vbi1vYmotbSArPSB1
aS8KIAogY29tbW9uLW9iai15ICs9IGRtYS1oZWxwZXJzLm8KLWNvbW1vbi1vYmoteSArPSB2bC5v
Ci12bC5vLWNmbGFncyA6PSAkKEdQUk9GX0NGTEFHUykgJChTRExfQ0ZMQUdTKQogY29tbW9uLW9i
ai0kKENPTkZJR19UUE0pICs9IHRwbS5vCiAKIGNvbW1vbi1vYmoteSArPSBiYWNrZW5kcy8KZGlm
ZiAtLWdpdCBhL01ha2VmaWxlLnRhcmdldCBiL01ha2VmaWxlLnRhcmdldAppbmRleCA2ZTYxZjYw
N2IxLi4wNmMzNmQxMTYxIDEwMDY0NAotLS0gYS9NYWtlZmlsZS50YXJnZXQKKysrIGIvTWFrZWZp
bGUudGFyZ2V0CkBAIC0xNjAsNiArMTYwLDcgQEAgb2JqLXkgKz0gcWFwaS8KIG9iai15ICs9IG1l
bW9yeS5vCiBvYmoteSArPSBtZW1vcnlfbWFwcGluZy5vCiBvYmoteSArPSBtaWdyYXRpb24vcmFt
Lm8KK29iai15ICs9IHNvZnRtbXUvCiBMSUJTIDo9ICQobGlic19zb2Z0bW11KSAkKExJQlMpCiAK
ICMgSGFyZHdhcmUgc3VwcG9ydApkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIv
c2NyaXB0cy9jaGVja3BhdGNoLnBsCmluZGV4IDExNTEyYThhMDkuLmIyN2U0ZmY1ZTkgMTAwNzU1
Ci0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwK
QEAgLTQ2Miw3ICs0NjIsNyBAQCBzdWIgdG9wX29mX2tlcm5lbF90cmVlIHsKIAlteSBAdHJlZV9j
aGVjayA9ICgKIAkJIkNPUFlJTkciLCAiTUFJTlRBSU5FUlMiLCAiTWFrZWZpbGUiLAogCQkiUkVB
RE1FLnJzdCIsICJkb2NzIiwgIlZFUlNJT04iLAotCQkidmwuYyIKKwkJImxpbnV4LXVzZXIiLCAi
c29mdG1tdSIKIAkpOwogCiAJZm9yZWFjaCBteSAkY2hlY2sgKEB0cmVlX2NoZWNrKSB7CmRpZmYg
LS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIvc2NyaXB0cy9nZXRfbWFpbnRhaW5l
ci5wbAppbmRleCAyNzk5MWViMWNmLi4yNzFmNWZmNDJhIDEwMDc1NQotLS0gYS9zY3JpcHRzL2dl
dF9tYWludGFpbmVyLnBsCisrKyBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKQEAgLTc5NSw3
ICs3OTUsOCBAQCBzdWIgdG9wX29mX3RyZWUgewogICAgICAgICAmJiAoLWYgIiR7bGtfcGF0aH1N
YWtlZmlsZSIpCiAgICAgICAgICYmICgtZCAiJHtsa19wYXRofWRvY3MiKQogICAgICAgICAmJiAo
LWYgIiR7bGtfcGF0aH1WRVJTSU9OIikKLSAgICAgICAgJiYgKC1mICIke2xrX3BhdGh9dmwuYyIp
KSB7CisgICAgICAgICYmICgtZCAiJHtsa19wYXRofWxpbnV4LXVzZXIvIikKKyAgICAgICAgJiYg
KC1kICIke2xrX3BhdGh9c29mdG1tdS8iKSkgewogCXJldHVybiAxOwogICAgIH0KICAgICByZXR1
cm4gMDsKZGlmZiAtLWdpdCBhL3NvZnRtbXUvTWFrZWZpbGUub2JqcyBiL3NvZnRtbXUvTWFrZWZp
bGUub2JqcwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kODBhNWZmZTVh
Ci0tLSAvZGV2L251bGwKKysrIGIvc29mdG1tdS9NYWtlZmlsZS5vYmpzCkBAIC0wLDAgKzEsMiBA
QAorb2JqLXkgKz0gdmwubwordmwuby1jZmxhZ3MgOj0gJChHUFJPRl9DRkxBR1MpICQoU0RMX0NG
TEFHUykKZGlmZiAtLWdpdCBhL3ZsLmMgYi9zb2Z0bW11L3ZsLmMKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIHZsLmMKcmVuYW1lIHRvIHNvZnRtbXUvdmwuYwotLSAKMi4yNC4xCgo=


