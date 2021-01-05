Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0C2EB24D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:17:22 +0100 (CET)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqtV-000864-Qj
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqr6-0006VK-Dt
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:14:52 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqr3-0005Xr-Ud
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:14:52 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id p12so41310qvj.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQKd8zLnocjvv3EBs5m/wd2K4OKGJ5lxkG3VzrtA+HQ=;
 b=Wpx8E82jvuPw0RpkHhX/lfiLuAZWjjAe+QIcu/GHbdpVIgqFioeo5UX2OBemWwmvGD
 zd7G4eYEfvE00oN8e0WUPXKmfhhcS5DRUi1+TYuUIE1LEkZVvHxeZFgK9ID+XyUgM1yt
 fAi1Yh8rIVTwJIOy5mtfst+YLsiE35VYzJUB25m5L8uoPSd3a5N4LIA5Gq77sh54JciJ
 iGExe6+cA8zC82CO+1b5FNtEcJnL1x69LHGI5ETG8Y6H6UbBZ18vo6FY3uPuSR25iO64
 sK3DZYdP72gWwQZBbBPGqW0o/VEaxct0KAjNk/j23ALr8XhbhbLBtkne+lQMopjFRiae
 ucUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQKd8zLnocjvv3EBs5m/wd2K4OKGJ5lxkG3VzrtA+HQ=;
 b=MQ94Kpx30+imsDg2AUiXJMvfnsOEAdKOVrf6CnJJHnECzacQzDgNrXO1surn+L7Dio
 TO0XF6zhjAD0HIUWDTGAlrGxPC37UzJ/i/tqkOU/5LRUwGU0thR/1NkxDZlmV/HQypgw
 t6b2iFVvJoeWSuwQLCL+rurTZbTbV01GPRLGBE9kB7wFpFlChHKKaeJVhItJoXkirhWN
 DQoYadyY/alX+ktMdFoIsWcQysl1u7Nr/UqHq0xiFV/05JhJPTBzwj2S2vWP8MIJiY65
 IMTtdbWGAD5gbn079bNU1++m/7Funv4F779v99bEzmmzclfZEM8BtdW7wYc4tdKfjEnS
 xgrQ==
X-Gm-Message-State: AOAM5314XRV4vm5sEQWXdKKgGO6ZhnUBXzV4nbz4EXAZfcF9TRcy3sfN
 nzBa3FrGLkoiamjocuW4lyA6yZY2B3ctog==
X-Google-Smtp-Source: ABdhPJy2GjEVITHFtghDlvZ9O3z0eMM3k9J7CmNwhp+u8voHJPdjih0RSZ/5WXks6h2ItvGkzbsq/A==
X-Received: by 2002:ad4:42a5:: with SMTP id e5mr760116qvr.37.1609870488622;
 Tue, 05 Jan 2021 10:14:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:63d2:cecd:bc88:6607:5111])
 by smtp.gmail.com with ESMTPSA id k187sm481229qkc.74.2021.01.05.10.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 10:14:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] vl.c: fix trace backend init ordering
Date: Tue,  5 Jan 2021 15:14:36 -0300
Message-Id: <20210105181437.538366-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from v2:
- fixed a typo in the comment block
- added Paolo's R-b


Daniel Henrique Barboza (1):
  vl.c: do not execute trace_init_backends() before daemonizing

 softmmu/vl.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.26.2


