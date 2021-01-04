Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20942E9BD1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:17:10 +0100 (CET)
Received: from localhost ([::1]:39404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTTh-0004NN-7x
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQS-0001z6-QY
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQF-0002RJ-AO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609780413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tTke9iQa2S7CzXtBbF2huNO/7iMoBXQva+TV9zxytmU=;
 b=S0CnXidE2Ik9HIcws10wrNZ/kFqdranHc+PAWrSQbaZVBvYxq/TnNzvIq2b/4Fq5wPANPT
 9d/PX70uv8lemLS9yk08VGO05h7k23iWqZoRjzNDw0cJ3GneHfCcq7xTDUlYUKvGn//JoX
 erpWd4ZM9QnnphCs4iQOlKnby4h2KEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-4g79zeqDMHaeMSp4pX8Uvg-1; Mon, 04 Jan 2021 12:13:30 -0500
X-MC-Unique: 4g79zeqDMHaeMSp4pX8Uvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2961718C8C02;
 Mon,  4 Jan 2021 17:13:29 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073F060BE5;
 Mon,  4 Jan 2021 17:13:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] nvdimm: read-only file support
Date: Mon,  4 Jan 2021 17:13:17 +0000
Message-Id: <20210104171320.575838-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, eric.g.ernst@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djM6DQogKiBQcm9kdWNlIGFuIGVycm9yIHdoZW4gLWRldmljZSBudmRpbW0sdW5hcm1lZD1vZmYg
aXMgdXNlZCB3aXRoIC1vYmplY3QNCiAgIG1lbW9yeS1iYWNrZW5kLWZpbGUscmVhZG9ubHk9b24g
aW5zdGVhZCBvZiBzaWxlbnRseSBzd2l0Y2hpbmcgb24NCiAgIHVuYXJtZWQuIFtJZ29yXQ0KICog
VXNlIE9iamVjdCAqb2JqIGluc3RlYWQgb2YgT2JqZWN0ICpvIFtJZ29yXQ0KICogRG8gbm90IGRl
cmVmZXJlbmNlIE1FTU9SWV9CQUNLRU5EX0ZJTEUobyktPnJlYWRvbmx5IGRpcmVjdGx5LCB1c2Ug
YQ0KICAgbG9jYWwgdmFyaWFibGUgdG8gaG9sZCB0aGUgSG9zdE1lbW9yeUJhY2tlbmRGaWxlIHBv
aW50ZXIuIFtJZ29yXQ0KdjI6DQogKiBzL3RoZSB0aGUvdGhlLyBpbiBkb2N1bWVudGF0aW9uIFtQ
aGlsaXBwZV0NCiAqIEFzc2lnbiBudmRpbW0tPnVuYXJtZWQgZWFybGllciBbUGhpbGlwcGVdDQoN
ClRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgdG8gYmFjayBhbiBOVkRJTU0gd2l0aCBhIHJlYWQt
b25seSBmaWxlIHNvIGl0IGNhbiBiZQ0Kc2FmZWx5IHNoYXJlZCBiZXR3ZWVuIHVudHJ1c3RlZCBn
dWVzdHMuDQoNCkludHJvZHVjZSBhbiAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUscmVhZG9u
bHk9b258b2ZmIG9wdGlvbi4NCg0KSnVsaW8gTW9udGVzIHNlbnQgYW4gZWFybGllciBwYXRjaCBo
ZXJlOg0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMTkwNzA4MjExOTM2LjgwMzctMS1qdWxp
by5tb250ZXNAaW50ZWwuY29tLw0KDQpFcmljIEVybnN0IHJlcXVlc3RlZCB0aGlzIGZlYXR1cmUg
YWdhaW4gZm9yIEthdGEgQ29udGFpbmVycyBzbyBJIGdhdmUgaXQgYSB0cnkuDQoNClN0ZWZhbiBI
YWpub2N6aSAoMyk6DQogIG1lbW9yeTogYWRkIHJlYWRvbmx5IHN1cHBvcnQgdG8gbWVtb3J5X3Jl
Z2lvbl9pbml0X3JhbV9mcm9tX2ZpbGUoKQ0KICBob3N0bWVtLWZpbGU6IGFkZCByZWFkb25seT1v
bnxvZmYgb3B0aW9uDQogIG52ZGltbTogY2hlY2sgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxl
LHJlYWRvbmx5PW9uIG9wdGlvbg0KDQogZG9jcy9udmRpbW0udHh0ICAgICAgICAgICB8IDI0ICsr
KysrKysrKysrKysrKysrLS0tLS0tLQ0KIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCAgICAgfCAgMiAr
Kw0KIGluY2x1ZGUvZXhlYy9yYW1fYWRkci5oICAgfCAgNSArKystLQ0KIGluY2x1ZGUvcWVtdS9t
bWFwLWFsbG9jLmggfCAgMiArKw0KIGJhY2tlbmRzL2hvc3RtZW0tZmlsZS5jICAgfCAyOCArKysr
KysrKysrKysrKysrKysrKysrKysrKystDQogaHcvbWVtL252ZGltbS5jICAgICAgICAgICB8ICA5
ICsrKysrKysrKw0KIHNvZnRtbXUvbWVtb3J5LmMgICAgICAgICAgfCAgNyArKysrKy0tDQogc29m
dG1tdS9waHlzbWVtLmMgICAgICAgICB8IDE4ICsrKysrKysrKysrLS0tLS0tLQ0KIHV0aWwvbW1h
cC1hbGxvYy5jICAgICAgICAgfCAxMCArKysrKystLS0tDQogdXRpbC9vc2xpYi1wb3NpeC5jICAg
ICAgICB8ICAyICstDQogcWVtdS1vcHRpb25zLmh4ICAgICAgICAgICB8ICA1ICsrKystDQogMTEg
ZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQoNCi0tIA0K
Mi4yOS4yDQoNCg==


