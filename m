Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AB699759
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfAs-0005bQ-Im; Thu, 16 Feb 2023 09:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAo-0005aW-M5
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAk-00075i-Mz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id d4so1934735wrj.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/pc4xY0KkVf5b//iMesTSo8MZ4ZxBt4DNYQN+C1HdI=;
 b=xm3UKzv2yzNgXUm886BkUe+/i+rHCY1Y6F94hYT5BZTDPkAK8FtiOU35Or0qKMpuHS
 oCwe4GFTO5IOR2cBJbV4GfPitMufN5Ofmx7g8EoIcSZqh8OsySUoL+UO+OX70VX9NEvS
 tgqixgsMLUQfsW+myb52ZJhXWYmVsJTbObv397qLE6y47/4MF0sgyyaABCubASK/Ax8F
 K1LwoTs9Err8cIvhrZyHYjHk9xPWX5iwzPxEH8txuvlGvcmV7vZyk6CL6OVbLoOuriC4
 tCQtuSF8v6pI6Q+yQOuutoI6THlPXHBhAP6WOvgNhWOPRykFRmGh8ld3BBA4z08VpD2D
 P8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/pc4xY0KkVf5b//iMesTSo8MZ4ZxBt4DNYQN+C1HdI=;
 b=tdtrpxF+cizmq7juPdmBWbJk5OitmWMHBQki0hGON+MPKssqVAa+fe3dtMeHeoHakI
 GOwv6Cm9e2m/Vr/UcCqe6vRRoSqR/iwK7CZqJQ4uvtXhG4tvvoF47TuIjVBzayRu57BM
 6HVw7pPXfANAPoYHLJsvSXgSlvxO5gcpgyu+DDTcL82W+yEY373w36kOUHZahBnNCkEL
 08L+RqL9kfRgi7Mic6xWFEdhpKW3yG4Y7BPEn81eWTVqbc88LJW4ir5nj/MKkkvQ6wwf
 kgZCBOKQKeChm3jFeHqoU7KuXfWEtQGlbZFa7mLabFIqFFDehdEJYBMfD3m2abo4PXca
 6n7w==
X-Gm-Message-State: AO0yUKUWB7Xa5En4AnxxuNuZRqyN3kV+MvIG+y35NbIgjSj8HRAzFGSy
 2xdtArSLE0Hz9Strx5+S14lZ6AmdhZF1PD3q
X-Google-Smtp-Source: AK7set/fvHUqzq36NUA0q8wFFrhcs/+/abFpUQKRqYYLu+LTVZovh29pUc0cOK3fa5jW3o7YE0SzzA==
X-Received: by 2002:a5d:4a52:0:b0:2c5:530b:7d6d with SMTP id
 v18-20020a5d4a52000000b002c5530b7d6dmr4818693wrs.24.1676557420715; 
 Thu, 16 Feb 2023 06:23:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c510300b003e2052bad94sm5484942wms.33.2023.02.16.06.23.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:23:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>,
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 0/5] hw/cpu/cluster: Restrict CPU cluster to a particular CPU
 type
Date: Thu, 16 Feb 2023 15:23:33 +0100
Message-Id: <20230216142338.82982-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Following Alex's comment [1] on "Introduce hybrid CPU topology"
RFC [2], this series strengthen a bit the CPU cluster by
restricting it to a particular CPU type.

We'd rather have a single way of creating heterogeneous (hybrid)
CPU topology. Note the CPU cluster is not user-creatable, so few
more work is required in this area.

Based-on: <20230216122524.67212-1-philmd@linaro.org>
  [3] "Have object_child_foreach() take Error* and return boolean"

[1] https://lore.kernel.org/qemu-devel/87y1p1c18a.fsf@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20230213095035.158240-1-zhao1.liu@linux.intel.com/
[3] https://lore.kernel.org/qemu-devel/20230216122524.67212-1-philmd@linaro.org/

Philippe Mathieu-Daudé (5):
  hw/cpu: Extend CPUState::cluster_index documentation
  hw/cpu/cluster: Only add CPU objects to CPU cluster
  hw/cpu/cluster: Restrict CPU cluster to a particular CPU type
  hw/arm: Restrict CPU clusters to the expected type
  hw/riscv: Restrict CPU clusters to the expected type

 accel/tcg/tcg-accel-ops.c  | 13 ++++++++++++-
 hw/arm/armsse.c            |  1 +
 hw/arm/xlnx-zynqmp.c       |  4 ++++
 hw/cpu/cluster.c           | 33 +++++++++++++++++++++++++++------
 hw/riscv/microchip_pfsoc.c |  4 ++++
 hw/riscv/sifive_u.c        |  2 ++
 include/hw/core/cpu.h      |  2 ++
 include/hw/cpu/cluster.h   |  1 +
 8 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.38.1


