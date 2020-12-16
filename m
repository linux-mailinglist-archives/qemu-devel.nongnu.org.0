Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63D2DC2BF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:09:28 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYQh-0004Fv-6j
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJk-0004Of-Mz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:16 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJj-0007Ue-1V
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:16 -0500
Received: by mail-ed1-x52c.google.com with SMTP id p22so25091661edu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMAHW/lOSnDs+tvYYnVBZJWjJu+36lZF4Eh2q1Iet6M=;
 b=Mog/mIHNOpbWPB0rAcwbjXeBcZFINaeLUJmoGl4tS/JpqbbZzfSouMAjuIALAM2l8e
 NtF0NLQMUB1YdVIa/HtxENlnD5noG0I3OVBVACJn16FsU0azWhpZPqLbAhWCyLfSNd7H
 YYxNqIzcgcx3E5gaG90Eppu5ClRiDV8CcfAJDWkr6mZ3we+ZtR62cUAeApxy8EVpVOib
 fgGhvRclenQEgTYx/RDZo4nzdesYZ/zf7auq9VH6ougWvuXKU1pUFFpUllwtg+R9RziN
 tLo26+MaYvkv9eT2z10DfavP9tpBkAeSKmPBkxDPr8v5iFSVZer4Qs2v6AuqsT0Lke3Q
 3plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pMAHW/lOSnDs+tvYYnVBZJWjJu+36lZF4Eh2q1Iet6M=;
 b=t4DtV5Zv369iBxEuRPa1U2fn78ymhjy4B/ZOXAw/yjQM3E06sxFdTVu6S1UaL3v0IW
 xDMrLQyxqQ1jtdLufI2ILCegQqNBQnewGRH6QVzYkhAakWgMI8JbwnV0fjZx/TAXqLSm
 3XBvOxxqXkW4j3YrCwjsMfcgbrOWYwjadTtSCGt4jSegMQ65wISgG6u0upkZuIwi14PX
 zCN2663LBUGh4/hEWkKRPf6ImRabNhoppcqlNzE77vrJFblPomuPEYJZ+RA6zhXiPjTm
 2aYYzd+Rs0NiUL3kdK5LwujveIrD0IbPYrORWvwYrO8vSL9R/BDBYfF/DDsSIx/uJ7ph
 5Mgg==
X-Gm-Message-State: AOAM533zHZqidik4pv5w4AGIkOSsNEQ3oRFjvmmTocmi1OQ9UWq3/emc
 Bd2oprfNzJ4PeFiCmPyfvYpqaAbE9uY=
X-Google-Smtp-Source: ABdhPJwVoOBSeiig5gi5rBA/mtmRF/lpW6FugBaZGaaMSVvSA23ex/FE4vobefydKQuGs5YZWseb6Q==
X-Received: by 2002:a05:6402:388:: with SMTP id
 o8mr33867801edv.359.1608130933716; 
 Wed, 16 Dec 2020 07:02:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] meson: use pkg-config method for libudev
Date: Wed, 16 Dec 2020 16:02:05 +0100
Message-Id: <20201216150207.431437-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216150207.431437-1-pbonzini@redhat.com>
References: <20201216150207.431437-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not bother asking CMake, this is a pkg-config dependency.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index ab622ae8bd..0b36fb38f1 100644
--- a/meson.build
+++ b/meson.build
@@ -399,6 +399,7 @@ endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
+                       method: 'pkg-config',
                        required: get_option('libudev'),
                        static: enable_static)
 endif
-- 
2.29.2



