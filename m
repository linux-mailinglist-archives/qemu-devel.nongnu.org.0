Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE74464F9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:30:44 +0100 (CET)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0Eq-0003NZ-0I
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj0BP-0000wS-Qm
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj0BM-0008PQ-Uj
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636122421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kRqyJC/JV+6B11q5unZLQCsXiO1VFs66KXHe5SIeVtg=;
 b=BOp0aOa54O62knhxozauVF5VOgjhgOEFEX1lcq5uq7KYS4ASB1B2Eg/Ij1trQKWr0RaWEh
 wEhOtnnrt0mlnSLukNYrW+49p6AgjfgRvqW526zhwG87VmZOPiTo1289+5DusIR2MdYM8a
 /Qynyk3zswhYXJkP6xLQcvjPtd3/NWc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-jxLvldamNk-XWH_mf4aquw-1; Fri, 05 Nov 2021 10:27:01 -0400
X-MC-Unique: jxLvldamNk-XWH_mf4aquw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2393290wrd.1
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kRqyJC/JV+6B11q5unZLQCsXiO1VFs66KXHe5SIeVtg=;
 b=NKMgR9H6gJKnvgv1W4r2c3sYMYiF6kgRwTkxoBpDwnh5TZtKlb9SDwGNbCi5UVg3Oz
 nrQ2xFGOXIyzSjESgRZRz+QIM5smlEDxKk9BMDfsa+SXrR5Fi6PYk+cSxcsfCG8bI91M
 FyquFZmjfI1nLAm1r/+8xlqEYtbBP80U8hW/hkN9p1julz7pJCfg7NMZ1fNPcCOSI7Od
 LhFXkQAZH8y33XzUYTCn1H0yUMjJpP+crUFybcoaXLUxCWOzWpjYTEyPDAK08qib2b5K
 6KWWKERreMAbEr1Zwlr8SL+vRqZ45nQhHmMWdAQm1B/NeRPz2rmF4rmDmFzxv0a1XjHa
 hXDw==
X-Gm-Message-State: AOAM533cVohsoSBbpt4I2N0kO5MlUvFnadU451ASmPQVr0kYCua6Jot1
 GTKSS+kUAAbk4Yhk6PukRPmK58u1C+TD6aeN16twoIBEbTFv7uHveIpB0ibqytf5ltJIHVjTGMa
 uhZaRSqRozB+Pq9hCLKZdY3iMi3XGX+0fKyfFThqJ3x8sbpinr0hg0g6Uzd+FhD6d
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr1905591wrx.342.1636122419362; 
 Fri, 05 Nov 2021 07:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNKA0brfXbUbNdgtoxtTB8FpI8d0pMyjoPIuMqeTYMNNXVtQNlLU1FWwa7fhX0/dDU/+rBjQ==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr1905547wrx.342.1636122419073; 
 Fri, 05 Nov 2021 07:26:59 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j10sm8064281wru.15.2021.11.05.07.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:26:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/about/deprecated: Remove empty 'related binaries' section
Date: Fri,  5 Nov 2021 15:26:56 +0100
Message-Id: <20211105142656.145791-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Eric Blake <eblake@redhat.com>,
 qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
removed the content of the "Related binaries" section but forgot
to remove the section title. Since it is now empty, remove it too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/about/deprecated.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 56f9ad15ab5..5e514fb443d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -370,9 +370,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
-Related binaries
-----------------
-
 Backwards compatibility
 -----------------------
 
-- 
2.31.1


