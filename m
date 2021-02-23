Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326A322CEB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:55:18 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ5p-0005iW-EC
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzv-0006K3-Rx
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEYzs-0002uB-DL
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxJx2fWYpnYM2g+41u6Dglbtf7MdW5OPsZThvjkGPRU=;
 b=alJktNKXt/s6xDDWLPVAM52KcBZQ44rlc2r6jtyPllVQ19eQEGG82BdtmWs+6/vBcriSfW
 sWicgwMbLW8ud0myzOLi071E9B006KuxVLmlXvA46FMuOG5vXouJD8QmlyuozVGuyRuDbo
 G7oxviN44YyVmhaV1v45BDXt8oxPSZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-yRhANnLCOE-dZ7xRy1WYpg-1; Tue, 23 Feb 2021 09:48:02 -0500
X-MC-Unique: yRhANnLCOE-dZ7xRy1WYpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BBCE106BB44;
 Tue, 23 Feb 2021 14:47:36 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0F345D6AB;
 Tue, 23 Feb 2021 14:47:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/12] libqtest: add qtest_kill_qemu()
Date: Tue, 23 Feb 2021 14:46:44 +0000
Message-Id: <20210223144653.811468-4-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGVzdHMgdGhhdCBtYW5hZ2UgbXVsdGlwbGUgcHJvY2Vzc2VzIG1heSB3aXNoIHRvIGtpbGwgUUVN
VSBiZWZvcmUKZGVzdHJveWluZyB0aGUgUVRlc3RTdGF0ZS4gRXhwb3NlIGEgZnVuY3Rpb24gdG8g
ZG8gdGhhdC4KClRoZSB2aG9zdC11c2VyLWJsay10ZXN0IHRlc3RjYXNlIHdpbGwgbmVlZCB0aGlz
LgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpS
ZXZpZXdlZC1ieTogV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhIDx3YWluZXJzbUByZWRoYXQu
Y29tPgotLS0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIHwgMTEgKysrKysrKysrKysK
IHRlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMgICAgICAgIHwgIDcgKysrKy0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L3F0ZXN0L2xpYnFvcy9saWJxdGVzdC5oIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgK
aW5kZXggZTVmMWVjNTkwYy4uNTEyODdiOTI3NiAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGli
cW9zL2xpYnF0ZXN0LmgKKysrIGIvdGVzdHMvcXRlc3QvbGlicW9zL2xpYnF0ZXN0LmgKQEAgLTc0
LDYgKzc0LDE3IEBAIFFUZXN0U3RhdGUgKnF0ZXN0X2luaXRfd2l0aG91dF9xbXBfaGFuZHNoYWtl
KGNvbnN0IGNoYXIgKmV4dHJhX2FyZ3MpOwogICovCiBRVGVzdFN0YXRlICpxdGVzdF9pbml0X3dp
dGhfc2VyaWFsKGNvbnN0IGNoYXIgKmV4dHJhX2FyZ3MsIGludCAqc29ja19mZCk7CiAKKy8qKgor
ICogcXRlc3Rfa2lsbF9xZW11OgorICogQHM6ICNRVGVzdFN0YXRlIGluc3RhbmNlIHRvIG9wZXJh
dGUgb24uCisgKgorICogS2lsbCB0aGUgUUVNVSBwcm9jZXNzIGFuZCB3YWl0IGZvciBpdCB0byB0
ZXJtaW5hdGUuIEl0IGlzIHNhZmUgdG8gY2FsbCB0aGlzCisgKiBmdW5jdGlvbiBtdWx0aXBsZSB0
aW1lcy4gTm9ybWFsbHkgcXRlc3RfcXVpdCgpIGlzIHVzZWQgaW5zdGVhZCBiZWNhdXNlIGl0Cisg
KiBhbHNvIGZyZWVzIFFUZXN0U3RhdGUuIFVzZSBxdGVzdF9raWxsX3FlbXUoKSB3aGVuIHlvdSBq
dXN0IHdhbnQgdG8ga2lsbCBRRU1VCisgKiBhbmQgcXRlc3RfcXVpdCgpIHdpbGwgYmUgY2FsbGVk
IGxhdGVyLgorICovCit2b2lkIHF0ZXN0X2tpbGxfcWVtdShRVGVzdFN0YXRlICpzKTsKKwogLyoq
CiAgKiBxdGVzdF9xdWl0OgogICogQHM6ICNRVGVzdFN0YXRlIGluc3RhbmNlIHRvIG9wZXJhdGUg
b24uCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9saWJxdGVzdC5jIGIvdGVzdHMvcXRlc3QvbGli
cXRlc3QuYwppbmRleCBiMTlkMmViZGEwLi4yYTk4ZGUyOTA3IDEwMDY0NAotLS0gYS90ZXN0cy9x
dGVzdC9saWJxdGVzdC5jCisrKyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKQEAgLTEzMyw3ICsx
MzMsNyBAQCB2b2lkIHF0ZXN0X3NldF9leHBlY3RlZF9zdGF0dXMoUVRlc3RTdGF0ZSAqcywgaW50
IHN0YXR1cykKICAgICBzLT5leHBlY3RlZF9zdGF0dXMgPSBzdGF0dXM7CiB9CiAKLXN0YXRpYyB2
b2lkIGtpbGxfcWVtdShRVGVzdFN0YXRlICpzKQordm9pZCBxdGVzdF9raWxsX3FlbXUoUVRlc3RT
dGF0ZSAqcykKIHsKICAgICBwaWRfdCBwaWQgPSBzLT5xZW11X3BpZDsKICAgICBpbnQgd3N0YXR1
czsKQEAgLTE0Myw2ICsxNDMsNyBAQCBzdGF0aWMgdm9pZCBraWxsX3FlbXUoUVRlc3RTdGF0ZSAq
cykKICAgICAgICAga2lsbChwaWQsIFNJR1RFUk0pOwogICAgICAgICBURlIocGlkID0gd2FpdHBp
ZChzLT5xZW11X3BpZCwgJnMtPndzdGF0dXMsIDApKTsKICAgICAgICAgYXNzZXJ0KHBpZCA9PSBz
LT5xZW11X3BpZCk7CisgICAgICAgIHMtPnFlbXVfcGlkID0gLTE7CiAgICAgfQogCiAgICAgLyoK
QEAgLTE2OSw3ICsxNzAsNyBAQCBzdGF0aWMgdm9pZCBraWxsX3FlbXUoUVRlc3RTdGF0ZSAqcykK
IAogc3RhdGljIHZvaWQga2lsbF9xZW11X2hvb2tfZnVuYyh2b2lkICpzKQogewotICAgIGtpbGxf
cWVtdShzKTsKKyAgICBxdGVzdF9raWxsX3FlbXUocyk7CiB9CiAKIHN0YXRpYyB2b2lkIHNpZ2Fi
cnRfaGFuZGxlcihpbnQgc2lnbm8pCkBAIC0zNzMsNyArMzc0LDcgQEAgdm9pZCBxdGVzdF9xdWl0
KFFUZXN0U3RhdGUgKnMpCiAgICAgLyogVW5pbnN0YWxsIFNJR0FCUlQgaGFuZGxlciBvbiBsYXN0
IGluc3RhbmNlICovCiAgICAgY2xlYW51cF9zaWdhYnJ0X2hhbmRsZXIoKTsKIAotICAgIGtpbGxf
cWVtdShzKTsKKyAgICBxdGVzdF9raWxsX3FlbXUocyk7CiAgICAgY2xvc2Uocy0+ZmQpOwogICAg
IGNsb3NlKHMtPnFtcF9mZCk7CiAgICAgZ19zdHJpbmdfZnJlZShzLT5yeCwgdHJ1ZSk7Ci0tIAoy
LjI5LjIKCg==


