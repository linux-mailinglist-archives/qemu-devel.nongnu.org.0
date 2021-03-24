Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699D347B8A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:03:15 +0100 (CET)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP52Q-0003zS-IX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4s7-0008FT-2F
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lP4s5-0002Q1-Jf
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616597552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2BrJXy2Vl2C8DXZfkgJnxWmIEPwr5BP/v+1qy7ukXE=;
 b=M4Z2dIWRiudOva9DsX8afaLGm7DrJMjf1NPpEaIgMefLFitpZKow3GmcQ8J4tvMr5r6WIB
 lKjs7aEyxdnBVZLpCIA9++/NlM5oHzXufbk8uibCKxxJmm4sHw0IEHJNK0vVHDWqiY5uws
 LpLCMUnl+/zQDMoOy08IXK8PW+Tbdes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-_X9U46HoP8K3msyU-95DgA-1; Wed, 24 Mar 2021 10:52:27 -0400
X-MC-Unique: _X9U46HoP8K3msyU-95DgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0A2D83DD37;
 Wed, 24 Mar 2021 14:52:25 +0000 (UTC)
Received: from localhost (ovpn-115-111.ams2.redhat.com [10.36.115.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A51B19C71;
 Wed, 24 Mar 2021 14:52:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/2] migrate-bitmaps-postcopy-test: check that we can't remove
 in-flight bitmaps
Date: Wed, 24 Mar 2021 14:52:02 +0000
Message-Id: <20210324145202.430759-3-stefanha@redhat.com>
In-Reply-To: <20210324145202.430759-1-stefanha@redhat.com>
References: <20210324145202.430759-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Y29tPgoKQ2hlY2sgdGhhdCB3ZSBjYW4ndCByZW1vdmUgYml0bWFwcyBiZWluZyBtaWdyYXRlZCBv
biBkZXN0aW5hdGlvbiB2bS4KVGhlIG5ldyBjaGVjayBwcm92ZXMgdGhhdCBwcmV2aW91cyBjb21t
aXQgaGVscHMuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2
c2VtZW50c292QHZpcnR1b3p6by5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1JZDogPDIwMjEwMzIyMDk0OTA2LjUwNzktMy12
c2VtZW50c292QHZpcnR1b3p6by5jb20+Ci0tLQogdGVzdHMvcWVtdS1pb3Rlc3RzL3Rlc3RzL21p
Z3JhdGUtYml0bWFwcy1wb3N0Y29weS10ZXN0IHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9xZW11LWlvdGVzdHMvdGVz
dHMvbWlncmF0ZS1iaXRtYXBzLXBvc3Rjb3B5LXRlc3QgYi90ZXN0cy9xZW11LWlvdGVzdHMvdGVz
dHMvbWlncmF0ZS1iaXRtYXBzLXBvc3Rjb3B5LXRlc3QKaW5kZXggZDA0NmViZWI5NC4uNTg0MDYy
YjQxMiAxMDA3NTUKLS0tIGEvdGVzdHMvcWVtdS1pb3Rlc3RzL3Rlc3RzL21pZ3JhdGUtYml0bWFw
cy1wb3N0Y29weS10ZXN0CisrKyBiL3Rlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cy9taWdyYXRlLWJp
dG1hcHMtcG9zdGNvcHktdGVzdApAQCAtMjI0LDYgKzIyNCwxNiBAQCBjbGFzcyBUZXN0RGlydHlC
aXRtYXBQb3N0Y29weU1pZ3JhdGlvbihpb3Rlc3RzLlFNUFRlc3RDYXNlKToKICAgICAgICAgc2Vs
Zi5zdGFydF9wb3N0Y29weSgpCiAKICAgICAgICAgc2VsZi52bV9iX2V2ZW50cyArPSBzZWxmLnZt
X2IuZ2V0X3FtcF9ldmVudHMoKQorCisgICAgICAgICMgV2hpbGUgYmVpbmcgaGVyZSwgbGV0J3Mg
Y2hlY2sgdGhhdCB3ZSBjYW4ndCByZW1vdmUgaW4tZmxpZ2h0IGJpdG1hcHMuCisgICAgICAgIGZv
ciB2bSBpbiAoc2VsZi52bV9hLCBzZWxmLnZtX2IpOgorICAgICAgICAgICAgZm9yIGkgaW4gcmFu
Z2UoMCwgbmJfYml0bWFwcyk6CisgICAgICAgICAgICAgICAgcmVzdWx0ID0gdm0ucW1wKCdibG9j
ay1kaXJ0eS1iaXRtYXAtcmVtb3ZlJywgbm9kZT0nZHJpdmUwJywKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbmFtZT1mJ2JpdG1hcHtpfScpCisgICAgICAgICAgICAgICAgc2VsZi5h
c3NlcnRfcW1wKHJlc3VsdCwgJ2Vycm9yL2Rlc2MnLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmIkJpdG1hcCAnYml0bWFwe2l9JyBpcyBjdXJyZW50bHkgaW4gdXNlIGJ5ICIKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImFub3RoZXIgb3BlcmF0aW9uIGFuZCBjYW5u
b3QgYmUgdXNlZCIpCisKICAgICAgICAgc2VsZi52bV9iLnNodXRkb3duKCkKICAgICAgICAgIyBy
ZWNyZWF0ZSB2bV9iLCBzbyB0aGVyZSBpcyBubyBpbmNvbWluZyBvcHRpb24sIHdoaWNoIHByZXZl
bnRzCiAgICAgICAgICMgbG9hZGluZyBiaXRtYXBzIGZyb20gZGlzawotLSAKMi4zMC4yCgo=


