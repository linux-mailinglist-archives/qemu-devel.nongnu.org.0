Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6F02F312D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:19:38 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJaD-00008q-VS
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kzJX6-0007RH-W9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kzJX4-0004VT-AY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610457380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qPCsRvyJIxLLfz/NPlDXj9g/7oWwieYKf4L6AzLNrS8=;
 b=JVcWW4sfhDB26wkMpmgxzcatd1VSaLPZ5pbRXn5w7aGIRJYZg+wCTz5fpSSdjHSbmwycva
 QZls4vuNf5Grl8YofvpXK0L57xy9C6lS7T9gJvu9ZC+g/HLbUwA5/RzYC1eDWhzwhg5l0w
 kX2vPCaH4zd6qOrb9QnFPuCDmA1/nho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-0el1A1XrPayJTmZgV7kegw-1; Tue, 12 Jan 2021 08:16:17 -0500
X-MC-Unique: 0el1A1XrPayJTmZgV7kegw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818AD809DCE
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:16:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C3219744;
 Tue, 12 Jan 2021 13:16:04 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Subject: [PATCH v2] vhost-user-fs: add the "bootindex" property
Date: Tue, 12 Jan 2021 14:16:03 +0100
Message-Id: <20210112131603.12686-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmlydGlvLWZzIHF1YWxpZmllcyBhcyBhIGJvb3RhYmxlIGRldmljZSBtaW5pbWFsbHkgdW5kZXIg
T1ZNRiwgYnV0CmN1cnJlbnRseSB0aGUgbmVjZXNzYXJ5ICJib290aW5kZXgiIHByb3BlcnR5IGlz
IG1pc3NpbmcuIEFkZCB0aGUgcHJvcGVydHkuCgpFeHBvc2UgdGhlIHByb3BlcnR5IG9ubHkgaW4g
dGhlIFBDSSBkZXZpY2UsIGZvciBub3cuIFRoZXJlIGlzIG5vIGJvb3QKc3VwcG9ydCBmb3Igdmly
dGlvZnMgb24gczM5MHggKGNjdykgZm9yIHRoZSB0aW1lIGJlaW5nIFsxXSBbMl0sIHNvIGxlYXZl
CnRoZSBDQ1cgZGV2aWNlIHVuY2hhbmdlZC4gQWRkIHRoZSBwcm9wZXJ0eSB0byB0aGUgYmFzZSBk
ZXZpY2Ugc3RpbGwsCmJlY2F1c2UgYWRkaW5nIHRoZSBhbGlhcyB0byB0aGUgQ0NXIGRldmljZSBs
YXRlciB3aWxsIGJlIGVhc2llciB0aGlzIHdheQpbM10uCgpbMV0gaHR0cHM6Ly9saXN0cy5nbnUu
b3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDEvbXNnMDE3NDUuaHRtbApbMl0gaHR0
cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDEvbXNnMDE4
NzAuaHRtbApbM10gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVs
LzIwMjEtMDEvbXNnMDE3NTEuaHRtbAoKRXhhbXBsZSBPcGVuRmlybXdhcmUgZGV2aWNlIHBhdGgg
Zm9yIHRoZSAidmhvc3QtdXNlci1mcy1wY2kiIGRldmljZSBpbiB0aGUKImJvb3RvcmRlciIgZndf
Y2ZnIGZpbGU6CgogIC9wY2lAaTBjZjgvcGNpLWJyaWRnZUAxLDYvcGNpMWFmNCwxMDVhQDAvZmls
ZXN5c3RlbUAwCgpDYzogIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQu
Y29tPgpDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgpDYzogSsOhbiBU
b21rbyA8anRvbWtvQHJlZGhhdC5jb20+CkNjOiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+CkNjOiB2aXJ0aW8tZnNAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgpBY2tlZC1ieTogRHIuIERhdmlkIEFsYW4gR2lsYmVy
dCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAgLSBkcm9wICJo
dy9zMzkweC92aG9zdC11c2VyLWZzLWNjdy5jIiBodW5rIFtDaHJpc3RpYW4sIENvcm5lbGlhXQog
ICAgCiAgICAtIGRvY3VtZW50IHRoZSBzYW1lIGluIHRoZSBjb21taXQgbWVzc2FnZQogICAgCiAg
ICAtIHJlbW92ZSBmd19jZmcga2VybmVsIGJvb3QgcmVmZXJlbmNlIGZyb20gdGhlIGNvbW1pdCBt
ZXNzYWdlIChzb21ld2hhdAogICAgICBzaW1pbGFyIHVzZSBjYXNlLCBidXQgYSBjb21wYXJpc29u
IG9yIGV2ZW4gYSBoaW50IGRvZXNuJ3QgbmVjZXNzYXJpbHkKICAgICAgYmVsb25nIGluIHRoZSBj
b21taXQgbWVzc2FnZSkKICAgIAogICAgLSBwaWNrIHVwIERhdmUncyBBQ0sKCiBpbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC11c2VyLWZzLmggfCAgMSArCiBody92aXJ0aW8vdmhvc3QtdXNlci1mcy1w
Y2kuYyAgICAgfCAgMiArKwogaHcvdmlydGlvL3Zob3N0LXVzZXItZnMuYyAgICAgICAgIHwgMTAg
KysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy5oIGIvaW5jbHVkZS9ody92aXJ0aW8v
dmhvc3QtdXNlci1mcy5oCmluZGV4IDY5ODU3NTI3NzEwMS4uMGQ2MjgzNGMyNTEwIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLWZzLmgKKysrIGIvaW5jbHVkZS9ody92
aXJ0aW8vdmhvc3QtdXNlci1mcy5oCkBAIC0zOSw2ICszOSw3IEBAIHN0cnVjdCBWSG9zdFVzZXJG
UyB7CiAgICAgVmhvc3RVc2VyU3RhdGUgdmhvc3RfdXNlcjsKICAgICBWaXJ0UXVldWUgKipyZXFf
dnFzOwogICAgIFZpcnRRdWV1ZSAqaGlwcmlvX3ZxOworICAgIGludDMyX3QgYm9vdGluZGV4Owog
CiAgICAgLyo8IHB1YmxpYyA+Ki8KIH07CmRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdXNl
ci1mcy1wY2kuYyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLWZzLXBjaS5jCmluZGV4IDhiYjM4OWJk
MjgyYS4uMmVkODQ5MmIzZmEzIDEwMDY0NAotLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy1w
Y2kuYworKysgYi9ody92aXJ0aW8vdmhvc3QtdXNlci1mcy1wY2kuYwpAQCAtNjgsNiArNjgsOCBA
QCBzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2ZzX3BjaV9pbnN0YW5jZV9pbml0KE9iamVjdCAqb2Jq
KQogCiAgICAgdmlydGlvX2luc3RhbmNlX2luaXRfY29tbW9uKG9iaiwgJmRldi0+dmRldiwgc2l6
ZW9mKGRldi0+dmRldiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVfVkhP
U1RfVVNFUl9GUyk7CisgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9hbGlhcyhvYmosICJib290aW5k
ZXgiLCBPQkpFQ1QoJmRldi0+dmRldiksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Ym9vdGluZGV4Iik7CiB9CiAKIHN0YXRpYyBjb25zdCBWaXJ0aW9QQ0lEZXZpY2VUeXBlSW5mbyB2
aG9zdF91c2VyX2ZzX3BjaV9pbmZvID0gewpkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXVz
ZXItZnMuYyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLWZzLmMKaW5kZXggZWQwMzZhZDljMTNmLi5h
YzRmYzM0YjM2YTIgMTAwNjQ0Ci0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLWZzLmMKKysrIGIv
aHcvdmlydGlvL3Zob3N0LXVzZXItZnMuYwpAQCAtMjIsNiArMjIsNyBAQAogI2luY2x1ZGUgInFl
bXUvZXJyb3ItcmVwb3J0LmgiCiAjaW5jbHVkZSAiaHcvdmlydGlvL3Zob3N0LXVzZXItZnMuaCIK
ICNpbmNsdWRlICJtb25pdG9yL21vbml0b3IuaCIKKyNpbmNsdWRlICJzeXNlbXUvc3lzZW11Lmgi
CiAKIHN0YXRpYyB2b2lkIHZ1Zl9nZXRfY29uZmlnKFZpcnRJT0RldmljZSAqdmRldiwgdWludDhf
dCAqY29uZmlnKQogewpAQCAtMjc5LDYgKzI4MCwxNCBAQCBzdGF0aWMgUHJvcGVydHkgdnVmX3By
b3BlcnRpZXNbXSA9IHsKICAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLAogfTsKIAorc3Rh
dGljIHZvaWQgdnVmX2luc3RhbmNlX2luaXQoT2JqZWN0ICpvYmopCit7CisgICAgVkhvc3RVc2Vy
RlMgKmZzID0gVkhPU1RfVVNFUl9GUyhvYmopOworCisgICAgZGV2aWNlX2FkZF9ib290aW5kZXhf
cHJvcGVydHkob2JqLCAmZnMtPmJvb3RpbmRleCwgImJvb3RpbmRleCIsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIi9maWxlc3lzdGVtQDAiLCBERVZJQ0Uob2JqKSk7Cit9CisK
IHN0YXRpYyB2b2lkIHZ1Zl9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0
YSkKIHsKICAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0VfQ0xBU1Moa2xhc3MpOwpAQCAtMzAw
LDYgKzMwOSw3IEBAIHN0YXRpYyBjb25zdCBUeXBlSW5mbyB2dWZfaW5mbyA9IHsKICAgICAubmFt
ZSA9IFRZUEVfVkhPU1RfVVNFUl9GUywKICAgICAucGFyZW50ID0gVFlQRV9WSVJUSU9fREVWSUNF
LAogICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFZIb3N0VXNlckZTKSwKKyAgICAuaW5zdGFu
Y2VfaW5pdCA9IHZ1Zl9pbnN0YW5jZV9pbml0LAogICAgIC5jbGFzc19pbml0ID0gdnVmX2NsYXNz
X2luaXQsCiB9OwogCi0tIAoyLjE5LjEuMy5nMzAyNDdhYTVkMjAxCgo=


