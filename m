Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF74A8B47
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:13:06 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgbQ-0006Qf-VW
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0S-0005HH-Mj
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:52 -0500
Received: from [2a00:1450:4864:20::52f] (port=45849
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0K-0008J4-Ab
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:52 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p7so7425038edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Unqz+c8PSAe2zSSUbFBlqr+oPyE4/jm1ooREsUyGltQ=;
 b=HfN6iRpH3tqTHxPxu5FRZO6gyRfyuq9dtEZp0ZgL11budQqdXW3IXQDNSs3BjUZlfm
 Uo8tWY6M4hQcEwMJNVU2H/waG7HiXuAhyaIiA3tsX+NDxhugJhT4VMT4Dj7/PsXkEiTz
 T8uwVj22KRugNm1KxXgE8gFINeld1i4tnDSC3oQBx+qf5Dgw9LVd9FHCYbGHv5DoU+Tr
 30uH+3dcYTEnJr2j2sVrGyDhNdf4YwBcJRdz3gWJ8tqZPvVId0Mbm6V6H2lSkYifBtnR
 Ij+ZejZxcdnBpy8imv/sd9d+Uacc4wKVgQJ45zxS+gWbWx9pMBXH0yKO0VXtaQwgmqEx
 GgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Unqz+c8PSAe2zSSUbFBlqr+oPyE4/jm1ooREsUyGltQ=;
 b=Tqw7RY0PsoHEqKcvAJ33BGS8SjVLK9SnLjnt5g4+jL0H9d51EsYL2obY3mNKCWw4E/
 GuU91wuxt1jMklA00sOArMY0w8Ie1W3+hHklEdGeDK+YQ4twjIgYAcYCTq5cxBEcfenY
 wHUSlITRMeiJD2Rg2wrSGftXwtTzxs2Fw0gdMYUHkd/GcT0dFC0eXboOccG/HW9P3L1z
 DDTnyMPGbd+TbH4gH+CiA5XUThTuzRZKCdAoD0aMmD/DETwP/ZF0vumdP4z27Kh9iNa4
 BDCjpBaL/yW3BIqD1pxfMGn/Z2rP8BDS9w0Y77GwlY8Z4Lziujb42xBVUJKwLnie4/WJ
 IG4A==
X-Gm-Message-State: AOAM532mY/Mw8hiI1mGHhjMhvXBBc/OlbjGbTo4Soox/uHAhlMq6Tb5o
 rCPm2/VhASzWVBeR3HlYj5H/mkW1fS4=
X-Google-Smtp-Source: ABdhPJzGIV7Aup8ks7FDQASj0jn9B9UARv5rks4iUXyW/KqExnIG5/MizKGQkG/dNPLQsBcGGTbilA==
X-Received: by 2002:a05:6402:254d:: with SMTP id
 l13mr23937782edb.77.1643909656909; 
 Thu, 03 Feb 2022 09:34:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/27] qga/vss: use standard windows headers location
Date: Thu,  3 Feb 2022 18:33:53 +0100
Message-Id: <20220203173359.292068-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Stop using special paths with outdated headers from an old SDK.

Instead, use standard include paths.

You can still build against the old SDK by running configure with
--extra-cxxflags="-isystem `/path/to/inc/win2003/"

(this also allows to build against MinGW headers, which are currently
broken as in 9.0)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/install.cpp   | 2 +-
 qga/vss-win32/provider.cpp  | 4 ++--
 qga/vss-win32/requester.cpp | 4 ++--
 qga/vss-win32/vss-common.h  | 6 +-----
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index 40de133774..efc5bb9909 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 
 #include "vss-common.h"
-#include <inc/win2003/vscoordint.h>
+#include <vscoordint.h>
 #include "install.h"
 #include <wbemidl.h>
 #include <comdef.h>
diff --git a/qga/vss-win32/provider.cpp b/qga/vss-win32/provider.cpp
index 72d8b0e19d..fd187fb66f 100644
--- a/qga/vss-win32/provider.cpp
+++ b/qga/vss-win32/provider.cpp
@@ -12,8 +12,8 @@
 
 #include "qemu/osdep.h"
 #include "vss-common.h"
-#include <inc/win2003/vscoordint.h>
-#include <inc/win2003/vsprov.h>
+#include <vscoordint.h>
+#include <vsprov.h>
 
 #define VSS_TIMEOUT_MSEC (60*1000)
 
diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 940a2c8f55..4513324dd2 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -14,8 +14,8 @@
 #include "vss-common.h"
 #include "requester.h"
 #include "install.h"
-#include <inc/win2003/vswriter.h>
-#include <inc/win2003/vsbackup.h>
+#include <vswriter.h>
+#include <vsbackup.h>
 
 /* Max wait time for frozen event (VSS can only hold writes for 10 seconds) */
 #define VSS_TIMEOUT_FREEZE_MSEC 60000
diff --git a/qga/vss-win32/vss-common.h b/qga/vss-win32/vss-common.h
index 61c170b52e..54f8de8c88 100644
--- a/qga/vss-win32/vss-common.h
+++ b/qga/vss-win32/vss-common.h
@@ -46,11 +46,7 @@
 #undef VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED
 #undef VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED
 
-/*
- * VSS headers must be installed from Microsoft VSS SDK 7.2 available at:
- * http://www.microsoft.com/en-us/download/details.aspx?id=23490
- */
-#include <inc/win2003/vss.h>
+#include <vss.h>
 #include "vss-handles.h"
 
 /* Macros to convert char definitions to wchar */
-- 
2.34.1



