Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23C2F0865
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 17:29:40 +0100 (CET)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kydb0-0007ks-AT
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 11:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZE-0006PW-1X
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:48 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZB-00055r-Sd
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so13958482wrc.4
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5sBJ6qHYMgl0aQ6BjikwmI/1EXpvh3CReocM7PWJU8g=;
 b=BDvj3iC/LLhBO1RMMRd54jThMZFjo99kY2GG9hKEMXgOnHD4xEvx29zUmF1BijMmOt
 OuhOmpeu28ngc1mDJI0G/9OD9qbj7rar/F0heoNI+Z0hBMUqaNNTQDITK13Docst+oRN
 Yu6jYyI9GJ3W8oVLPtEbXnDXNw8KvXMJ3Q+ObuYCVl+yi73rRAXleRB5HT5ozUrRI95j
 3c50IvcEJO8K6csc/CsPf9EozC6XOBXO+k/MW0DlHpQjk6WgDccxfx1uBzBFKq4zbzQ0
 8dzcpelNXiZcK7LAJcrgqikx4M+9aRKiFjbG0pjq+FnEYVRoGRqWkpotVII0WFdNF1q/
 VUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5sBJ6qHYMgl0aQ6BjikwmI/1EXpvh3CReocM7PWJU8g=;
 b=giMUn/h4KlQIJwcTnlBzVX7u16xeoa6A2SYo++FAYohjobzNM1WYO6nZ985OjRT9s7
 ByByPS1Dk3/GWcOg42RJhDuTh9kiZxcGQMjYr1/MTW/98K09dX5KRbP6+GuJZYFakxTd
 6oJwwjSKAbJj66MZukrA5oYqOKf5AzL3ZGjjwJR0fCqEZNhAesqXVF0UBP7NHDJcxWdm
 qkn5DYn0bcF2NyTG5CPhvtgDlFFtzkwIOU5f6v4IibBIrgNgryO1hyZ6o4QRxN4SYTBG
 YlIb8qxGKRtNkBsGPja528SjIk4PAcm6/2Hl0d3kPrZJCJJ6EOIfKMeCn3oAdkP10VV8
 P1Tw==
X-Gm-Message-State: AOAM530F2EC8CwtB+MClVv6oFXZDex3da3UluqMPwOJFmjfaRmSVpkBV
 FbWGjnepmhOBBUMACBoyAByLlAJAxEY=
X-Google-Smtp-Source: ABdhPJyL4R+poCmOFsvqJyTyctDC2kouFQU/d5b5fcJ62SZZTlVcLHFDTBuMDVfDUvVHFAN/MVDgCw==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr13257167wro.338.1610296062522; 
 Sun, 10 Jan 2021 08:27:42 -0800 (PST)
Received: from localhost.localdomain (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id h4sm20413792wrt.65.2021.01.10.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 08:27:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg/tci: Fix Clang build
Date: Sun, 10 Jan 2021 17:27:37 +0100
Message-Id: <20210110162739.858087-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the build failure reported by Wataru Ashihara on [*]=0D
and add a CI test to catch future problems.=0D
=0D
[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg771326.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tcg: Mark more tcg_out*() functions with attribute 'unused'=0D
  gitlab-ci: Add a job building TCI with Clang=0D
=0D
 tcg/tcg.c      | 30 +++++++++++++++++++++---------=0D
 .gitlab-ci.yml | 22 ++++++++++++++++++++--=0D
 2 files changed, 41 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

