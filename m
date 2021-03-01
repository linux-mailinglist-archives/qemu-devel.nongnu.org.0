Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147132879C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:29:48 +0100 (CET)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmMc-0007ur-Q2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKe-0006dC-1I
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmKa-0002li-KJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Djctwd/wfvvHCIRsi1xHUXCGzKPZe/9bO8z4eoNjx4Y=;
 b=HGXWxHSfAhwm7FpazkQr3gq41Z9sGZUs5pFIJ8nZ4y6xd957F+eh/DoKFO4Q0jxG4V3yuP
 opSMliwbqZ6hXanLplI4Wg6iGh04u/FwwjZJzawJf76iS/NlWZHEDvXgD9o4rus+ifeFlB
 FJHgSoArRsDuDafhtAeh/6jbgJJ0nJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-O_bNj4zAMiSJLWy-dHy15w-1; Mon, 01 Mar 2021 12:27:36 -0500
X-MC-Unique: O_bNj4zAMiSJLWy-dHy15w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B16874982;
 Mon,  1 Mar 2021 17:27:35 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 137015D9E2;
 Mon,  1 Mar 2021 17:27:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] docs: show how to spawn qemu-storage-daemon with fd
 passing
Date: Mon,  1 Mar 2021 17:27:26 +0000
Message-Id: <20210301172728.135331-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

djM6DQogKiBFeHBsYWluIGhvdyB0byBkZXRlY3QgbGF1bmNoIGVycm9ycyBhbmQgdGhhdCB0aGUg
bGlzdGVuIHNvY2tldCBtdXN0IGJlDQogICBjbG9zZWQgaW4gdGhlIHBhcmVudCBwcm9jZXNzIGlu
IG9yZGVyIGZvciB0aGlzIHRvIHdvcmsgW0RhbmllbF0NCg0KdjI6DQogKiBVc2UgL3Zhci9ydW4v
cW1wLnNvY2sgaW5zdGVhZCBvZiAvdG1wL3FtcC0kUElELnNvY2sgdG8gcHJldmVudCBzZWN1cml0
eQ0KICAgaXNzdWVzIHdpdGggd29ybGQtd3JpdGVhYmxlIGRpcmVjdG9yaWVzIFtSaWNoLCBEYW5p
ZWxdDQogKiBBZGQgUGF0Y2ggMiB0byBmaXggaW5zZWN1cmUgZXhhbXBsZXMgaW4gdGhlIGRvY3Vt
ZW50YXRpb24gW1JpY2gsIERhbmllbF0NCg0KQWRkIGFuIGV4YW1wbGUgb2YgaG93IHRvIHNwYXdu
IHFlbXUtc3RvcmFnZS1kYWVtb24gd2l0aCBmZCBwYXNzaW5nLiBUaGlzDQphcHByb2FjaCBlbGlt
aW5hdGVzIHRoZSBuZWVkIHRvIGJ1c3kgd2FpdCBmb3IgdGhlIFFNUCwgTkJELCBvciB2aG9zdC11
c2VyDQpzb2NrZXQgdG8gYmVjb21lIGF2YWlsYWJsZS4NCg0KU3RlZmFuIEhham5vY3ppICgyKToN
CiAgZG9jczogc2hvdyBob3cgdG8gc3Bhd24gcWVtdS1zdG9yYWdlLWRhZW1vbiB3aXRoIGZkIHBh
c3NpbmcNCiAgZG9jczogcmVwbGFjZSBpbnNlY3VyZSAvdG1wIGV4YW1wbGVzIGluIHFzZCBkb2Nz
DQoNCiBkb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0IHwgNDkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yOS4yDQoNCg==


