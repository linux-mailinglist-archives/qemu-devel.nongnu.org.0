Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A5168DC3
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:58:28 +0100 (CET)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5QcF-0000vj-MX
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j5QX1-0008VV-9S
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j5QX0-0000e8-CM
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:03 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57900
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j5QX0-0000dw-9D
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582361581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FGI7HEQJgbwPvROfTkjFPAH/TyN7FlE/u4vpR9orNQ=;
 b=Z1bbS/XwgjG86ixtMEpJpynAmFd02ukWDZEJZq2OIH27OwRVKne/swPtepsra8fdbM+75f
 CWexPUct47wr2/D8LHVA+naELaoY1UiuZqiBh5Dtk+LBucHXXihgl8utcJ1Wce081oTbf8
 6vWi4yMwdeQWFKis7eR1X472fpKDQMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-5mYMcDKRMzuL8wH9DP9RrQ-1; Sat, 22 Feb 2020 03:52:59 -0500
X-MC-Unique: 5mYMcDKRMzuL8wH9DP9RrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 168DB100550E;
 Sat, 22 Feb 2020 08:52:58 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C452E87B0A;
 Sat, 22 Feb 2020 08:52:46 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/31] fuzz: add FUZZ_TARGET module type
Date: Sat, 22 Feb 2020 08:50:12 +0000
Message-Id: <20200222085030.1760640-14-stefanha@redhat.com>
In-Reply-To: <20200222085030.1760640-1-stefanha@redhat.com>
References: <20200222085030.1760640-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgQnVsZWtvdiA8YWx4bmRyQGJ1LmVkdT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IERhcnJlbiBLZW5ueSA8ZGFy
cmVuLmtlbm55QG9yYWNsZS5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwMjIwMDQxMTE4LjIzMjY0LTUt
YWx4bmRyQGJ1LmVkdQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9xZW11L21vZHVsZS5oIHwgNCArKystCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9xZW11L21vZHVsZS5oIGIvaW5jbHVkZS9xZW11L21vZHVsZS5oCmluZGV4IDY1YmE1OTZlNDYu
LjY4NDc1M2Q4MDggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWVtdS9tb2R1bGUuaAorKysgYi9pbmNs
dWRlL3FlbXUvbW9kdWxlLmgKQEAgLTQ2LDYgKzQ2LDcgQEAgdHlwZWRlZiBlbnVtIHsKICAgICBN
T0RVTEVfSU5JVF9UUkFDRSwKICAgICBNT0RVTEVfSU5JVF9YRU5fQkFDS0VORCwKICAgICBNT0RV
TEVfSU5JVF9MSUJRT1MsCisgICAgTU9EVUxFX0lOSVRfRlVaWl9UQVJHRVQsCiAgICAgTU9EVUxF
X0lOSVRfTUFYCiB9IG1vZHVsZV9pbml0X3R5cGU7CiAKQEAgLTU2LDcgKzU3LDggQEAgdHlwZWRl
ZiBlbnVtIHsKICNkZWZpbmUgeGVuX2JhY2tlbmRfaW5pdChmdW5jdGlvbikgbW9kdWxlX2luaXQo
ZnVuY3Rpb24sIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTU9EVUxFX0lOSVRfWEVOX0JBQ0tFTkQpCiAjZGVmaW5lIGxpYnFvc19pbml0KGZ1bmN0aW9u
KSBtb2R1bGVfaW5pdChmdW5jdGlvbiwgTU9EVUxFX0lOSVRfTElCUU9TKQotCisjZGVmaW5lIGZ1
enpfdGFyZ2V0X2luaXQoZnVuY3Rpb24pIG1vZHVsZV9pbml0KGZ1bmN0aW9uLCBcCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1PRFVMRV9JTklUX0ZVWlpf
VEFSR0VUKQogI2RlZmluZSBibG9ja19tb2R1bGVfbG9hZF9vbmUobGliKSBtb2R1bGVfbG9hZF9v
bmUoImJsb2NrLSIsIGxpYikKICNkZWZpbmUgdWlfbW9kdWxlX2xvYWRfb25lKGxpYikgbW9kdWxl
X2xvYWRfb25lKCJ1aS0iLCBsaWIpCiAjZGVmaW5lIGF1ZGlvX21vZHVsZV9sb2FkX29uZShsaWIp
IG1vZHVsZV9sb2FkX29uZSgiYXVkaW8tIiwgbGliKQotLSAKMi4yNC4xCgo=


