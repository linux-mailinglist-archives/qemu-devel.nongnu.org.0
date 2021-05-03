Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C40371EE2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:50:26 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldci9-00066D-8n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc3-0008JQ-UB; Mon, 03 May 2021 13:44:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1ldcc1-0004BU-JT; Mon, 03 May 2021 13:44:07 -0400
Received: by mail-ed1-x52d.google.com with SMTP id j28so7257437edy.9;
 Mon, 03 May 2021 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhViP92RCgNeeeesNjpV+M4kF2iisdIkolC/wFtuRj0=;
 b=JD4Rw3C5EpvF+2nKP2S9977Zc8EUvwJ6ivZpOVxHBMnCyTypiKeEEMzApag10feKMn
 M5k2EoiC/Y6KMhjRn+WtIiRaQgjBqolm95HhtTvv3JJOEKCS0vqkw2q3GD5l5ErfydNo
 +Ffyc/ZOOM4xM/1mTyl3GF9y6Y0ZPek7TSkQjJOhP10qNSl+dhbgTTVP/8e0DWarwpp4
 Dx8VkPFs/SKC6TrZXMSh/mfoNszFpVIiAHiG6QmlSxJBlHLusiNFAbRZlq1N2ZCTkQXA
 SuP7nLgxxq7ObEW4RQZbyl6Q6OAtKfPg6KZ/FuBGGMdroXS5DegBM2cxcMDRRoU/nePj
 jQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XhViP92RCgNeeeesNjpV+M4kF2iisdIkolC/wFtuRj0=;
 b=Vd5uuUjl4p2Uboc6mxVcWF61lhICmLLQfQD9kUYPjwnv1wm5QP1/p0o1c2ATwnGEKn
 dG2g630cUxb1u5IwUYBhpub7Ll01D3xh0LyK4WvzRFQ692NHjoswNpXDrcvlOaogsua/
 otwoOPz2F86rd8K5mAp+ceuI90YgpIJWUJedrj0wJC95gJUmvlXlhOhwEw1lb27Rg5yj
 MoWs2Pa4PSERmWPYSHEpXMzqWjmRo4/NmQry8h2d/tLEZRXzZbt5iMA9624DEHGN8zCS
 Ii/mOOsM3OTC9oCgP/VMCtQfhA1qJUVcSUmXVLzXyyusi1HYXUhYwbGPcQV5LbM1VmqW
 sfKQ==
X-Gm-Message-State: AOAM531IzlQ/TCxxSMw5XV6X5czPBzqO7FASAYQ8dJCfsBHjHWbrDvt8
 zlcN7IcY0K0l+rJmDb4OQxm43YEoxZ0=
X-Google-Smtp-Source: ABdhPJz9sCkh9dpFS7hj6h3gALe1AwMgtWPxepnHuGWRqAVJbgH9zLyTKw3hPsnfr5sW8lpisbj44g==
X-Received: by 2002:a05:6402:17fc:: with SMTP id
 t28mr21487446edy.283.1620063843130; 
 Mon, 03 May 2021 10:44:03 -0700 (PDT)
Received: from localhost.localdomain ([151.60.47.133])
 by smtp.gmail.com with ESMTPSA id x7sm155879ejc.116.2021.05.03.10.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:44:02 -0700 (PDT)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user: Small fix for copy_file_range
Date: Mon,  3 May 2021 19:41:57 +0200
Message-Id: <20210503174159.54302-1-thatlemon@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=thatlemon@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-ppc@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

An unwanted sign-extension is currently making the host kernel return EOVERFLOW
when calling copy_file_range with a count of 0xffffffff, despite the host being
a 64bit platform.

The fix is only affecting 32bit targets on 64bit hosts, it's a no-op when the
target bitness matches the host one.

As a bonus add a pretty-printer for copy_file_range syscall.

Giuseppe Musacchio (2):
  linux-user: Add copy_file_range to strace.list
  linux-user: Fix erroneous conversion in copy_file_range

 linux-user/strace.list | 3 +++
 linux-user/syscall.c   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.30.2


