Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE3651BD2F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:27:38 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYht-0006aU-F4
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmY58-0006o4-MU
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:47:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:28709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmY56-0004h3-0V
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651744050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AhdFc4b7fL5SLiMP4hnnjiZfSGGUziAykS5C9bFEXPg=;
 b=cOj5sbnDCdAoBzbtXThCOolaGUw2m33VjfXz9D/A6raFOTeQbNGjCLMjECbumDuIWXU7px
 j+6xUMzHUhB8n8ZE17Z1otqyjr2GqXnfIVshJl3mK9SKcwsCJ8rGNL5BO4FlGJWEtI2Wgi
 0AClzWVzzIYCPxKKIIdb9rxhufbGM+0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-dZX87254N76eob6mcMsY9w-1; Thu, 05 May 2022 05:47:28 -0400
X-MC-Unique: dZX87254N76eob6mcMsY9w-1
Received: by mail-ej1-f72.google.com with SMTP id
 nd34-20020a17090762a200b006e0ef16745cso2303429ejc.20
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhdFc4b7fL5SLiMP4hnnjiZfSGGUziAykS5C9bFEXPg=;
 b=Wi1XXZp8Q4hM1NBlKHrbQcfrNq/DMyJYe1FVuZ64U7bvbd3YUUt1nUMgiHTRSoLcDK
 iTnJ/LqWJZSAgb2vIpHHw8XAiamvhQe2NXx3pMlzxIFTAZghvAyssk1m9VYiMghuwc00
 v4Z1pcq3un68uZ4VrJG69MWg6YxrdiSuXrlT7vfiq7PgeURpTtJBCAptjbAnzr18K0KH
 Fgllo33ohqK4bz9czFo2KaMlSPnAZ+E4uFX4A17KyjL2ggcTtYJWOH2UqKFG19pO0K3j
 anRG8sD0jh7kAbuFz5EZXR+XEMg1sCNvMdmFtfAhCDeqAkSPDamD+/IPmmjFaEsWYnKD
 /tSQ==
X-Gm-Message-State: AOAM532mlLpGjxTleBZTQriu8FDCull6D82GQrPYbL7l5TTigTQia+PO
 LuCAohFbkuCbGT8IjQuaK4dbDISWB3HgJGy5fhQG3VcXUpewh2xWDTjyKWb1LJ6TE66S62bObRM
 /P9qzrdbqY17lMsPoVyH0hql5O0B8aHrbKivvGwQigEnvKOZhKiVApzKR+o0TWfopjew=
X-Received: by 2002:a17:906:6a29:b0:6f4:3389:9094 with SMTP id
 qw41-20020a1709066a2900b006f433899094mr21364315ejc.323.1651744047366; 
 Thu, 05 May 2022 02:47:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1BtXdrOgRyMFn8DqJmc839j629MdIR4r28G7CsnLcngJQFj8nOaw0fbFJUe+Tv6mRxZUciQ==
X-Received: by 2002:a17:906:6a29:b0:6f4:3389:9094 with SMTP id
 qw41-20020a1709066a2900b006f433899094mr21364286ejc.323.1651744047017; 
 Thu, 05 May 2022 02:47:27 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ml20-20020a170906cc1400b006f3ef214e2fsm557893ejb.149.2022.05.05.02.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:47:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH] qemu-iotests: inline common.config into common.rc
Date: Thu,  5 May 2022 11:47:23 +0200
Message-Id: <20220505094723.732116-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

common.rc has some complicated logic to find the common.config that
dates back to xfstests and is completely unnecessary now.  Just include
the contents of the file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/common.config | 41 --------------------------------
 tests/qemu-iotests/common.rc     | 31 ++++++++++++++----------
 2 files changed, 19 insertions(+), 53 deletions(-)
 delete mode 100644 tests/qemu-iotests/common.config

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common.config
deleted file mode 100644
index 9bd1a5a6fc..0000000000
--- a/tests/qemu-iotests/common.config
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/usr/bin/env bash
-#
-# Copyright (C) 2009 Red Hat, Inc.
-# Copyright (c) 2000-2003,2006 Silicon Graphics, Inc.  All Rights Reserved.
-#
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it would be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-#
-# all tests should use a common language setting to prevent golden
-# output mismatches.
-export LANG=C
-
-PATH=".:$PATH"
-
-HOSTOS=$(uname -s)
-arch=$(uname -m)
-[[ "$arch" =~ "ppc64" ]] && qemu_arch=ppc64 || qemu_arch="$arch"
-
-# make sure we have a standard umask
-umask 022
-
-_optstr_add()
-{
-    if [ -n "$1" ]; then
-        echo "$1,$2"
-    else
-        echo "$2"
-    fi
-}
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 227e0a5be9..165b54a61e 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -17,6 +17,17 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+export LANG=C
+
+PATH=".:$PATH"
+
+HOSTOS=$(uname -s)
+arch=$(uname -m)
+[[ "$arch" =~ "ppc64" ]] && qemu_arch=ppc64 || qemu_arch="$arch"
+
+# make sure we have a standard umask
+umask 022
+
 # bail out, setting up .notrun file
 _notrun()
 {
@@ -120,18 +131,14 @@ peek_file_raw()
     dd if="$1" bs=1 skip="$2" count="$3" status=none
 }
 
-config=common.config
-test -f $config || config=../common.config
-if ! test -f $config
-then
-    echo "$0: failed to find common.config"
-    exit 1
-fi
-if ! . $config
-    then
-    echo "$0: failed to source common.config"
-    exit 1
-fi
+_optstr_add()
+{
+    if [ -n "$1" ]; then
+        echo "$1,$2"
+    else
+        echo "$2"
+    fi
+}
 
 # Set the variables to the empty string to turn Valgrind off
 # for specific processes, e.g.
-- 
2.35.1


