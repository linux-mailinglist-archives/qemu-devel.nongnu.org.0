Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1232868F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:13:40 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGm71-0005GZ-Kr
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGm54-0004GZ-Pu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGm4i-0006Cn-Re
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614618676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tnwCt4g97BnqVgqjJs4/MkJedhHjYflzmrPIvEhiM80=;
 b=Tl0evM98N/bOIQyMQzllPnuu/HmOgMtugamNO5zZdnc00foTTBfdUXNSOz3wdMxq2baDQH
 W5gSmIgjD3Ha8+noHnS6QCsGpaZiffhiHFfO51R+12BOODsM2iTc8PrvUJ87lL2EQQ/hVp
 FgteXX3xvbQxAsvXAGBcF2u8Mky3sSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-cwX0GQwyM3uF5RCaVQ0fVw-1; Mon, 01 Mar 2021 12:11:14 -0500
X-MC-Unique: cwX0GQwyM3uF5RCaVQ0fVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5619A195D560;
 Mon,  1 Mar 2021 17:11:13 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FBE360636;
 Mon,  1 Mar 2021 17:11:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] docs: show how to spawn qemu-storage-daemon with fd
 passing
Date: Mon,  1 Mar 2021 17:11:05 +0000
Message-Id: <20210301171107.134100-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGFuIGV4YW1wbGUgb2YgaG93IHRvIHNwYXduIHFlbXUtc3RvcmFnZS1kYWVtb24gd2l0aCBm
ZCBwYXNzaW5nLiBUaGlzDQphcHByb2FjaCBlbGltaW5hdGVzIHRoZSBuZWVkIHRvIGJ1c3kgd2Fp
dCBmb3IgdGhlIFFNUCwgTkJELCBvciB2aG9zdC11c2VyDQpzb2NrZXQgdG8gYmVjb21lIGF2YWls
YWJsZS4NCg0KdjI6DQogKiBVc2UgL3Zhci9ydW4vcW1wLnNvY2sgaW5zdGVhZCBvZiAvdG1wL3Ft
cC0kUElELnNvY2sgdG8gcHJldmVudCBzZWN1cml0eQ0KICAgaXNzdWVzIHdpdGggd29ybGQtd3Jp
dGVhYmxlIGRpcmVjdG9yaWVzIFtSaWNoLCBEYW5pZWxdDQogKiBBZGQgUGF0Y2ggMiB0byBmaXgg
aW5zZWN1cmUgZXhhbXBsZXMgaW4gdGhlIGRvY3VtZW50YXRpb24gW1JpY2gsIERhbmllbF0NCg0K
U3RlZmFuIEhham5vY3ppICgyKToNCiAgZG9jczogc2hvdyBob3cgdG8gc3Bhd24gcWVtdS1zdG9y
YWdlLWRhZW1vbiB3aXRoIGZkIHBhc3NpbmcNCiAgZG9jczogcmVwbGFjZSBpbnNlY3VyZSAvdG1w
IGV4YW1wbGVzIGluIHFzZCBkb2NzDQoNCiBkb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24u
cnN0IHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yOS4yDQoNCg==


