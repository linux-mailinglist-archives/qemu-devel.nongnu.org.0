Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AF321C86
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:14:17 +0100 (CET)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDqi-0004In-MC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnf-0002XF-Ue
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDne-0002B1-C9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fE2ZqW7Abd0nNn/xz8kYfaU1Kg9VPxOJrShvvATcpvw=;
 b=KJfeWeUuHMDlaQMIcXdDib5UVi7QXh2ZroDOacPnzIrTShTauj+ll9/tUpMqPj2Pf0EzZ3
 X0Z5NOop6l2ynWroyWTdgEGL2f49pFf6HI1qC9/dEBjuEsKhu6vP1cU9Z7xcYJ68QlHPTD
 sbZGFP4pU67spcIxAZgrNJ+VMwx+hY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-DcsUX2HAMUyjUV34pjH8sg-1; Mon, 22 Feb 2021 11:11:00 -0500
X-MC-Unique: DcsUX2HAMUyjUV34pjH8sg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F39801A8A
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:10:59 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A2F91054FDC;
 Mon, 22 Feb 2021 16:10:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/qtest/vhost-user-test: use share=on with memfd
Date: Mon, 22 Feb 2021 16:10:15 +0000
Message-Id: <20210222161017.570837-2-stefanha@redhat.com>
In-Reply-To: <20210222161017.570837-1-stefanha@redhat.com>
References: <20210222161017.570837-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rm9yIHNvbWUgcmVhc29uIG1lbWZkIG5ldmVyIHVzZWQgc2hhcmU9b24uIHZob3N0LXVzZXIgcmVs
aWVzIG9uCm1tYXAoTUFQX1NIQVJFRCkgc28gdGhpcyBzZWVtcyBsaWtlIGEgcHJvYmxlbSwgYnV0
IHRoZSB0ZXN0cyBzdGlsbCBydW4Kd2l0aG91dCBpdC4KCkFkZCBzaGFyZT1vbiBmb3IgY29uc2lz
dGVuY3kgYW5kIHRvIHByZXZlbnQgZnV0dXJlIGJ1Z3MgaW4gdGhlIHRlc3QuCgpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRl
c3Qvdmhvc3QtdXNlci10ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC92aG9zdC11c2VyLXRl
c3QuYyBiL3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVzdC5jCmluZGV4IDFhNWY1MzEzZmYuLjJk
Yjk4YzQ5MjAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVzdC5jCisrKyBi
L3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVzdC5jCkBAIC00MCw3ICs0MCw3IEBACiAjZGVmaW5l
IFFFTVVfQ01EX01FTSAgICAiIC1tICVkIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSxpZD1t
ZW0sc2l6ZT0lZE0sIiBcCiAgICAgICAgICAgICAgICAgICAgICAgICAibWVtLXBhdGg9JXMsc2hh
cmU9b24gLW51bWEgbm9kZSxtZW1kZXY9bWVtIgogI2RlZmluZSBRRU1VX0NNRF9NRU1GRCAgIiAt
bSAlZCAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLW1lbWZkLGlkPW1lbSxzaXplPSVkTSwiIFwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICIgLW51bWEgbm9kZSxtZW1kZXY9bWVtIgorICAgICAgICAg
ICAgICAgICAgICAgICAgInNoYXJlPW9uIC1udW1hIG5vZGUsbWVtZGV2PW1lbSIKICNkZWZpbmUg
UUVNVV9DTURfQ0hSICAgICIgLWNoYXJkZXYgc29ja2V0LGlkPSVzLHBhdGg9JXMlcyIKICNkZWZp
bmUgUUVNVV9DTURfTkVUREVWICIgLW5ldGRldiB2aG9zdC11c2VyLGlkPWhzMCxjaGFyZGV2PSVz
LHZob3N0Zm9yY2UiCiAKLS0gCjIuMjkuMgoK


