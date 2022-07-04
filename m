Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3AD564BDB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 04:42:49 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8C2y-0004fG-MZ
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 22:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8C1i-0003F2-4G
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 22:41:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8C1b-0005jb-Jw
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 22:41:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so12220042pjm.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 19:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqBwyQ/bLXR/nX5eIe196dy7W3woYx60NpMZR8oxKyg=;
 b=vZ5dIylrj5k2mKMdVeY0FwuL6Qzg58J2JS1VxCoAu0rm8hZCW1Cp8qmHGWKiDyuQPQ
 I7MUMUcqxvsyqqLWJXl4GWKWslLg1uHAI3ET61LuSKZQnuIokiIe1+Do8cYw80WETxzf
 77ncwEccbCEgKZoxDexfSOZN59V3jg83HuJ9kPyvoFoO6ojerBbWHW632DH8Ggb/ONt5
 HIov8UuY9gC7OldhK2mTK6ApejVShFXI1jcffvrwmWT1lsGjSw1s5FFyBxEzE1ML+Cfb
 Qr3IVbbbhcvHAWC3wI/3ho0Mw0prfJFdmnCuBtCDxZr/Vj0eRkexSvqSjX0TIycYHwyy
 vDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqBwyQ/bLXR/nX5eIe196dy7W3woYx60NpMZR8oxKyg=;
 b=KlYjO3IsjxNo6mKDHNepSjXyS3ZGfXs13ATslGkW4AtB47+MUT9uHFCwD+Gg2ATgJs
 WDpc3y1shSPn6Mt4ow7MuyLaIZgjwrs3fcSg4a2ZZlt90n/6XINV4Dtwzb2P6rUeruOA
 Ywnv1Io5jkUGaCDi7BUb29pX0zSbZ7GzGTnuPfxqneIk7Qjf5DowE/aE38crm63xOgJY
 y6kkNXstvpI1QgsJqJZJ+etcObDYFafOmmLqWv4JsNLJPeGcW/fxNwQtsxDe5bmKyOaj
 DkHmX7m970vtgPhguBbdoVDnizD4r/gBoKPf/5ZVyvbJQSvRnRLm6EQ/RxMFEWKpFMhN
 YrxQ==
X-Gm-Message-State: AJIora+fu5/0DZnzHGadRBCJdgGJvlsfEVE8mhlBgEC3o+G1GOtXfa6M
 jGbkIPQT63kBEXkvhM3VS/XWOg==
X-Google-Smtp-Source: AGRyM1sUiJFPOHqIDXwWWdOtN4MeO+q5kK6EoR7b5PehC1HHUOLiO13ud0gGKwu9tQGWgb2H3S6K8A==
X-Received: by 2002:a17:902:a70d:b0:15e:da68:b1b1 with SMTP id
 w13-20020a170902a70d00b0015eda68b1b1mr34202551plq.53.1656902480897; 
 Sun, 03 Jul 2022 19:41:20 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 c126-20020a621c84000000b005252defb016sm19756352pfc.122.2022.07.03.19.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 19:41:20 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v2 0/1] qga: add command 'guest-get-cpustats'
Date: Mon,  4 Jul 2022 10:36:17 +0800
Message-Id: <20220704023618.626849-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v1 -> v2:
- Konstantin & Marc-André pointed out that the structure 'GuestCpuStats'
  is too *linux style*, so re-define it to 'GuestLinuxCpuStats', and use
  an union type of 'GuestCpuStats'.

- Modify comment info from 'man proc', also add linux version infomation.

- Test sscanf return value by '(i == EOF)' (To Marc-André: name is declared
  as 'char name[64];', so we can't test '!name').

- Suggested by Marc-André, use 'int clk_tck = sysconf(_SC_CLK_TCK);'
  instead of hard code.

v1:
- Implement guest agent command 'guest-get-cpustats'

Zhenwei Pi (1):
  qga: add command 'guest-get-cpustats'

 qga/commands-posix.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |  6 +++
 qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

-- 
2.20.1


