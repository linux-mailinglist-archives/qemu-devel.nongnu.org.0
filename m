Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCF1C0F86
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 10:31:06 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUR4b-000232-LR
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 04:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jUR2a-0000CZ-14
 for qemu-devel@nongnu.org; Fri, 01 May 2020 04:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jUR26-0001FS-3i
 for qemu-devel@nongnu.org; Fri, 01 May 2020 04:28:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57739
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jUR25-00018b-Ha
 for qemu-devel@nongnu.org; Fri, 01 May 2020 04:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588321708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvIclo+ffBDAjmYLRURHUeFw/kvPZU1fVvZeR8GJz/0=;
 b=gtbKA6vpCFctVqaIPCC7YUZKnXVkBEI7PQebniNqfLjfjDK8cgWcAsY03SDXCrns5soLV/
 Lx6wovl586L7Vc+zP40bC6/esrRX9e+N3SFp1TYfUNrXLnPtHX6CjCpThXa+vLwrRZh4X9
 vKkChWmsES25IT68RncKHjElwNcCSzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-4KJd2tS2MrCOpXI1RFQA0w-1; Fri, 01 May 2020 04:28:23 -0400
X-MC-Unique: 4KJd2tS2MrCOpXI1RFQA0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 358AF45F;
 Fri,  1 May 2020 08:28:22 +0000 (UTC)
