Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B435E3A9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:19:22 +0200 (CEST)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLl3-0002eP-P9
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLax-0006zl-Qf
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLaw-0007GM-4l
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id n2so26799483ejy.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=WlXzZ5OE2Rxl/EDu55R6ZZRknKashJ6rOHBWWR95XFoA+k7E+IPaZkF/pQi0wqHbFB
 aA0ciGiRfkazG2CGCTtr57pl//rggfIwBFGLv20trSgB/6ZaPpj+M3eCMU4v1FTRlWU9
 vjHVi071mwoEwEAAfy3x7Te/Zrvh3bgPqxzSsupG8ywdEi/ZJDsWGtEhEtK605CUG8xx
 ZByxCr/f6239F8TaVCov7lMENoPLAP4flvQSUcd1YHGAjEQXhujbmvV0GybsgDIjkM9n
 yix7JIPkycFrYzzSaFJqbamYtIc3JCErDU6p4nGVL22wnxrbpXMmd+0lV51GykQFJqow
 MCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=aM8fOoceCop1HgesPWcYOvPUnmwsjFhERNAPqJ7E2RGnxOFYQcq0qOXviaLLffcmh9
 FBtH3vWA2EGD7QVoC9HDg1Z/PQt5BA+Eed9rSVn2EUBM2fz2hdowkOGoABpwsqsXQDdm
 Q6wTcV6TTbDQ5/1nJbbgOPbUQtsaL2KeN44vrMp79U4Mvuf0aS9HHfM4/XQ2ettzypZt
 qwtvrUxa3Xf6gA0jgZv3df3iEg04mav1xLfmTeT+inoqxgC0aLVSB4pmCihUkTpj0t3r
 yVj62YKmWg8GigezGR3GsvV2YbuDOBhvmCwPNng6/KiKZp4P9zyEMxbRC3q5knR3hFbI
 vdSQ==
X-Gm-Message-State: AOAM5332bqvC9UjFnzaTKQdU9UmqM8aQ1DZxETPiKCl6/24zDtzQDWLq
 9c/UNjeRf0ZhF16pK0tZIzLXYQ8CItk=
X-Google-Smtp-Source: ABdhPJwF6eE+IPaNPsOANh7+kGkG6DrRo9BPnSTBnxfypTaZLeI0i1WmgCEPqDG07hkvmO5IuaB4Vg==
X-Received: by 2002:a17:906:4756:: with SMTP id
 j22mr5932119ejs.506.1618330132832; 
 Tue, 13 Apr 2021 09:08:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u19sm9897670edy.23.2021.04.13.09.08.52 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/3] osdep: include glib-compat.h before other QEMU headers
Date: Tue, 13 Apr 2021 18:08:48 +0200
Message-Id: <20210413160850.240064-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
References: <20210413160850.240064-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

glib-compat.h is sort of like a system header, and it needs to include
system headers (glib.h) that may dislike being included under
'extern "C"'.  Move it right after all system headers and before
all other QEMU headers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..b67b0a1e8c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -111,6 +111,8 @@ extern int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+#include "glib-compat.h"
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -123,7 +125,6 @@ extern int daemon(int, int);
 #include <AvailabilityMacros.h>
 #endif
 
-#include "glib-compat.h"
 #include "qemu/typedefs.h"
 
 /*
-- 
2.30.1



