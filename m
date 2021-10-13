Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAF42BBB0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:33:57 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maae4-0003LC-OK
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEy-0002c1-JI
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:05 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEq-0005uY-Bm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:59 -0400
Received: by mail-ed1-x534.google.com with SMTP id ec8so7259778edb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDROQXrBHjp89GUquZYhrHR11bo1zH9TlZJcG4AO4d8=;
 b=ef0wDXiuFMlJwMMXOPqFXHL4IMIeUm3k1bmqOjG2aNTLJuDCtmut85VTNelthW5EqJ
 unRwIvC01gnD1ZU+k+kAtlJ2vJZibKcX+sv2V+DUGjEmFIyHnBS+uEKbVYztGqJqtt1x
 IpAqFCD9R38NlRj8K752wDGzTsnyJEmlwlcf2DSHabMlWaiQfSa9jWSCDZi8eY22pe7f
 i0YtDOxNRJfqnlUF397QgzkfZS+YL4A5Fp59XziF6aX1wwx4OGoZmq6irE77KcVZcu9C
 1+UsgBmBw451o7ZSyN9wugLCLFZRRqITGFoVEvuZl/K44no1UvgQcQZfJN4/TxrLEOfN
 48AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tDROQXrBHjp89GUquZYhrHR11bo1zH9TlZJcG4AO4d8=;
 b=nlgknnbDJaeofcc4/K2wR3CB337yM4EKQ8D36KAFG6oG7vVecH6xEb9+Lq4ya9KmAW
 lfpHlPMPIfy7WbmGgkEr17mgz9iow3ks3O4oTkQnyqwG5KDwErn5bHkOhjhqwRKIB+9V
 xG1Q+kgodOf5DC2E8U0Xi+JmucfNepRo670ZccCzTzh8OPSDXPbHelO9XcZAyYPL+13D
 N6yU1VSyV78nKaFckf27+4dAFEblpK+dbz94n+vVad14E1uFhYHfEWvsQ2PwGKlqNlxE
 RNULzjtX4wKqxTF1CzlWKML+R/Q0qOT+MBNERcEIQY+M/OAdytxyg0REF7ZsfsLUv/l/
 uy8A==
X-Gm-Message-State: AOAM532m5yFFrr1s6RIT53KcGGuCqD/Jq8Y2ueo0gEmSLoPBICo4Qvx2
 TN8oU3UMZvw4gU7MjIF4r/hbNXURoxU=
X-Google-Smtp-Source: ABdhPJxZnZUDBYyc4h5cHS5hxj6hYFxo3AFg5WRgull/5qMNFp0cVbst8BvoqGQ0WLnuQNr/fNdTrA==
X-Received: by 2002:a50:e043:: with SMTP id g3mr8015354edl.196.1634116071084; 
 Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/40] hvf: Determine slot count from struct layout
Date: Wed, 13 Oct 2021 11:07:19 +0200
Message-Id: <20211013090728.309365-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

We can handle up to a static amount of memory slots, capped by the size of
an internal array.

Let's make sure that array size is the only source of truth for the number
of elements in that array.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211008054616.43828-1-agraf@csgraf.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/hvf/hvf-accel-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 6cbd2c3f97..2b2c411076 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -321,7 +321,7 @@ static int hvf_accel_init(MachineState *ms)
 
     s = g_new0(HVFState, 1);
 
-    s->num_slots = 32;
+    s->num_slots = ARRAY_SIZE(s->slots);
     for (x = 0; x < s->num_slots; ++x) {
         s->slots[x].size = 0;
         s->slots[x].slot_id = x;
-- 
2.31.1



