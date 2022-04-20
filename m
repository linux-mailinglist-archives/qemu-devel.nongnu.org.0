Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF40508C5A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:44:55 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCVi-0001NG-8g
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLV-0001BV-7B
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLS-0000tf-Qn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b19so2754722wrh.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naEAB3p73JH+poeN9mZadWNCsi8lUD4sUKcP4Qz3f10=;
 b=k+Ol71GM7DfxpGhN8k92+QtrTOwtv6jcI99mBHT5RGqbud+fbYwtn8nVtYg8YWglSG
 YwN8Kli88pEHonSLUxosqqv+VGeoK8gtsQ/QWd5wJ9SxmVHP7hhNSSRk3gM+XbDwogFl
 +y7VJo1OcP38NCTKZ1zPpibg/Bl94FEc4mSdXZyZu+TliTRcrKEiK7VtU4n2LDyjvGyL
 LN04pm9TYMqrOTjeU9dZdE2IcXLHNEXPB8i1DK+FaHvKmtltqyttrJsECOG3zRnBFPXV
 qnqdq5Bj+froEeQLZtOcUtRsr3dCsV22BLsWZ6xVHD/hGIPtqZBVYAYEtF/sVx47RbWH
 kiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=naEAB3p73JH+poeN9mZadWNCsi8lUD4sUKcP4Qz3f10=;
 b=JMq10W3ehS+2FABsmnUaQUQ8TcLjnzABZklRThc9jhVjCVFNBB8iMzWLevpSEe0ArC
 AzoDnVOsQ28BOGPf8NhyVHMyE2P7gOBJXsFzjL3Ad7eLBQM2gdRB1w0Zz2vsLA5rOvz6
 iyNlQMm4jtEsCht/ebTDIWTdEJFpNSFyUkI77ZDK5LnzPzirWJaPhFuGSTpo1wOmu06H
 S9MhngFfkCytqBeRf+wQjTSZ9YpGCAgA7lEm6uw4vurMInej+msd43fH9LDeTendR4yf
 Fmq7zt3kuoFZiXzDfYSeGdVc5iXMc5uUbGSBRvkvRQt9XBk8V8xtXjFAvNrMkHR9pf6/
 SwDg==
X-Gm-Message-State: AOAM530/NSBoA6tlgfRXwZiMOOjH5rW5D9K/xNshVMOhts1ZjIwJbdw9
 1YYCO+smmgZ5rkilw8/vnsVZDRRVEC8dVw==
X-Google-Smtp-Source: ABdhPJwzFkX46gRRkyLIkWgyRorDXiNFoC8TBRd9tSgcPwFkQALQWVSB3ojwYmKqzJMHJKWGXlGi/Q==
X-Received: by 2002:a05:6000:18ae:b0:20a:a549:d38a with SMTP id
 b14-20020a05600018ae00b0020aa549d38amr7480322wri.247.1650468857153; 
 Wed, 20 Apr 2022 08:34:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/34] configure: pc-bios/qemu-icon.bmp does not exist
Date: Wed, 20 Apr 2022 17:33:37 +0200
Message-Id: <20220420153407.73926-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The file has been removed in commit a8260d3876 ("ui: install logo icons to
$prefix/share/icons", 2019-01-21), do not try to symlink it in the build tree.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 2bc5a0b84f..7a89cb4123 100755
--- a/configure
+++ b/configure
@@ -3020,7 +3020,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
-- 
2.35.1



