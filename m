Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E7260C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 09:33:02 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFY7h-0005pT-Rp
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 03:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFY4h-0001Bn-8q
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:29:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFY4e-0003k2-Fp
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599550191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnr1pI1n8EI25hLmY8tM6ZUgIEhmTjcSrt1jUFrneW8=;
 b=Kfm9iuibRtbEYG/N7n6h8OWPJ5tZfPW0M/SZGKEtffOOxrpCm6gsDHP3WwuF9S4/4M8A2C
 TSfonSLzjH3e/ltI9u/1awbdY9zH1/KNiIUcS5livYH7EPnH+19U+et+AeXXnVR7aYtVCU
 g+m91YgL/wIeqZTSfzBPQrdxwUrnBF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-hzqgVeXANk-hkoqb5N3BAA-1; Tue, 08 Sep 2020 03:29:49 -0400
X-MC-Unique: hzqgVeXANk-hkoqb5N3BAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C374080734C
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 07:29:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-122.ams2.redhat.com
 [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC22C7E30C;
 Tue,  8 Sep 2020 07:29:47 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Subject: [PATCH 03/10] roms/Makefile.edk2: prepare for replacing TPM2*_ENABLE
 macros
Date: Tue,  8 Sep 2020 09:29:32 +0200
Message-Id: <20200908072939.30178-4-lersek@redhat.com>
In-Reply-To: <20200908072939.30178-1-lersek@redhat.com>
References: <20200908072939.30178-1-lersek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RWtkMiBjb21taXQgMDc5NTJhOTYyYTQwICgiT3ZtZlBrZzogcmVuYW1lIFRQTTIgY29uZmlnIHBy
ZWZpeCB0byBUUE0iLAoyMDIwLTAzLTA0KSwgcGFydCBvZiBlZGsyLXN0YWJsZTIwMjAwNSwgcmVu
YW1lZCBPVk1GJ3MgVFBNMipfRU5BQkxFIGJ1aWxkCmZsYWdzIHRvIFRQTSpfRU5BQkxFLiBHb2lu
ZyBmb3J3YXJkLCB0aGUgVFBNKl9FTkFCTEUgZmxhZ3Mgd291bGQgYWN0aXZhdGUKYm90aCBUUE0x
LjIgYW5kIFRQTTIuMCBzdXBwb3J0LgoKSW4gb3JkZXIgdG8gYnVpbGQgT1ZNRiBhdCBlZGsyLXN0
YWJsZTIwMjAwOCB3aXRob3V0IGxvc2luZyBjdXJyZW50bHkKZW5hYmxlZCBmdW5jdGlvbmFsaXR5
LCBpbnNlcnQgdGhlIG5ldyBmbGFncyBhcyBuby1vcHMgbm93LiBXZSdsbCByZW1vdmUKdGhlIG9s
ZCBmbGFncyBhZnRlciBhZHZhbmNpbmcgd2l0aCB0aGUgZWRrMiBzdWJtb2R1bGUuCgpDYzogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpSZWY6IGh0dHBzOi8vYnVn
cy5sYXVuY2hwYWQubmV0L3FlbXUvK2J1Zy8xODUyMTk2ClNpZ25lZC1vZmYtYnk6IExhc3psbyBF
cnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogcm9tcy9NYWtlZmlsZS5lZGsyIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3JvbXMv
TWFrZWZpbGUuZWRrMiBiL3JvbXMvTWFrZWZpbGUuZWRrMgppbmRleCAzM2EwNzRkM2E0YzIuLjdj
MDY2NDVjOTVjYSAxMDA2NDQKLS0tIGEvcm9tcy9NYWtlZmlsZS5lZGsyCisrKyBiL3JvbXMvTWFr
ZWZpbGUuZWRrMgpAQCAtODgsNiArODgsOCBAQCBzdWJtb2R1bGVzOgogCQktRCBORVRXT1JLX0lQ
Nl9FTkFCTEUgXAogCQktRCBORVRXT1JLX0hUVFBfQk9PVF9FTkFCTEUgXAogCQktRCBORVRXT1JL
X1RMU19FTkFCTEUgXAorCQktRCBUUE1fRU5BQkxFIFwKKwkJLUQgVFBNX0NPTkZJR19FTkFCTEUg
XAogCQktRCBUUE0yX0VOQUJMRSBcCiAJCS1EIFRQTTJfQ09ORklHX0VOQUJMRQogCWNwIGVkazIv
QnVpbGQvT3ZtZklhMzIvREVCVUdfJChjYWxsIHRvb2xjaGFpbixpMzg2KS9GVi9PVk1GX0NPREUu
ZmQgJEAKQEAgLTEwMCw2ICsxMDIsOCBAQCBzdWJtb2R1bGVzOgogCQktRCBORVRXT1JLX0lQNl9F
TkFCTEUgXAogCQktRCBORVRXT1JLX0hUVFBfQk9PVF9FTkFCTEUgXAogCQktRCBORVRXT1JLX1RM
U19FTkFCTEUgXAorCQktRCBUUE1fRU5BQkxFIFwKKwkJLUQgVFBNX0NPTkZJR19FTkFCTEUgXAog
CQktRCBUUE0yX0VOQUJMRSBcCiAJCS1EIFRQTTJfQ09ORklHX0VOQUJMRSBcCiAJCS1EIFNFQ1VS
RV9CT09UX0VOQUJMRSBcCkBAIC0xMTQsNiArMTE4LDggQEAgc3VibW9kdWxlczoKIAkJLUQgTkVU
V09SS19JUDZfRU5BQkxFIFwKIAkJLUQgTkVUV09SS19IVFRQX0JPT1RfRU5BQkxFIFwKIAkJLUQg
TkVUV09SS19UTFNfRU5BQkxFIFwKKwkJLUQgVFBNX0VOQUJMRSBcCisJCS1EIFRQTV9DT05GSUdf
RU5BQkxFIFwKIAkJLUQgVFBNMl9FTkFCTEUgXAogCQktRCBUUE0yX0NPTkZJR19FTkFCTEUKIAlj
cCBlZGsyL0J1aWxkL092bWZYNjQvREVCVUdfJChjYWxsIHRvb2xjaGFpbix4ODZfNjQpL0ZWL09W
TUZfQ09ERS5mZCAkQApAQCAtMTI3LDYgKzEzMyw4IEBAIHN1Ym1vZHVsZXM6CiAJCS1EIE5FVFdP
UktfSVA2X0VOQUJMRSBcCiAJCS1EIE5FVFdPUktfSFRUUF9CT09UX0VOQUJMRSBcCiAJCS1EIE5F
VFdPUktfVExTX0VOQUJMRSBcCisJCS1EIFRQTV9FTkFCTEUgXAorCQktRCBUUE1fQ09ORklHX0VO
QUJMRSBcCiAJCS1EIFRQTTJfRU5BQkxFIFwKIAkJLUQgVFBNMl9DT05GSUdfRU5BQkxFIFwKIAkJ
LUQgU0VDVVJFX0JPT1RfRU5BQkxFIFwKLS0gCjIuMTkuMS4zLmczMDI0N2FhNWQyMDEKCgo=


