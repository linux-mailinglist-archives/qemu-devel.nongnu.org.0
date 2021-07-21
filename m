Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E43D14A4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:53:29 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FTM-00055t-6a
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6FS7-0003im-KT
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:52:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6FS6-0003wR-6c
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:52:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c12so2918826wrt.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHvL5JGryJpJ8ZjeOvErkp5SAEDZS/O5P4ngO5cbS6Y=;
 b=P9K1eS7tCA00l5sm+pLGqpHYAy+e7GNRsYyuci3SMIwFdK9cxqARPFIjU1hlOkYPFB
 EeqfJ8xm2lQdGjYUmc5a6mfmeZT03eRmMLwCazqFhvrnURNKQxb2jg1BYOJ5phtnaqUS
 rr12MHSqewT3MExGUBkuze6xrB6IAj+6mmVdQNWvbDEjaE5ZT0r0Z/wEWaKMPOjc+tLD
 dYXWdUZkly3BBMRkxuw5RSDLOueaeiNFx1FZWOj6kqYvQE1k55iqGWVmInnFwW/OVOrw
 6389fZc6eNjcaUZwsEIKyz9AKONAQsreMCCNDqAIDjkkWP93r8TOagp9hdIod0g+22QZ
 TqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oHvL5JGryJpJ8ZjeOvErkp5SAEDZS/O5P4ngO5cbS6Y=;
 b=ILDXvfvI52V2Elmyf52L1u3zaimXbnFGzmTwSP5WpGHO5b+Zqdf16WdRGa9cEURUem
 y9TRXsjxDTomXm9Kmwy8Zr2QDIA38rx6eS/Tm2Z+32XsOe7MFs8pjiehI9fBeN88wZT/
 c/47RjvPHQyYCJKsKIFDWvQrfayQdevDpuutTfWpt9vnn3E/w1A7C4cf2LGdJBNNsgi/
 NU6G/M8I7KnILHbSJi3eF5fW6GU2mLJ+Dx4lwQWTqzhpY32436nHiI96P+e9rmomEwuu
 jR/S4lEoCiFf7uFTxPWl3rLw2qsyG4y4+LxxUyKs5N3dN5ugbRaRRYQw8J7Ee1IRp2e0
 MvVQ==
X-Gm-Message-State: AOAM5300PRtMOmPxIFGAZi+dS7BhG70wAqEK/DP4t54+NoU4Mm/EsDEI
 +4sZGOLtXYxgPviFCvfUaPhcxwt1X/l7Ng==
X-Google-Smtp-Source: ABdhPJykZ3ah/IoJpPX5w2LUSGkZm94TkfRzOyYb7P/6+FQSUGCUhKnssg/YIAPv95fVEYCFfzg9HA==
X-Received: by 2002:adf:d204:: with SMTP id j4mr43539668wrh.414.1626886328465; 
 Wed, 21 Jul 2021 09:52:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y12sm10622673wmc.12.2021.07.21.09.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:52:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix dependencies for modinfo
Date: Wed, 21 Jul 2021 18:52:06 +0200
Message-Id: <20210721165206.652325-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

modinfo runs the preprocessor and therefore needs all generated input files
to be there.  Add a "depends" clause.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 8817706d08..18e6cb0a8c 100644
--- a/meson.build
+++ b/meson.build
@@ -2512,6 +2512,7 @@ foreach d, list : modules
                                        output: d + '-' + m + '.modinfo',
                                        input: module_ss.sources(),
                                        capture: true,
+                                       depends: genh,
                                        command: [modinfo_collect, '@INPUT@'])
       endif
     else
-- 
2.31.1


