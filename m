Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B64316AE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:00:07 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQNC-0006eH-F8
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLc-00053g-LJ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcQLa-0002OT-5N
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634554705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qmh3hhZAGjAIiECvnjskGm/Ts0gmnqZa3vJcYXBgjMs=;
 b=G4lTYh0rWSY/Hbp582djH0pp5jC0AXTFg95M1gX/5iDIjOAo5p3jXmIKh8VD+VJ981MmK2
 JtXDdLck4w+JgvCU+MLRjmRZkKt2bTzxtiig6n5Ai+u93su8Qs6+eKSV3Igm/JpLLncHCd
 DgPlgoVNGvCB0wbJIuIAbXeDcfFO1nY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-JQeEW33jMqO88Q7vLQWdJg-1; Mon, 18 Oct 2021 06:58:24 -0400
X-MC-Unique: JQeEW33jMqO88Q7vLQWdJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 6-20020a1c1906000000b0030dd4dd6659so3044744wmz.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qmh3hhZAGjAIiECvnjskGm/Ts0gmnqZa3vJcYXBgjMs=;
 b=ctI31RY//jqFlI/5NNIEJwcqAhc+86cLjR29PUTauzIKsJpoBUS+oStvTRHlZMO0Zg
 36Qbj3nGKLy12R+sP/4GWI0pPwbOvPXi9QZemR582I+LpliBIFSlUWB8DcWMsGYxzZ2J
 XkKB5IrGhItDpsqjwtIaWlXkQCAWsMhGkrN7IdxDUczwAGhW4CmX2r3fjGjtDccuLG0O
 ImmwlTz65RGiAdIEdgyLUNSObiZ3DVRgOAFwP/UzrL0RNADtBtTFMulZLeHk50+hCz7G
 z996ZyDyl6EsaUghtoHh8nuKmK2VLyIPswFFwj4p0zWNI64Kd1vIwKUbTO4vUPNSexWV
 pwxw==
X-Gm-Message-State: AOAM533EAQYiC62tPakR6jQv2+fO2UU1JL5qojxhmbmlpaPIdiD7Gdc+
 co5MxH7BuDbNPGqnZCq94YwS0hWpsz3gTWFuEXBPhOg+nxjcwwtUB88RdWW4VnjcRZEwhuhXPw3
 n4r1mBRV91UwuHa4UiOCO/Z3zkQ+gcoEhNNyMuUCEeUY7Tqh2/0sVlmMVnaX4TwuN
X-Received: by 2002:adf:a118:: with SMTP id o24mr34418810wro.15.1634554702660; 
 Mon, 18 Oct 2021 03:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCCNcJDzul/SBGo97OTF88AagEP1UfCKABYHdjHUA0iOTJAR+MG1q5825pJsTW1IsbFzGRDg==
X-Received: by 2002:adf:a118:: with SMTP id o24mr34418777wro.15.1634554702446; 
 Mon, 18 Oct 2021 03:58:22 -0700 (PDT)
Received: from x1w.redhat.com (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id t4sm12189985wro.1.2021.10.18.03.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] roms/edk2: Only init brotli submodule to build
 BaseTools
Date: Mon, 18 Oct 2021 12:58:15 +0200
Message-Id: <20211018105816.2663195-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018105816.2663195-1-philmd@redhat.com>
References: <20211018105816.2663195-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since EDK2 BaseTools only require the brotli submodule,
we don't need to initialize other submodules to build it.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 roms/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index eeb5970348c..b967b53bb76 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -143,7 +143,8 @@ build-efi-roms: build-pxe-roms
 #    efirom
 #
 edk2-basetools:
-	cd edk2/BaseTools && git submodule update --init --force
+	cd edk2/BaseTools && git submodule update --init --force \
+		Source/C/BrotliCompress/brotli
 	$(MAKE) -C edk2/BaseTools \
 		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
 		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
-- 
2.31.1


