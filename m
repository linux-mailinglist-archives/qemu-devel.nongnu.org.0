Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B166468C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:51:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6f-0003bO-GN; Tue, 10 Jan 2023 11:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6S-0003Tx-6j
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6O-00057n-Sg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9GluDZMGEQc7BsTewqVDUoFAHAmOZfv8WtZCminAlg=;
 b=SLKKvLCuG+y3M7epZpqNF4XJIDK/eNVy6+EXi9sHb/tQeWGGq1VAQUvXVuBPjvgirdUVEs
 XWi+J3FTmWFNXHn+hL5ymN6/D8iTKDPWG2xBDqDSmYA3uUba9uTAkx2/G7y7Sdui2rxhe+
 g3HdDjKNdw7YLp4OxdHG5D3e37YvwO0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-VAU2YSTROhadifuKbgwhqA-1; Tue, 10 Jan 2023 11:03:50 -0500
X-MC-Unique: VAU2YSTROhadifuKbgwhqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so9219368wmq.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9GluDZMGEQc7BsTewqVDUoFAHAmOZfv8WtZCminAlg=;
 b=x9nGq81dpbL5L/mkZK/OrxKYh1eIqjZi2jqE80pH9eegJRSA1Czc4xAr0EUfZUz3xX
 RR7hvTuGRJp5C2pJ01sYGktj69qlbinI1Z2R1U8vjWTOCkbE74OcL0c/rNNdj/k+5J1n
 L0VZyE8PtuEtfmbGlWdMcwyKEiGdf2vS+TIsrMp8R02NCkuDlSpT93mfp3ano5gidY89
 PW41ITgsvOwMXksOzPpFZZ+yx+wSyJO1aywi+BXJWIaufWsSlcuQPdUzzWBymWEi5yPs
 bGOkcgtZYPDYXOT5UvAErwNNBSeeVo5iIH6SS9giwPN8ozJDYl+81VhoX/cV3X8anY0l
 810A==
X-Gm-Message-State: AFqh2kqE7PGxNVsJzFxxc4cCXdLh76oFLEl8Lgm5uEFJOvQhB9egjzaZ
 yKPVESefr0XNVeaVs/Vpv50boW+T1Q4lhaJR+WcYGACl+ZCkTFc+wYocS372NaZlR0ZWaWW0TwZ
 TF6aseagT/xG/cTqCJP9c+LoYjbHBOCFyAdJodIvXzKgtpXpQvQf97/Bxf6rDBWiJ7JI=
X-Received: by 2002:adf:f851:0:b0:2bc:7e19:fe84 with SMTP id
 d17-20020adff851000000b002bc7e19fe84mr3906921wrq.62.1673366629284; 
 Tue, 10 Jan 2023 08:03:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCbbF6VUWnUl7ydouuYwoI2K/7IxMN3dxrFQMKlITcyAZVQQDsaLpkJQosP2uNmWzZgmiPSQ==
X-Received: by 2002:adf:f851:0:b0:2bc:7e19:fe84 with SMTP id
 d17-20020adff851000000b002bc7e19fe84mr3906900wrq.62.1673366628967; 
 Tue, 10 Jan 2023 08:03:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm1230647wrm.78.2023.01.10.08.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 27/29] libvduse: Add extra compiler warnings
Date: Tue, 10 Jan 2023 17:02:31 +0100
Message-Id: <20230110160233.339771-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

In case libvhost-user is used externally, that projects compiler
warnings might be more strict. Enforce an extra set of compiler warnings
to catch issues early on.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <08daa1896ad8824e17d57d6a970bc0b4bee73ece.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvduse/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/meson.build
index ba08f5ee1a03..3e3b53da33ae 100644
--- a/subprojects/libvduse/meson.build
+++ b/subprojects/libvduse/meson.build
@@ -1,6 +1,12 @@
 project('libvduse', 'c',
         license: 'GPL-2.0-or-later',
-        default_options: ['c_std=gnu99'])
+        default_options: ['warning_level=1', 'c_std=gnu99'])
+
+cc = meson.get_compiler('c')
+add_project_arguments(cc.get_supported_arguments('-Wsign-compare',
+                                                 '-Wdeclaration-after-statement',
+                                                 '-Wstrict-aliasing'),
+                      native: false, language: 'c')
 
 libvduse = static_library('vduse',
                           files('libvduse.c'),
-- 
2.38.1


