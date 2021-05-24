Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AAC38E726
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:11:23 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAMb-0000bK-UL
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAEK-00037e-FH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llAEE-0007uK-D1
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrKtf93KEwf7fhVYkXwikVjc1emb9I2sov9Y+NqXs+k=;
 b=D9Avr/W4w73SnBg0oJRXlxB9+QUjRr1AYjzPB36A+bdbk6W9Cpjp51e0+l4CVM6DktAUfO
 ebS0Lp6rt+3yHu6Lgm6YrS5nF8vNFSR+WSTAtOFoaSn7i68V/O3Orxw5fw5C6jdDcfIFyA
 kS/sG9yQhe+RGYp9V7xjcVCKovv/zFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-YUsTXNMTM9Gu6DCLusM2Vw-1; Mon, 24 May 2021 09:02:35 -0400
X-MC-Unique: YUsTXNMTM9Gu6DCLusM2Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2538E801817;
 Mon, 24 May 2021 13:02:34 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61BD536DE;
 Mon, 24 May 2021 13:02:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 6/8] coroutine-sleep: move timer out of QemuCoSleepState
Date: Mon, 24 May 2021 14:01:48 +0100
Message-Id: <20210524130150.50998-7-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KClRoaXMgc2ltcGxpZmlj
YXRpb24gaXMgZW5hYmxlZCBieSB0aGUgcHJldmlvdXMgcGF0Y2guICBOb3cgYWlvX2NvX3dha2UK
d2lsbCBvbmx5IGJlIGNhbGxlZCBvbmNlLCB0aGVyZWZvcmUgd2UgZG8gbm90IGNhcmUgYWJvdXQg
YSBzcHVyaW91cwpmaXJpbmcgb2YgdGhlIHRpbWVyIGFmdGVyIGEgcWVtdV9jb19zbGVlcF93YWtl
LgoKUmV2aWV3ZWQtYnk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZA
dmlydHVvenpvLmNvbT4KU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVk
aGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMTA1MTcxMDA1NDguMjg4MDYtNS1wYm9uemluaUByZWRo
YXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KLS0tCiB1dGlsL3FlbXUtY29yb3V0aW5lLXNsZWVwLmMgfCA4ICsrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3V0
aWwvcWVtdS1jb3JvdXRpbmUtc2xlZXAuYyBiL3V0aWwvcWVtdS1jb3JvdXRpbmUtc2xlZXAuYwpp
bmRleCAzYWUyYjUzOTlhLi4xZDI1MDE5NjIwIDEwMDY0NAotLS0gYS91dGlsL3FlbXUtY29yb3V0
aW5lLXNsZWVwLmMKKysrIGIvdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jCkBAIC0yMSw3ICsy
MSw2IEBAIHN0YXRpYyBjb25zdCBjaGFyICpxZW11X2NvX3NsZWVwX25zX19zY2hlZHVsZWQgPSAi
cWVtdV9jb19zbGVlcF9ucyI7CiAKIHN0cnVjdCBRZW11Q29TbGVlcFN0YXRlIHsKICAgICBDb3Jv
dXRpbmUgKmNvOwotICAgIFFFTVVUaW1lciB0czsKICAgICBRZW11Q29TbGVlcFN0YXRlICoqdXNl
cl9zdGF0ZV9wb2ludGVyOwogfTsKIApAQCAtMzQsNyArMzMsNiBAQCB2b2lkIHFlbXVfY29fc2xl
ZXBfd2FrZShRZW11Q29TbGVlcFN0YXRlICpzbGVlcF9zdGF0ZSkKIAogICAgICAgICBhc3NlcnQo
c2NoZWR1bGVkID09IHFlbXVfY29fc2xlZXBfbnNfX3NjaGVkdWxlZCk7CiAgICAgICAgICpzbGVl
cF9zdGF0ZS0+dXNlcl9zdGF0ZV9wb2ludGVyID0gTlVMTDsKLSAgICAgICAgdGltZXJfZGVsKCZz
bGVlcF9zdGF0ZS0+dHMpOwogICAgICAgICBhaW9fY29fd2FrZShzbGVlcF9zdGF0ZS0+Y28pOwog
ICAgIH0KIH0KQEAgLTQ5LDYgKzQ3LDcgQEAgdm9pZCBjb3JvdXRpbmVfZm4gcWVtdV9jb19zbGVl
cF9uc193YWtlYWJsZShRRU1VQ2xvY2tUeXBlIHR5cGUsIGludDY0X3QgbnMsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFFlbXVDb1NsZWVwU3RhdGUgKipzbGVl
cF9zdGF0ZSkKIHsKICAgICBBaW9Db250ZXh0ICpjdHggPSBxZW11X2dldF9jdXJyZW50X2Fpb19j
b250ZXh0KCk7CisgICAgUUVNVVRpbWVyIHRzOwogICAgIFFlbXVDb1NsZWVwU3RhdGUgc3RhdGUg
PSB7CiAgICAgICAgIC5jbyA9IHFlbXVfY29yb3V0aW5lX3NlbGYoKSwKICAgICAgICAgLnVzZXJf
c3RhdGVfcG9pbnRlciA9IHNsZWVwX3N0YXRlLApAQCAtNjMsMTAgKzYyLDExIEBAIHZvaWQgY29y
b3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUoUUVNVUNsb2NrVHlwZSB0eXBlLCBp
bnQ2NF90IG5zLAogICAgICAgICBhYm9ydCgpOwogICAgIH0KIAotICAgIGFpb190aW1lcl9pbml0
KGN0eCwgJnN0YXRlLnRzLCB0eXBlLCBTQ0FMRV9OUywgY29fc2xlZXBfY2IsIHNsZWVwX3N0YXRl
KTsKKyAgICBhaW9fdGltZXJfaW5pdChjdHgsICZ0cywgdHlwZSwgU0NBTEVfTlMsIGNvX3NsZWVw
X2NiLCBzbGVlcF9zdGF0ZSk7CiAgICAgKnNsZWVwX3N0YXRlID0gJnN0YXRlOwotICAgIHRpbWVy
X21vZCgmc3RhdGUudHMsIHFlbXVfY2xvY2tfZ2V0X25zKHR5cGUpICsgbnMpOworICAgIHRpbWVy
X21vZCgmdHMsIHFlbXVfY2xvY2tfZ2V0X25zKHR5cGUpICsgbnMpOwogICAgIHFlbXVfY29yb3V0
aW5lX3lpZWxkKCk7CisgICAgdGltZXJfZGVsKCZ0cyk7CiAKICAgICAvKiBxZW11X2NvX3NsZWVw
X3dha2UgY2xlYXJzICpzbGVlcF9zdGF0ZSBiZWZvcmUgcmVzdW1pbmcgdGhpcyBjb3JvdXRpbmUu
ICAqLwogICAgIGFzc2VydCgqc2xlZXBfc3RhdGUgPT0gTlVMTCk7Ci0tIAoyLjMxLjEKCg==


