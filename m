Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39474BC6EB
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 09:14:36 +0100 (CET)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLKt1-00035u-KE
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 03:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLKop-0001U9-T5; Sat, 19 Feb 2022 03:10:15 -0500
Received: from [2a00:1450:4864:20::335] (port=35599
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLKnx-0002e6-Q7; Sat, 19 Feb 2022 03:10:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so10172527wml.0; 
 Sat, 19 Feb 2022 00:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGjXls4ZVWxXVVoUMq4FbJvgFu0puPO6O0/ebPyr/50=;
 b=a7RGCri18MVjel/dr1ih4ykvPFqu8iJYxMvrqTIWUc6WGtkBILPyUp1QDDvOCJBGVg
 HFfeVHoJaC8HpvpdAdCZvFGiJmfUDpytq8IfneLUdHxkClC7Vff+uziRkAAsOumCIJdY
 X21k9Rpw99oss57xBj6ce/2Fm+P4FHrYXCz4hSMEGDqCjglF0Gcrzcu2RV4ryD/9CEAj
 9AlRHHCxKLlTIwzzYlew3V5gOB2OJaq5ngrxP/ANbEVqVoo+Xiko1GONjyoEG/P48cxR
 fULRE/3vDdr4ki+Mg2fdq2FH40I+3rUDNQlw8QpcDm1h8A5lc0FSYJhyKsFSpRJjtkaX
 VoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGjXls4ZVWxXVVoUMq4FbJvgFu0puPO6O0/ebPyr/50=;
 b=gh5XE56qm/U+2j5oe/GQT1vXeOP34gpf213xVAvtAICiNhqPSrs+vUWz3pZOLBsUqV
 4UTNSMYAN31QnspgNFf2Xo4jAAj92tHL865wjtLviR2S+TfAqVYBmHDgcyeZzp/LW0Cn
 Gc5PniT0uspcfMTWcJVQkS4H8px8uRF2+Qyls+3fgWKVvkRwjj0vB7WxEmytiX38kiLP
 Y+k+SPgQu5NN6oFzp7REjfO8YIkC2j3nSywmP6UqAufANNUQisokNueLCBm/rZz3cnbm
 QeivMjQghLzV8Kem5mTLGMxG6OWJ90J8t152cJaOuGOsKkAuNZmuolqxW46YA8eUGiU0
 d0+g==
X-Gm-Message-State: AOAM531+R56QziKo/zfnFv7jtz5BDKFL7c2wjwGLyXToZixCK9aHd9gW
 4xooz/ne5t6dQYFujMKGn0UWBnNZjgcvmg==
X-Google-Smtp-Source: ABdhPJz3MVPwNtMHvFg7SvMcwftePP6cU/CeZARFNX9J3FmZK+JG/GvyYZF7NivnBOB/PzMUCv/93A==
X-Received: by 2002:a05:600c:3d12:b0:37b:ef1d:7460 with SMTP id
 bh18-20020a05600c3d1200b0037bef1d7460mr13385548wmb.36.1645258159414; 
 Sat, 19 Feb 2022 00:09:19 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id 12sm19940719wry.111.2022.02.19.00.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 00:09:19 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] hw/ide: share bmdma read and write functions
Date: Sat, 19 Feb 2022 10:08:17 +0200
Message-Id: <20220219080818.327683-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a preparation before I send v3 of ich6-ide controller emulation patch.
I figured that it's more trivial to split the changes this way, by extracting
the bmdma functions from via.c and piix.c and sharing them together. Then,
I could easily put these into use when I send v3 of the ich6-ide patch by just
using the already separated functions. This was suggested by BALATON Zoltan when
he submitted a code review on my ich6-ide controller emulation patch.

Liav Albani (1):
  hw/ide: share bmdma read and write functions between piix.c and via.c

 hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
 hw/ide/piix.c        | 50 ++-----------------------------------------
 hw/ide/via.c         | 51 ++------------------------------------------
 include/hw/ide/pci.h |  4 ++++
 4 files changed, 55 insertions(+), 97 deletions(-)

-- 
2.35.1


