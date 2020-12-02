Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D742CC0CC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:29:12 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU47-0006ve-0i
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU1j-0005Ng-I5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU1d-0003rR-6J
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fah5uFDQbyz4KSDKjNmz9PBQ5GHzfnym0PucUg5yQ2I=;
 b=KvYCE/YYp3+rFpA6BtKH80fBmunLLZA5gNzzzOV5m1OxdLIXWE5gjrs9YF0cGUJBncoHil
 vLmdc5GR0fHTvEm0Ht9lSWu6LnJV5iGUMbiTqA90f/Stz5QNzOWgtxnQigAcOW+AftpMk4
 /jxdvz0T2WnZgJqwe80dQSFepalvEmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-a08YDVjLMhWAY9_GigSmMA-1; Wed, 02 Dec 2020 10:26:30 -0500
X-MC-Unique: a08YDVjLMhWAY9_GigSmMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BB6184215E;
 Wed,  2 Dec 2020 15:26:28 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C075D6BA;
 Wed,  2 Dec 2020 15:26:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] vhost-user: avoid g_return_val_if() in get/set_config()
Date: Wed,  2 Dec 2020 15:26:07 +0000
Message-Id: <20201202152611.677753-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djI6DQogKiBQcmludCBlcnJvcnMgW01hcmMtQW5kcsOpXQ0KDQpNYXJrdXMgQXJtYnJ1c3RlciBw
b2ludGVkIG91dCB0aGF0IGdfcmV0dXJuX3ZhbF9pZigpIGlzIG1lYW50IGZvciBwcm9ncmFtbWlu
Zw0KZXJyb3JzLiBJdCBtdXN0IG5vdCBiZSB1c2VkIGZvciBpbnB1dCB2YWxpZGF0aW9uIHNpbmNl
IGl0IGNhbiBiZSBjb21waWxlZCBvdXQuDQpVc2UgZXhwbGljaXQgaWYgc3RhdGVtZW50cyBpbnN0
ZWFkLg0KDQpUaGlzIHBhdGNoIHNlcmllcyBjb252ZXJ0cyB2aG9zdC11c2VyIGRldmljZSBiYWNr
ZW5kcyB0aGF0IHVzZQ0KZ19yZXR1cm5fdmFsX2lmKCkgaW4gZ2V0L3NldF9jb25maWcoKS4NCg0K
U3RlZmFuIEhham5vY3ppICg0KToNCiAgY29udHJpYi92aG9zdC11c2VyLWJsazogYXZvaWQgZ19y
ZXR1cm5fdmFsX2lmKCkgaW5wdXQgdmFsaWRhdGlvbg0KICBjb250cmliL3Zob3N0LXVzZXItZ3B1
OiBhdm9pZCBnX3JldHVybl92YWxfaWYoKSBpbnB1dCB2YWxpZGF0aW9uDQogIGNvbnRyaWIvdmhv
c3QtdXNlci1pbnB1dDogYXZvaWQgZ19yZXR1cm5fdmFsX2lmKCkgaW5wdXQgdmFsaWRhdGlvbg0K
ICBibG9jay9leHBvcnQ6IGF2b2lkIGdfcmV0dXJuX3ZhbF9pZigpIGlucHV0IHZhbGlkYXRpb24N
Cg0KIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyAgICB8IDYgKysrKystDQog
Y29udHJpYi92aG9zdC11c2VyLWJsay92aG9zdC11c2VyLWJsay5jIHwgNiArKysrKy0NCiBjb250
cmliL3Zob3N0LXVzZXItZ3B1L3Zob3N0LXVzZXItZ3B1LmMgfCA2ICsrKysrLQ0KIGNvbnRyaWIv
dmhvc3QtdXNlci1pbnB1dC9tYWluLmMgICAgICAgICB8IDYgKysrKystDQogNCBmaWxlcyBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMjguMA0KDQo=


