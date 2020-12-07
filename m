Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A12D179D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:32:59 +0100 (CET)
Received: from localhost ([::1]:40988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKNe-00065k-Rl
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFt-0000mQ-Dg
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmKFr-0006wi-AG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCiZaM28lfZG1PeWK0dkKTsEqfZ+eX95FyupjddJxpQ=;
 b=FQOlZRySHv38BBYmwdXueVnIP3ItRCwkV5s2cPJ3s95ZrEJWpvbt6FDrCdFAo1xkhn7eEr
 CXyiOHB/X0cruL58EMpd+5gwCZpUaw8GQNWmeAB0IHtaOXOp5pyN1dgosqBJOv04tYbdnA
 2mzND29A8Wwawd42SSZT9faNc77LVuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-dzptBeBJNyydeSVXodRP9A-1; Mon, 07 Dec 2020 12:24:53 -0500
X-MC-Unique: dzptBeBJNyydeSVXodRP9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D6A1842141;
 Mon,  7 Dec 2020 17:24:51 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 914D260BD8;
 Mon,  7 Dec 2020 17:24:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] libqtest: add qtest_kill_qemu()
Date: Mon,  7 Dec 2020 17:20:21 +0000
Message-Id: <20201207172030.251905-4-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-1-stefanha@redhat.com>
References: <20201207172030.251905-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGVzdHMgdGhhdCBtYW5hZ2UgbXVsdGlwbGUgcHJvY2Vzc2VzIG1heSB3aXNoIHRvIGtpbGwgUUVN
VSBiZWZvcmUKZGVzdHJveWluZyB0aGUgUVRlc3RTdGF0ZS4gRXhwb3NlIGEgZnVuY3Rpb24gdG8g
ZG8gdGhhdC4KClRoZSB2aG9zdC11c2VyLWJsay10ZXN0IHRlc3RjYXNlIHdpbGwgbmVlZCB0aGlz
LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgot
LS0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIHwgMTEgKysrKysrKysrKysKIHRlc3Rz
L3F0ZXN0L2xpYnF0ZXN0LmMgICAgICAgIHwgIDcgKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0
L2xpYnFvcy9saWJxdGVzdC5oIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKaW5kZXgg
ZTVmMWVjNTkwYy4uNTEyODdiOTI3NiAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGlicW9zL2xp
YnF0ZXN0LmgKKysrIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKQEAgLTc0LDYgKzc0
LDE3IEBAIFFUZXN0U3RhdGUgKnF0ZXN0X2luaXRfd2l0aG91dF9xbXBfaGFuZHNoYWtlKGNvbnN0
IGNoYXIgKmV4dHJhX2FyZ3MpOwogICovCiBRVGVzdFN0YXRlICpxdGVzdF9pbml0X3dpdGhfc2Vy
aWFsKGNvbnN0IGNoYXIgKmV4dHJhX2FyZ3MsIGludCAqc29ja19mZCk7CiAKKy8qKgorICogcXRl
c3Rfa2lsbF9xZW11OgorICogQHM6ICNRVGVzdFN0YXRlIGluc3RhbmNlIHRvIG9wZXJhdGUgb24u
CisgKgorICogS2lsbCB0aGUgUUVNVSBwcm9jZXNzIGFuZCB3YWl0IGZvciBpdCB0byB0ZXJtaW5h
dGUuIEl0IGlzIHNhZmUgdG8gY2FsbCB0aGlzCisgKiBmdW5jdGlvbiBtdWx0aXBsZSB0aW1lcy4g
Tm9ybWFsbHkgcXRlc3RfcXVpdCgpIGlzIHVzZWQgaW5zdGVhZCBiZWNhdXNlIGl0CisgKiBhbHNv
IGZyZWVzIFFUZXN0U3RhdGUuIFVzZSBxdGVzdF9raWxsX3FlbXUoKSB3aGVuIHlvdSBqdXN0IHdh
bnQgdG8ga2lsbCBRRU1VCisgKiBhbmQgcXRlc3RfcXVpdCgpIHdpbGwgYmUgY2FsbGVkIGxhdGVy
LgorICovCit2b2lkIHF0ZXN0X2tpbGxfcWVtdShRVGVzdFN0YXRlICpzKTsKKwogLyoqCiAgKiBx
dGVzdF9xdWl0OgogICogQHM6ICNRVGVzdFN0YXRlIGluc3RhbmNlIHRvIG9wZXJhdGUgb24uCmRp
ZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9saWJxdGVzdC5jIGIvdGVzdHMvcXRlc3QvbGlicXRlc3Qu
YwppbmRleCBiYzM4OWQ0MjJiLi5jYzJjZWM0YTM1IDEwMDY0NAotLS0gYS90ZXN0cy9xdGVzdC9s
aWJxdGVzdC5jCisrKyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKQEAgLTEzMyw3ICsxMzMsNyBA
QCB2b2lkIHF0ZXN0X3NldF9leHBlY3RlZF9zdGF0dXMoUVRlc3RTdGF0ZSAqcywgaW50IHN0YXR1
cykKICAgICBzLT5leHBlY3RlZF9zdGF0dXMgPSBzdGF0dXM7CiB9CiAKLXN0YXRpYyB2b2lkIGtp
bGxfcWVtdShRVGVzdFN0YXRlICpzKQordm9pZCBxdGVzdF9raWxsX3FlbXUoUVRlc3RTdGF0ZSAq
cykKIHsKICAgICBwaWRfdCBwaWQgPSBzLT5xZW11X3BpZDsKICAgICBpbnQgd3N0YXR1czsKQEAg
LTE0Myw2ICsxNDMsNyBAQCBzdGF0aWMgdm9pZCBraWxsX3FlbXUoUVRlc3RTdGF0ZSAqcykKICAg
ICAgICAga2lsbChwaWQsIFNJR1RFUk0pOwogICAgICAgICBURlIocGlkID0gd2FpdHBpZChzLT5x
ZW11X3BpZCwgJnMtPndzdGF0dXMsIDApKTsKICAgICAgICAgYXNzZXJ0KHBpZCA9PSBzLT5xZW11
X3BpZCk7CisgICAgICAgIHMtPnFlbXVfcGlkID0gLTE7CiAgICAgfQogCiAgICAgLyoKQEAgLTE2
OSw3ICsxNzAsNyBAQCBzdGF0aWMgdm9pZCBraWxsX3FlbXUoUVRlc3RTdGF0ZSAqcykKIAogc3Rh
dGljIHZvaWQga2lsbF9xZW11X2hvb2tfZnVuYyh2b2lkICpzKQogewotICAgIGtpbGxfcWVtdShz
KTsKKyAgICBxdGVzdF9raWxsX3FlbXUocyk7CiB9CiAKIHN0YXRpYyB2b2lkIHNpZ2FicnRfaGFu
ZGxlcihpbnQgc2lnbm8pCkBAIC0zNzMsNyArMzc0LDcgQEAgdm9pZCBxdGVzdF9xdWl0KFFUZXN0
U3RhdGUgKnMpCiAgICAgLyogVW5pbnN0YWxsIFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0IGluc3Rh
bmNlICovCiAgICAgY2xlYW51cF9zaWdhYnJ0X2hhbmRsZXIoKTsKIAotICAgIGtpbGxfcWVtdShz
KTsKKyAgICBxdGVzdF9raWxsX3FlbXUocyk7CiAgICAgY2xvc2Uocy0+ZmQpOwogICAgIGNsb3Nl
KHMtPnFtcF9mZCk7CiAgICAgZ19zdHJpbmdfZnJlZShzLT5yeCwgdHJ1ZSk7Ci0tIAoyLjI4LjAK
Cg==


