Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028BA4C5AA4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 12:35:21 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOHpe-0004Ha-IL
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 06:35:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHoH-0003Wg-J9
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:33:53 -0500
Received: from [2a00:1450:4864:20::431] (port=35445
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1nOHoF-0005rg-5g
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 06:33:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id b5so11244300wrr.2
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 03:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LN7upLvhA4bzyltkMAiFVLaXA2hEq2Rr6utWhqcRMI=;
 b=H8mlj/YOQOwlo0OeVzLWTxc/6DyUaN9rOYOWsD8WpXkI5FkjPPDK6wV841j9rzUJrm
 071UhPhY0Fixeri3ZPlTw8c19LbzwWEDboIbwAN/zZMCCQv0G0x+75UngN7obmOmBrf+
 RRMpqySqover70dCPhE5pIGbLxt+XxR2dxyVRQWov+CVOMg+Pm4qvDDAAexU3TNOVcVz
 4QDJiZc9Gl2sh97cglLTulgVABGTZDxPHetpg55VvdXLrPPdUmv9sootTH/1WXqNqJQx
 2xzmGQ97HTbV2rw4Ti6dq+i38ntL+ljrM8qu9SRTIlZwj1kzJs4YjGJ9JOunCyOXzQUg
 wKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LN7upLvhA4bzyltkMAiFVLaXA2hEq2Rr6utWhqcRMI=;
 b=D8k+m3NpqbDSX8JFeU95uNx5f1wMesRvezZVyEN0ftDldyQfI2x6N2fIS/42E6WK24
 m0qQ+FGyDROUp5wczzQwCeR23SBgOb0/r5IEoNKRgJdHlXSj5X287EM1US6xD065VGAs
 gCET4kxMzRjgD4A9PAU/pFZLHgYvbl81Jpi9X7x1dVMWYohv3txwtZFlyOdUKexcqj+V
 UqKKQA+XX8n9fP2URiUjdln4Y1PZm68CfQISUwf8pjsnRuwEilvpNPQRx941MXIQ/Xdh
 Z7EhhQVbv+jHSgVl1ZrHRdrbnxyHH4f2pw+ZC/abuoEafmVMwut8jNr3Jlig3GpXsyTr
 UuVA==
X-Gm-Message-State: AOAM531uyOtbZI6VTSuZNMzkrzGB3eOfWrAkzlxXkJYLZHoLsicicCKA
 E/I2uVce9MNZnqeuKsoNCyiRYc688ubrMQ==
X-Google-Smtp-Source: ABdhPJwz3LnPYgrltoyKB3yTwxY57I3i5MQxwNUsOeJ8zqWbmKW014DPBjcNWgl7uLnwVIh44//Wbw==
X-Received: by 2002:a5d:584b:0:b0:1e8:b478:ca0 with SMTP id
 i11-20020a5d584b000000b001e8b4780ca0mr12198317wrf.377.1645961629439; 
 Sun, 27 Feb 2022 03:33:49 -0800 (PST)
Received: from station.lan ([46.140.159.18]) by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm7776956wrj.76.2022.02.27.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 03:33:49 -0800 (PST)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] Fix MAX_OPC_PARAM_IARGS accordingly
Date: Sun, 27 Feb 2022 12:31:28 +0100
Message-Id: <20220227113127.414533-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ziqiaokong@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: sw@weilnetz.de, tsimpson@quicinc.com, richard.henderson@linaro.org,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I notice that in the patch here:

https://gitlab.com/qemu-project/qemu/-/commit/5d6542bea780ad443c4f7f1496e64706101f525

The MAX_OPC_PARAM_IARGS was not updated as this path did:

https://gitlab.com/qemu-project/qemu/-/commit/1df3caa946e08b387511dfba3a37d78910e51796

And thus this patch fixes it accordingly.

Sorry that the format of my previous patch is wrong.

Ziqiao Kong (1):
  tcg: Set MAX_OPC_PARAM_IARGS to 7

 include/tcg/tcg.h        | 2 +-
 tcg/tci/tcg-target.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.32.0


