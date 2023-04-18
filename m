Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764A26E55D2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 02:27:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poZBB-0005Pc-Ki; Mon, 17 Apr 2023 20:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZB5-0005Oo-LQ; Mon, 17 Apr 2023 20:26:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1poZB4-0005ps-8J; Mon, 17 Apr 2023 20:26:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so1434336b3a.2; 
 Mon, 17 Apr 2023 17:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681777591; x=1684369591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r+x/xa7lvEVaub6vFrNHCWKmAJlLghtfnSoqICQcnfc=;
 b=FRzeji8hQHSu05Ip483i5XVRbsgbfVMC8wp7l6zWOK3EKEs2tJxn9qRhoWEVojCe2G
 pEU7TgxW7+kZL4XtTQ91PnnpZEfT3I+n043A8aF1MOnK0xK+TJ1JzknF/sbkUmYG+fAC
 WG1rR1URZR2Tg3vy3qhvTdLjHcFqhuZVq2yaw5/zB3gdiuZS2+JUdQZgzJOm04OCIgDC
 G0EpqfOrYKf+FP8lvPIW+Un+xy+1CKXxmr4IZsXraU+d6GWu5XdZEgI1RaBbvOmq3NH4
 rr7cDohcifAStYiIxKTglqocuSgHk1qbnoICDSLL9Ph/X7NGevlprWX6TBRRN2/X/YZZ
 1OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681777591; x=1684369591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+x/xa7lvEVaub6vFrNHCWKmAJlLghtfnSoqICQcnfc=;
 b=l+rQ/wVg6zDRTkxDWM6Bvg0PFPne2vHjprjel+A7Mp11sXS4FtqUuyFXIUHm0w2wYX
 tB7MRgb7wZ71gall1AP5U6Q0e0tXEdjTGHYg5tvjAm+ffVEqIPfKnL5MX1rVFXvBmLem
 3veZB76A9R4mqhDS1Eb8Jjc42o81jZXPcayx69EOK7dyA34QurkZ9ZEOBMzObC3R1aVI
 yGkODfra/QaRmoSG2ehl+MSbF+rAA0uSQSX4czzxN58lj5Zwzet5wQlpvyDWSkjqFupr
 zhqWAf9TAKdo3Zeu9fOuGSS0gpICuF8t3JZDIEakUpC2TDZzNQov/klJU/da+gd4jAco
 v0Tg==
X-Gm-Message-State: AAQBX9fl+NcoMHIlDme9cP0d6wslqkG4rQMI6Q6jr8j6EXZSql1LtvNI
 WqadeJBSJGIBNq/svAKTWBpHqFuVQRM=
X-Google-Smtp-Source: AKy350aASyg/0hcsjHmczpj56Cpiih4QeDS/32wn+0/4PVRd3BsbdspY73xrHNrSApRDhSxv4IFM1A==
X-Received: by 2002:a05:6a00:1821:b0:63c:6485:d5fd with SMTP id
 y33-20020a056a00182100b0063c6485d5fdmr7056233pfa.2.1681777591444; 
 Mon, 17 Apr 2023 17:26:31 -0700 (PDT)
Received: from localhost ([1.230.133.98]) by smtp.gmail.com with ESMTPSA id
 d8-20020aa78e48000000b006352a6d56ebsm8122694pfr.119.2023.04.17.17.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 17:26:31 -0700 (PDT)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Subject: [PATCH RESEND 0/2] hw/nvme: COPY fixes
Date: Tue, 18 Apr 2023 09:26:20 +0900
Message-Id: <20230418002622.29819-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix status code overwritten issue in the COPY command and a trivial
patch to check the Maximum Copy Length (MCL) for COPY command.

Minwoo Im (2):
  hw/nvme: consider COPY command in nvme_aio_err
  hw/nvme: check maximum copy length (MCL) for COPY

 hw/nvme/ctrl.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

-- 
2.34.1


