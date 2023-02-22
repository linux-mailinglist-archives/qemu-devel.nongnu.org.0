Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C288569FD93
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwQC-0000U0-OO; Wed, 22 Feb 2023 16:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQA-0000TS-E1
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:02 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQ7-0005Bn-HK
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:00 -0500
Received: by mail-lf1-x130.google.com with SMTP id f18so11798903lfa.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+8h4YGgnKZnL9y/e4Cj/Uj4Rec7WyQjBeNV+uwigNHw=;
 b=uqSzsddgJO7SJUudt6JePShtTnoikzaUtVnF3X3AWC1QwBVBLeuZncryFT3pcD++23
 lLuE1Qc3WWAq2EI9opD/0Ox2XkdJtt6iXWTKORJTvL0ec/mi4DYHFcHaD6noubQXLUY9
 eA5RcUr3Hs2hbL+80/0atKs3kSWlC2RTLGQm117x7juk8yEj6dXDolSXr487F8vzc3pn
 0KgPv/te4cgMBe2/UToJ8qc9XG3LRX2j1SSBFVp9I7ttxEXP4Y7At0YKiP80cypTcXou
 Rh/Xp2kSIkSDFAKkgYsoo6EFFepxOVGj48f+UNwDWtW7zfBU+zn9+TgJcdyv9f1ss7bx
 DDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+8h4YGgnKZnL9y/e4Cj/Uj4Rec7WyQjBeNV+uwigNHw=;
 b=K4SeeUAvX1vV+SQlx3aCQ6A1Ua+2PhF52nmF9+K1443u27MOo7GiC+5Y/aa9bKGVZg
 Hh/T9TmaZ1rGIO5KNoACEoM21Ri84gGMLSLBiq+63/kTu38iOL7YERlkHcqeVOPoI6ku
 6jwlETsAhEMUTGZaexuda5NtMfA8cm58dlTEpwy5/oTz6nJU/sVKIX1YnifVSGZX+L0u
 AjEJbucvS9tvAFoIp70wAWhyEoKcHyqEhDpndFtnodBXZPBXpw0XMXxsGX+beTly5U/u
 Z1uiZEfaKW8JeZOucMOjcGC+SIXz2PWxfZxL21GUAa9s1s6HuUGVKNwTKhegkoyG6u31
 nmxA==
X-Gm-Message-State: AO0yUKXYgWGZRf51ZZVwE/wo0LFT8q9yB07WBe13LjyLFXD4A15ElgMD
 LPHi28902eCp8W9uYh6TmQgazQ==
X-Google-Smtp-Source: AK7set+Zbcu7ebYlAmcoODl7MY27+MQbA2kzwlb4i/QcS72SVTI+EkboUbwtZuRaeOJSBkafprgh7A==
X-Received: by 2002:ac2:4474:0:b0:4a4:68b9:66f3 with SMTP id
 y20-20020ac24474000000b004a468b966f3mr3542337lfl.62.1677100376784; 
 Wed, 22 Feb 2023 13:12:56 -0800 (PST)
Received: from vp-pc.. (46-138-232-132.dynamic.spd-mgts.ru. [46.138.232.132])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2558f000000b004db0d97b053sm330068lfg.137.2023.02.22.13.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:12:56 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: annie.li@oracle.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v2 0/3] contrib/elf2dmp: Windows Server 2022 support
Date: Thu, 23 Feb 2023 00:12:43 +0300
Message-Id: <20230222211246.883679-1-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi,

For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
Windows Server 2022 guest. This patch series fixes it.

v1: improve code-style fix
v2: don't remove data directory entry RVA print and DOS header size check

Viktor Prutyanov (3):
  contrib/elf2dmp: fix code style
  contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
  contrib/elf2dmp: add PE name check and Windows Server 2022 support

 contrib/elf2dmp/addrspace.c |   1 +
 contrib/elf2dmp/main.c      | 108 ++++++++++++++++++++++-----------
 contrib/elf2dmp/pe.h        | 115 ++++++++++++++++++++----------------
 3 files changed, 140 insertions(+), 84 deletions(-)

-- 
2.35.1