Received: from localhost (ovpn-112-199.ams2.redhat.com [10.36.112.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16C367656;
 Fri,  1 May 2020 08:28:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 1/4] fuzz: select fuzz target using executable name
Date: Fri,  1 May 2020 09:26:40 +0100
Message-Id: <20200501082643.205362-2-stefanha@redhat.com>
In-Reply-To: <20200501082643.205362-1-stefanha@redhat.com>
References: <20200501082643.205362-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 04:28:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Lieven <pl@kamp.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpUaGUgZnV6emVycyBhcmUg
YnVpbHQgaW50byBhIGJpbmFyeSAoZS5nLiBxZW11LWZ1enotaTM4NikuIFRvIHNlbGVjdCB0aGUK
ZGV2aWNlIHRvIGZ1enovZnV6eiB0YXJnZXQsIHdlIHVzdWFsbHkgdXNlIHRoZSAtLWZ1enotdGFy
Z2V0PSBhcmd1bWVudC4KVGhpcyBjb21taXQgYWxsb3dzIHRoZSBmdXp6LXRhcmdldCB0byBiZSBz
cGVjaWZpZWQgdXNpbmcgdGhlIG5hbWUgb2YgdGhlCmV4ZWN1dGFibGUuIElmIHRoZSBleGVjdXRh
YmxlIG5hbWUgZW5kcyB3aXRoIC10YXJnZXQtRlVaWl9UQVJHRVQsIHRoZW4Kd2Ugc2VsZWN0IHRo
ZSBmdXp6IHRhcmdldCBiYXNlZCBvbiB0aGlzIG5hbWUsIHJhdGhlciB0aGFuIHRoZQotLWZ1enot
dGFyZ2V0IGFyZ3VtZW50LiBUaGlzIGlzIHVzZWZ1bCBmb3Igc3lzdGVtcyBzdWNoIGFzIG9zcy1m
dXp6CndoZXJlIHdlIGRvbid0IGhhdmUgY29udHJvbCBvZiB0aGUgYXJndW1lbnRzIHBhc3NlZCB0
byB0aGUgZnV6emVyLgoKW0ZpeGVkIGluY29ycmVjdCBpbmRlbnRhdGlvbi4KLS1TdGVmYW5dCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgQnVsZWtvdiA8YWx4bmRyQGJ1LmVkdT4KUmV2aWV3ZWQt
Ynk6IERhcnJlbiBLZW5ueSA8ZGFycmVuLmtlbm55QG9yYWNsZS5jb20+Ck1lc3NhZ2UtaWQ6IDIw
MjAwNDIxMTgyMjMwLjYzMTMtMS1hbHhuZHJAYnUuZWR1ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBI
YWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0cy9xdGVzdC9mdXp6L2Z1enou
YyB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KIHNsaXJwICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9mdXp6L2Z1enouYyBiL3Rlc3RzL3F0ZXN0L2Z1enovZnV6
ei5jCmluZGV4IDBkNzhhYzhkMzYuLmY1YzkyMzg1MmUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3F0ZXN0
L2Z1enovZnV6ei5jCisrKyBiL3Rlc3RzL3F0ZXN0L2Z1enovZnV6ei5jCkBAIC05MSw2ICs5MSw3
IEBAIHN0YXRpYyB2b2lkIHVzYWdlKGNoYXIgKnBhdGgpCiAgICAgICAgIHByaW50ZigiICogJXMg
IDogJXNcbiIsIHRtcC0+dGFyZ2V0LT5uYW1lLAogICAgICAgICAgICAgICAgIHRtcC0+dGFyZ2V0
LT5kZXNjcmlwdGlvbik7CiAgICAgfQorICAgIHByaW50ZigiQWx0ZXJuYXRpdmVseSwgYWRkIC10
YXJnZXQtRlVaWl9UQVJHRVQgdG8gdGhlIGV4ZWN1dGFibGUgbmFtZVxuIik7CiAgICAgZXhpdCgw
KTsKIH0KIApAQCAtMTQzLDE4ICsxNDQsMjAgQEAgaW50IExMVk1GdXp6ZXJJbml0aWFsaXplKGlu
dCAqYXJnYywgY2hhciAqKiphcmd2LCBjaGFyICoqKmVudnApCiAgICAgbW9kdWxlX2NhbGxfaW5p
dChNT0RVTEVfSU5JVF9RT00pOwogICAgIG1vZHVsZV9jYWxsX2luaXQoTU9EVUxFX0lOSVRfTElC
UU9TKTsKIAotICAgIGlmICgqYXJnYyA8PSAxKSB7CisgICAgdGFyZ2V0X25hbWUgPSBzdHJzdHIo
Kiphcmd2LCAiLXRhcmdldC0iKTsKKyAgICBpZiAodGFyZ2V0X25hbWUpIHsgICAgICAgIC8qIFRo
ZSBiaW5hcnkgbmFtZSBzcGVjaWZpZXMgdGhlIHRhcmdldCAqLworICAgICAgICB0YXJnZXRfbmFt
ZSArPSBzdHJsZW4oIi10YXJnZXQtIik7CisgICAgfSBlbHNlIGlmICgqYXJnYyA+IDEpIHsgIC8q
IFRoZSB0YXJnZXQgaXMgc3BlY2lmaWVkIGFzIGFuIGFyZ3VtZW50ICovCisgICAgICAgIHRhcmdl
dF9uYW1lID0gKCphcmd2KVsxXTsKKyAgICAgICAgaWYgKCFzdHJzdHIodGFyZ2V0X25hbWUsICIt
LWZ1enotdGFyZ2V0PSIpKSB7CisgICAgICAgICAgICB1c2FnZSgqKmFyZ3YpOworICAgICAgICB9
CisgICAgICAgIHRhcmdldF9uYW1lICs9IHN0cmxlbigiLS1mdXp6LXRhcmdldD0iKTsKKyAgICB9
IGVsc2UgewogICAgICAgICB1c2FnZSgqKmFyZ3YpOwogICAgIH0KIAogICAgIC8qIElkZW50aWZ5
IHRoZSBmdXp6IHRhcmdldCAqLwotICAgIHRhcmdldF9uYW1lID0gKCphcmd2KVsxXTsKLSAgICBp
ZiAoIXN0cnN0cih0YXJnZXRfbmFtZSwgIi0tZnV6ei10YXJnZXQ9IikpIHsKLSAgICAgICAgdXNh
Z2UoKiphcmd2KTsKLSAgICB9Ci0KLSAgICB0YXJnZXRfbmFtZSArPSBzdHJsZW4oIi0tZnV6ei10
YXJnZXQ9Iik7Ci0KICAgICBmdXp6X3RhcmdldCA9IGZ1enpfZ2V0X3RhcmdldCh0YXJnZXRfbmFt
ZSk7CiAgICAgaWYgKCFmdXp6X3RhcmdldCkgewogICAgICAgICB1c2FnZSgqKmFyZ3YpOwpkaWZm
IC0tZ2l0IGEvc2xpcnAgYi9zbGlycAppbmRleCAyZmFhZTBmNzc4Li41NWFiMjFjOWEzIDE2MDAw
MAotLS0gYS9zbGlycAorKysgYi9zbGlycApAQCAtMSArMSBAQAotU3VicHJvamVjdCBjb21taXQg
MmZhYWUwZjc3OGY4MThmYWRjODczMzA4Zjk4MzI4OWRmNjk3ZWI5MworU3VicHJvamVjdCBjb21t
aXQgNTVhYjIxYzlhMzY4NTI5MTViODFmMWI0MWViYWYzYjY1MDlkZDhiYQotLSAKMi4yNS4zCgo=


