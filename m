Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F119C51E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 16:58:40 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK1Il-00033V-TR
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 10:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jK1F1-0005ak-Ru
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jK1F0-0001l8-SN
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:54:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29429
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jK1F0-0001kj-Oj
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 10:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EQd/tAWeF/YV2ZgjjIRKrDKai5RAA8QDSkAEaREc33E=;
 b=CbwUvLbrr8TALnshRJ5UuObmxD26SbktMBPX6IHJOyOqoL/Yrna0JJC8Q9QOqU0CnT2o2a
 L3NtJioXnDA8ar8TyZNOzY1yLyvNzZ4ko4vvBb84Ar/sbrNZb9bM7FvPQ5qQNrdMKpU6VX
 aTPQHCW1qOY67cWSPBGvAL0D8odDJuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-dNKkYIcYP5CP9Dk26D4eZA-1; Thu, 02 Apr 2020 10:54:43 -0400
X-MC-Unique: dNKkYIcYP5CP9Dk26D4eZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A090B800D53;
 Thu,  2 Apr 2020 14:54:41 +0000 (UTC)
Received: from localhost (ovpn-115-222.ams2.redhat.com [10.36.115.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F205B5C290;
 Thu,  2 Apr 2020 14:54:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0] aio-posix: fix test-aio /aio/event/wait with
 fdmon-io_uring
Date: Thu,  2 Apr 2020 15:54:34 +0100
Message-Id: <20200402145434.99349-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cole Robinson <crobinso@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2hlbiBhIGZpbGUgZGVzY3JpcHRvciBiZWNvbWVzIHJlYWR5IHdlIG11c3QgcmUtYXJtIFBPTExf
QURELiAgVGhpcyBpcwpkb25lIGJ5IGFkZGluZyBhbiBzcWUgdG8gdGhlIGlvX3VyaW5nIHNxIHJp
bmcuICBUaGUgLT5uZWVkX3dhaXQoKQpmdW5jdGlvbiB3YXNuJ3QgdGFraW5nIHBlbmRpbmcgc3Fl
cyBpbnRvIGFjY291bnQgYW5kIHRoZXJlZm9yZQppb191cmluZ19zdWJtaXRfYW5kX3dhaXQoKSB3
YXMgbm90IGJlaW5nIGNhbGxlZC4gIFBvbGxpbmcgZm9yIGNxZXMKZmFpbGVkIHRvIGRldGVjdCBm
ZCByZWFkaW5lc3Mgc2luY2Ugd2UgaGFkbid0IHN1Ym1pdHRlZCB0aGUgc3FlIHRvCmlvX3VyaW5n
LgoKVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIHRlc3RzL3Rlc3QtYWlvIC1wIC9haW8v
ZXZlbnQvd2FpdApmYWlsdXJlOgoKICBvayAxMSAvYWlvL2V2ZW50L3dhaXQKICAqKgogIEVSUk9S
OnRlc3RzL3Rlc3QtYWlvLmM6Mzc0OnRlc3RfZmx1c2hfZXZlbnRfbm90aWZpZXI6IGFzc2VydGlv
biBmYWlsZWQ6IChhaW9fcG9sbChjdHgsIGZhbHNlKSkKClJlcG9ydGVkLWJ5OiBDb2xlIFJvYmlu
c29uIDxjcm9iaW5zb0ByZWRoYXQuY29tPgpGaXhlczogNzNmZDI4MmU3YjZkZDRlNGVhMWMzYmJi
M2QzMDJjOGRiNTFlNGNjZgogICAgICAgKCJhaW8tcG9zaXg6IGFkZCBpb191cmluZyBmZCBtb25p
dG9yaW5nIGltcGxlbWVudGF0aW9uIikKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwvZmRtb24taW9fdXJpbmcuYyB8IDcgKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3V0aWwvZmRtb24taW9fdXJpbmcuYyBiL3V0aWwvZmRtb24taW9fdXJpbmcuYwppbmRl
eCA3ZTE0M2VmNTE1Li5iNGQ2MTA5ZjIwIDEwMDY0NAotLS0gYS91dGlsL2ZkbW9uLWlvX3VyaW5n
LmMKKysrIGIvdXRpbC9mZG1vbi1pb191cmluZy5jCkBAIC0yOTUsNyArMjk1LDEyIEBAIHN0YXRp
YyBib29sIGZkbW9uX2lvX3VyaW5nX25lZWRfd2FpdChBaW9Db250ZXh0ICpjdHgpCiAgICAgICAg
IHJldHVybiB0cnVlOwogICAgIH0KIAotICAgIC8qIERvIHdlIG5lZWQgdG8gc3VibWl0IG5ldyBp
b191cmluZyBzcWVzPyAqLworICAgIC8qIEFyZSB0aGVyZSBwZW5kaW5nIHNxZXMgdG8gc3VibWl0
PyAqLworICAgIGlmIChpb191cmluZ19zcV9yZWFkeSgmY3R4LT5mZG1vbl9pb191cmluZykpIHsK
KyAgICAgICAgcmV0dXJuIHRydWU7CisgICAgfQorCisgICAgLyogRG8gd2UgbmVlZCB0byBwcm9j
ZXNzIEFpb0hhbmRsZXJzIGZvciBpb191cmluZyBjaGFuZ2VzPyAqLwogICAgIGlmICghUVNMSVNU
X0VNUFRZX1JDVSgmY3R4LT5zdWJtaXRfbGlzdCkpIHsKICAgICAgICAgcmV0dXJuIHRydWU7CiAg
ICAgfQotLSAKMi4yNS4xCgo=


