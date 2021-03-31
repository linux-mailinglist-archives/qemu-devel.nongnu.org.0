Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4434FD7C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:53:30 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXXV-00010s-Ro
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVS-000882-IJ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRXVR-00013u-2g
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CdueM3gEogQ5G3KRAQE7L4SV5arKAMcS6BZEoBjje4=;
 b=gc+Z1Nv4UUb2kRmhoZ/MSwpCkK/mRkz+mqh1SKpKI0lOKddnm4OAbp5EbWwMHJqaPam9KO
 29xRvOu9ts/mWfhSWQf+C44RN9bhPJVvDDmtfKYqCdM+9FaRJmecHpd53j78a1r0YlLRzP
 mOxeE1IqsuIZ+yu7+KWTfcKcmccvqfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-KjL5E--eNpSukC1G0t822w-1; Wed, 31 Mar 2021 05:51:18 -0400
X-MC-Unique: KjL5E--eNpSukC1G0t822w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA09C801FD8;
 Wed, 31 Mar 2021 09:51:16 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B103D19C44;
 Wed, 31 Mar 2021 09:51:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Wed, 31 Mar 2021 10:50:54 +0100
Message-Id: <20210331095059.303996-2-stefanha@redhat.com>
In-Reply-To: <20210331095059.303996-1-stefanha@redhat.com>
References: <20210331095059.303996-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRGF2aWQgRWRtb25kc29uIDxkYXZpZC5lZG1vbmRzb25Ab3JhY2xlLmNvbT4KCklmIGEg
bmV3IGJpdG1hcCBlbnRyeSBpcyBhbGxvY2F0ZWQsIHJlcXVpcmluZyB0aGUgZW50aXJlIGJsb2Nr
IHRvIGJlCndyaXR0ZW4sIGF2b2lkaW5nIGxlYWtpbmcgdGhlIGJ1ZmZlciBhbGxvY2F0ZWQgZm9y
IHRoZSBibG9jayBzaG91bGQKdGhlIHdyaXRlIGZhaWwuCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBF
ZG1vbmRzb24gPGRhdmlkLmVkbW9uZHNvbkBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBQYW9s
byBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpBY2tlZC1ieTogTWF4IFJlaXR6IDxtcmVp
dHpAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMTAzMjUxMTI5NDEuMzY1MjM4LTItcGJvbnpp
bmlAcmVkaGF0LmNvbQpNZXNzYWdlLUlkOiA8MjAyMTAzMDkxNDQwMTUuNTU3NDc3LTItZGF2aWQu
ZWRtb25kc29uQG9yYWNsZS5jb20+CkFja2VkLWJ5OiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
YmxvY2svdmRpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2Jsb2NrL3ZkaS5jIGIvYmxvY2svdmRpLmMKaW5kZXggNTYyN2U3ZDc2NC4uMmE2ZGMy
NjEyNCAxMDA2NDQKLS0tIGEvYmxvY2svdmRpLmMKKysrIGIvYmxvY2svdmRpLmMKQEAgLTY5MCw2
ICs2OTAsNyBAQCBub25hbGxvY2F0aW5nX3dyaXRlOgogCiAgICAgbG9nb3V0KCJmaW5pc2hlZCBk
YXRhIHdyaXRlXG4iKTsKICAgICBpZiAocmV0IDwgMCkgeworICAgICAgICBnX2ZyZWUoYmxvY2sp
OwogICAgICAgICByZXR1cm4gcmV0OwogICAgIH0KIAotLSAKMi4zMC4yCgo=


