Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF61C89EF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 14:01:46 +0200 (CEST)
Received: from localhost ([::1]:37874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWfDl-0007qm-0h
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 08:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAR-0006Iv-DE
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20593
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAP-0000ca-SB
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588852695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goQB+ZJ3KkFNo7UHqa0H+yx53cyZ067ag9jf2ms9rEU=;
 b=YXaZoKHokP6PAmCrpKAT2+hC4MsqUYNSbUX77ZtTJuboMCrC9Qvl7iT9ojcpZfxKXpRn+q
 P1ajqnugRLQ3oQrknclvurpxQdKJt4OzXHmy6XWRm1Ba1lvharRY6366CzWXUH0kUWYZD5
 lJaTHsolDc6nbWBnXUbWKcu+Bmn9Y7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-GTWzWg6NMKK9aN9vBfPGPg-1; Thu, 07 May 2020 07:58:12 -0400
X-MC-Unique: GTWzWg6NMKK9aN9vBfPGPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC67C64AD6;
 Thu,  7 May 2020 11:58:11 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A740662A50;
 Thu,  7 May 2020 11:58:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] crypto/secret: fix inconsequential errors.
Date: Thu,  7 May 2020 12:58:00 +0100
Message-Id: <20200507115803.1122661-3-berrange@redhat.com>
In-Reply-To: <20200507115803.1122661-1-berrange@redhat.com>
References: <20200507115803.1122661-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Alexey Krasikov <alex-krasikov@yandex-team.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Krasikov <alex-krasikov@yandex-team.ru>

Change condition from QCRYPTO_SECRET_FORMAT_RAW
to QCRYPTO_SECRET_FORMAT_BASE64 in if-operator, because
this is potential error if you add another format value.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/secret.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/secret.c b/crypto/secret.c
index 5fb6bbe59c..a846a3c87c 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -204,7 +204,7 @@ qcrypto_secret_prop_set_loaded(Object *obj,
             input =3D output;
             inputlen =3D outputlen;
         } else {
-            if (secret->format !=3D QCRYPTO_SECRET_FORMAT_RAW) {
+            if (secret->format =3D=3D QCRYPTO_SECRET_FORMAT_BASE64) {
                 qcrypto_secret_decode(input, inputlen,
                                       &output, &outputlen, &local_err);
                 g_free(input);
--=20
2.26.2


