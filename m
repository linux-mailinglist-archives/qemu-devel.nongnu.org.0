Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428B40EFE6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 04:58:59 +0200 (CEST)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR45a-0000cX-3W
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 22:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43O-0006On-Ot
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:42 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43M-0005kM-Qf
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:42 -0400
Received: by mail-il1-x12e.google.com with SMTP id x2so8734429ila.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mg8/owaJWUk7d8eG8OqPVqhzuQK5wP0+WRviF/JghMs=;
 b=liVf+pVYerFI1cMISusci287kQahPmh0n/PeRXcjDOaTY1eIJIOkGi0XOc4A6yoEvg
 TH+SeK/dAqkn2zHfX4siriqI0CYfRk16c1iUay7UmMxt6sZNqARpOUB3vqWSg8offRTQ
 lZp1sa7L8jK1evvEX3aB7o+V6pQWrW9stjMW32Yp9dNLjsw+L7SUMRwm5hW62Ar+n2Vk
 GGth9mHZGxH6nSVjul23j03qhKYawgF3uaWphuj/F0X2vB59myqAqRLwLBSy54h7n4Fy
 hq4ndLrxSk8Y+kaBw0L+h0Zfz2o9sYwCkgDbiQwNU2nfe2bXknlIIw8J1WbjRL9yKcHo
 w9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mg8/owaJWUk7d8eG8OqPVqhzuQK5wP0+WRviF/JghMs=;
 b=D45CgNmB+A0S8kWlavEr+FrMTV8Ky71psoGU0DfMyOvsV5xYOHFjOZU8Wsu4oB9Koo
 LXU7rOEnOZHM2Gzb6qdwVNsLkGLwqhoCAStScnL3/MlX22Ub/Tmm5a6CU5Tqc1DJop4E
 zZgflNvrUN2s3jsPuXyseM4m+CgTMlsvIhQX6gmmiAcw+RXBVLXqAP4MaPZUDbTXoBkU
 SpMkviYJLAkV+fQLU4nnPZ1fV5y8314ROZjFk6Mh7uvahe3bVwruCqj6WS6wVkLqGIZE
 x+9uPHwTQySk6vYt+H6earMr6HV7Z4+ySSNGV4mRO1bVXG4O0h7lZ+d7Xr/OS5VhpbyH
 nDfQ==
X-Gm-Message-State: AOAM5319yuMZoq+nJdkIYa2/g41ZoUo8FUXlQg1TDLlKGTGAK+EAVJ4m
 Clogcb67utkvqz9Fch45jFfmHhOJVpZj1HeEdMc=
X-Google-Smtp-Source: ABdhPJz3Wbiwl5ZED6C1mzU4nbp7pwaI1/u1yypkgkB38JnC1roKL9dxaK9v1/4Gd9L8ycb8q6gM7w==
X-Received: by 2002:a92:da49:: with SMTP id p9mr6170022ilq.89.1631847398288;
 Thu, 16 Sep 2021 19:56:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] bsd-user mmap fixes
Date: Thu, 16 Sep 2021 20:56:26 -0600
Message-Id: <20210917025635.32011-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series synchronizes mmap.c with the bsd-user fork. This is a mix of old bug
fixes pulled in from linux-user, as well as some newer fixes to adress bugs
found in check-tcg and recent FreeBSD developments. There are also a couple of
style commits.

Guy Yur (1):
  bsd-user: Don't try to mmap fd when it is -1 independently from
    MAP_ANONYMOUS flag

Kyle Evans (1):
  bsd-user: Implement MAP_EXCL, required by jemalloc in head

Mikaël Urankar (2):
  bsd-user: Apply e6deac9cf99 from linux-user (zero anonymous memory)
  bsd-user: Apply fb7e378cf9c from linux-user (fix FORTIFY warnings)

Paolo Bonzini (1):
  bsd-user: Apply 86abac06c14 from linux-user (target_mprotect can't
    fail)

Warner Losh (4):
  bsd-user: MAP_ symbols are defined, so no need for ifdefs
  bsd-user: mmap return ENOMEM on overflow
  bsd-user: mmap prefer MAP_ANON for BSD
  bsd-user: mmap line wrap change

 bsd-user/mmap.c | 69 +++++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

-- 
2.32.0


