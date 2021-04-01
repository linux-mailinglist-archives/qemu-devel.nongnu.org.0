Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0362E35147F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:32:14 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvYb-0002WI-2P
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPG-0000mH-FJ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006fx-S4
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:34 -0400
Received: by mail-ej1-x636.google.com with SMTP id u9so2321003ejj.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQoDQ8iT0Uvjd7qMNAdOTTXuMpF8k0rgM3v4MUOSB5I=;
 b=bWJaiR2z1vcDu3Gwq14Wj9OuhrH83Nki2rH/VvfeluaFHEQfIV0rUAM+/8HuGj8gk3
 WGQnlAyIm8kCdpGgmNWGljIUpXvP0XfecFa7+L20IPupFHwPE8xwpBoNvRoiJlMHBcI9
 3horxNJVdix5+2NV7iobaufTAa4WKULMu5g4bwg+ejeBfH8Nk3j5VkWG6gyD0qYgIUuT
 xsfaB/8HoODaQt595lh9Ttfp1uHQHLEObs5i77rCxwEkUz2/hUx2EROiz934S4FtfngO
 PkXPPCQewteo93f9sij9EaCMM/nBVEKo5npvDoJ0a57DS6aH9QT4Rr+7y94qGAbk7+79
 G6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JQoDQ8iT0Uvjd7qMNAdOTTXuMpF8k0rgM3v4MUOSB5I=;
 b=XotXlSwTMTDnDiovxqz+wgDrwd7lLR3apeL1DuW8leol6rwvUfhuPw9cUVx+ZpcDal
 RNiSmRKXewBNfUJ7TniKwrxvZX5QGDCULQ9RMMazxUhJjU/gfuVAP6bxa9pmXAl9u84g
 dar7Y650Rh9oQO/MQUpY+0knXLU1Jcfx+JA9AjvEIu5I/inpBDyto23RkNeDsXlePEGU
 gbn9YQl0OL2kAoQJkfJc/tpdJ9T1yIWjNWd3thMNhWCdqg9N0vcRSjtUX/94gva8+yRv
 vM77zwI654BdVosloJsvMAhJhgjmsWWehSOt7dO3+uWOLsGeKYg5imfN88Y+kKzHiRrW
 gXjw==
X-Gm-Message-State: AOAM532oxqYnoAVJuUd8LIuHn2NskvcZaNt+/HQK7YZD2kaMHx7WAWT+
 1PdqaNtqJCed/0t0idim7QvEchHlrDw=
X-Google-Smtp-Source: ABdhPJyEQFbZVyBDw2zslTNvwAwZ1Ox1n7FgxCTtYD3qhiZ7umYsZLe9ea1Qvo/OCOMfOF3yWT5Q0g==
X-Received: by 2002:a17:906:f247:: with SMTP id
 gy7mr8759685ejb.183.1617276146962; 
 Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] qapi: qom: do not use target-specific conditionals
Date: Thu,  1 Apr 2021 13:22:14 +0200
Message-Id: <20210401112223.55711-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ObjectType and ObjectOptions are defined in a target-independent file,
therefore they do not have access to target-specific configuration
symbols such as CONFIG_PSERIES or CONFIG_SEV.  For this reason,
pef-guest and sev-guest are currently omitted when compiling the
generated QAPI files.  In addition, this causes ObjectType to have
different definitions depending on the file that is including
qapi-types-qom.h (currently this is not causing any issues, but it
is wrong).

Define the two enum entries and the SevGuestProperties type
unconditionally to avoid the issue.  We do not expect to have
many target-dependent user-creatable classes, so it is not
particularly problematic.

Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 2056edc072..db5ac419b1 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -733,8 +733,7 @@
             '*policy': 'uint32',
             '*handle': 'uint32',
             '*cbitpos': 'uint32',
-            'reduced-phys-bits': 'uint32' },
-  'if': 'defined(CONFIG_SEV)' }
+            'reduced-phys-bits': 'uint32' } }
 
 ##
 # @ObjectType:
@@ -768,14 +767,14 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
-    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
+    'pef-guest',
     'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
     'secret',
     'secret_keyring',
-    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
+    'sev-guest',
     's390-pv-guest',
     'throttle-group',
     'tls-creds-anon',
@@ -831,8 +830,7 @@
       'rng-random':                 'RngRandomProperties',
       'secret':                     'SecretProperties',
       'secret_keyring':             'SecretKeyringProperties',
-      'sev-guest':                  { 'type': 'SevGuestProperties',
-                                      'if': 'defined(CONFIG_SEV)' },
+      'sev-guest':                  'SevGuestProperties',
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
-- 
2.30.1



