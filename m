Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0D629EC7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouydM-000789-Bu; Tue, 15 Nov 2022 11:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd3-0006wz-69
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyd1-0007OR-H3
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:17:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so25103964wrt.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fO0NkAPmRiMNRQMVdqcKFmcyhZDuyLIOF0Gj71kORx0=;
 b=atWVjjekIh1VoBlVthqJ/fbFQhaGP00WuPMbOuhmkvZoarH7WrV3OcaUITQlaplV+4
 b/Kn8UVRWu3IwjaGOEasBQ8tp5UN+tHfCpAqtRJHCtrRD8yxxm3Bqf4I1D9lu12avyQV
 ryzb2DLiAVond1jCyUlkRxGcwru9BKCnVbxByTmx8PaesqaqsJ0ZNpY2BMzwZQcQRZDK
 Bvx/7tPJvpxWFSN/M655gABB6aoKQavyasJuDVf+HsRbmSlEQYBMQiXurnzOd3ppuMmF
 /LCrLVzUDgw3SLsktSdBbXRNai5ztQTGVjpoydd5NAqhd4doeneipfa590XndENHbAfy
 pboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fO0NkAPmRiMNRQMVdqcKFmcyhZDuyLIOF0Gj71kORx0=;
 b=UFrm3U1wBxuW3FX4/rpbts5X5tgzX6gjG5jPi1fuXr1i3GnHUs90U7BSSQksnVBPJi
 eeIgU8IetxG68ytBLyYA+x/zyXjPrlEL3uGrJN+I7z3iyQPXua2zljJ7aa1Ts3xUt3vR
 +S3VW99kg92sCJyE5DWE4draEdLV0Juidb15IH+D1YMuoRjkNKNwYGbU9GTiEyXh6X3S
 ZHLk0f/XA/mmRxoAjz4jK5LKdbggaMm7KPV7ZZvTuFt61HDDfUVQ/WlkhTmS2xESxzKo
 LfW+4YcEWBCy+81cL6Cil2jZFJbhhAACk4F/wg+g1qFOc3gFvYdn0zkj1A2VcRTl6rGk
 Azcw==
X-Gm-Message-State: ANoB5pk4s/NQOxZE6/4rybwCNSINCB7S977vnqO/Ny/1gxEYbDI/7qmI
 cdaYklNgy9hu7VnnUsCG0D6HPQ==
X-Google-Smtp-Source: AA0mqf5uQ2r0rIyaN3F9v4o+bGfBvC23zBy7v+Ik8k2XJBz3bDU9W2+hqHK3+VHCeGfR/ReUqIX6bQ==
X-Received: by 2002:a5d:6dce:0:b0:228:da80:a902 with SMTP id
 d14-20020a5d6dce000000b00228da80a902mr11352298wrz.177.1668529057651; 
 Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003a2f2bb72d5sm27892688wmo.45.2022.11.15.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:17:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3D991FFB7;
 Tue, 15 Nov 2022 16:17:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2? v2 0/2] Arm GICv2 fixes
Date: Tue, 15 Nov 2022 16:17:34 +0000
Message-Id: <20221115161736.2425584-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi Peter,

These are the 2 GICv2 patches as you suggested in the last review -
this time with an updated commit message for the second patch. I don't
know if they qualify for 7.2 but here they are if you want them.

Alex Bennée (2):
  hw/intc: clean-up access to GIC multi-byte registers
  hw/intc: add implementation of GICD_IIDR to Arm GIC

 hw/intc/arm_gic.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

-- 
2.34.1


