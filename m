Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801534D7EF6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:47:28 +0100 (CET)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThIV-0004MU-Jj
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:47:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3n-00080Y-42; Mon, 14 Mar 2022 05:32:15 -0400
Received: from [2a00:1450:4864:20::433] (port=39932
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3l-00084K-GW; Mon, 14 Mar 2022 05:32:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id h15so22823814wrc.6;
 Mon, 14 Mar 2022 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eB39o4/uwR51SPBmuaJYSqmO/4adg9neg9PXYqCJatM=;
 b=KRbwa5XFX1jvx3hMGzpxUyTv0MknmsfBKj5epd1w6ryw/96X70VAxj8tCBogDb3imn
 hJrl5j/YIPNvuiLia0EsP1k7/HzVR5MEQ9ebWQSGd7f2ARhy0iiyzJTVtOayXhJ1oeoj
 76a0EQKm1KiQ7cXGIOjJQZN+0E/utdBcnI8yfMWLvn/RigtVBr+34OQiTRCu96lsZIFR
 jIP+cTv0FN+lamecsum+a2vwTh+zl1YzdA+hSJuki3PrKCqmJ1rOH70Q07vmUmbQ/U5C
 IJdPxWwyTgddUJxKBNhPKhLUk0WfOGVktWk511tTXJCTmaXTieD4Cw9LtpVB2FPffWUS
 Eyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eB39o4/uwR51SPBmuaJYSqmO/4adg9neg9PXYqCJatM=;
 b=rC7Xs7kYKJTcWLJgafQJfuKHxys3fK6M5H+fKUsbKx//Ank20OKutYZC3RRD84ftAW
 JeAy6al/VIFlypUxpwzs7uVJFNbo+jNNIb17rb5I6H2gyXsHQmeFcHILIsyqYWWKGNfh
 Q08sK0ZMlT9GSD6UwV/5AWrLulLnvg0xf0wvHpw/i16c/Zasf1pNNBCRDizaby6txBQ8
 niVmDWhTLi2AwKArRsCTdLr3nvk5HQnH/0gv4fEHiglmFj/znI+n1InSEkntkqg41LnA
 HKqr6rRxGmlwM4aiqMGQjjkEwXrV4C/PhRUzDEqUwO4+59hvGltfRnTN7G5aQT0MZl58
 mvZg==
X-Gm-Message-State: AOAM5331sNSPTRjVC2N7IU/uymNs5/jq4GobjAxBFXXR/XFPEyP5EiS1
 wZMAlqaBRxUrvN5iXpBJddSW9So5s1o=
X-Google-Smtp-Source: ABdhPJzFeo/F69T5fsNRGJukNo4HsgzqvDBZp2zkD34fz7mcD+RC+P2mp+iovV0kdmkld7lzwwLt3g==
X-Received: by 2002:a5d:50c5:0:b0:1f0:2111:8f74 with SMTP id
 f5-20020a5d50c5000000b001f021118f74mr15721192wrt.211.1647250331814; 
 Mon, 14 Mar 2022 02:32:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 08/16] tracetool: add extern "C" around generated
 headers
Date: Mon, 14 Mar 2022 10:31:55 +0100
Message-Id: <20220314093203.1420404-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/format/h.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index e94f0be7da..2d92fa8bd2 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -27,6 +27,9 @@ def generate(events, backend, group):
         '#define TRACE_%s_GENERATED_TRACERS_H' % group.upper(),
         '',
         '#include "%s"' % header,
+        '#ifdef __cplusplus',
+        'extern "C" {',
+        '#endif'
         '')
 
     for e in events:
@@ -100,4 +103,7 @@ def generate(events, backend, group):
 
     backend.generate_end(events, group)
 
-    out('#endif /* TRACE_%s_GENERATED_TRACERS_H */' % group.upper())
+    out('#ifdef __cplusplus',
+        '}',
+        '#endif',
+        '#endif /* TRACE_%s_GENERATED_TRACERS_H */' % group.upper())
-- 
2.35.1



