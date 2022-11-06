Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65F61E119
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPu-0001qQ-Dn; Sun, 06 Nov 2022 03:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPo-0001m0-7b
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPl-0002yS-AP
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aE3uf4Tj4fcpIJUY5ACapdk4+UyUxmO3dzqbPlt9tWQ=;
 b=EV/V98jdnI/F4qOzdnUEliwicgheKQSew2/ruu+hdRn11QtIjI9+OkA2X8HadYM0m8USSa
 jiTBVvL3dm2WL7zCultB5qg3Cil81+SWjg3GjZJr2FX61A+JRfMn2Hukr9O3m04mwQjSli
 3sVtcS9hoyEe1AU5bgVu3GfoY8UbT34=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-xMCMgC7JNxuwAeiMiasSfw-1; Sun, 06 Nov 2022 03:53:59 -0500
X-MC-Unique: xMCMgC7JNxuwAeiMiasSfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso4551491wmb.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aE3uf4Tj4fcpIJUY5ACapdk4+UyUxmO3dzqbPlt9tWQ=;
 b=TAQ1Tll/xWofaqCgK58yfTwE0TIDeTh2I5hA+UAzgI+ODYb901PGLaEbvJZzw0zblg
 EZyOhdHQqHJ3OdMTVxVw3rsJ4mDtvMqDkkQs60nCqnAd769B78GfTN+/6aaHIRipqHTH
 9ol/TmSqhRqhc3ZuAdZzsmcOCxYEFq1wBWu22rNne8EC5vRW5eSUBDwl0VEvegt+IhCQ
 p31tjgvofFZhmY/hbcSp+U9Di3g/tKpEy6ioOEWSfjpFfEdceu6LMvg9NW/l49K2PcOw
 d7l4QNYTDluX/BD+bVoEdIabPMOJIFHjr6Js+nIaL62u7duAK6Erl2ApHC/2IVyAxIX2
 zXow==
X-Gm-Message-State: ACrzQf2qVAHYjynMGIFpmcD3GJ4el8tuvpm/E4JOPBmjYG5YKqYfTg2T
 Zgw42EuqW8mcJHMtxCuDYEvaMtUUyjCoVsmIVWsCrHb+7U7qDfMfuse6pH7XUH+dOGhKD7t3RCW
 xW+k13JiPVKYzUoYW5kwZRLF8Q9cLAWoIWtE0ciSKy8dcSqavmi78l1UI12pB3kLxIWQ=
X-Received: by 2002:a05:6000:144d:b0:236:f53e:363d with SMTP id
 v13-20020a056000144d00b00236f53e363dmr13472293wrx.422.1667724837954; 
 Sun, 06 Nov 2022 01:53:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SYvT9JmGH1mKH1nQ5dojwRTC2h1ubci6Ctz0jLSK6bflb8G0oTrjDuVi21chCWruoSyHcgw==
X-Received: by 2002:a05:6000:144d:b0:236:f53e:363d with SMTP id
 v13-20020a056000144d00b00236f53e363dmr13472277wrx.422.1667724837657; 
 Sun, 06 Nov 2022 01:53:57 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm4128815wrq.24.2022.11.06.01.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/12] dmg: warn when opening dmg images containing blocks of
 unknown type
Date: Sun,  6 Nov 2022 09:51:14 +0100
Message-Id: <20221106085115.257018-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kevin Wolf <kwolf@redhat.com>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929093035.4231-5-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/dmg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/block/dmg.c b/block/dmg.c
index ba8ec344d479..675e840ca587 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -254,6 +254,25 @@ static int dmg_read_mish_block(BDRVDMGState *s, DmgHeaderState *ds,
     for (i = s->n_chunks; i < s->n_chunks + chunk_count; i++) {
         s->types[i] = buff_read_uint32(buffer, offset);
         if (!dmg_is_known_block_type(s->types[i])) {
+            switch (s->types[i]) {
+            case UDBZ:
+                warn_report_once("dmg-bzip2 module is missing, accessing bzip2 "
+                                 "compressed blocks will result in I/O errors");
+                break;
+            case ULFO:
+                warn_report_once("dmg-lzfse module is missing, accessing lzfse "
+                                 "compressed blocks will result in I/O errors");
+                break;
+            case UDCM:
+            case UDLE:
+                /* Comments and last entry can be ignored without problems */
+                break;
+            default:
+                warn_report_once("Image contains chunks of unknown type %x, "
+                                 "accessing them will result in I/O errors",
+                                 s->types[i]);
+                break;
+            }
             chunk_count--;
             i--;
             offset += 40;
-- 
2.38.1


