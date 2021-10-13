Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83C42BB4F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:16:44 +0200 (CEST)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaNP-00041R-O5
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEc-0002C4-4c
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:38 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEZ-0005cp-8A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:36 -0400
Received: by mail-ed1-x533.google.com with SMTP id z20so7129351edc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNG36sfrGRnhfbW02QCMFzqnCJ3SMLhvJx/HaulJn0Y=;
 b=ggsKdrCW1FXYuozXn7G7sBXbO4e3YaZS4PPTBYVipC3eSPhrC7ZTzvQMJMqoJkE3L/
 h0YQYWht4F1KLX0YXx2fwRCw5TkOgrCvoW6a2Walx+rSTewJnJpRf7ftKpOFXheK2HaB
 QwVAAVa0wCD4PSA7Co5QYNlDQcbAdZkVlUhUXHc/LwVfmS4J8NQ6+vHr0ocq/uPjvUWg
 a91ZcrbCHnk78J4vKv4x8EWtmJVXFm4CtFZdD+9cweiD+0g48WjQKy0iUmZM4yFUmmJV
 FVW0hEGGGiOsMsGUFESkd5b17mVik6dQIfuqiAVZlCvvY8k18YwwTC8acZGymN8REeCI
 mBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uNG36sfrGRnhfbW02QCMFzqnCJ3SMLhvJx/HaulJn0Y=;
 b=x5Dp5PwbgiMZXFxWdGmxvDzvGZRYBkANm+ZAfYOxPpHhvbVMC/Nw8nnwNAwyjLqSF2
 +XBdVUfMo5l8wzep7jllPVz9U98k2ewKsmdqcO99srLwlF3UrXQYWPGLYL4sRa3U/8l6
 d+GNxVMCwXf9/ghjECpsPW/F2/UlEowaKQ3KIFcBjnbeRhN20ie9CpT7c1PCEjUvD+Lc
 5ziXjJmLC/y3TKprnFUxS9Gymb8gzg9CYPgCKTalVQUNI5MqczWi/cRnldpMqeCm7i+7
 3x9W1lCIGP3iOmyd9VeRcGEvaZ9Leei/5+usNnyMtN3YSz++VqNLVi5UoQuHqbQebpvt
 qQbQ==
X-Gm-Message-State: AOAM532G5X3tuODHOleDzr7uIBzmddY1MJyJzNj0JrkEe1B8iYXNJWjR
 CXCejrLu/PSpxhqYUdCnuu5G6oO2PNg=
X-Google-Smtp-Source: ABdhPJz18O6M0Zo8qZnaPQ8267k0zlBzr2eWUDogPap2z/yKmksPX199t/0ssy6PANwZrll0qRB8qg==
X-Received: by 2002:a05:6402:1b92:: with SMTP id
 cc18mr7773797edb.31.1634116052854; 
 Wed, 13 Oct 2021 02:07:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/40] qemu-iotests: flush after every test
Date: Wed, 13 Oct 2021 11:06:52 +0200
Message-Id: <20211013090728.309365-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it possible to see what is happening, even if the output of
"make check-block" is not sent to a tty (for example if it is sent to
grep or tee).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a56b6da396..0e29c2fddd 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -341,6 +341,7 @@ def run_tests(self, tests: List[str]) -> bool:
             elif res.status == 'not run':
                 notrun.append(name)
 
+            sys.stdout.flush()
             if res.interrupted:
                 break
 
-- 
2.31.1



