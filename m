Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E8479C79
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 21:00:08 +0100 (CET)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfsF-0004qN-BF
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 15:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbj-0000pM-Vp
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:03 -0500
Received: from [2607:f8b0:4864:20::42f] (port=34803
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbi-0003UD-Fk
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:03 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c2so5109252pfc.1
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g3Nq0ia1EnuIjxs/Mhwgb8DdNQHpgozpO7mrb3WB+O4=;
 b=b6enAHiNYOIHoJTVwXndvBJaZu447EHBRpN7OrROyPrsWbm8RHcgS1WSdM2bKlWeZ0
 XlfRw2ulZArLZfjWnobYD3mAb3tqDejskC+ReM/sDzLFljM+mL4MBDHb06sXutNMEuK3
 GmwENJpzf3Pu+HiKXGb0hTW725mw+QFrtu96jyWl4EDlbqYcVv+WYDCVokzswCjmLCyK
 TSSZ7B+MfD5Wcj1FC2g1rF+JV15TxZmu6UmKNN2VDi5S4ofuawX5uGSDsf/vrpudGJqM
 xI4VQjBKcYkj0GpYWm5rMkhMDkCDer6FttAPOahAPNYlGcss3EbIvBHxBXjfDfVQTgy4
 SPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g3Nq0ia1EnuIjxs/Mhwgb8DdNQHpgozpO7mrb3WB+O4=;
 b=BeeRTr3E0aGB4/ZnmPKSs7iACPNWnxD2p4OJXH4inIR3xDeUFn9x+YK4t7S9vVbUEf
 5Z92/N0KvjE7fXE8BC4KBC/d8Wi/ZJgbHmVoof25+waBOIj79mEOIN6GFIkWyP7dxXiu
 3LKMz5/xzPQJ8g6j8W75ENK5BtBZeG1fbb6/vGvBhUQu6ydCbdeBbFxIpZGDq3eZikp+
 kKsnIdLhl85WNfcr/1lwhVkqpO7bFm98SWT6DxsRuEAy458z4M6TFE/x+SPP4gvfNOJh
 JfJp3XBvJUl+HKY365OBJupytJF2E03EjSDY6fvXP6KbnsHedOTEvoFxiCWP2JfrbSDc
 tOUg==
X-Gm-Message-State: AOAM533HzJUO4DUHToBaftrfHlU8IVYFSfjIGqX2W4gOZFdTA85h5/fP
 P5TZqstr5ACyQIxsQOygNRRUMKqnv/ZdzA==
X-Google-Smtp-Source: ABdhPJyoszJPIq0MWDQoDZzgIDJ+FJBVpcQSND2FDA8AKse1xDpmgHVTBFxleiShzXv8tixqDDXvKw==
X-Received: by 2002:a05:6a00:811:b0:4af:d1c9:fa3f with SMTP id
 m17-20020a056a00081100b004afd1c9fa3fmr8976265pfk.21.1639856581079; 
 Sat, 18 Dec 2021 11:43:01 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/20] tcg/i386: Remove rotls_vec from tcg_target_op_def
Date: Sat, 18 Dec 2021 11:42:45 -0800
Message-Id: <20211218194250.247633-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There is no such instruction on x86, so we should
not be pretending it has arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 54fb8321a9..99ec31977a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3235,7 +3235,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
-    case INDEX_op_rotls_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_x86_shufps_vec:
     case INDEX_op_x86_blend_vec:
-- 
2.25.1


