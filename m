Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C97347B3E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:59:01 +0100 (CET)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4yK-0007G7-BE
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4s3-00087d-LT
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4s1-0002Nk-Ov
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616597549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHP1iJZcWdIYe64zKdhbh7qOkXhTit7y8nXfYPBENB8=;
 b=jElVK1QZzzGOXeLc+U7cQ56aFUju3grO/bROju/aUIScHoSEMxmWy/GDVCLvTnriyxdzwd
 xBtsKRu+MUJUNzpzrHN2KHZRBUQAcE+Ikvc04517wzcF0lqeGEVlMUDHDIumfYiRp6Ux14
 jghpdtwW7TGnL7nvh0s/EHrTqELnfGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-DV6ba5v4PR2wkI3g9hZ8LA-1; Wed, 24 Mar 2021 10:52:26 -0400
X-MC-Unique: DV6ba5v4PR2wkI3g9hZ8LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E88DEC1A3;
 Wed, 24 Mar 2021 14:52:24 +0000 (UTC)
Received: from localhost (ovpn-115-111.ams2.redhat.com [10.36.115.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE7E85DEAD;
 Wed, 24 Mar 2021 14:52:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/2] migration/block-dirty-bitmap: make incoming disabled
 bitmaps busy
Date: Wed, 24 Mar 2021 14:52:01 +0000
Message-Id: <20210324145202.430759-2-stefanha@redhat.com>
In-Reply-To: <20210324145202.430759-1-stefanha@redhat.com>
References: <20210324145202.430759-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPgoKSW5jb21pbmcgZW5hYmxlZCBiaXRtYXBzIGFyZSBidXN5LCBiZWNhdXNlIHdlIGRvCmJk
cnZfZGlydHlfYml0bWFwX2NyZWF0ZV9zdWNjZXNzb3IoKSBmb3IgdGhlbS4gQnV0IGRpc2FibGVk
IGJpdG1hcHMKYmVpbmcgbWlncmF0ZWQgYXJlIG5vdCBtYXJrZWQgYnVzeSwgYW5kIHVzZXIgY2Fu
IHJlbW92ZSB0aGVtIGR1cmluZyB0aGUKaW5jb21pbmcgbWlncmF0aW9uLiBUaGVuIHdlIG1heSBj
cmFzaCBpbiBjYW5jZWxfaW5jb21pbmdfbG9ja2VkKCkgd2hlbgp0cnkgdG8gcmVtb3ZlIHRoZSBi
aXRtYXAgdGhhdCB3YXMgYWxyZWFkeSByZW1vdmVkIGJ5IHVzZXIsIGxpa2UgdGhpczoKCiAjMCAg
cWVtdV9tdXRleF9sb2NrX2ltcGwgKG11dGV4PTB4NTU5M2Q4OGM1MGQxLCBmaWxlPTB4NTU5Njgw
NTU0YjIwCiAgICIuLi9ibG9jay9kaXJ0eS1iaXRtYXAuYyIsIGxpbmU9NjQpIGF0IC4uL3V0aWwv
cWVtdS10aHJlYWQtcG9zaXguYzo3NwogIzEgIGJkcnZfZGlydHlfYml0bWFwc19sb2NrIChicz0w
eDU1OTNkODhjMGVlOSkKICAgYXQgLi4vYmxvY2svZGlydHktYml0bWFwLmM6NjQKICMyICBiZHJ2
X3JlbGVhc2VfZGlydHlfYml0bWFwIChiaXRtYXA9MHg1NTk2ODEwZTk1NzApCiAgIGF0IC4uL2Js
b2NrL2RpcnR5LWJpdG1hcC5jOjM2MgogIzMgIGNhbmNlbF9pbmNvbWluZ19sb2NrZWQgKHM9MHg1
NTk2ODBiZTgyMDggPGRibV9zdGF0ZSs0MD4pCiAgIGF0IC4uL21pZ3JhdGlvbi9ibG9jay1kaXJ0
eS1iaXRtYXAuYzo5MTgKICM0ICBkaXJ0eV9iaXRtYXBfbG9hZCAoZj0weDU1OTY4MWQwMmIxMCwg
b3BhcXVlPTB4NTU5NjgwYmU4MWUwCiAgIDxkYm1fc3RhdGU+LCB2ZXJzaW9uX2lkPTEpIGF0IC4u
L21pZ3JhdGlvbi9ibG9jay1kaXJ0eS1iaXRtYXAuYzoxMTk0CiAjNSAgdm1zdGF0ZV9sb2FkIChm
PTB4NTU5NjgxZDAyYjEwLCBzZT0weDU1OTY4MGZiNTgxMCkKICAgYXQgLi4vbWlncmF0aW9uL3Nh
dmV2bS5jOjkwOAogIzYgIHFlbXVfbG9hZHZtX3NlY3Rpb25fcGFydF9lbmQgKGY9MHg1NTk2ODFk
MDJiMTAsCiAgIG1pcz0weDU1OTY4MGZiNGEzMCkgYXQgLi4vbWlncmF0aW9uL3NhdmV2bS5jOjI0
NzMKICM3ICBxZW11X2xvYWR2bV9zdGF0ZV9tYWluIChmPTB4NTU5NjgxZDAyYjEwLCBtaXM9MHg1
NTk2ODBmYjRhMzApCiAgIGF0IC4uL21pZ3JhdGlvbi9zYXZldm0uYzoyNjI2CiAjOCAgcG9zdGNv
cHlfcmFtX2xpc3Rlbl90aHJlYWQgKG9wYXF1ZT0weDApCiAgIGF0IC4uL21pZ3JhdGlvbi9zYXZl
dm0uYzoxODcxCiAjOSAgcWVtdV90aHJlYWRfc3RhcnQgKGFyZ3M9MHg1NTk2ODE3Y2NkMTApCiAg
IGF0IC4uL3V0aWwvcWVtdS10aHJlYWQtcG9zaXguYzo1MjEKICMxMCBzdGFydF90aHJlYWQgKCkg
YXQgL2xpYjY0L2xpYnB0aHJlYWQuc28uMAogIzExIGNsb25lICgpIGF0IC9saWI2NC9saWJjLnNv
LjYKCk5vdGUgYnMgcG9pbnRlciB0YWtlbiBmcm9tIGJpdG1hcDogaXQncyBkZWZpbml0ZWx5IGJh
ZCBhbGlnbmVkLiBUaGF0J3MKYmVjYXVzZSB3ZSBhcmUgaW4gdXNlIGFmdGVyIGZyZWUsIGJpdG1h
cCBpcyBhbHJlYWR5IGZyZWVkLgoKU28sIGxldCdzIG1ha2UgZGlzYWJsZWQgYml0bWFwcyAoYmVp
bmcgbWlncmF0ZWQpIGJ1c3kgZHVyaW5nIGluY29taW5nCm1pZ3JhdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpN
ZXNzYWdlLUlkOiA8MjAyMTAzMjIwOTQ5MDYuNTA3OS0yLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4KLS0tCiBtaWdyYXRpb24vYmxvY2stZGlydHktYml0bWFwLmMgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9ibG9jay1k
aXJ0eS1iaXRtYXAuYyBiL21pZ3JhdGlvbi9ibG9jay1kaXJ0eS1iaXRtYXAuYwppbmRleCA5NzUw
OTM2MTBhLi4zNWY1ZWY2ODhkIDEwMDY0NAotLS0gYS9taWdyYXRpb24vYmxvY2stZGlydHktYml0
bWFwLmMKKysrIGIvbWlncmF0aW9uL2Jsb2NrLWRpcnR5LWJpdG1hcC5jCkBAIC04MzksNiArODM5
LDggQEAgc3RhdGljIGludCBkaXJ0eV9iaXRtYXBfbG9hZF9zdGFydChRRU1VRmlsZSAqZiwgREJN
TG9hZFN0YXRlICpzKQogICAgICAgICAgICAgZXJyb3JfcmVwb3J0X2Vycihsb2NhbF9lcnIpOwog
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KKyAgICB9IGVsc2UgeworICAg
ICAgICBiZHJ2X2RpcnR5X2JpdG1hcF9zZXRfYnVzeShzLT5iaXRtYXAsIHRydWUpOwogICAgIH0K
IAogICAgIGIgPSBnX25ldyhMb2FkQml0bWFwU3RhdGUsIDEpOwpAQCAtOTE0LDYgKzkxNiw4IEBA
IHN0YXRpYyB2b2lkIGNhbmNlbF9pbmNvbWluZ19sb2NrZWQoREJNTG9hZFN0YXRlICpzKQogICAg
ICAgICBhc3NlcnQoIXMtPmJlZm9yZV92bV9zdGFydF9oYW5kbGVkIHx8ICFiLT5taWdyYXRlZCk7
CiAgICAgICAgIGlmIChiZHJ2X2RpcnR5X2JpdG1hcF9oYXNfc3VjY2Vzc29yKGItPmJpdG1hcCkp
IHsKICAgICAgICAgICAgIGJkcnZfcmVjbGFpbV9kaXJ0eV9iaXRtYXAoYi0+Yml0bWFwLCAmZXJy
b3JfYWJvcnQpOworICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgYmRydl9kaXJ0eV9iaXRt
YXBfc2V0X2J1c3koYi0+Yml0bWFwLCBmYWxzZSk7CiAgICAgICAgIH0KICAgICAgICAgYmRydl9y
ZWxlYXNlX2RpcnR5X2JpdG1hcChiLT5iaXRtYXApOwogICAgIH0KQEAgLTk1MSw2ICs5NTUsOCBA
QCBzdGF0aWMgdm9pZCBkaXJ0eV9iaXRtYXBfbG9hZF9jb21wbGV0ZShRRU1VRmlsZSAqZiwgREJN
TG9hZFN0YXRlICpzKQogCiAgICAgaWYgKGJkcnZfZGlydHlfYml0bWFwX2hhc19zdWNjZXNzb3Io
cy0+Yml0bWFwKSkgewogICAgICAgICBiZHJ2X3JlY2xhaW1fZGlydHlfYml0bWFwKHMtPmJpdG1h
cCwgJmVycm9yX2Fib3J0KTsKKyAgICB9IGVsc2UgeworICAgICAgICBiZHJ2X2RpcnR5X2JpdG1h
cF9zZXRfYnVzeShzLT5iaXRtYXAsIGZhbHNlKTsKICAgICB9CiAKICAgICBmb3IgKGl0ZW0gPSBz
LT5iaXRtYXBzOyBpdGVtOyBpdGVtID0gZ19zbGlzdF9uZXh0KGl0ZW0pKSB7Ci0tIAoyLjMwLjIK
Cg==


