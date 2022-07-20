Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B357BA38
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:04 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBj5-0005Mb-SA
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBay-0002RU-UQ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBaw-0005CM-MK
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id h9so1545702wrm.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=241Cj3nRc+TfIsWqH9QSLVkPEH6LQqDnk//kT3z1Vb4=;
 b=j11TT9/OHYcYAu68D4+6RWK/QS08SMs1gkkboplA4Suw/1+hVNqxeaklBQ2sAXh/Yd
 X98iGuCpZtdONu6ql9BZcyj+iBjQ909zSiiVq3x5Hyzrytcu+2niKe5ssn3/4cmW1bkO
 ZUrINSHoYp4DNBe830QvRJMwwmZSiPFkxOutwWH5efjPyR/pBxi0D0tD81zC85KYS/cH
 PVZrzwczhHo3FMy4O37NgdCDtEn5fe8lJmICwh3wzuKJ8RfMAT7PptGDjj1a2q9ayn9j
 fAnozdbKltm4aV/rIvZqK0Hilfh7Zdq7Q2sKWayJnvUDsY4rohF6RTvbyxLiBhsNfBJX
 JMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=241Cj3nRc+TfIsWqH9QSLVkPEH6LQqDnk//kT3z1Vb4=;
 b=69UKGmMZ+Qfo+wQfZ7p7fJTosxNF2CziXY/X6w2knWIBmkou0sV9SiykqgfxmtUnnn
 N8s8uAvwVOZmfVAcsoszKWIn1eE5+RvfN1AZFkSBDMhgrIMqme5/2ajK9qzAmVzZVbUN
 pwrnqEIREvZpuLgYVX4qT4ogDP6KqHC8uqYQHevc/uiX90Ps6L9wakkBTXGeQowDp64W
 CL2XwPOMoLx6q/TYbKlusnjmrXr5/BvYi7e3hPpk5gzh8IgNJDZkL/U5Iw5d1oR4ul55
 A5asqWG1rgteFxz8mFldQFKwJugEfaH518LcqEaiyPbC/nVY1hNMJwlbZAI+97leUIRd
 7z3w==
X-Gm-Message-State: AJIora+O5Calu+29KAv4o2QKr607AB9n9xpygVD3xf02jMz6HLpKdjFH
 PTMmwume1ZXcTK/z0p+fIAqWnYOb2W6L5w==
X-Google-Smtp-Source: AGRyM1sc/SvbPrJu5oARw+1J13cKD3GLs2sHAxJwYov2KgXqnVXTodAnLBH8ViW7ehYukuCJKkHyww==
X-Received: by 2002:adf:e505:0:b0:21e:5134:c7b6 with SMTP id
 j5-20020adfe505000000b0021e5134c7b6mr211923wrm.159.1658330797373; 
 Wed, 20 Jul 2022 08:26:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/5] configure: Drop dead code attempting to use -msmall-data
 on alpha hosts
Date: Wed, 20 Jul 2022 16:26:30 +0100
Message-Id: <20220720152631.450903-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 823eb013452e93d we moved the setting of ARCH from configure
to meson.build, but we accidentally left behind one attempt to use
$ARCH in configure, which was trying to add -msmall-data to the
compiler flags on Alpha hosts.  Since ARCH is now never set, the test
always fails and we never add the flag.

There isn't actually any need to use this compiler flag on Alpha:
the original intent was that it would allow us to simplify our TCG
codegen on that platform, but we never actually made the TCG changes
that would rely on -msmall-data.

Drop the effectively-dead code from configure, as we don't need it.

This was spotted by shellcheck:

In ./configure line 2254:
case "$ARCH" in
      ^---^ SC2153: Possible misspelling: ARCH may not be assigned, but arch is.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/configure b/configure
index c05205b6085..d0e9a51462e 100755
--- a/configure
+++ b/configure
@@ -2251,13 +2251,6 @@ if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
 fi
 
-case "$ARCH" in
-alpha)
-  # Ensure there's only a single GP
-  QEMU_CFLAGS="-msmall-data $QEMU_CFLAGS"
-;;
-esac
-
 if test "$have_asan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
   QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
-- 
2.25.1


