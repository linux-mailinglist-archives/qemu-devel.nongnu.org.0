Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76D370E2A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:19:40 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFkp-0004aw-H4
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF85-0003Yj-S5
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldF84-00062l-Bm
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:39:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id h4so3105188wrt.12
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qIBvlSGSc0QgPCjhRIKTt6O6Yj1bjLUHeTUC03LKkc=;
 b=mJTiErZ6RHYepmnJM5NcrgffaZ7OXZmLuMty99n1mwy1AiKlxW+jsZjMGIY5x7bIiV
 JF9DShWBp9/Wmx2JigbrvEI0s15VX6Cn2k0VWyNu2WZa0aDSp78pPcb2pg6Dug4oOlxo
 tO99EFAWszT9pQkyr5B11toqWX6avgEDFMhLuFG36WpsUi4zOVyDgLPLV9zc68bhbWUU
 k1Bf9EiLxbPcWmsSDYYLJm7lP0gYCXkZV+fjq1Y/9HxnQul+1gUKPvitMrq+1d0Ot1so
 o+vPgPagSt2RlkuiEp0dbPHF9z3yqCxxYTcxmQlk34RcBOKyiYBdOBqOtYC+/S6VVAwH
 DJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+qIBvlSGSc0QgPCjhRIKTt6O6Yj1bjLUHeTUC03LKkc=;
 b=hntr1o/v2R5lt+DNEMMyZa57M/j+9p58+1tirpPz9fA8J6CP6PfWWqMMMOY5clvh+X
 kmBtQ7868TbHqaD/eg1yLr7kOKWoi25ytCDVzJIRY5qC4UjEUmn5sFg0PGyNI31pSHs7
 r0RxO8W6WdLpZX+fKH9nAQ6+sMQsM29nUdH4GV1ZXW1f02a3mgBDkeENyLIhikGXkOAN
 3eUb4HBnJzWz1zHKDWY05w782VoiREh9AXDPe2XLttj1ClPLhNQzJiikm30uaG5dcFhE
 s4zXE8/bKJ62WsKB9Lf7RtvdKHQMS8BFpEzw5EFfunDN6qZMI4MSGM+lybPYKy623Km3
 HE4Q==
X-Gm-Message-State: AOAM530T2ESxfay6F9g8+0CLhHaGEyaRuUGn1CW7WpNSZuu9VOaTEHLo
 E9f7t+ARJESMMT7QhxZ52nbRyy3lYkpkz1z2
X-Google-Smtp-Source: ABdhPJxjh+2wRNRVDcwwM+0baOqoZPizjNtkH1uwG9s9gKkXoea3sP5O8MWpUL8cW28oR/WP3R8BZA==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr8027928wrr.111.1619973574025; 
 Sun, 02 May 2021 09:39:34 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x8sm9400727wrs.25.2021.05.02.09.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:39:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw: Convert mc146818rtc & etraxfs_timer to 3-phase
 reset interface
Date: Sun,  2 May 2021 18:39:29 +0200
Message-Id: <20210502163931.552675-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove qemu_register_reset() when a qdev type has a qbus parent,=0D
implementing the 3-phase Resettable interface.=0D
=0D
Since v2:=0D
- Lower IRQ in 'hold' phase, not 'exit' one (Edgar)=0D
=0D
Since v1:=0D
- Use 3-phase reset interface instead of qdev one (Laurent)=0D
=0D
Supersedes: <20210423233652.3042941-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/timer/etraxfs_timer: Convert to 3-phase reset (Resettable=0D
    interface)=0D
  hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable interface)=0D
=0D
 hw/rtc/mc146818rtc.c     | 42 +++++++++++++++++++++-------------------=0D
 hw/timer/etraxfs_timer.c | 14 +++++++++++---=0D
 2 files changed, 33 insertions(+), 23 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

