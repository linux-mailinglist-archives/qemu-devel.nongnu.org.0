Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3574E13F9C6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 20:48:03 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isB7Z-0001es-R5
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 14:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1isB3c-00055x-1w
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 14:43:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1isB3a-0007SU-RG
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 14:43:55 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1isB3a-0007RY-LC
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 14:43:54 -0500
Received: by mail-pg1-x543.google.com with SMTP id z124so10404163pgb.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 11:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlmrkeJpIzrykZtBoNNBzf4mMw31J+DYkBhjDwHekRc=;
 b=LFuUOFE0E970h9rzr6EFoFYOv2230PPKeJzHn3Ps17vThQ31K6HLEg5ZfQ4BL56/ql
 ZT04Sb+WEUdedU2ESw0aw0quwzLJr/EZ84SupQvlyQINgClfZizfb5PrU5fNay6pzmYZ
 lgxsfqE/G1V3MQmSJoUZjyy5eBhHf1AhTH4o2t+U+jAJzUqISOf1MQ4T29++dw+0CFW/
 BEX5pSBsI8eF97oFxS31DkJEKV875CyMuCGFG5zaQTHStGeABteZfi8VC1GEa10xoiOD
 XEN6cuAqe5eqqmJ5B3wOZBzkDtvO5YvVxokoqhG8J5UWahuKRi1rTLhvA0m1A5fTdPKz
 mU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlmrkeJpIzrykZtBoNNBzf4mMw31J+DYkBhjDwHekRc=;
 b=KVAhu35d0G+/eV3Bo6Txbzh3pSqep8bUPVMDfnmfdZ5YLjtlEv8i5P3YiHE1I0BSlI
 v4DdFXoFSZ0BZFjUWhmpwkoBqRh9Yx5/c795XxIDZzPMKzWjMZoV+LONOmDB0XrF8A12
 RzmISSkcTDTjpemiivNCfcxs171uBHsojh8xEHqI6jGYz+zbczYqAo3kROkEHnYoGdGG
 sv+m6ZjcW+s4xbB8z11evQlO9ZUojKB0iq9kM9cesGKbMA9Aw+oQ1sPIaEN70wUcfwRe
 FVSccq78E/fFatYTL7OCnNBBkek0KHq+udF6H8Ky99jONXhdR0Wiwoaoadoa0jYEWFmV
 Jnow==
X-Gm-Message-State: APjAAAVcGO4vnMRr7z2rFGCmmu0HPKq+49FKnIunoyPQcyo0VH2hk/pn
 2tt2dzY85+IgeUWNTekir/szMqAOYJE=
X-Google-Smtp-Source: APXvYqzhrW9lxQeR8BHFha5JSUbw0KRD785JlC4MaJXnLIhGQcUBD3cbwCEKOjAn4wRwRILd9xcLIg==
X-Received: by 2002:a62:1783:: with SMTP id 125mr39653076pfx.189.1579203833454; 
 Thu, 16 Jan 2020 11:43:53 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id g2sm26411831pgn.59.2020.01.16.11.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 11:43:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] linux-user: Add x86_64 vsyscall page to /proc/self/maps
Date: Thu, 16 Jan 2020 09:43:40 -1000
Message-Id: <20200116194341.402-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116194341.402-1-richard.henderson@linaro.org>
References: <20200116194341.402-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The page isn't (necessarily) present in the host /proc/self/maps,
and even if it might be it isn't present in page_flags, and even
if it was it might not have the same set of page permissions.

The easiest thing to do, particularly when it comes to the
"[vsyscall]" note at the end of line, is to special case it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 171c0caef3..eb867a5296 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7005,6 +7005,15 @@ static int open_self_maps(void *cpu_env, int fd)
         }
     }
 
+#ifdef TARGET_X86_64
+    /*
+     * We only support execution from the vsyscall page.
+     * This is as if CONFIG_LEGACY_VSYSCALL_XONLY=y from v5.3.
+     */
+    dprintf(fd, "ffffffffff600000-ffffffffff601000 --xp 00000000 00:00 0"
+                "          [vsyscall]\n");
+#endif
+
     free(line);
     fclose(fp);
 
-- 
2.20.1


