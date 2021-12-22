Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7847D140
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:46:54 +0100 (CET)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0058-0000fA-1R
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzss-0001EA-EW
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzse-00072E-Tt
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VfZjxbclXGxpSGf66sql3q/0k8675QShcJgFOeJNuA=;
 b=i2xKzzCeNhUYi27mgM4CwhFrohgKuJ7M+DE4T+x6tKLHoVFUCiNZj9nx5JonustDh1cOvU
 IfqDZfcv30ag+7VS2E/wRN9R+azz0f1AMTO2B+UvsXBLxO0LTo7u4snC7QNogpC4Ffaevs
 Nh0tSlYvv/lY8XhKyv7yZbZn4jomXTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-vr9jNuz6NFiZP9fD54E64A-1; Wed, 22 Dec 2021 06:33:57 -0500
X-MC-Unique: vr9jNuz6NFiZP9fD54E64A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F053D1023F4D;
 Wed, 22 Dec 2021 11:33:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8F57B015;
 Wed, 22 Dec 2021 11:33:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] tests/qtest: Improve endianness-test to work with missing
 machines and devices
Date: Wed, 22 Dec 2021 12:32:56 +0100
Message-Id: <20211222113259.823203-7-thuth@redhat.com>
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
References: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The users might have built QEMU with less machines or without the
i82378 superio device. Add some checks to the endianess-test so that
it is able to deal with such stripped down QEMU versions, too.

Message-Id: <20211220081054.151515-3-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/endianness-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/endianness-test.c b/tests/qtest/endianness-test.c
index 09ecb531f1..9c03b72dc9 100644
--- a/tests/qtest/endianness-test.c
+++ b/tests/qtest/endianness-test.c
@@ -281,7 +281,10 @@ int main(int argc, char **argv)
 
     for (i = 0; test_cases[i].arch; i++) {
         gchar *path;
-        if (strcmp(test_cases[i].arch, arch) != 0) {
+
+        if (!g_str_equal(test_cases[i].arch, arch) ||
+            !qtest_has_machine(test_cases[i].machine) ||
+            (test_cases[i].superio && !qtest_has_device(test_cases[i].superio))) {
             continue;
         }
         path = g_strdup_printf("endianness/%s",
-- 
2.27.0


