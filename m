Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3881869E0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 12:19:44 +0100 (CET)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDnmY-0004Yq-Q8
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 07:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jDndT-0002au-B4
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jDndS-0006Ji-BN
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:10:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33021
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jDndS-000695-1P
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 07:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584357017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uxXCTSUm4qEqGIe/kdGVyfMNrv3WdFjxFzXGp465pus=;
 b=f0Rms75S/Lq3cy3SXoVlXZuRAjKQdOlVHPlRN4wDk9qOCxhz2X4QpB3W1rGeYijrAXMnY+
 mKWSq37aW2Zd15No7hcqjO+n2tYz6IYcKeUIS4C3BGMpANnWsAZSFYv2daMTbaSKzXTsWs
 KEiABmVR3fvkTO6aRNYKt9JK/HVK650=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-WdD9RWQVMcCq9umLppLKlw-1; Mon, 16 Mar 2020 07:10:15 -0400
X-MC-Unique: WdD9RWQVMcCq9umLppLKlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57598107ACCA;
 Mon, 16 Mar 2020 11:10:14 +0000 (UTC)
Received: from localhost (unknown [10.36.119.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 540E35C219;
 Mon, 16 Mar 2020 11:09:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] thread: add lock guard macros
Date: Mon, 16 Mar 2020 11:09:55 +0000
Message-Id: <20200316110957.449700-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TG9jayBndWFyZHMgYXV0b21hdGljYWxseSBjYWxsIHFlbXVfKHJlY18pbXV0ZXhfdW5sb2NrKCkg
d2hlbiByZXR1cm5pbmcgZnJvbSBhCmZ1bmN0aW9uIG9yIGxlYXZpbmcgbGVhdmluZyBhIGxleGlj
YWwgc2NvcGUuICBUaGlzIHNpbXBsaWZpZXMgY29kZSBhbmQKZWxpbWluYXRlcyBsZWFrcyAoZXNw
ZWNpYWxseSBpbiBlcnJvciBjb2RlIHBhdGhzKS4KClRoaXMgc2VyaWVzIGFkZHMgbG9jayBndWFy
ZHMgZm9yIFFlbXVNdXRleCBhbmQgUWVtdVJlY011dGV4LiAgSXQgZG9lcyBub3QKY29udmVydCB0
aGUgZW50aXJlIHRyZWUgYnV0IGluY2x1ZGVzIGV4YW1wbGUgY29udmVyc2lvbnMuCgpTdGVmYW4g
SGFqbm9jemkgKDIpOgogIGxvY2thYmxlOiBhZGQgbG9jayBndWFyZHMKICBsb2NrYWJsZTogYWRk
IFFlbXVSZWNNdXRleCBzdXBwb3J0CgogaW5jbHVkZS9xZW11L2xvY2thYmxlLmggfCA2NyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogcGx1Z2lucy9jb3JlLmMgICAg
ICAgICAgfCAgNyArKy0tLQogcGx1Z2lucy9sb2FkZXIuYyAgICAgICAgfCAxNiArKysrKy0tLS0t
CiB1dGlsL3FlbXUtdGltZXIuYyAgICAgICB8IDIzICsrKysrKystLS0tLS0tCiA0IGZpbGVzIGNo
YW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMQoK


