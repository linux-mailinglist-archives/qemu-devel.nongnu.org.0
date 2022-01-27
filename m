Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A349E0C1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:26:39 +0100 (CET)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2vG-00080R-1D
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fy-0006mj-K7
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: from [2a00:1450:4864:20::430] (port=39624
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-000696-Sz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id s9so4072391wrb.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPO4TufcfjhpALVJpQIo88mGXcGGnW5eY9HmLHccuZQ=;
 b=SFTy3V/C77+C6LgfFDMjbMeGMsU2IGCkl3KDQsZpUZMYhLop0zy71sOrm/SW5fyQQU
 VdHYRmFEkB/L3jW49INxey7q2+q2+HGKdjm4KWDX9b0KUWQGkFvz80xFxdVBkUsuVn/v
 kleWwRca2MphUFB3G/XZccfz3/SiUg3Nhn6SWbfahvWjuYq42S5IRQY87Iufe/XQc4Vt
 KTC3erwQGnBZw/PDmLUsicYMiR8Yyb24a/WsQK7qn9B6sR8xRhxNGUTN6qQEsXgKsHhR
 T+zjZFEGVU3OQp3JqYtUa2vPjiRMWrv0grukpMBcBQpg92quT3Dh47//pAJy6bUfdM54
 QgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hPO4TufcfjhpALVJpQIo88mGXcGGnW5eY9HmLHccuZQ=;
 b=myq0+Gr0F8L2t0TffJP7BmR+5+RAvsVRzc2p65P21IOmR5CZkNj6WuQ/U5lc5hkuZO
 9uwrb6TutbSw1eRbVFTq/QhF9Xugpq0GAy06eMbedAZZaprAIIiv6C8pmHP68FY4JhdQ
 6EkU+6QzAi0fuJEw0Ej1IKH9gJIVcSAoR/l0jbgy/gWgwhsC59p6FbdANXwyVsTOv4zw
 CtfNyGl0ogR+1fQSgXm65Ow5WcdMKI2SqklR7mdQo1zRqq5dKX28v2VitZWUTEwzHD8S
 1zcYTdysLrVKMH41lLThJgD3mfY6Ys3jKOyl4dEVi8gF1Rgdoxmm6OqCQ9wLZ3vDfj52
 VmCg==
X-Gm-Message-State: AOAM531WmcQzh77+qCRDElNsW1cYvECEmgMdET0pOQazc1NCcuMq9oHg
 X/LtwzwvyiPKskEcNCaF+fgQoJy2c7Y=
X-Google-Smtp-Source: ABdhPJwGbHX5QHCLFuX05zpn9gn1y9sCOauf+1WsEU6gI964CJ3sSmEC+KhBjFA7QLHqJkvKM8fyTA==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr2583084wrq.425.1643281845644; 
 Thu, 27 Jan 2022 03:10:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] check-block.sh: passthrough -jN flag of make to -j N
 flag of check
Date: Thu, 27 Jan 2022 12:10:31 +0100
Message-Id: <20220127111037.457901-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This improves performance of running iotests during "make -jN check".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211223183933.1497037-1-vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f86cb863de..d98d49ad63 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -74,10 +74,17 @@ cd tests/qemu-iotests
 # QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
 export QEMU_CHECK_BLOCK_AUTO=1
 export PYTHONUTF8=1
+# If make was called with -jN we want to call ./check with -j N. Extract the
+# flag from MAKEFLAGS, so that if it absent (or MAKEFLAGS is not defined), JOBS
+# would be an empty line otherwise JOBS is prepared string of flag with value:
+# "-j N"
+# Note, that the following works even if make was called with "-j N" or even
+# "--jobs N", as all these variants becomes simply "-jN" in MAKEFLAGS variable.
+JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check $JOBS -makecheck -$fmt $group || ret=1
 done
 
 exit $ret
-- 
2.34.1



