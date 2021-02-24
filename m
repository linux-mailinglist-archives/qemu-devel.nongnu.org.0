Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBA3242C4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:03:36 +0100 (CET)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExZW-0004lU-MM
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUT-0003GC-Su
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lExUN-00072n-K4
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h98so2552703wrh.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WofdIg2a7AJVUPO/DtIgH8BRfzeblCXKDRSqcTtVJGg=;
 b=v8jpmdqxHkXIzH38emGAQYSeZF2lqsGlQ4WCWRhQ6qKLhSvKPfsMgw89LStiQrCGUV
 txpge6UAs87e6X+Qw6CUxV5A3nzeJP6Pl+UV9gqMypXpHtIEgiE71wADHXJzC03yDC0P
 ClHuRuUBq0FKnqcg3uI3ikijPZPhHFarV0d3oXTfl3N56PKlNsebB+ar/KOZA3NQiBmh
 A7jehbBSYC9MORhHMBL+WLutGwvDzCktSJOZEolNDK9unFKZecDR6DqerRMSj6sDnBh+
 f2Y7svVaAvqTR3ZmQunEM5GZSnztko1xpG5KX0clHkpCq8DYkuAf6+B1LVpoRgzKhuqu
 gdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WofdIg2a7AJVUPO/DtIgH8BRfzeblCXKDRSqcTtVJGg=;
 b=H0iNSnrTP1oYRF4Hv+eQY5HpKxI7XJrSEljnDG0tI4ztfR9+uAYGvGv7+yTCw5qFsk
 exyvwkMWWtez91D0nZENmiFXMkMuX3SCAn59ouCn3aWVfZ06e9CgrHhCaOTMiUjznWqz
 83+FML4ET+TAXCWTkqE080smCJ7POmNzAvtjBJ+38yLeuu8E8zTQKOOjtilb3aIJsn5g
 xXvjkbgUB3rTvM9K3TI69zN4rv5dOzimi0NIx6k3j6dYR6fqenrs9khs3CU7neAsAldd
 2PTmjkvwsqy2sLdHIwhul5xpaF9olKKAlT8vnwU1nwsMoVYgBdImZRN9GW65s8jgb3sQ
 TmEg==
X-Gm-Message-State: AOAM533yyyXS3N3jM9aQfDZZfMQNfhflxf33OMdYBf+meRb6LPTQ9AgJ
 FcGOGQ8jOfQPOq+HLTx8/PuKCQ==
X-Google-Smtp-Source: ABdhPJyknthJrQCeq84S5FG8ORIQcBvFuaf6XCNXlD/9v9nrnPAUfzPNW2QwySoIC7+j4ubekfym1w==
X-Received: by 2002:adf:e4c7:: with SMTP id v7mr1482481wrm.245.1614185893752; 
 Wed, 24 Feb 2021 08:58:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q140sm4573017wme.0.2021.02.24.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 08:58:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C85B1FF7E;
 Wed, 24 Feb 2021 16:58:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [RFC PATCH  0/5] Experimenting with tb-lookup tweaks
Date: Wed, 24 Feb 2021 16:58:06 +0000
Message-Id: <20210224165811.11567-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

Well I spun up some of the ideas we talked about to see if there was
anything to be squeezed out of the function. In the end the results
seem to be a washout with my pigz benchmark:

 qemu-system-aarch64 -cpu cortex-a57 \
   -machine type=virt,virtualization=on,gic-version=3 \
   -serial mon:stdio \
   -netdev user,id=unet,hostfwd=tcp::2222-:22 \
   -device virtio-net-pci,netdev=unet,id=virt-net,disable-legacy=on \
   -device virtio-scsi-pci,id=virt-scsi,disable-legacy=on \
   -blockdev driver=raw,node-name=hd,discard=unmap,file.driver=host_device,file.filename=/dev/zen-disk/debian-buster-arm64 \
   -device scsi-hd,drive=hd,id=virt-scsi-hd \
   -smp 4 -m 4096 \
   -kernel ~/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image \
   -append "root=/dev/sda2 systemd.unit=benchmark-pigz.service" \
   -display none -snapshot

| Command | Mean [s]       | Min [s] | Max [s] | Relative |
|---------+----------------+---------+---------+----------|
| Before  | 46.597 ± 2.482 |  45.208 |  53.618 |     1.00 |
| After   | 46.867 ± 2.242 |  45.871 |  53.180 |     1.00 |

Maybe the code cleanup itself makes it worthwhile. WDYT?

Alex Bennée (5):
  accel/tcg: rename tb_lookup__cpu_state and hoist state extraction
  accel/tcg: move CF_CLUSTER calculation to curr_cflags
  accel/tcg: drop the use of CF_HASH_MASK and rename params
  include/exec: lightly re-arrange TranslationBlock
  include/exec/tb-lookup: try and reduce branch prediction issues

 include/exec/exec-all.h   | 20 +++++++++++---------
 include/exec/tb-lookup.h  | 34 +++++++++++++++++-----------------
 accel/tcg/cpu-exec.c      | 31 ++++++++++++++++++-------------
 accel/tcg/tcg-runtime.c   |  6 ++++--
 accel/tcg/translate-all.c | 14 ++++++++------
 softmmu/physmem.c         |  2 +-
 6 files changed, 59 insertions(+), 48 deletions(-)

-- 
2.20.1


