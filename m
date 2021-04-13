Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C335DF30
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:50:07 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIUX-0002u9-Vq
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISb-0001W1-Qh
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISZ-0001pj-WC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w23so19234727edx.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=U/3iMIAOgykLV1HY3zaWRRzUT1t3YSDzZSO7TE+G8WEFAqi2tgW8AuEKGur7kxEqaT
 9VhP3TQCvq2VF8RQ8vhTYyEFXx+E4Wk/wPkvfHr41rzebIv7lSNZZundi7wUatqHG8fc
 EwVcB6JAra8Y8Ww6+ZvzWdLZLVwP9J4mU0vclXq0LCBcHX4lfJC+Hw6auznGiVJBPJQ4
 0AXB6R6k/HotawKYzkJ++4NpFwx3Z4lVMnJ5/xq74FmZuKX/M/HcXXNFDZrWIpQV6MsG
 QAK2mmHKkmTJC3QVpN+LawAlMCXEn8MyNLYDSq8p5L+SWKKMOcaZBsDmIsJ6thZYvODA
 N4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=Y8gV/FtJF455id+7L0/eEPePo+iQivolRXcsgt7zbTmfGkLwd6Z0EEEixWLPXWDHQG
 8ZZmvSu1qtOJDUaqvOIfoZGguuDZoMq290bi0NE/GdYaiwOyRyUYNcJ9WZ37QFrZfO+T
 Vq/GZSAZ7iC6acbDTDUdsJUvu0mPUb5JOL9lLZTLF7xEcno++TajYBOhh+YM8e3nPWMT
 ouqbggsLDoBGxUO368qNAlXfFZmyAxWu7FJhXav60+5X+MIcgrIuXFW66F0Y0kjVjh0C
 TEzlpWS5BDvK/9qfdQ3Da7t01qHaGOFDbx2BpklKODhAZDizS4ynahbzXBPd0VDdSOtR
 UBDA==
X-Gm-Message-State: AOAM531brHGSbEs6P58K+5mU8GmYR/zAQJxU+hUMxOc3wzk7Jm/I8BBl
 to+hQLXjqRAbZ5K33tl/HrXYNeYNVng=
X-Google-Smtp-Source: ABdhPJy3PYWqXY0O0OuNazTO8v1OLvdLxTjfSU1ZadN1HY4UrLT93n/ZZLjfCO86vVDBL+kN0Bo/Gw==
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr35067084edt.353.1618318082499; 
 Tue, 13 Apr 2021 05:48:02 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s9sm8635961edd.16.2021.04.13.05.48.01 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:48:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] osdep: include glib-compat.h before other QEMU headers
Date: Tue, 13 Apr 2021 14:47:59 +0200
Message-Id: <20210413124800.216095-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413124800.216095-1-pbonzini@redhat.com>
References: <20210413124800.216095-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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



