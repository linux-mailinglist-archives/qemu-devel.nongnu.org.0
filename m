Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D523A1473
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:29:57 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxLI-0000Hw-Oe
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fedora.dm0@gmail.com>)
 id 1lqxK9-0007Tj-F1
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:28:45 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fedora.dm0@gmail.com>)
 id 1lqxK7-0007Wk-NS
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:28:45 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id w4so5222195qvr.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version;
 bh=9HtOp5OBnTVJQCJUxcGPwDtzAaCCjmrEE+7cxERYvcY=;
 b=Dz0IqoAcEUnLqgQxOrMhew1lbX71OEy+XlRXOgA65sZKNH0pPw7jhcbPHwsfkjO5qt
 VKEwqvkbtE6hNIEB2BjCYonQtXXCX5UsFQb1LJqluTA/e1p0kA9bxCFYT4VTUo+/U2DU
 faLh0ZtqyjnQ9ObQF8ZN2EqHPQNrqDOMIX/K11B28EQWToTbvxOF5wq+A+unOVZgtNc+
 nM+KLke3vXsLT6c4Z192La0xYOovWsCB8r/Cw1C++33HXm9dPkh/ntB+xFa07/W3KPdo
 MhzZLlqTWPZwSz1VOLVtYZL5eaEqijJp3WyYfyptACJs6I5govTJ4ilCd6r0CgcQsKxs
 wrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
 bh=9HtOp5OBnTVJQCJUxcGPwDtzAaCCjmrEE+7cxERYvcY=;
 b=Osj7JN9upjOuVxrBP/O1npsj5sIik86S82mM1QR6tLBKKCHZcPYWtffzOtk3LJUV0w
 CLWzAcsEcv1BVW+tve2I4s+cc+WbCtn4MbEYYFozkqMXt4tRnr4Qls10dGXkYhF7/EEK
 O0HKRL7nR53X4cMkL8Kl9NFaS/687D6s/QodmPAUoMTjOTb6wl8fy5IWuq3/2R/9qHmU
 JoQNgFnA6XkIbZIvofpvA9bkslWf61lH3DhDsj6cfysxjUtKAeGeLzcgO1FZvS/0rIe9
 0YkjPE1bNhvRiQHE4lG1Szviqu1iuKlvr89mL7Tfp6n4A5zzrmkcqxOQdYeB5no0tpYM
 A67A==
X-Gm-Message-State: AOAM531OImLxaRwSlXYe87h+lWyBxVvPukXTrjZNcBXrgng5xWGXwJtw
 YlSXIAFZ+fclHJdc6TAcxMPnQ6JZqaY=
X-Google-Smtp-Source: ABdhPJyFpULhKKaUa09gxfiby3WjFQV/ON1h8q7phhANFBNU43pjvuk/AOnoFMsAozfRmLvX+mPBxQ==
X-Received: by 2002:a05:6214:8eb:: with SMTP id
 dr11mr5178542qvb.15.1623241721657; 
 Wed, 09 Jun 2021 05:28:41 -0700 (PDT)
Received: from callisto (c-73-175-137-55.hsd1.pa.comcast.net. [73.175.137.55])
 by smtp.gmail.com with ESMTPSA id
 p7sm3072218qkk.104.2021.06.09.05.28.40 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 05:28:41 -0700 (PDT)
From: David Michael <fedora.dm0@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: map x32 to cpu_family x86_64 for meson
Date: Wed, 09 Jun 2021 08:28:39 -0400
Message-ID: <878s3jrzm0.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=fedora.dm0@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=no autolearn_force=no
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

The meson.build file defines supported_cpus which does not contain
x32, and x32 is not one of meson's stable built-in values:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: David Michael <fedora.dm0@gmail.com>
---

Hi,

QEMU fails to build for x32 due to that cpu_family not being defined in
supported_cpus.  Can something like this be applied?

Alternatively, maybe it could be added to supported_cpus and accepted
everywhere that matches x86 in meson.build, but upstream meson does not
define a CPU type for x32.

Thanks.

David

 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8dcb9965b2..4478f3889a 100755
--- a/configure
+++ b/configure
@@ -6384,7 +6384,7 @@ if test "$skip_meson" = no; then
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
-        x86_64)
+        x86_64|x32)
             echo "cpu_family = 'x86_64'" >> $cross
             ;;
         ppc64le)
-- 
2.31.1

