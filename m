Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4C4C50BC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:33:29 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiDQ-0001n3-Se
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:33:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhlL-0007rZ-Rf
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhlH-0005Yv-QV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645823062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNODeJwjuUNMne1tnJjwXA4MZtQxGl2DrlKChgzr9aw=;
 b=QH92NNl+/qtwKJZJwWtH43V2AgCBZR8+poRfelWX3r3ud54UkCW3iFq9La3ABBjwLD0p8u
 L2VbQuBbsWGFd335gQ3gllK/TLEboaejVaauv8yyHpg5l9L6U2lFpRhArffY5/0SZyNq6Z
 Qm8l/JYcKillfXqvmBwTkW1du6thjIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-Vp8j209aOqiSR3BxDp8-8g-1; Fri, 25 Feb 2022 16:04:19 -0500
X-MC-Unique: Vp8j209aOqiSR3BxDp8-8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AEAC5200;
 Fri, 25 Feb 2022 21:04:16 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73A592ED84;
 Fri, 25 Feb 2022 21:04:13 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 9/9] Avocado tests: don't run tests with TCG that boot full
 blown distros
Date: Fri, 25 Feb 2022 16:01:56 -0500
Message-Id: <20220225210156.2032055-10-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests that use TCG and boot full blown distros, such as Fedora, will
take a good time to run.  This excludes those combinations by default
on invocations of "make check-avocado".

Tests that rely on KVM instead, will continue to run.

As a reminder, one can always supply a list of tests or tags to be
used on a "make check-avocado" by setting AVOCADO_TESTS or
AVOCADO_TAGS.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 676aa0d944..6d9cf7cbc9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -91,8 +91,11 @@ endif
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
+comma:=,
 ifndef AVOCADO_TAGS
-	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
+       AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%$(comma)accel:tcg$(comma)boots:-distro, \
+						 $(filter %-softmmu,$(TARGETS)))
+       AVOCADO_CMDLINE_TAGS+=$(patsubst %-softmmu,-t arch:%$(comma)accel:kvm, \
 						 $(filter %-softmmu,$(TARGETS)))
 else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
-- 
2.35.1


