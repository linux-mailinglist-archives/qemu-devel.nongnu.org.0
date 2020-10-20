Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A928BCAF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:45:05 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS00W-0003Jt-AP
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqD-0006j0-TF
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq9-0007GM-DL
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i1so13561521wro.1
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=UkSP7IvR3ZHZ0vB/gPLvDD39ym3SElSAtD6BQpwZggwMPzlDY/C4xvDMk82T8mJtCh
 w4ERaZvRFN+WqbGzhac5PynNnAb88fpGeKelbrfi5blZCuvazGR3yTPuddzujXtUjo9j
 KZoQ6qHR/D8Uv2cfFLyHH6wewMAz7IGejJDoDiK4BerSnK9waZ+50yVoVsa0C5u6wgv2
 1I0JtCeOxMPXGX3i6O/RcaPLizTNK7Nv5ZmzVDB+nbDredWeSlBVTBtf96EE/D+Ae0UE
 WtfzhYIWdqbg5oNegwG6E2uEKmKH4k9Vc4TlXD3/SRtb83/DHYVoD6uXTGlyh7rYxFmK
 aXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dCI9vVIHjGOIU15u/YnihvSC4K6HLaW4rgzCu/bPQI=;
 b=lV+iBESr24S0NcJoUhQ5R015x183WaONIPsmCzaL1FbQQMQ7IyNMmrvOubj129MUMb
 TFQOUja/yEI29msxRD3XtN4An3SejqRchcDhypWytgDgCgNzWBoPHsUzzbKxnfNfd9H7
 lrx6UqSLhWYvxhXcrtaDXWkGo5Wxdo8BHEjjzfYrVxLk7xjIXH3R6DtzugtYwBANtRz5
 GCGpInJJJm6rGlBU2LM+JocJIu6+cP6/f5Ayz7BZDIyANheAFfikXg54DOxUa42sjPqz
 UBseIIH8hF5dsDBKnrios/AEUQMshKO/DOFTKB+56QXWSxlrn7s18ySj4a1j1QLcw9OJ
 uCkw==
X-Gm-Message-State: AOAM530Xj5M7/doRtNN/Evc06RwjPQACe/pTyI7iof4KunGIgVaLC1Z1
 PupHPmX8Ds9UdpaIFwpUnICkLA==
X-Google-Smtp-Source: ABdhPJw4YZZR6kVhMgC98In1t20D47LraX5eIj+Z1+MGYeZu+KXKom/eAqshKgl76prZW6cMD12dBg==
X-Received: by 2002:adf:e741:: with SMTP id c1mr19303102wrn.16.1602516859770; 
 Mon, 12 Oct 2020 08:34:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] decodetree: Fix codegen for non-overlapping group
 inside overlapping group
Date: Mon, 12 Oct 2020 16:33:31 +0100
Message-Id: <20201012153408.9747-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For nested groups like:

  {
    [
      pattern 1
      pattern 2
    ]
    pattern 3
  }

the intended behaviour is that patterns 1 and 2 must not
overlap with each other; if the insn matches neither then
we fall through to pattern 3 as the next thing in the
outer overlapping group.

Currently we generate incorrect code for this situation,
because in the code path for a failed match inside the
inner non-overlapping group we generate a "return" statement,
which causes decode to stop entirely rather than continuing
to the next thing in the outer group.

Generate a "break" instead, so that decode flow behaves
as required for this nested group case.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 60fd3b5e5f6..c1bf3cfa85f 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -548,7 +548,7 @@ class Tree:
             output(ind, '    /* ',
                    str_match_bits(innerbits, innermask), ' */\n')
             s.output_code(i + 4, extracted, innerbits, innermask)
-            output(ind, '    return false;\n')
+            output(ind, '    break;\n')
         output(ind, '}\n')
 # end Tree
 
-- 
2.20.1


