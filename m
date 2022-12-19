Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43668650BD6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:38:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7P-0008HG-NW; Mon, 19 Dec 2022 07:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F73-0008B9-DU
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F71-0006Uf-CC
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx10so8487329wrb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBHnyL4EFazciHWW+mpVyqetqNYC5psxNZdbkggYfNQ=;
 b=NxSjLHKabOSXX5rdrb4aiZH9TZF76oy9tfCff46HO41jRJ5ySCnbKVVWRbeKbum6kI
 wfZmNmhORa8kPH94X6D9G2EQdALUHHuZ/gtEWOqJ1FX/cCJjJaiNmALsLpBfh0iz+gz+
 nV1jN4SQadK1z9Dnx+jhOBYbpj18fcU/GajMF9UFaK6JK2XIceyfHcElPqYKE+2hFzf5
 iml87jETs87ng/fBWq5x882GlyXVeruUfqexwWz6AehU9B+za6UlB8fYmGBUOB8Wc+mk
 qtQpWnHFJoqNYSo4TpnuVtBOsnllGBOkKHRGCJNSO2VNIq0PtaHkot6o4nr66TG/+x5i
 oMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dBHnyL4EFazciHWW+mpVyqetqNYC5psxNZdbkggYfNQ=;
 b=cQS+bnlYzrDtUNPxjGFYj7kMtwgVy1spxlhbMsXhUIGpj0A5phLPJxyTzOAent7PsU
 NMMFEcEW6ZIalMmwqxoHg/BV0EXeMmFVmn/x4J6M6/dLASDdUa29+MjU82T/iXKCZHlh
 mtUUERtIoQxis3CHw2Gr6nRaxravDe3aOil8S37I/Gpggc4OojhnEpiHQDNqOal2UvGS
 Vo4Gxni8X/il1z1BCkt6kVVdqufm3uAmixNOYnKSzQmtDKrBvhRvCwaZeMbYz96sP6Vd
 n17iswejAeX00GAatxG/qoexV8+qGhcBQBtMpnzhZ4f00K9txVLloIEn/MKGTJWSw60u
 Sl0w==
X-Gm-Message-State: AFqh2kqEDECST7CBIvGq5qet7XE6/Y3iGMtSzryzyZ8eABLw1oIDwjU2
 yqqDDPFW5bKHLGLQQEQZJzjuPQ==
X-Google-Smtp-Source: AMrXdXvgh5bLw+U7AWgNXu9y0vcXylXD3AFEd9h7j0Gbx64odxFmBom/gEcNrzz5+Ya1nJ9Y+b+LQg==
X-Received: by 2002:a5d:5a1e:0:b0:255:971b:a40e with SMTP id
 bq30-20020a5d5a1e000000b00255971ba40emr14314936wrb.65.1671452358045; 
 Mon, 19 Dec 2022 04:19:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bu10-20020a056000078a00b00242814c2cf0sm9841526wrb.4.2022.12.19.04.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F4671FFC1;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 10/11] contrib/gitdm: add Idan to IBM's group map
Date: Mon, 19 Dec 2022 12:19:13 +0000
Message-Id: <20221219121914.851488-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

According to LinkedIn Idan works at IBM. Please confirm if you want
these contributions counted under IBM or as personal contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Idan Horowitz <idan.horowitz@gmail.com>
---
 contrib/gitdm/group-map-ibm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-ibm b/contrib/gitdm/group-map-ibm
index da62fa3f44..24d8dc1b86 100644
--- a/contrib/gitdm/group-map-ibm
+++ b/contrib/gitdm/group-map-ibm
@@ -12,3 +12,4 @@ jcfaracco@gmail.com
 joel@jms.id.au
 sjitindarsingh@gmail.com
 tommusta@gmail.com
+idan.horowitz@gmail.com
-- 
2.34.1


