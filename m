Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAF233840
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 20:16:48 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1D6l-0007jN-NW
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 14:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k1D4j-0006lD-4s
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:14:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44295
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k1D4h-0001T4-ID
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 14:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596132878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbmL4Rhz2i+65G7NEIp7+3CCiuvMD5mIk47Yeovyko8=;
 b=Jbu1T+njlTRAZVar2/2RsZKit0GoKZ68sqDUzJKVLWjVbsJkHcj68lizrJvx+0M6zsfVfC
 pzzQIphMCmk7Ck/EQ31kXKeI2RmGLh1LrNS97QxH5/uqIJnIbaSux8Hdqlv2Gg0o1Vwljq
 iDphYYzqhCqMSqNxM0rotRJjVjtkftw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-kfBtc0pYOXCu4dRUrVnFPg-1; Thu, 30 Jul 2020 14:14:33 -0400
X-MC-Unique: kfBtc0pYOXCu4dRUrVnFPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC86A57;
 Thu, 30 Jul 2020 18:14:31 +0000 (UTC)
Received: from localhost (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD570100239B;
 Thu, 30 Jul 2020 18:14:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.1 1/2] trace/simple: Allow enabling simple traces from
 command line
Date: Thu, 30 Jul 2020 19:14:13 +0100
Message-Id: <20200730181414.160066-2-stefanha@redhat.com>
In-Reply-To: <20200730181414.160066-1-stefanha@redhat.com>
References: <20200730181414.160066-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Josh DuBois <duboisj@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Josh DuBois <josh@joshdubois.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogSm9zaCBEdUJvaXMgPGR1Ym9pc2pAZ21haWwuY29tPgoKVGhlIHNpbXBsZSB0cmFjZSBi
YWNrZW5kIGlzIGVuYWJsZWQgLyBkaXNhYmxlZCB3aXRoIGEgY2FsbAp0byBzdF9zZXRfdHJhY2Vf
ZmlsZV9lbmFibGVkKCkuICBXaGVuIGluaXRpYWxpemluZyB0cmFjaW5nCmZyb20gdGhlIGNvbW1h
bmQtbGluZSwgdGhpcyBtdXN0IGJlIGVuYWJsZWQgb24gc3RhcnR1cC4KKFByaW9yIHRvIGRiMjVk
NTZjMDE0YWExYTksIGNvbW1hbmQtbGluZSBpbml0aWFsaXphdGlvbiBvZgpzaW1wbGUgdHJhY2Ug
d29ya2VkIGJlY2F1c2UgZXZlcnkgY2FsbCB0byBzdF9zZXRfdHJhY2VfZmlsZQplbmFibGVkIHRy
YWNpbmcuKQoKRml4ZXM6IGRiMjVkNTZjMDE0YWExYTk2MzE5YzY2M2UwYTYwMzQ2YTIyM2IzMWUK
U2lnbmVkLW9mZi1ieTogSm9zaCBEdUJvaXMgPGpvc2hAam9zaGR1Ym9pcy5jb20+Ck1lc3NhZ2Ut
aWQ6IDIwMjAwNzIzMDUzMzU5LjI1NjkyOC0xLWpvc2hAam9zaGR1Ym9pcy5jb20KU2lnbmVkLW9m
Zi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRyYWNlL2Nv
bnRyb2wuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvdHJhY2UvY29udHJvbC5jIGIvdHJhY2UvY29udHJvbC5jCmluZGV4IDJmZmUwMDA4MTguLjY1
NThiNWM5MDYgMTAwNjQ0Ci0tLSBhL3RyYWNlL2NvbnRyb2wuYworKysgYi90cmFjZS9jb250cm9s
LmMKQEAgLTIyNSw2ICsyMjUsNyBAQCB2b2lkIHRyYWNlX2luaXRfZmlsZShjb25zdCBjaGFyICpm
aWxlKQogewogI2lmZGVmIENPTkZJR19UUkFDRV9TSU1QTEUKICAgICBzdF9zZXRfdHJhY2VfZmls
ZShmaWxlKTsKKyAgICBzdF9zZXRfdHJhY2VfZmlsZV9lbmFibGVkKHRydWUpOwogI2VsaWYgZGVm
aW5lZCBDT05GSUdfVFJBQ0VfTE9HCiAgICAgLyoKICAgICAgKiBJZiBib3RoIHRoZSBzaW1wbGUg
YW5kIHRoZSBsb2cgYmFja2VuZHMgYXJlIGVuYWJsZWQsICItLXRyYWNlIGZpbGUiCi0tIAoyLjI2
LjIKCg==


