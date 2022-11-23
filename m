Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1563634F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrZF-0004pP-GC; Wed, 23 Nov 2022 10:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZD-0004or-18
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxrZB-0006Tl-7o
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 10:21:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1680453wme.5
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t6i2chXybZhHzH7CmCmYDx3Yy0sdjv4ra3ikgYcmUMA=;
 b=p3FH76crndeXD+XKP0OoU85ergRXB5OSpex59vTnk8TS1KyBjJQ7XICxB/LyOBbJh5
 RwCGpVqXbz3ZwhL+KH41+lt3LoBeED6XqOUmIzZNRd6eldnqlwd5fCdl4i021LOMm3eg
 N5wOFMdxqtN+z3xQn0sD4J0sbC1ht6aqVp7TRydRHMviUDCsUTb/59gq0fewF2Dm6n4T
 /ZrMGjt8HpL7LCuQHwHO4c8UQWWkufqjeAYYEXQrF7y39nZRBbnY5diTWyuBMBv02N8n
 MkGhKCW7+Ll/P5eY+BDPOgGiyyUBkCLKOPjQOl35ZthKEPrkzXfqJUzpI6+5y1R2SgGm
 Rcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6i2chXybZhHzH7CmCmYDx3Yy0sdjv4ra3ikgYcmUMA=;
 b=J1izaVv9MKPxKPoVTFT1OYoUPLnJAgeHfmJFjuooLUB5DnrEhCcesYhDmHtuWhPwg2
 b0KaU9y5y32O+K7ogi4gDyKg8JSM937yQdDYKlWxHWtlWSqBiDo3E/5qs+QM18qGEdTs
 QTWqBjuRfEPjvETS+VhT84bhoGvuQC1ALpWvczoM27aOdb4CW1xiP7BCVTNb5WGQEL+9
 RkRdZIgW/YMKhb09LPCdBzy1hmZc/iudOnjSuLome3FbDE5QaBalcfm+9FeH+T7rvknk
 sU74aWg9WI8tSVQWLGaoEDUKZVxbYwc5/2MshpvqEfOX1n5tpcquZGat2CSWEmvvfPlg
 rxzw==
X-Gm-Message-State: ANoB5pmZWmpGXCq7kqGnluwo79Uw/Cnqb7c6AKwm+HlEGIp/oeAyav8Z
 0Kf5K7HxDh4/CfiSXFhFVzfm5A==
X-Google-Smtp-Source: AA0mqf5vcEa+G2aKoPj4JkFG1DvmcK2jHbjah9AGoOwW+FzMjj4L1iIoi2wpfPM+3Ikd/VXljaPDSg==
X-Received: by 2002:a05:600c:5124:b0:3cf:878c:6555 with SMTP id
 o36-20020a05600c512400b003cf878c6555mr9808420wms.38.1669216895730; 
 Wed, 23 Nov 2022 07:21:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b00236488f62d6sm16965023wru.79.2022.11.23.07.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:21:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84A071FFB7;
 Wed, 23 Nov 2022 15:21:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Wed, 23 Nov 2022 15:21:32 +0000
Message-Id: <20221123152134.179929-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This hopefully fixes the problems with VirtIO migration caused by the
previous refactoring of virtio_device_started(). That introduced a
different order of checking which didn't give the VM state primacy but
wasn't noticed as we don't properly exercise VirtIO device migration
and caused issues when dev->started wasn't checked in the core code.
The introduction of virtio_device_should_start() split the overloaded
function up but the broken order still remained. The series finally
fixes that by restoring the original semantics but with the cleaned up
functions.

I've added more documentation to the various structures involved as
well as the functions. There is still some inconsistencies in the
VirtIO code between different devices but I think that can be looked
at over the 8.0 cycle.

Alex Bennée (2):
  include/hw: attempt to document VirtIO feature variables
  include/hw: VM state takes precedence in virtio_device_should_start

 include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
 include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
 2 files changed, 59 insertions(+), 9 deletions(-)

-- 
2.34.1


