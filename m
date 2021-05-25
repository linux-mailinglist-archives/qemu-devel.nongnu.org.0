Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57C3903EB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:30:39 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llY4s-0005rq-Jl
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llY2y-0003nP-H3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llY2v-00089c-FP
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621952916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUnwbG2LTVhPpxM8WRSWhFamkuOkPnk96+tXIzDWUtY=;
 b=GwLU3S/HfgooPnFTLt6SCkk3ESsOzVAgJs/ksmDKDCrok6nYN7QE4IzEinK/uTuH0kHCAr
 /mZMaqJ+qYdS6hh4bcSP24yYiRgsZY12g6FSgwR5Oub5QuX/dmqujEVBBqY0HIRYA1x5JH
 zoceROQPhtxB8ZssONy7cY3SpKJD+y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-1hsdM-hQMT-4_MYERSrUxw-1; Tue, 25 May 2021 10:28:32 -0400
X-MC-Unique: 1hsdM-hQMT-4_MYERSrUxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C50319253D3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 14:28:31 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32EDC5C1C2;
 Tue, 25 May 2021 14:28:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] tests/qtest/vhost-user-test: use share=on with memfd
Date: Tue, 25 May 2021 15:28:01 +0100
Message-Id: <20210525142803.125401-2-stefanha@redhat.com>
In-Reply-To: <20210525142803.125401-1-stefanha@redhat.com>
References: <20210525142803.125401-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

QWRkIHNoYXJlPW9uIGZvciBjb25zaXN0ZW5jeSBhbmQgdG8gcHJldmVudCBmdXR1cmUgYnVncyBp
biB0aGUgdGVzdC4KCk5vdGUgdGhhdCBzaGFyZT1vbiBpcyB0aGUgZGVmYXVsdCBmb3IgbWVtb3J5
LWJhY2tlbmQtbWVtZmQgc28gZXhpc3RpbmcKdGVzdHMgd29yay4KClJldmlld2VkLWJ5OiBNYXJj
LUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFRo
b21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9j
emkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci10ZXN0
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC92aG9zdC11c2VyLXRlc3QuYyBiL3Rlc3RzL3F0ZXN0
L3Zob3N0LXVzZXItdGVzdC5jCmluZGV4IDNkNjMzN2ZiNWMuLjZjMDg5MWQ0MjkgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVzdC5jCisrKyBiL3Rlc3RzL3F0ZXN0L3Zob3N0
LXVzZXItdGVzdC5jCkBAIC00MCw3ICs0MCw3IEBACiAjZGVmaW5lIFFFTVVfQ01EX01FTSAgICAi
IC1tICVkIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSxpZD1tZW0sc2l6ZT0lZE0sIiBcCiAg
ICAgICAgICAgICAgICAgICAgICAgICAibWVtLXBhdGg9JXMsc2hhcmU9b24gLW51bWEgbm9kZSxt
ZW1kZXY9bWVtIgogI2RlZmluZSBRRU1VX0NNRF9NRU1GRCAgIiAtbSAlZCAtb2JqZWN0IG1lbW9y
eS1iYWNrZW5kLW1lbWZkLGlkPW1lbSxzaXplPSVkTSwiIFwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICIgLW51bWEgbm9kZSxtZW1kZXY9bWVtIgorICAgICAgICAgICAgICAgICAgICAgICAgInNo
YXJlPW9uIC1udW1hIG5vZGUsbWVtZGV2PW1lbSIKICNkZWZpbmUgUUVNVV9DTURfQ0hSICAgICIg
LWNoYXJkZXYgc29ja2V0LGlkPSVzLHBhdGg9JXMlcyIKICNkZWZpbmUgUUVNVV9DTURfTkVUREVW
ICIgLW5ldGRldiB2aG9zdC11c2VyLGlkPWhzMCxjaGFyZGV2PSVzLHZob3N0Zm9yY2UiCiAKLS0g
CjIuMzEuMQoK


