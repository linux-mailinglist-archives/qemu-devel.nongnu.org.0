Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF23D120C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:12:23 +0200 (CEST)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6DtV-0002pk-UV
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6DsL-00027S-3T
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6DsI-0001nu-H3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626880263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+RHA6VatZNb8CmzJ8p5WZhUnXsDxHpHtOVLLXZ39kM=;
 b=gExdbsFBDEjIqUXgOy/vmJlks/h7QenwhxHUVjTaZ0CaaTaWrdagHU4qvqERQ2OG2mQiVf
 qUrSeh1ObBuBxQViH0jzAZH1z4ahRlVD4w/As7lEVKT+j5zWCXOBn/DEO5aeDmbaiIekA/
 RxckxJkEgV1MyYuFTSaSyIcP5zmhHNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-zjcDdJ_rOMm-iwnBn744EA-1; Wed, 21 Jul 2021 11:11:02 -0400
X-MC-Unique: zjcDdJ_rOMm-iwnBn744EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31144800D62
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:11:01 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883621009962;
 Wed, 21 Jul 2021 15:10:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1] qemu-config: restore "machine" in
 qmp_query_command_line_options()
Date: Wed, 21 Jul 2021 16:10:55 +0100
Message-Id: <20210721151055.424580-1-stefanha@redhat.com>
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
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q29tbWl0IGQ4ZmI3ZDA5NjlkNWMzMmIzZDFiOWUyMGI2M2VjNmMwYWJlODBiZTQgKCJ2bDogc3dp
dGNoIC1NIHBhcnNpbmcKdG8ga2V5dmFsIikgc3RvcHBlZCBhZGRpbmcgdGhlICJtYWNoaW5lIiBR
ZW11T3B0c0xpc3QuIFRoaXMgY2F1c2VzCiJtYWNoaW5lIiBvcHRpb25zIHRvIG5vdCBzaG93IHVw
IGluIFFNUCBxdWVyeS1jb21tYW5kLWxpbmUtb3B0aW9ucwpvdXRwdXQuIEZvciBleGFtcGxlLCBs
aWJ2aXJ0IGNhbm5vdCBkZXRlY3QgdGhhdCBrZXJuZWxfaXJxY2hpcCBzdXBwb3J0CmlzIGF2YWls
YWJsZS4KCkFkanVzdCB0aGUgIm1hY2hpbmUiIG9wdHMgZW51bWVyYXRpb24gaW4KcW1wX3F1ZXJ5
X2NvbW1hbmRfbGluZV9vcHRpb25zKCkgc28gdGhhdCBvcHRpb25zIGFyZSBwcm9wZXJseSByZXBv
cnRlZC4KCkZpeGVzOiBkOGZiN2QwOTY5ZDUgKCJ2bDogc3dpdGNoIC1NIHBhcnNpbmcgdG8ga2V5
dmFsIikKQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCkknbSBub3QgZmFt
aWxpYXIgd2l0aCB0aGlzIGNvZGUuIEJldHRlciBzb2x1dGlvbnMgd2VsY29tZSEKLS0tCiB1dGls
L3FlbXUtY29uZmlnLmMgfCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS91dGlsL3FlbXUtY29uZmlnLmMgYi91
dGlsL3FlbXUtY29uZmlnLmMKaW5kZXggODRlZTZkYzRlYS4uNTJkYjVlNzQzYyAxMDA2NDQKLS0t
IGEvdXRpbC9xZW11LWNvbmZpZy5jCisrKyBiL3V0aWwvcWVtdS1jb25maWcuYwpAQCAtMjU1LDgg
KzI1NSw2IEBAIENvbW1hbmRMaW5lT3B0aW9uSW5mb0xpc3QgKnFtcF9xdWVyeV9jb21tYW5kX2xp
bmVfb3B0aW9ucyhib29sIGhhc19vcHRpb24sCiAgICAgICAgICAgICBpbmZvLT5vcHRpb24gPSBn
X3N0cmR1cCh2bV9jb25maWdfZ3JvdXBzW2ldLT5uYW1lKTsKICAgICAgICAgICAgIGlmICghc3Ry
Y21wKCJkcml2ZSIsIHZtX2NvbmZpZ19ncm91cHNbaV0tPm5hbWUpKSB7CiAgICAgICAgICAgICAg
ICAgaW5mby0+cGFyYW1ldGVycyA9IGdldF9kcml2ZV9pbmZvbGlzdCgpOwotICAgICAgICAgICAg
fSBlbHNlIGlmICghc3RyY21wKCJtYWNoaW5lIiwgdm1fY29uZmlnX2dyb3Vwc1tpXS0+bmFtZSkp
IHsKLSAgICAgICAgICAgICAgICBpbmZvLT5wYXJhbWV0ZXJzID0gcXVlcnlfb3B0aW9uX2Rlc2Nz
KG1hY2hpbmVfb3B0cy5kZXNjKTsKICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAg
ICAgaW5mby0+cGFyYW1ldGVycyA9CiAgICAgICAgICAgICAgICAgICAgIHF1ZXJ5X29wdGlvbl9k
ZXNjcyh2bV9jb25maWdfZ3JvdXBzW2ldLT5kZXNjKTsKQEAgLTI2NSw2ICsyNjMsMTMgQEAgQ29t
bWFuZExpbmVPcHRpb25JbmZvTGlzdCAqcW1wX3F1ZXJ5X2NvbW1hbmRfbGluZV9vcHRpb25zKGJv
b2wgaGFzX29wdGlvbiwKICAgICAgICAgfQogICAgIH0KIAorICAgIGlmICghaGFzX29wdGlvbiB8
fCAhc3RyY21wKG9wdGlvbiwgIm1hY2hpbmUiKSkgeworICAgICAgICBpbmZvID0gZ19tYWxsb2Mw
KHNpemVvZigqaW5mbykpOworICAgICAgICBpbmZvLT5vcHRpb24gPSBnX3N0cmR1cCgibWFjaGlu
ZSIpOworICAgICAgICBpbmZvLT5wYXJhbWV0ZXJzID0gcXVlcnlfb3B0aW9uX2Rlc2NzKG1hY2hp
bmVfb3B0cy5kZXNjKTsKKyAgICAgICAgUUFQSV9MSVNUX1BSRVBFTkQoY29uZl9saXN0LCBpbmZv
KTsKKyAgICB9CisKICAgICBpZiAoY29uZl9saXN0ID09IE5VTEwpIHsKICAgICAgICAgZXJyb3Jf
c2V0ZyhlcnJwLCAiaW52YWxpZCBvcHRpb24gbmFtZTogJXMiLCBvcHRpb24pOwogICAgIH0KLS0g
CjIuMzEuMQoK


