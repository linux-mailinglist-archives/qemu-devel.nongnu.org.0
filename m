Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5896149D354
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:18:16 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCokB-0002rk-E9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:18:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogy-0000AV-ID; Wed, 26 Jan 2022 15:14:56 -0500
Received: from [2607:f8b0:4864:20::c36] (port=45805
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogw-0005cI-CS; Wed, 26 Jan 2022 15:14:56 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so169091oor.12; 
 Wed, 26 Jan 2022 12:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01fAj0DuhKkW/8EyYTNz37BAXnZ9WekFSVQG8aKy/5E=;
 b=NIFSvRX2xWIdqN8YiHf6qfjMBTprqfi6eSGZ5HfibnNE0h2B7OynwYFS5tBGGycBUL
 7MtNmixlLu9zVFCJDgNvElvOQgbDIxFdKP1KSFrvq312rjQt65nobZv0mBkDrmj1EJB3
 FpIR4LtVYJ9AB+SxbJ5m6RIRmppy4uJABRCPc5ikSy/BowLdoAD+4F0OPA3OyINzMXUn
 raAxftprXHSMjWTIMyH6qrsctL6Fsi6FCjtPkyN2SC9bRfY9Hi8a3qNUiYj0Td7Z6KKa
 WBGjkO39eDH2N8QyKDQDSlDy7HnHJ1hJQfb4mNcesxDuCrUHvWEy+5a1nRIxypj4LFp9
 JnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01fAj0DuhKkW/8EyYTNz37BAXnZ9WekFSVQG8aKy/5E=;
 b=Ts62ETu9NY9c0jZxJjo7zftOjBPNEcVaiMcA6KJpXjXC26dzBPPGCM1bMPWD35Mh2y
 dm91CgZI35S93DSkrqoS+M7m0pHUYkHOJt0IWofBIwiREYVmUkfGC5gx/AJpAv3d7w49
 2SSCiu0tkexAFW178BpmXu5+q3pY7V/beOucJkNUx+qVfPoz4DBl9/KcHFgvgrqc+Zuc
 HtnvEVwGQeu7zyiRIX4W54oIDhKG+otVD38QRxbkKeFJcTIoM/Sd7/3RTXeHN2MJznqg
 vyClVxfh2/Gz6BGS480Ll4XVJkkg27IlXYr9acOTw43aBh+egtrO9g0zEJGymyAuuolr
 7nRg==
X-Gm-Message-State: AOAM5321IOQ3GwqIAyFUMHnOhKf/7f34SbZGUHbIkjP6c5hr6GbtotDG
 YX3rWkg+D2d/tT1IXGe07cdhmMRbA0A=
X-Google-Smtp-Source: ABdhPJx9YybC/qGTSocsV5ZkCXd6RZHc6xi3W91ZZTwJr2qPWM1nZoZn3K87ZNEjIu9dy1FNSjkkuA==
X-Received: by 2002:a4a:a541:: with SMTP id s1mr360616oom.49.1643228086730;
 Wed, 26 Jan 2022 12:14:46 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id s11sm5587021otq.69.2022.01.26.12.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:14:46 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] use a do-while() loop in pnv_phbX_translate_tve()
Date: Wed, 26 Jan 2022 17:14:36 -0300
Message-Id: <20220126201438.822457-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This second version implemented Matheus' suggestion of using a
do-while() loop instead of initializing variables.

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg05475.html

Daniel Henrique Barboza (2):
  ppc/pnv: use a do-while() loop in pnv_phb3_translate_tve()
  ppc/pnv: use a do-while() loop in pnv_phb4_translate_tve()

 hw/pci-host/pnv_phb3.c |  4 ++--
 hw/pci-host/pnv_phb4.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.34.1


