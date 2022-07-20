Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A294A57B9AE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:32:18 +0200 (CEST)
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBgP-0001i9-Qm
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBax-0002Op-Bx
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEBav-0005C4-MF
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:26:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id e15so21376370wro.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RnUi10H2zETr3PzFE8ItmqNkeEXhjlZHbA93aIrcRAo=;
 b=buCbvTCAAaAlaZ9ed247zTejvVgpevlNDasn+Hl3z+XqLYQ2abTu7Yq76RdPACiuW3
 Ctoq4fgDZ51uJIXRaT2uXqr3jMdAPzDNKh1uTldCEY41ptgJKw0g2PPgMQRcSXEb/3WG
 9nqStl/pJxa9LpGkzAbecS9vZGBCBnIuVylGxZxKwy6p/h2Nmd1x/Ky4klBZOq0YI8Bt
 LA/j2osVOrN8MaeQ6Q3vE09iRjV81NJab1Hdf9Yi0ifVFpdJhojuDuZFApPg2rpg8Ob8
 /VX39HfzVZxfVv+LBALD1wDS25oYs77bQ7lbvfFiIwv1bWLryyyBL5WHx76JmDsgyoZV
 C/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RnUi10H2zETr3PzFE8ItmqNkeEXhjlZHbA93aIrcRAo=;
 b=2WaG3vybOafsETxLkMD6XL4+mNnUREAeB1VZqBcCMPVx1mm1WBQdZwrYbk7hW1xjzP
 DLwoBA52jY0cioMLdJwJ+WhenWcvBoEJ1R7BvHGk8EZfqlCbgoX8ZJdBB+w/7RJegF7O
 Wu1k2HIdnN79QCHiqXnsoYwjAYwGAOO8d6ZryORWCJ0ddsnYncnSgMTO50hamNN8nG+G
 gWah1jDUhQHwEouur9DC/Xe5nEsjWVm3ZGMq1EWxh5FsjYYlCi/ltAGLG7oZJLRtJueZ
 cQeWrCl1+cPtmgvGisFqMjcSGCWzSXbLepyc/Sf8auaxjWPaeBowc6/ymcUy32or6xAo
 o3IQ==
X-Gm-Message-State: AJIora9JOiFgHcHdKJhTlmsC+IDtH2dZEzHp7y29yaq2pe9BE4Rv9Oxb
 41EhM4F7IRDM/86Jw6llx4AYaDrcATyuHw==
X-Google-Smtp-Source: AGRyM1saIgNssSJbPWgbV5/FAzhRl+B1D5h9qKTL3M8d8GpzxyB2LXSqjHiEyWyqZacOwgW3QoW9nA==
X-Received: by 2002:a05:6000:2ab:b0:21e:2e68:52f4 with SMTP id
 l11-20020a05600002ab00b0021e2e6852f4mr7262267wry.236.1658330796445; 
 Wed, 20 Jul 2022 08:26:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b0021d68a504cbsm16395987wrx.94.2022.07.20.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:26:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/5] configure: Don't use bash-specific string-replacement
 syntax
Date: Wed, 20 Jul 2022 16:26:29 +0100
Message-Id: <20220720152631.450903-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

The variable string-replacement syntax ${var/old/new} is a bashism
(though it is also supported by some other shells), and for instance
does not work with the NetBSD /bin/sh, which complains:
 ../src/configure: 687: Syntax error: Bad substitution

Replace it with a more portable sed-based approach, similar to
what we already do in quote_sh().

Note that shellcheck also diagnoses this:

In ./configure line 687:
    e=${e/'\'/'\\'}
      ^-----------^ SC2039: In POSIX sh, string replacement is undefined.
           ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.
                ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.


In ./configure line 688:
    e=${e/\"/'\"'}
      ^----------^ SC2039: In POSIX sh, string replacement is undefined.

Fixes: 8154f5e64b0cf ("meson: Prefix each element of firmware path")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index a56c3d921be..c05205b6085 100755
--- a/configure
+++ b/configure
@@ -684,9 +684,10 @@ meson_option_build_array() {
     IFS=:
   fi
   for e in $1; do
-    e=${e/'\'/'\\'}
-    e=${e/\"/'\"'}
-    printf '"""%s""",' "$e"
+    printf '"""'
+    # backslash escape any '\' and '"' characters
+    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
+    printf '""",'
   done)
   printf ']\n'
 }
-- 
2.25.1


