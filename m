Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C7324722
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:49:06 +0100 (CET)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2xt-0006ZV-NG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2w3-0004qE-0L
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2w1-00065e-3a
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dtFkRI9hyOOeUpAKA3F6JXd4eQ65AOROSFOc2P9BEU=;
 b=AQPSm/e2eSgQKAWnE7Pu9evWrRmkX9NeOxl0A34APcDQAUFTQfInZ3KU67wpTKTHHjcrUv
 +ayUbi6X/f00OAT8PNFw5EXpRva0dplJCYLAqeiSE0rOi9j3lebRMtkvZz/XStmtPukLTC
 oMgKwCknLWNxmCTQNSr1Aca7RS0zBu0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-4RRG87WoNUCcbZHFklkeBg-1; Wed, 24 Feb 2021 17:47:06 -0500
X-MC-Unique: 4RRG87WoNUCcbZHFklkeBg-1
Received: by mail-wr1-f72.google.com with SMTP id p15so1687313wro.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dtFkRI9hyOOeUpAKA3F6JXd4eQ65AOROSFOc2P9BEU=;
 b=gPxYK9RKwLUtVsb7X6Ob0gO732rKya3YC1gktQlJa2Iuecmko8/Yj9MMTFE80c7ZTc
 j/PTwmTLhlyyYH7vDmaGPioinCFTAYo7JvSu6bZjpn6v9+AZhyj9Ni53QSji+436yYyC
 tb0iobZu1eNJ8sRcdXtwCUQm+h3A8mLstB1vTAMPqwENNlHedb+j2akvyXSbkLFc54+s
 Cg1krA8MAcxJVQ4sxNL/xu6vxm03QjG5sixH++A6xTec+pgbjj1r7ub+m/+FamLK3ZEL
 LKHN1sehp9NufSL9g//023+3ccsLELavCy3FCXdpNDe/c0nk7CT0JdCq8xOL2BxebZgo
 wx+Q==
X-Gm-Message-State: AOAM530Yhie0PM7PjCqySt4pbNmtMba8tkgbfBC+KQQpsQluw615RTiv
 JtSasXKm9mXdM+7Ltr0ec6y5zabcw0C2yB+GMd79+DBlN/fg+6hDUq5TXTD+bYXu0E5RFSSWzgY
 FvBAofEPN3PhnSzdYwuAqg407vLavwPMX2v7dHx752Nt0JcwBs+seGPGX+8R9g6QH
X-Received: by 2002:a7b:c957:: with SMTP id i23mr292081wml.32.1614206825054;
 Wed, 24 Feb 2021 14:47:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPMD1MHIlrRzkJyhWirg05IJfKtPF6HXF3qdSMGXsVJwgpsk2XSnFXE/79lOPLG0z+v29nfQ==
X-Received: by 2002:a7b:c957:: with SMTP id i23mr292059wml.32.1614206824817;
 Wed, 24 Feb 2021 14:47:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 75sm5375107wma.23.2021.02.24.14.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:47:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] qapi/machine-target: Restrict X86 features to X86
 targets
Date: Wed, 24 Feb 2021 23:46:43 +0100
Message-Id: <20210224224643.3369940-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224224643.3369940-1-philmd@redhat.com>
References: <20210224224643.3369940-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

X86CPURegister32 enum and X86CPUFeatureWordInfo structure
are specific to the x86 architecture, restrict them to the
X86 targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine-target.json | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 106fbd2e9ed..a8a5b3f86f6 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -338,7 +338,8 @@
 # Since: 1.5
 ##
 { 'enum': 'X86CPURegister32',
-  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
+  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ],
+  'if': 'defined(TARGET_I386)' }
 
 ##
 # @X86CPUFeatureWordInfo:
@@ -360,7 +361,8 @@
   'data': { 'cpuid-input-eax': 'int',
             '*cpuid-input-ecx': 'int',
             'cpuid-register': 'X86CPURegister32',
-            'features': 'int' } }
+            'features': 'int' },
+  'if': 'defined(TARGET_I386)' }
 
 ##
 # @DummyForceArrays:
@@ -370,4 +372,5 @@
 # Since: 2.5
 ##
 { 'struct': 'DummyForceArrays',
-  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
+  'data': { 'unused': ['X86CPUFeatureWordInfo'] },
+  'if': 'defined(TARGET_I386)' }
-- 
2.26.2


