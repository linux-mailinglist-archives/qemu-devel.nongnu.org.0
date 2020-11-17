Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE62B6B6C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:13:07 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4XS-0006qE-LP
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Et-00033c-5A
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:55 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Er-0007GY-HX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:54 -0500
Received: by mail-ej1-x643.google.com with SMTP id a16so2630502ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtelKqLZh4dFsPBgnxF0HdQsyjUnFNYeWjU1dgG+VRk=;
 b=otzhKc24ftE4TuOMMiA57FfCRGYzgu8zcYUhndgfy7eHtHZf8al1kgYWePpEGNTLbo
 wT6RTQf+ZLSNW+0L4Tctvxe1AS8ykCwd0USBIPPR+k60FprD9tJ9Ef4T5SkpGmnIW6mK
 /WHvNil5AH9dIFTicW+ITUhPZIdf7ryBsSO39SNaVoxorYGoaFbvTXT10Sl2pemj7Q7s
 uSk5aP2Dys8W/n1ZHwUyOeY6LtN+L7jHguacKF+RphgHMJrz8m/FTis4iZOZnH12lkuB
 XWKQlWUju6jdh7NPEmHv2p5yf/C2DI//1PhuFHDTnJ2f9Mw3KsHXLSDygh3dUOPjmDuO
 DpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MtelKqLZh4dFsPBgnxF0HdQsyjUnFNYeWjU1dgG+VRk=;
 b=r+lag4hZlrP96aVy1WtiByNVxxWL4l5/DHTYV5/HzrBbSi92vKQCHJcuPy7L6h8R/e
 BzausuZ7Y78qxifA2bTX9P5e1WuyPTEaRWGaOY5uRAwY0fo5jRGBtwgX8givi+v3GULe
 Wif6oUGfhInPg/DUsAkrZSXmHPwa8nTIeTMqiE5rf0x/xkEJKb6RjNxEoFJahOhy/1U2
 H4HDU78/cKUtWIsdxWWeLbrMupEQA/53uraEqmKo/LDHC/ZYSFWl5Y8OtCof0XdPy5W3
 IdLnn5a/h99dQZ2JINiE864AxEF49pvkb+9ja1PJ0JQxtk/pwgswDJWvHDSJo4pqgvzA
 Pbvw==
X-Gm-Message-State: AOAM530mH0LBiVrAciXDYKuiLyVhHyKLOAZVy9W+I8Vc2i/G4qLiOMSQ
 sypWwAKwWlr8dDdT8QQ1x+p1gBnKgjk=
X-Google-Smtp-Source: ABdhPJy4DAPN2S3C681sIu74xowUUge9GNL8NHPjx7zsSGwC3E+Fap1gntJgONrr6YTX6OkCQsjAXw==
X-Received: by 2002:a17:906:ca93:: with SMTP id
 js19mr21281011ejb.537.1605632031930; 
 Tue, 17 Nov 2020 08:53:51 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/29] Revert "kernel-doc: Handle function typedefs that
 return pointers"
Date: Tue, 17 Nov 2020 17:53:09 +0100
Message-Id: <20201117165312.118257-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

This reverts commit 19ab6044be0c55d529e875e3ee16fdd5c3b54d33.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 780aee4e92..d3a289628c 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1434,8 +1434,8 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+\s*\**)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef\s+(\w+\s*\**)\s*(\w\S+)\s*\s*\((.*)\);/) {
+    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
-- 
2.28.0



