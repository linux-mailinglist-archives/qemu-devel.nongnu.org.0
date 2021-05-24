Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC638E722
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:10:14 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llALW-0007Yc-07
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAEA-0002zQ-Rq
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAE7-0007qT-1y
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9E7UAyaR663w41AQQhkHnIEll+V9IkybDFnciUlz7GY=;
 b=e1WZY3eP+Ym71g/4f2wZUkq97hLcw8yFjGMateHAV63XLBgTCzXFj7x9R7cC576qC6/14A
 npATuBNMoxl1ovkAkqdaG89yCEdWk+5LQimQXjN4QwNr1n74AqNIBFyZO7+/unu1ilKzaX
 ikarMKSfoF/8icnIif2OPVqdsIbsnkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-c_usiDmRO-eJXPTdgHnnbg-1; Mon, 24 May 2021 09:02:30 -0400
X-MC-Unique: c_usiDmRO-eJXPTdgHnnbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEC01012D93;
 Mon, 24 May 2021 13:02:29 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 639CE6E52F;
 Mon, 24 May 2021 13:02:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/8] coroutine-sleep: allow qemu_co_sleep_wake that wakes
 nothing
Date: Mon, 24 May 2021 14:01:47 +0100
Message-Id: <20210524130150.50998-6-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KCkFsbCBjYWxsZXJzIG9m
IHFlbXVfY29fc2xlZXBfd2FrZSBhcmUgY2hlY2tpbmcgd2hldGhlciB0aGV5IGFyZSBwYXNzaW5n
CmEgTlVMTCBhcmd1bWVudCBpbnNpZGUgdGhlIHBvaW50ZXItdG8tcG9pbnRlcjogZG8gdGhlIGNo
ZWNrIGluCnFlbXVfY29fc2xlZXBfd2FrZSBpdHNlbGYuCgpBcyBhIHNpZGUgZWZmZWN0LCBxZW11
X2NvX3NsZWVwX3dha2UgY2FuIGJlIGNhbGxlZCBtb3JlIHRoYW4gb25jZSBhbmQKaXQgd2lsbCBv
bmx5IHdha2UgdGhlIGNvcm91dGluZSBvbmNlOyBhZnRlciB0aGUgZmlyc3QgdGltZSwgdGhlIGFy
Z3VtZW50CndpbGwgYmUgc2V0IHRvIE5VTEwgdmlhICpzbGVlcF9zdGF0ZS0+dXNlcl9zdGF0ZV9w
b2ludGVyLiAgSG93ZXZlciwgdGhpcwp3b3VsZCBub3QgYmUgc2FmZSB1bmxlc3MgY29fc2xlZXBf
Y2Iga2VlcHMgdXNpbmcgdGhlIFFlbXVDb1NsZWVwU3RhdGUqCmRpcmVjdGx5LCBzbyBtYWtlIGl0
IGdvIHRocm91Z2ggdGhlIHBvaW50ZXItdG8tcG9pbnRlciBpbnN0ZWFkLgoKUmV2aWV3ZWQtYnk6
IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbT4K
U2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KTWVzc2Fn
ZS1pZDogMjAyMTA1MTcxMDA1NDguMjg4MDYtNC1wYm9uemluaUByZWRoYXQuY29tClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBibG9jay9i
bG9jay1jb3B5LmMgICAgICAgICAgfCAgNCArLS0tCiBibG9jay9uYmQuYyAgICAgICAgICAgICAg
ICAgfCAgOCArKy0tLS0tLQogdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jIHwgMjEgKysrKysr
KysrKysrLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsb2NrLWNvcHkuYyBiL2Jsb2NrL2Jsb2Nr
LWNvcHkuYwppbmRleCA5YjRhZjAwNjE0Li5mODk2ZGM1NmYyIDEwMDY0NAotLS0gYS9ibG9jay9i
bG9jay1jb3B5LmMKKysrIGIvYmxvY2svYmxvY2stY29weS5jCkBAIC02NzQsOSArNjc0LDcgQEAg
b3V0OgogCiB2b2lkIGJsb2NrX2NvcHlfa2ljayhCbG9ja0NvcHlDYWxsU3RhdGUgKmNhbGxfc3Rh
dGUpCiB7Ci0gICAgaWYgKGNhbGxfc3RhdGUtPnNsZWVwX3N0YXRlKSB7Ci0gICAgICAgIHFlbXVf
Y29fc2xlZXBfd2FrZShjYWxsX3N0YXRlLT5zbGVlcF9zdGF0ZSk7Ci0gICAgfQorICAgIHFlbXVf
Y29fc2xlZXBfd2FrZShjYWxsX3N0YXRlLT5zbGVlcF9zdGF0ZSk7CiB9CiAKIC8qCmRpZmYgLS1n
aXQgYS9ibG9jay9uYmQuYyBiL2Jsb2NrL25iZC5jCmluZGV4IDFkNDY2OGQ0MmQuLjFjNjMxNWIx
NjggMTAwNjQ0Ci0tLSBhL2Jsb2NrL25iZC5jCisrKyBiL2Jsb2NrL25iZC5jCkBAIC0yODksOSAr
Mjg5LDcgQEAgc3RhdGljIHZvaWQgY29yb3V0aW5lX2ZuIG5iZF9jbGllbnRfY29fZHJhaW5fYmVn
aW4oQmxvY2tEcml2ZXJTdGF0ZSAqYnMpCiAgICAgQkRSVk5CRFN0YXRlICpzID0gKEJEUlZOQkRT
dGF0ZSAqKWJzLT5vcGFxdWU7CiAKICAgICBzLT5kcmFpbmVkID0gdHJ1ZTsKLSAgICBpZiAocy0+
Y29ubmVjdGlvbl9jb19zbGVlcF9uc19zdGF0ZSkgewotICAgICAgICBxZW11X2NvX3NsZWVwX3dh
a2Uocy0+Y29ubmVjdGlvbl9jb19zbGVlcF9uc19zdGF0ZSk7Ci0gICAgfQorICAgIHFlbXVfY29f
c2xlZXBfd2FrZShzLT5jb25uZWN0aW9uX2NvX3NsZWVwX25zX3N0YXRlKTsKIAogICAgIG5iZF9j
b19lc3RhYmxpc2hfY29ubmVjdGlvbl9jYW5jZWwoYnMsIGZhbHNlKTsKIApAQCAtMzMwLDkgKzMy
OCw3IEBAIHN0YXRpYyB2b2lkIG5iZF90ZWFyZG93bl9jb25uZWN0aW9uKEJsb2NrRHJpdmVyU3Rh
dGUgKmJzKQogCiAgICAgcy0+c3RhdGUgPSBOQkRfQ0xJRU5UX1FVSVQ7CiAgICAgaWYgKHMtPmNv
bm5lY3Rpb25fY28pIHsKLSAgICAgICAgaWYgKHMtPmNvbm5lY3Rpb25fY29fc2xlZXBfbnNfc3Rh
dGUpIHsKLSAgICAgICAgICAgIHFlbXVfY29fc2xlZXBfd2FrZShzLT5jb25uZWN0aW9uX2NvX3Ns
ZWVwX25zX3N0YXRlKTsKLSAgICAgICAgfQorICAgICAgICBxZW11X2NvX3NsZWVwX3dha2Uocy0+
Y29ubmVjdGlvbl9jb19zbGVlcF9uc19zdGF0ZSk7CiAgICAgICAgIG5iZF9jb19lc3RhYmxpc2hf
Y29ubmVjdGlvbl9jYW5jZWwoYnMsIHRydWUpOwogICAgIH0KICAgICBpZiAocWVtdV9pbl9jb3Jv
dXRpbmUoKSkgewpkaWZmIC0tZ2l0IGEvdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jIGIvdXRp
bC9xZW11LWNvcm91dGluZS1zbGVlcC5jCmluZGV4IDNmNmY2MzdlODEuLjNhZTJiNTM5OWEgMTAw
NjQ0Ci0tLSBhL3V0aWwvcWVtdS1jb3JvdXRpbmUtc2xlZXAuYworKysgYi91dGlsL3FlbXUtY29y
b3V0aW5lLXNsZWVwLmMKQEAgLTI3LDE5ICsyNywyMiBAQCBzdHJ1Y3QgUWVtdUNvU2xlZXBTdGF0
ZSB7CiAKIHZvaWQgcWVtdV9jb19zbGVlcF93YWtlKFFlbXVDb1NsZWVwU3RhdGUgKnNsZWVwX3N0
YXRlKQogewotICAgIC8qIFdyaXRlIG9mIHNjaGVkdWxlIHByb3RlY3RlZCBieSBiYXJyaWVyIHdy
aXRlIGluIGFpb19jb19zY2hlZHVsZSAqLwotICAgIGNvbnN0IGNoYXIgKnNjaGVkdWxlZCA9IHFh
dG9taWNfY21weGNoZygmc2xlZXBfc3RhdGUtPmNvLT5zY2hlZHVsZWQsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcWVtdV9jb19zbGVlcF9uc19fc2NoZWR1bGVk
LCBOVUxMKTsKKyAgICBpZiAoc2xlZXBfc3RhdGUpIHsKKyAgICAgICAgLyogV3JpdGUgb2Ygc2No
ZWR1bGUgcHJvdGVjdGVkIGJ5IGJhcnJpZXIgd3JpdGUgaW4gYWlvX2NvX3NjaGVkdWxlICovCisg
ICAgICAgIGNvbnN0IGNoYXIgKnNjaGVkdWxlZCA9IHFhdG9taWNfY21weGNoZygmc2xlZXBfc3Rh
dGUtPmNvLT5zY2hlZHVsZWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBxZW11X2NvX3NsZWVwX25zX19zY2hlZHVsZWQsIE5VTEwpOwogCi0gICAgYXNz
ZXJ0KHNjaGVkdWxlZCA9PSBxZW11X2NvX3NsZWVwX25zX19zY2hlZHVsZWQpOwotICAgICpzbGVl
cF9zdGF0ZS0+dXNlcl9zdGF0ZV9wb2ludGVyID0gTlVMTDsKLSAgICB0aW1lcl9kZWwoJnNsZWVw
X3N0YXRlLT50cyk7Ci0gICAgYWlvX2NvX3dha2Uoc2xlZXBfc3RhdGUtPmNvKTsKKyAgICAgICAg
YXNzZXJ0KHNjaGVkdWxlZCA9PSBxZW11X2NvX3NsZWVwX25zX19zY2hlZHVsZWQpOworICAgICAg
ICAqc2xlZXBfc3RhdGUtPnVzZXJfc3RhdGVfcG9pbnRlciA9IE5VTEw7CisgICAgICAgIHRpbWVy
X2RlbCgmc2xlZXBfc3RhdGUtPnRzKTsKKyAgICAgICAgYWlvX2NvX3dha2Uoc2xlZXBfc3RhdGUt
PmNvKTsKKyAgICB9CiB9CiAKIHN0YXRpYyB2b2lkIGNvX3NsZWVwX2NiKHZvaWQgKm9wYXF1ZSkK
IHsKLSAgICBxZW11X2NvX3NsZWVwX3dha2Uob3BhcXVlKTsKKyAgICBRZW11Q29TbGVlcFN0YXRl
ICoqc2xlZXBfc3RhdGUgPSBvcGFxdWU7CisgICAgcWVtdV9jb19zbGVlcF93YWtlKCpzbGVlcF9z
dGF0ZSk7CiB9CiAKIHZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUo
UUVNVUNsb2NrVHlwZSB0eXBlLCBpbnQ2NF90IG5zLApAQCAtNjAsNyArNjMsNyBAQCB2b2lkIGNv
cm91dGluZV9mbiBxZW11X2NvX3NsZWVwX25zX3dha2VhYmxlKFFFTVVDbG9ja1R5cGUgdHlwZSwg
aW50NjRfdCBucywKICAgICAgICAgYWJvcnQoKTsKICAgICB9CiAKLSAgICBhaW9fdGltZXJfaW5p
dChjdHgsICZzdGF0ZS50cywgdHlwZSwgU0NBTEVfTlMsIGNvX3NsZWVwX2NiLCAmc3RhdGUpOwor
ICAgIGFpb190aW1lcl9pbml0KGN0eCwgJnN0YXRlLnRzLCB0eXBlLCBTQ0FMRV9OUywgY29fc2xl
ZXBfY2IsIHNsZWVwX3N0YXRlKTsKICAgICAqc2xlZXBfc3RhdGUgPSAmc3RhdGU7CiAgICAgdGlt
ZXJfbW9kKCZzdGF0ZS50cywgcWVtdV9jbG9ja19nZXRfbnModHlwZSkgKyBucyk7CiAgICAgcWVt
dV9jb3JvdXRpbmVfeWllbGQoKTsKLS0gCjIuMzEuMQoK


