Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099A168DC4
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:58:31 +0100 (CET)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5QcI-0000yY-AL
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j5QYq-0003jd-8v
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j5QYp-0002nd-8c
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:54:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44208
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j5QYp-0002nN-4p
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582361694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/kxCr/mGPa4guwdR3SAt74RiSdH9fGx83pZOl9u8+w=;
 b=X/vXDKrbymYvOFlNNuydiDs6sZShi1ahFKsZ3yYCI83Lr6Pg3NdnL0EVKrkL2/K9lB3pp2
 runP7zN4+DwfGLswzaH8lR2UfGVXQ95PtnadGjjinnwbZk2Tlc0OErAIWxP+bvWVjwScDy
 KfJep9BOkHGArYaPDfasqvpm8PJ/Ppw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-KLoUWVVaOzKMVAzfNY6RXQ-1; Sat, 22 Feb 2020 03:54:52 -0500
X-MC-Unique: KLoUWVVaOzKMVAzfNY6RXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F74183B554;
 Sat, 22 Feb 2020 08:54:51 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 731505D9CD;
 Sat, 22 Feb 2020 08:54:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/31] main: keep rcu_atfork callback enabled for qtest
Date: Sat, 22 Feb 2020 08:50:22 +0000
Message-Id: <20200222085030.1760640-24-stefanha@redhat.com>
In-Reply-To: <20200222085030.1760640-1-stefanha@redhat.com>
References: <20200222085030.1760640-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpUaGUgcXRlc3QtYmFzZWQg
ZnV6emVyIG1ha2VzIHVzZSBvZiBmb3JraW5nIHRvIHJlc2V0LXN0YXRlIGJldHdlZW4KdGVzdHMu
IEtlZXAgdGhlIGNhbGxiYWNrIGVuYWJsZWQsIHNvIHRoZSBjYWxsX3JjdSB0aHJlYWQgZ2V0cyBj
cmVhdGVkCndpdGhpbiB0aGUgY2hpbGQgcHJvY2Vzcy4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBCdWxla292IDxhbHhuZHJAYnUuZWR1PgpSZXZpZXdlZC1ieTogRGFycmVuIEtlbm55IDxkYXJy
ZW4ua2VubnlAb3JhY2xlLmNvbT4KQWNrZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFA
cmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMDAyMjAwNDExMTguMjMyNjQtMTUtYWx4bmRyQGJ1
LmVkdQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
Ci0tLQogc29mdG1tdS92bC5jIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvZnRtbXUvdmwuYyBi
L3NvZnRtbXUvdmwuYwppbmRleCAwODBkM2I1MTA2Li45MmM3YjNhNmU5IDEwMDY0NAotLS0gYS9z
b2Z0bW11L3ZsLmMKKysrIGIvc29mdG1tdS92bC5jCkBAIC0zNzgyLDcgKzM3ODIsMTcgQEAgdm9p
ZCBxZW11X2luaXQoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjaGFyICoqZW52cCkKICAgICBzZXRf
bWVtb3J5X29wdGlvbnMoJnJhbV9zbG90cywgJm1heHJhbV9zaXplLCBtYWNoaW5lX2NsYXNzKTsK
IAogICAgIG9zX2RhZW1vbml6ZSgpOwotICAgIHJjdV9kaXNhYmxlX2F0Zm9yaygpOworCisgICAg
LyoKKyAgICAgKiBJZiBRVGVzdCBpcyBlbmFibGVkLCBrZWVwIHRoZSByY3VfYXRmb3JrIGVuYWJs
ZWQsIHNpbmNlIHN5c3RlbSBwcm9jZXNzZXMKKyAgICAgKiBtYXkgYmUgZm9ya2VkIHRlc3Rpbmcg
cHVycG9zZXMgKGUuZy4gZm9yay1zZXJ2ZXIgYmFzZWQgZnV6emluZykgVGhlIGZvcmsKKyAgICAg
KiBzaG91bGQgaGFwcGVuIGJlZm9yZSBhIHNpZ25sZSBjcHUgaW5zdHJ1Y3Rpb24gaXMgZXhlY3V0
ZWQsIHRvIHByZXZlbnQKKyAgICAgKiBkZWFkbG9ja3MuIFNlZSBjb21taXQgNzNjNmU0MCwgcmN1
OiAiY29tcGxldGVseSBkaXNhYmxlIHB0aHJlYWRfYXRmb3JrCisgICAgICogY2FsbGJhY2tzIGFz
IHNvb24gYXMgcG9zc2libGUiCisgICAgICovCisgICAgaWYgKCFxdGVzdF9lbmFibGVkKCkpIHsK
KyAgICAgICAgcmN1X2Rpc2FibGVfYXRmb3JrKCk7CisgICAgfQogCiAgICAgaWYgKHBpZF9maWxl
ICYmICFxZW11X3dyaXRlX3BpZGZpbGUocGlkX2ZpbGUsICZlcnIpKSB7CiAgICAgICAgIGVycm9y
X3JlcG9ydGZfZXJyKGVyciwgImNhbm5vdCBjcmVhdGUgUElEIGZpbGU6ICIpOwotLSAKMi4yNC4x
Cgo=


