Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18933224D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:46:01 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYwC-00069q-DT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYrq-0001FZ-RR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYro-00032s-Bb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEppb1V0RX/rpz6T6uZ8rUZ4sl4ex4AoGkabbVN3c0k=;
 b=OfFhIguRGB2dhX3jy4bBWNdHP0TW8qWutlND3z0gN4naO4mEcAVNYLyITq86cZU+rMcvUq
 YfXGc2WXG91bNxU9nSEc/NN9xrSN08euMozqgum2q/OpS6DjMBKmTlYn1AYLZRtYtRHQvQ
 awbGJP0AjKKGtA7KDoM0C1gH2clVakE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-pPbk03asNMGGuLgHq7xL6g-1; Tue, 09 Mar 2021 04:41:26 -0500
X-MC-Unique: pPbk03asNMGGuLgHq7xL6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F385626864;
 Tue,  9 Mar 2021 09:41:24 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4166A5B4A9;
 Tue,  9 Mar 2021 09:41:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] block/export: disable
 VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD for now
Date: Tue,  9 Mar 2021 09:41:03 +0000
Message-Id: <20210309094106.196911-2-stefanha@redhat.com>
In-Reply-To: <20210309094106.196911-1-stefanha@redhat.com>
References: <20210309094106.196911-1-stefanha@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIHZob3N0LXVzZXIgaW4tZmxpZ2h0IHNobWZkIGZlYXR1cmUgaGFzIG5vdCBiZWVuIHRlc3Rl
ZCB3aXRoCnFlbXUtc3RvcmFnZS1kYWVtb24ncyB2aG9zdC11c2VyLWJsayBzZXJ2ZXIuIERpc2Fi
bGUgdGhpcyBvcHRpb25hbApmZWF0dXJlIGZvciBub3cgYmVjYXVzZSBpdCByZXF1aXJlcyBNRkRf
QUxMT1dfU0VBTElORywgd2hpY2ggaXMgbm90CmF2YWlsYWJsZSBpbiBzb21lIENJIGVudmlyb25t
ZW50cy4KCklmIHdlIG5lZWQgdGhpcyBmZWF0dXJlIGluIHRoZSBmdXR1cmUgaXQgY2FuIGJlIHJl
LWVuYWJsZWQgYWZ0ZXIKdGVzdGluZy4KClJlcG9ydGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+CkNjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
YmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIHwgMyArLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgYi9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1i
bGstc2VydmVyLmMKaW5kZXggY2I1ZDg5NmI3Yi4uZmEwNjk5NmQzNyAxMDA2NDQKLS0tIGEvYmxv
Y2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCisrKyBiL2Jsb2NrL2V4cG9ydC92aG9z
dC11c2VyLWJsay1zZXJ2ZXIuYwpAQCAtMzQ1LDggKzM0NSw3IEBAIHN0YXRpYyB1aW50NjRfdCB2
dV9ibGtfZ2V0X2ZlYXR1cmVzKFZ1RGV2ICpkZXYpCiAKIHN0YXRpYyB1aW50NjRfdCB2dV9ibGtf
Z2V0X3Byb3RvY29sX2ZlYXR1cmVzKFZ1RGV2ICpkZXYpCiB7Ci0gICAgcmV0dXJuIDF1bGwgPDwg
VkhPU1RfVVNFUl9QUk9UT0NPTF9GX0NPTkZJRyB8Ci0gICAgICAgICAgIDF1bGwgPDwgVkhPU1Rf
VVNFUl9QUk9UT0NPTF9GX0lORkxJR0hUX1NITUZEOworICAgIHJldHVybiAxdWxsIDw8IFZIT1NU
X1VTRVJfUFJPVE9DT0xfRl9DT05GSUc7CiB9CiAKIHN0YXRpYyBpbnQKLS0gCjIuMjkuMgoK


