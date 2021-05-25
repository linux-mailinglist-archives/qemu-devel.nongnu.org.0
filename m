Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A93903EA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:30:29 +0200 (CEST)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llY4i-0005OZ-Un
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llY2l-0003Ni-6E
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llY2h-00080m-HZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621952901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6rsQMMvVoriekl5LzCXj62gBjAdxJp8VlK9SZgnhjKk=;
 b=h8SNcMxPkEmE0cAmbRT34V4RZtPryCsK7EV1wyHKjxuS/JBSKdl0s69ZUHpCG3/q7L10AJ
 byyt7vNbZSy+wYITOFy1VpEYCi9sUXyRwTHNa0tv2g/fm3aCm/FLf//sJcQUMSsHEcSqTO
 02iU8PATOgY6rYtgcTsn90ZF6xsXjFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-SqLQ4eQNP9ew0K-pF0_MRQ-1; Tue, 25 May 2021 10:28:19 -0400
X-MC-Unique: SqLQ4eQNP9ew0K-pF0_MRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C42691007B05
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 14:28:18 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF2B5D9C0;
 Tue, 25 May 2021 14:28:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] vhost-user: warn when guest RAM is not shared
Date: Tue, 25 May 2021 15:28:00 +0100
Message-Id: <20210525142803.125401-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6DQogKiBDbGFyaWZ5IHRoYXQgb2JqZWN0LW1lbW9yeS1tZW1mZCBlbmFibGVzIHNoYXJlPW9u
IGJ5IGRlZmF1bHQgW01hcmMtQW5kcsOpXQ0KICogUmViYXNlZA0KDQp2aG9zdC11c2VyIHJlcXVp
cmVzIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtKixzaGFyZT1vbiBvcHRpb24gc28gdGhhdCBRRU1V
IHVzZXMNCm1tYXAoTUFQX1NIQVJFRCkgb24gZ3Vlc3QgUkFNIHRoYXQgaXMgc2hhcmVkIHdpdGgg
dGhlIHZob3N0LXVzZXIgZGV2aWNlIGJhY2tlbmQNCnByb2Nlc3MuIFRoaXMgaXMgbmVlZGVkIHNv
IHRoZSBRRU1VIHByb2Nlc3Mgc2VlcyBjaGFuZ2VzIG1hZGUgYnkgdGhlIHZob3N0LXVzZXINCmRl
dmljZSBiYWNrZW5kIHByb2Nlc3MsIGFuZCB2aWNlIHZlcnNhLg0KDQpUb2RheSBRRU1VIGFuZCB0
aGUgdmhvc3QtdXNlciBkZXZpY2UgcHJvY2VzcyB3aWxsIHN0YXJ0IHVwIGFuZCB0aGVuIGZhaWwg
d2l0aCBhDQpjb25mdXNpbmcgZXJyb3IgbWVzc2FnZSBpZiB0aGUgdXNlciBmb3Jnb3QgdG8gc3Bl
Y2lmeSBzaGFyZT1vbi4NCg0KVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIHdhcm5pbmcgbGV0dGlu
ZyB0aGUgdXNlciBrbm93IHRoYXQgc2hhcmU9b24gaXMNCnJlcXVpcmVkLg0KDQpTdGVmYW4gSGFq
bm9jemkgKDMpOg0KICB0ZXN0cy9xdGVzdC92aG9zdC11c2VyLXRlc3Q6IHVzZSBzaGFyZT1vbiB3
aXRoIG1lbWZkDQogIG1lbW9yeTogYWRkIG1lbW9yeV9yZWdpb25faXNfbWFwcGVkX3NoYXJlZCgp
DQogIHZob3N0LXVzZXI6IHdhcm4gd2hlbiBndWVzdCBSQU0gaXMgbm90IHNoYXJlZA0KDQogaW5j
bHVkZS9leGVjL21lbW9yeS5oICAgICAgICAgfCAxMSArKysrKysrKysrKw0KIGh3L3ZpcnRpby92
aG9zdC11c2VyLmMgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0NCiBzb2Z0bW11L21l
bW9yeS5jICAgICAgICAgICAgICB8ICA2ICsrKysrKw0KIHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXIt
dGVzdC5jIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQoNCi0tIA0KMi4zMS4xDQoNCg==


