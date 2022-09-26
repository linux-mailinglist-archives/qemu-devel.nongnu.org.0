Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D008E5EA823
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:15:19 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocotC-0001pf-GQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoRB-00052p-Lg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR7-00071b-W9
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id iv17so4532556wmb.4
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0V+KZsCCESnUWUU0eYzHN1+b3vhEj98V7+Dm8NfcqyU=;
 b=MtU5+bVV+DBJ5tNYcAvuw5JNEcoAvjkIV2PZp7hqirjSQl2XifwAsrkDZtj1TlzKf2
 k4IcyPptfcoMxaSwd8OWLTzFap1LGW44LEx4xwbCnQscNITldRsNqArNE9xTXX8wVVB8
 g4xk2mEvVBkyPPDAIOx1o8txD4DLgAzDVtFWvRuY5KLiarORgE69OuJkQljm2XmpUxn9
 I787Q2dbdCbc1qn1m5uEmtKT7CpMqbyPQKZgm7UFbkSBD+koR+JyDC6y3VPSfRBbdiVR
 7lyTtIM40NOM482IQndXAUVzNvJWlU946210MrgObrWKaRKpFb2SB111H0Xon89wnTrc
 EbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0V+KZsCCESnUWUU0eYzHN1+b3vhEj98V7+Dm8NfcqyU=;
 b=U+Wi5wPv2P6N1vUF9py6W/8U3rmUwZeEttUf5xInni+sxeQL5+7OWiU5z7IxOXV7qN
 qO0gVVRTFh5OeMGkDVB2SnyTIOmbFg6K72toVYE1MngiZ42NhtKDtmibzFzLVEvKvG4r
 /PCWpPIxWQ8fbH7htDFCxRdeCUBcpy/yE7svpzViLzCqb8puezHDrSZhMUcxVIwS2NG6
 4mxH4VOIDfWK9S8eC5QcR+VVRZGGJaofsiD9HDCWdpqWdV4/l2rTn3SEAYfybxYjpwM1
 U8c7kKNDaClf+zN9tsY0pM3Ux0de+cwm/eZOf3lA8FY4PSo1MKJPqhyD8oAAvcnlKX6n
 LzGg==
X-Gm-Message-State: ACrzQf076HyUJy1Fyew6p28YGWGRayYi3rfJ9pcaMw4jCWOAh35i6nUx
 MbYYySYdg8tdyactUb2af9AIFA==
X-Google-Smtp-Source: AMsMyM7emwUkkeSul0ydX39Sb8IqQNyhs+eNmxu2k0Ud9FA2jHUd5Na3o9NWlu2vv1ajpqiZX+wPzA==
X-Received: by 2002:a05:600c:1910:b0:3b4:bb80:c951 with SMTP id
 j16-20020a05600c191000b003b4bb80c951mr22665171wmq.81.1664199976602; 
 Mon, 26 Sep 2022 06:46:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003b47b80cec3sm11941446wmq.42.2022.09.26.06.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B4D11FFBE;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v1 6/7] =?UTF-8?q?contrib/gitdm:=20add=20Universit=C3=A9?=
 =?UTF-8?q?=20Grenoble=20Alpes?=
Date: Mon, 26 Sep 2022 14:46:08 +0100
Message-Id: <20220926134609.3301945-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

again to the academic group map.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index 877a11e69b..082458e1bd 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -22,3 +22,6 @@ bu.edu
 
 # Institute of Software Chinese Academy of Sciences
 iscas.ac.cn
+
+# Université Grenoble Alpes
+univ-grenoble-alpes.fr
-- 
2.34.1


