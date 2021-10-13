Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760342BBCF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:39:59 +0200 (CEST)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaju-00083K-9D
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEu-0002Wr-OW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:57 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEp-0005tN-EX
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:56 -0400
Received: by mail-ed1-x536.google.com with SMTP id w14so7164137edv.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gCPOO8vd2h8GUe9dv0h6T1ONRg1lbq1vkzQBXhJZDy8=;
 b=kFMAINvAPKh5ykTLYXB1OvDaCRFr3e4AqZS7qbCL5W8B0uATfC1/KqDfTDHhdQBCxl
 b1QxAlHdHAaOZCktlx7dsYQ+C9nZxxP76ByICwaNdp2gY4vrdjp/U+zeVPGuoC1VsAsc
 W3b8HS1bwkorPJGZKil76mS8Fz2RVj5nAMUdFSq46iyNqWPUmwQck8IC1pk9p8V3o28m
 5DLvhG9LsOlWJ+SyOgBtRCnzt604cw7Q6SMa+X7N4gAg/eSBcKTjMWk4E10S10FCYkZG
 KT19AIBsNl6GvOtt/I4SMdMYUYFjcAkudlvNtZfUzSFfCUTk3mParCFW8ZrOz6R1O1XR
 VMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gCPOO8vd2h8GUe9dv0h6T1ONRg1lbq1vkzQBXhJZDy8=;
 b=Du9inYEUDIU3Qr1Dhc7rNb9Ua8kiVx4KmIW33oBMpMrjgZxNkvL1313MNGwAQgFYu8
 W3IQ2lOoonZ5HXBq3Ml4OT6RLfrUxSR3r0lfjK+caFV7cfeJopde+eAZNbyPbqftR249
 +2s1c66Oq2c9eSzkSJr0zg+x7NMNJlPBc4bheCSZ2UAozTaTd7MDFMFkoaOwXalILPZH
 fY+qmlIyhWbOe7Col6BPsF2LiGqpBl/Bt6/s12XPu0g/mtYAmFGogbDysgimoJYRTfIn
 zYxn/U6iGFv7i7w6qq2K5hyNnSVLurIdQQPGbayPWw9LEpE3k91Xw/50axl2t4F/mtZU
 Az8Q==
X-Gm-Message-State: AOAM532q9EY5dwiTE8bomsR3p0+IQ6H9DJT35BstRnaH6XPKPiO9kOEl
 fszabRauubG6qJB7sSD+aXiBsAFUsXA=
X-Google-Smtp-Source: ABdhPJxHZVJALtqZndRXcxHEEOMRBgD2de2bfMRTyD9Vx8S5OhxJ82+xuy9alTRWzilnK/JsYGeFBA==
X-Received: by 2002:a17:906:5590:: with SMTP id
 y16mr38999070ejp.286.1634116069805; 
 Wed, 13 Oct 2021 02:07:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/40] qapi: Make some ObjectTypes depend on the build settings
Date: Wed, 13 Oct 2021 11:07:17 +0200
Message-Id: <20211013090728.309365-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Some of the ObjectType entries already depend on CONFIG_* switches.
Some others also only make sense with certain configurations, but
are currently always listed in the ObjectType enum. Let's make them
depend on the correpsonding CONFIG_* switches, too, so that upper
layers (like libvirt) have a better way to determine which features
are available in QEMU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210928160232.432980-1-thuth@redhat.com>
[Do the same for MemoryBackendEpcProperties. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 0222bb4506..7231ac3f34 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -794,7 +794,8 @@
     'authz-pam',
     'authz-simple',
     'can-bus',
-    'can-host-socketcan',
+    { 'name': 'can-host-socketcan',
+      'if': 'CONFIG_LINUX' },
     'colo-compare',
     'cryptodev-backend',
     'cryptodev-backend-builtin',
@@ -808,21 +809,26 @@
     'filter-replay',
     'filter-rewriter',
     'input-barrier',
-    'input-linux',
+    { 'name': 'input-linux',
+      'if': 'CONFIG_LINUX' },
     'iothread',
+    { 'name': 'memory-backend-epc',
+      'if': 'CONFIG_LINUX' },
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
       'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
-    'memory-backend-epc',
     'pef-guest',
-    'pr-manager-helper',
+    { 'name': 'pr-manager-helper',
+      'if': 'CONFIG_LINUX' },
     'qtest',
     'rng-builtin',
     'rng-egd',
-    'rng-random',
+    { 'name': 'rng-random',
+      'if': 'CONFIG_POSIX' },
     'secret',
-    'secret_keyring',
+    { 'name': 'secret_keyring',
+      'if': 'CONFIG_SECRET_KEYRING' },
     'sev-guest',
     's390-pv-guest',
     'throttle-group',
@@ -853,7 +859,8 @@
       'authz-listfile':             'AuthZListFileProperties',
       'authz-pam':                  'AuthZPAMProperties',
       'authz-simple':               'AuthZSimpleProperties',
-      'can-host-socketcan':         'CanHostSocketcanProperties',
+      'can-host-socketcan':         { 'type': 'CanHostSocketcanProperties',
+                                      'if': 'CONFIG_LINUX' },
       'colo-compare':               'ColoCompareProperties',
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
@@ -867,20 +874,25 @@
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
       'input-barrier':              'InputBarrierProperties',
-      'input-linux':                'InputLinuxProperties',
+      'input-linux':                { 'type': 'InputLinuxProperties',
+                                      'if': 'CONFIG_LINUX' },
       'iothread':                   'IothreadProperties',
+      'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
+                                      'if': 'CONFIG_LINUX' },
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
-      'memory-backend-epc':         'MemoryBackendEpcProperties',
-      'pr-manager-helper':          'PrManagerHelperProperties',
+      'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
+                                      'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-      'rng-random':                 'RngRandomProperties',
+      'rng-random':                 { 'type': 'RngRandomProperties',
+                                      'if': 'CONFIG_POSIX' },
       'secret':                     'SecretProperties',
-      'secret_keyring':             'SecretKeyringProperties',
+      'secret_keyring':             { 'type': 'SecretKeyringProperties',
+                                      'if': 'CONFIG_SECRET_KEYRING' },
       'sev-guest':                  'SevGuestProperties',
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
-- 
2.31.1



