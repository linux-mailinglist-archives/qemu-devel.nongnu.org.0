Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E92B6AC3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:56:44 +0100 (CET)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Hb-0007An-P6
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4ES-00029P-Nw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:28 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EQ-00075N-Nl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:28 -0500
Received: by mail-ej1-x644.google.com with SMTP id f20so30406138ejz.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=diMMQnnjwdchxcFLq3HawYvuPKfV5ciSzV6TIRp0xJo=;
 b=N75MFvRJ/308yQq7qQBwaJ+NK2I5Y8qyE22wHOOy+/wdBiJjfKwNuZ3xi+xAEl9CdO
 ZE0zF0CKL/Lw8MEJsIn5xeYQ2YIdsUmp1i0SyEWdeOcXJSh78EGQpbezy4piQ3uHvDas
 AJCFSqEjCRm1Vft8DrqsY4J5iZpBrOb+zEHiXSd8hSIkc5eAz3IYeMcbWR6RLH1UIsOK
 1wgjsw469Ef0SUfk2TxqhCMBDZC6uxmjwd5NtV5w3s+gf11hAGgQzPwdQlOiZFS04OLs
 L3ipHpGNpfHVL8xcETcIXZquXQ58Cu/BpfwpCA1x3moqQWZWn0L2c88ntr5uA90KXL19
 esqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=diMMQnnjwdchxcFLq3HawYvuPKfV5ciSzV6TIRp0xJo=;
 b=O8Io66SAXKYjh5gkBx4qkmPKenRiVgtiw/BFwimEoKJLilinjXBrWgkWUXrA9W8xJ2
 sqrPgHX9wRXEZ4HrCT/T2dbBjBDTs7XS+S4y3BCMePHuyE3cNtQp4kWypFzRgAlhqDZ/
 sdrx/mogj77LIxZ0MyxgyxstgvqMnAfrt+exCxJKR7GXcnSDr11I3aK3tKP+2AOhnwFo
 hfRZt+Z+vO6SIk5LZwHX9kdiq/qf7JGpK5W1OfBN+mSnPEfds1nqeL65FQUfJ1UAs1J1
 vqeCUXR8Ord/QOZq7EUo72z8U6ZWKiO4O2QERlh6NloJ5XIB+FZvAxejX8CWcd8jFusa
 Yqqw==
X-Gm-Message-State: AOAM531BwY9sz0b61eEx18SWelXGf1j8NyJypBPt16M7lBcY1hyOvsJk
 BgQ8w6uGfem5UG1Tk3d8/WGPn/C/RXw=
X-Google-Smtp-Source: ABdhPJwcVocxHEu5CaDlDtY1vjF6/GarnTZrbB2ov85TsdydrYI2s2nQnB/HjT5hFoHsan28NiFNGw==
X-Received: by 2002:a17:906:e2c3:: with SMTP id
 gr3mr19651113ejb.471.1605632005052; 
 Tue, 17 Nov 2020 08:53:25 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/29] scripts/kernel-doc: handle function pointer prototypes
Date: Tue, 17 Nov 2020 17:52:52 +0100
Message-Id: <20201117165312.118257-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some function pointer prototypes inside the net
includes, like this one:

	int (*pcs_config)(struct phylink_config *config, unsigned int mode,
			  phy_interface_t interface, const unsigned long *advertising);

There's nothing wrong using it with kernel-doc, but we need to
add a rule for it to parse such kind of prototype.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/fec520dd731a273013ae06b7653a19c7d15b9562.1592895969.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8fff6a525..1cdece23fb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1801,6 +1801,11 @@ sub process_proto_function($$) {
 	$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
 	$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
 	$prototype =~ s@^\s+@@gos; # strip leading spaces
+
+	 # Handle prototypes for function pointers like:
+	 # int (*pcs_config)(struct foo)
+	$prototype =~ s@^(\S+\s+)\(\s*\*(\S+)\)@$1$2@gos;
+
 	if ($prototype =~ /SYSCALL_DEFINE/) {
 		syscall_munge();
 	}
-- 
2.28.0



