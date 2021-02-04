Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F630F5CB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:07:04 +0100 (CET)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gDo-0007Al-11
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9J-0002i7-Jw
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7g9H-0002MA-PT
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1RYL/3GqlVG6CoX21NwDjulrW7es6gx7ouOpyvdwnss=;
 b=VeasSrwvX4KNSI48xuLaa7hzLd7ii9YsXxyJW5bl+/wrRQW46SgGdeSqdYlaQT44kQZJJU
 4qdNjvK/vrlVYs0oDUN3Bg76x3xpZ0qnPYXamrvYjQSpqjoTfoy9sPXS3WLXwr47Ucr1+B
 j/XlLPOqkCWvjFNdyROMP91Qqt6oBEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-ibJth5jpM963yL_unPCSgA-1; Thu, 04 Feb 2021 10:02:21 -0500
X-MC-Unique: ibJth5jpM963yL_unPCSgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F0D8143F7;
 Thu,  4 Feb 2021 15:02:20 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E597E5C257;
 Thu,  4 Feb 2021 15:02:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Date: Thu,  4 Feb 2021 15:02:05 +0000
Message-Id: <20210204150208.367837-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 Greg Kurz <groug@kaod.org>, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, vgoyal@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djQ6DQogKiBQYXRjaCAxOiBSZXR1cm4gcG9zaXRpdmUgZXJybm8gaWYgb3BlbmF0KDIpIGZhaWxz
IGluIGxvX2RvX29wZW4oKSBbR3JlZ10NCiAqIFBhdGNoIDM6IFJldHVybiAtZmQgaW5zdGVhZCBv
ciAtZXJybm8gYWZ0ZXIgbG9faW5vZGVfb3BlbigpIGluIGxvX2RvX29wZW4oKSBbR3JlZ10NCiAq
IFBhdGNoIDM6IFVzZSBEZSBNb3JnYW4ncyBMYXcgdG8gc2ltcGxpZnkgdGhlIGJvb2xlYW4gZXhw
cmVzc2lvbiBpbiBsb19jcmVhdGUoKSBbVml2ZWtdDQogKiBQYXRjaCAzOiBBZGQgbWlzc2luZyBl
cnJubyA9IC10cnVuY2ZkIGFmdGVyIGxvX2lub2RlX29wZW4oKSBjYWxsIGluIGxvX3NldGF0dHIN
CnYzOg0KICogUmVzdHJ1Y3R1cmUgbG9fY3JlYXRlKCkgdG8gaGFuZGxlIGV4dGVybmFsbHktY3Jl
YXRlZCBmaWxlcyAod2UgbmVlZA0KICAgdG8gYWxsb2NhdGUgYW4gaW5vZGUgZm9yIHRoZW0pIFtH
cmVnXQ0KICogUGF0Y2ggMSAmIDIgcmVmYWN0b3IgdGhlIGNvZGUgc28gdGhhdCBQYXRjaCAzIGNh
biBpbXBsZW1lbnQgdGhlIENWRSBmaXgNCnYzOg0KICogUHJvdGVjdCBsb19jcmVhdGUoKSBbR3Jl
Z10NCnYyOg0KICogQWRkIGRvYyBjb21tZW50IGNsYXJpZnlpbmcgdGhhdCBzeW1saW5rcyBhcmUg
dHJhdmVyc2VkIGNsaWVudC1zaWRlDQogICBbRGFuaWVsXQ0KDQpBIHdlbGwtYmVoYXZlZCBGVVNF
IGNsaWVudCBkb2VzIG5vdCBhdHRlbXB0IHRvIG9wZW4gc3BlY2lhbCBmaWxlcyB3aXRoDQpGVVNF
X09QRU4gYmVjYXVzZSB0aGV5IGFyZSBoYW5kbGVkIG9uIHRoZSBjbGllbnQgc2lkZSAoZS5nLiBk
ZXZpY2Ugbm9kZXMNCmFyZSBoYW5kbGVkIGJ5IGNsaWVudC1zaWRlIGRldmljZSBkcml2ZXJzKS4N
Cg0KVGhlIGNoZWNrIHRvIHByZXZlbnQgdmlydGlvZnNkIGZyb20gb3BlbmluZyBzcGVjaWFsIGZp
bGVzIGlzIG1pc3NpbmcgaW4NCmEgZmV3IGNhc2VzLCBtb3N0IG5vdGFibHkgRlVTRV9PUEVOLiBB
IG1hbGljaW91cyBjbGllbnQgY2FuIGNhdXNlDQp2aXJ0aW9mc2QgdG8gb3BlbiBhIGRldmljZSBu
b2RlLCBwb3RlbnRpYWxseSBhbGxvd2luZyB0aGUgZ3Vlc3QgdG8NCmVzY2FwZS4gVGhpcyBjYW4g
YmUgZXhwbG9pdGVkIGJ5IGEgbW9kaWZpZWQgZ3Vlc3QgZGV2aWNlIGRyaXZlci4gSXQgaXMNCm5v
dCBleHBsb2l0YWJsZSBmcm9tIGd1ZXN0IHVzZXJzcGFjZSBzaW5jZSB0aGUgZ3Vlc3Qga2VybmVs
IHdpbGwgaGFuZGxlDQpzcGVjaWFsIGZpbGVzIGluc2lkZSB0aGUgZ3Vlc3QgaW5zdGVhZCBvZiBz
ZW5kaW5nIEZVU0UgcmVxdWVzdHMuDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHRoaXMgaXNz
dWUgYnkgaW50cm9kdWNpbmcgdGhlIGxvX2lub2RlX29wZW4oKSBmdW5jdGlvbg0KdG8gY2hlY2sg
dGhlIGZpbGUgdHlwZSBiZWZvcmUgb3BlbmluZyBpdC4gVGhpcyBpcyBhIHNob3J0LXRlcm0gc29s
dXRpb24gYmVjYXVzZQ0KaXQgZG9lcyBub3QgcHJldmVudCBhIGNvbXByb21pc2VkIHZpcnRpb2Zz
ZCBwcm9jZXNzIGZyb20gb3BlbmluZyBkZXZpY2Ugbm9kZXMNCm9uIHRoZSBob3N0Lg0KDQpUaGlz
IGlzc3VlIHdhcyBkaWFnbm9zZWQgb24gcHVibGljIElSQyBhbmQgaXMgdGhlcmVmb3JlIGFscmVh
ZHkga25vd24NCmFuZCBub3QgZW1iYXJnb2VkLg0KDQpSZXBvcnRlZC1ieTogQWxleCBYdSA8YWxl
eEBhbHh1LmNhPg0KRml4ZXM6IENWRS0yMDIwLTM1NTE3DQoNClN0ZWZhbiBIYWpub2N6aSAoMyk6
DQogIHZpcnRpb2ZzZDogZXh0cmFjdCBsb19kb19vcGVuKCkgZnJvbSBsb19vcGVuKCkNCiAgdmly
dGlvZnNkOiBvcHRpb25hbGx5IHJldHVybiBpbm9kZSBwb2ludGVyIGZyb20gbG9fZG9fbG9va3Vw
KCkNCiAgdmlydGlvZnNkOiBwcmV2ZW50IG9wZW5pbmcgb2Ygc3BlY2lhbCBmaWxlcyAoQ1ZFLTIw
MjAtMzU1MTcpDQoNCiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYyB8IDIyNCArKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE0OCBpbnNlcnRp
b25zKCspLCA3NiBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjI5LjINCg0K


