Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A8508C77
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:51:19 +0200 (CEST)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCbu-00081z-E1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLW-0001F6-BR
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLU-0000tz-Ba
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so1489622wms.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+6vVe44Ze6Zp52ur673XaROVI4p8cy+qC9SEHaHUS4=;
 b=DDSknHsCs/yJ9ldF4pDd5Z+QSxi/xMNiGUBghoXw/9sTmshDN0yyLhgazc/eNTkUyd
 Xh0rJNVtF8CY/V3hKqfrKBtlWd0Z3wNt6uZMovdDKyyIOmMmIvcUla+0ws7thu+x3Lxk
 1IFTIQcCJfbz5HUtkMNyhVuUfKmVCpGmNpR1eeCJw7tZaNsCxQXGgicyEZSbF8F9hgBI
 acHzI2OBRijWku9OhtmdbeOG3Ad38tQOTkFhzTEacOiePRdAdOLuOsFX4ZZSM6QAfYL3
 JTzplwfJV/ciLfUuJARJGjEiPy2g1D8sTJnUvdJTp5sI+CO16jvzt7mAozjFgzOUqfQf
 eVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w+6vVe44Ze6Zp52ur673XaROVI4p8cy+qC9SEHaHUS4=;
 b=ekkQqNbU+MZbroAosWk1JhZtEDbYhOA9nl1s9a+9eqD9uLX49MvjaKuZw+EWnwm1Tr
 lNEq3NBLDbupWrkN/J+u7XiEygmlK7k4fNJ9CGwU7OxZhKCv6UJNhrFZrr0LXHjv0m7R
 KzR4EZuCiiQzOvYSqjxs+at9ii0UTIAkQM/VlkoL8Vtf7MaKjA2jNV/pHWuLljJEpwKj
 EW3CJMAx0SYBhe/MOfw+5chD/Eaq0u8tXsBNksG+y1i+8U8yZFD6C4I1Z4k69j1U6UJe
 tOCJr4saTp7o0uavTubHUxObnKQKsXJUia1oOS6gEiYU6yWf6spLuoR1qnH6qSaDCbBt
 fkNQ==
X-Gm-Message-State: AOAM531R3ngQEq85Vz7BcvE4+h3sx0asJew47Unf9Ad35BlWR8z72iKc
 Y6/RtbgCzfP57P7zsOvDEFq8piZ/4LIh5Q==
X-Google-Smtp-Source: ABdhPJwy+WvOyJzsPIFAMf6CmP+hdKe7U31fBRTrxfSWsOu9Gvr4FLZvxew/EwDANejT/9aPhE+ZOA==
X-Received: by 2002:a05:600c:4fc9:b0:392:8906:7e5d with SMTP id
 o9-20020a05600c4fc900b0039289067e5dmr4156968wmq.179.1650468858294; 
 Wed, 20 Apr 2022 08:34:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/34] configure: gcov should not exclude fortify-source
Date: Wed, 20 Apr 2022 17:33:38 +0200
Message-Id: <20220420153407.73926-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

There is no reason other than history (dating back to commit 1d728c3946, "tests: add gcov
support", 2013-01-06) for this, remove this unnecessary conditional.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 7a89cb4123..48ae18f47f 100755
--- a/configure
+++ b/configure
@@ -2625,9 +2625,7 @@ fi
 
 write_c_skeleton
 
-if test "$gcov" = "yes" ; then
-  :
-elif test "$fortify_source" = "yes" ; then
+if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
   debug=no
 fi
-- 
2.35.1



