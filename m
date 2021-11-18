Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F6455EE2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:02:48 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniw3-0003eD-Ft
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:02:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnirA-0004xG-TY
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnir8-00084q-SC
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=995klPDX33rmzvSoWGVJ6V1EGfWuQDmUmdzVzSbmtDc=;
 b=DYOPCf1MAH4AZRv2mPWAdMXANcFKWX2DrYvM7xo5J8+o/gySe8IuA4qGu6u2OBW7T878NL
 Ubbi23eqhbx8bOsk9MeCgrIAGR9K1G37kboVQGBVsXwu/KbMfjhwah4nLobY3DZE0O6lnD
 x772ThSFMvKVcIcjMLh1SAY3sCMONqI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-AvNbVFXKMqqJYEeMh2NZHQ-1; Thu, 18 Nov 2021 09:57:41 -0500
X-MC-Unique: AvNbVFXKMqqJYEeMh2NZHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso2688389wmc.8
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=995klPDX33rmzvSoWGVJ6V1EGfWuQDmUmdzVzSbmtDc=;
 b=kRrPQQB1x5Llrg16pvOyISB9/RRTebIncxV2ZtfV7IIAM8NSATpcW+RFa5UKgu4IgA
 2dmnYJhKIiCH+UWizJvDcd9Xu4jDRo6GJnbl9FNFXdetNW5rhOedAmJzj+LBtyGUYHjo
 GzcDRsJtgA2OLKCLicwWySVY06ir7UiJ/dLQt6PlNZ+unf+j3tNxkGAc52vQNXuq+9++
 7PKAH1ssV8KHmTaOUmZeJ+jO39E/Qg+3dR8edHmU4a+DC5DjsdMQfu2B2Q/GT5wMidU8
 v30CJm4dco7DDpmQUj8ehtovIAKgXiQiLpQ1tcFXVZceDyhtSTyRc0YzwFiZTU/jc7q8
 8tQw==
X-Gm-Message-State: AOAM532ZE0W0jdKWgGRazdwz41Un8nLiwnrTmYsTu5NH/W1SkMMRRCOx
 w6gOQ1tfDMZ72ItgtAiwLna9VauWCiz6hP+BBE18xV0HjudroeQM1zLGBFqb7zYRS22vlBaXF7S
 go6DV8xg6xKsczZBoGgt+KjxXM8uz6laxAtoFOehTh9rZoTktxeit2JCyf9Rve/Jv
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr31229420wrn.423.1637247459428; 
 Thu, 18 Nov 2021 06:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzA9z6QrKZQxNpKCdTMNZz5Kdu7G0oiAbK9lXyLgLEfb7M5V6ubx7stOrU/w/u2ubttfOFqQ==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr31229388wrn.423.1637247459149; 
 Thu, 18 Nov 2021 06:57:39 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q123sm9051755wma.30.2021.11.18.06.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 5/5] docs/devel/style: Misc rST rendering
 improvements
Date: Thu, 18 Nov 2021 15:57:16 +0100
Message-Id: <20211118145716.4116731-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 0397971e528..1db50b70544 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -4,7 +4,7 @@ QEMU Coding Style
 
 .. contents:: Table of Contents
 
-Please use the script checkpatch.pl in the scripts directory to check
+Please use the script ``checkpatch.pl`` in the scripts directory to check
 patches before submitting.
 
 Formatting and style
@@ -195,9 +195,9 @@ blocks) are generally not allowed; declarations should be at the beginning
 of blocks.
 
 Every now and then, an exception is made for declarations inside a
-#ifdef or #ifndef block: if the code looks nicer, such declarations can
+``#ifdef`` or ``#ifndef`` block: if the code looks nicer, such declarations can
 be placed at the top of the block even if there are statements above.
-On the other hand, however, it's often best to move that #ifdef/#ifndef
+On the other hand, however, it's often best to move that ``#ifdef/#ifndef``
 block to a separate function altogether.
 
 Conditional statements
@@ -220,13 +220,13 @@ even when the constant is on the right.
 Comment style
 =============
 
-We use traditional C-style /``*`` ``*``/ comments and avoid // comments.
+We use traditional C-style ``/* */`` comments and avoid ``//`` comments.
 
-Rationale: The // form is valid in C99, so this is purely a matter of
+Rationale: The ``//`` form is valid in C99, so this is purely a matter of
 consistency of style. The checkpatch script will warn you about this.
 
 Multiline comment blocks should have a row of stars on the left,
-and the initial /``*`` and terminating ``*``/ both on their own lines:
+and the initial ``/*`` and terminating ``*/`` both on their own lines:
 
 .. code-block:: c
 
@@ -274,11 +274,11 @@ Order include directives as follows:
     #include "..."           /* and finally QEMU headers. */
 
 The "qemu/osdep.h" header contains preprocessor macros that affect the behavior
-of core system headers like <stdint.h>.  It must be the first include so that
-core system headers included by external libraries get the preprocessor macros
-that QEMU depends on.
+of core system headers like ``<stdint.h>``.  It must be the first include so
+that core system headers included by external libraries get the preprocessor
+macros that QEMU depends on.
 
-Do not include "qemu/osdep.h" from header files since the .c file will have
+Do not include ``"qemu/osdep.h"`` from header files since the .c file will have
 already included it.
 
 C types
@@ -352,9 +352,9 @@ casts, then reconsider or ask for help.
 Pointers
 --------
 
-Ensure that all of your pointers are "const-correct".
+Ensure that all of your pointers are "``const``-correct".
 Unless a pointer is used to modify the pointed-to storage,
-give it the "const" attribute.  That way, the reader knows
+give it the '``const``' attribute.  That way, the reader knows
 up-front that this is a read-only pointer.  Perhaps more
 importantly, if we're diligent about this, when you see a non-const
 pointer, you're guaranteed that it is used to modify the storage
@@ -505,7 +505,7 @@ painful. These are:
   the sign bit (ie it is an arithmetic shift, not a logical shift)
 
 In addition, QEMU assumes that the compiler does not use the latitude
-given in C99 and C11 to treat aspects of signed '<<' as undefined, as
+given in C99 and C11 to treat aspects of signed '``<<``' as undefined, as
 documented in the GNU Compiler Collection manual starting at version 4.0.
 
 .. _autofree-ref:
-- 
2.31.1


