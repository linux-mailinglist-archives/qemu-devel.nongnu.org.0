Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFD30044E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:37:18 +0100 (CET)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wcn-0007O2-9u
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wWI-00027p-BN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2wWG-0004t2-8C
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqLUxS6+wXdFYNdF20lIIzQLVCdqXVLR3cT1O1xo2Ts=;
 b=QlnUHF3Gr9P2cPRnamxHQauBRiSOBAPo10+f3QDT3tJJzn23X7ntUgwtAB/gaapreQfYYk
 faSLRcmUJ8ZViskBb2mOz+Ln5qbFSDyAdLFpNs3jjf5OChIpyj1lhwkDy/P5iLnrcwOtJC
 ixOkV4KLCZ1ywR9yhpMr+XgPZjgxuNk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-I5vE7xwPNLyXMiGmu2XCWg-1; Fri, 22 Jan 2021 08:30:29 -0500
X-MC-Unique: I5vE7xwPNLyXMiGmu2XCWg-1
Received: by mail-ej1-f71.google.com with SMTP id h18so2177422ejx.17
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqLUxS6+wXdFYNdF20lIIzQLVCdqXVLR3cT1O1xo2Ts=;
 b=gTh5iaQosCPi/eTm9JwX7INedLFxZx+pVqhklpm//z1uH8UgQGgRPjO+xdgAE1K7d6
 yOa9WVMAJDas9Ga7ICzLM08nvxSnGXcDQdS3gf6IDiMwMwE7pGBJvY5x0FZsOf8nTEpM
 bd/P5trnbwmUYD1dqAwfivDUBvoSJ6FCIOrNSblh0OaqAi1lCXRoyQgs/Nb1PO7FpidJ
 JVF48uYyoZcXS2seD60QcuAdU6iSCLPbgA6VrFrVxXbUPGfGOJN6I2gMvTzaG68sbIvP
 QNk5e8emy6rAGsE53jSPobsTAqgjspjBIDvZbUHLTFN8+zIwdMScSzJ2DqeRpP+JOQsS
 Et2A==
X-Gm-Message-State: AOAM531FH631PeFF+Pi5zcjFWjk2pbhgSXTiVQ5ZcJIvk63tlWdfgYUN
 s1I617tdyAOAa2JyYoUIJI7aTBpTHUgJAbe3e4ccPzV9177dRxn66TBgOzHdVRyggKfSqOIwAXr
 JVieBiBDd8zEPIR6l8zrxKIXY9WcFRkubcV4JjqefjWxBty96qUgdQbAR9sMiDzy5
X-Received: by 2002:a17:906:3401:: with SMTP id
 c1mr3067689ejb.156.1611322228075; 
 Fri, 22 Jan 2021 05:30:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDKkqjq0cxNEgFzumErQwUHNNbfoMfN/tF8SdsThiumUxWd15W8HQSTlEswAsIubpLRCMsCg==
X-Received: by 2002:a17:906:3401:: with SMTP id
 c1mr3067667ejb.156.1611322227806; 
 Fri, 22 Jan 2021 05:30:27 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm5431195eds.48.2021.01.22.05.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 05:30:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] configure: Reword --enable-tcg-interpreter as
 --disable-native-tcg
Date: Fri, 22 Jan 2021 14:30:04 +0100
Message-Id: <20210122133004.1913923-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122133004.1913923-1-philmd@redhat.com>
References: <20210122133004.1913923-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users might want to enable all features, without realizing some
features have negative effect. Rename '--enable-tcg-interpreter'
as '--disable-native-tcg' to avoid user selecting this feature
without understanding it. '--enable-tcg-interpreter' is kept in
for backward compability with scripts.

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 48bd6f48d7a..5e5ff779a69 100755
--- a/configure
+++ b/configure
@@ -1121,7 +1121,8 @@ for opt do
   ;;
   --disable-tcg-interpreter) tcg_interpreter="no"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="yes"
+  --enable-tcg-interpreter) # backward compatibility
+  --disable-native-tcg) tcg_interpreter="yes"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -1753,7 +1754,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
+  --disable-native-tcg     enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
-- 
2.26.2


