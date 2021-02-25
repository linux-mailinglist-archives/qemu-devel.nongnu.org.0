Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C6324F0B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:21:38 +0100 (CET)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEi9-0004Vs-Mj
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFEYk-0000Bs-6V
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:11:54 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFEYi-0004mB-Kn
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:11:53 -0500
Received: by mail-ed1-x535.google.com with SMTP id l12so6326413edt.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVHqnCaAecDzxeSTNOFGz/qg1R5Frghm+xlQG9GYHlo=;
 b=kvWUvvNVlNZ4o3mv6oisBOMi8fyfLPIX+7Wz/XbzUVRlOgfIsKOVUxfP1umk/Qbe4V
 Hjg4O/O/L2vaDbO6Ly58svboObPMY6sQh32Ub6Ou6ct3ANmOJVpm+fW/8Q0a7njQ8xKm
 /S5R3PBugRdqRu/pku8YlHhkx6Krg+Vyh4fjDncDZivLAyCCw6rSm/Ixx1QEVHtOKBPx
 iau0NrCF3T1rsSWjR0hlOM6Vre6OErZTqY8tlvAfFDUxeDQHxepaV2D5mUBfrkh5POr7
 Lk5lT8ZwZl69ZrVwjTypwvDVG0MEnhnkAYip4heGWsKi3L5WS8mCOijsEYuRtCnVTDX+
 axDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OVHqnCaAecDzxeSTNOFGz/qg1R5Frghm+xlQG9GYHlo=;
 b=pMN8a2iSHd0+qCqeDeoeg19qXGH2PexUjTlGgzE8UrRT2g2WNIJs59Rh/XJ2qL7GGk
 yV8dcF71SkPbtRq67CVO6et4XRuUd+VBzm87XVIeHUTJH86hcbCAx0IDD83pdaNlMvYI
 e2qPmfCJ4lgPlycBjMb4i2yHHAEV5845hWHocL2iTCpyoi5qeQ+Yh/Fk6BKX+zxquhFV
 es9tj28aHIvOSUFilfWNhy8hw9h7SrCHo+UjeblFLekcFLwFVxMXuZQhNnygREt/Vpxn
 9ERlof9T6U6AQlhNwCH3UkDLYBCJNTo0XEV9c+w/b5JSAub3BYJOfCHRhtPFjmplLnvI
 azVg==
X-Gm-Message-State: AOAM533YBmc7kpbxL0RAUT+cSrJWZTgjrCRF8WXBC+xsidrvGYbElGjM
 ZxgxqxeXw2LYRjB78S+pvTEfu9qlQK4=
X-Google-Smtp-Source: ABdhPJzA65P+BA+3w1HX7E75S2asq1V4ChWP7S0+NSCGpeMfT9Ajpk19TAazMSV/cbH+itcjbSpm/g==
X-Received: by 2002:aa7:da19:: with SMTP id r25mr2352539eds.367.1614251509919; 
 Thu, 25 Feb 2021 03:11:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w18sm225999ejn.23.2021.02.25.03.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 03:11:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: deprecate -writeconfig
Date: Thu, 25 Feb 2021 12:11:48 +0100
Message-Id: <20210225111148.618704-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functionality of -writeconfig is limited and the code
does not even try to detect cases where it prints incorrect
syntax (for example if values have a quote in them, since
qemu_config_parse does not support any kind of escaping)
so remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 7 +++++++
 softmmu/vl.c               | 1 +
 2 files changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 2fcac7861e..9aede21f11 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,13 @@ library enabled as a cryptography provider.
 Neither the ``nettle`` library, or the built-in cryptography provider are
 supported on FIPS enabled hosts.
 
+``-writeconfig`` (since 6.0)
+'''''''''''''''''''''''''''''
+
+The ``-writeconfig`` option is not able to serialize the entire contents
+of the QEMU command line.  It is thus considered a failed experiment
+and deprecated.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..3e4dce2874 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
+                    warn_report("The -writeconfig option is deprecated");
                     if (strcmp(optarg, "-") == 0) {
                         fp = stdout;
                     } else {
-- 
2.29.2


