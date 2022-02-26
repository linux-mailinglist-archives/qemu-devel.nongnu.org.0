Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80AB4C55EF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:53:42 +0100 (CET)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwZw-0002tn-QD
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSK-0001PF-Ls
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:48 -0500
Received: from [2607:f8b0:4864:20::530] (port=46785
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSI-0003KB-JV
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:48 -0500
Received: by mail-pg1-x530.google.com with SMTP id o23so7180951pgk.13
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6MwX5z7NybpukrNpGl4mrjA47MR716bNMiO0PwnR+I=;
 b=QmFH3vAUmQSj2nvlyxsg9jJSkqQi1rBntC9Idt4bAl3ubzwF0AE5gVATqWvDeKx91n
 8dsVlahb1k74j9ReHHu7FMNJ9qE6miFoaP7GevMKogEagBpChYLvt/MoH+lgoOUwGgNC
 u6Maa8zX5JiSUQoiDir5+fOlsFRAZfEmkjFFoyYG8WwkEkfpkCkCcKq2TBDpE8QppU+S
 sBBXk69j91ATCztFyy4HW2o7avpPTX2TLxunW3/ewD3dFoktQUclcPCslWTHqq/q8s3Q
 Rq5w87fg4Uus1PNW/7WUU2ZVgFMif25DlbVvtlTaMmlZGYksmw5+C1ltY8pmymYRaP5L
 9rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6MwX5z7NybpukrNpGl4mrjA47MR716bNMiO0PwnR+I=;
 b=WZU4w0WlDKHZzJ+zFPSg9J/U/Bk8S7kheE8LbVzO4Z4fSpcNzO3yOS2zbxhng1CP9n
 NpZO7jRuGd8S6x4n0UqEleFk9evldSCy0mNkWSyOoX4qx1t1BVbbHffLXT0qL1q2i7SP
 B9u6SZnUrjTyfHM1bA5W56W1Cz4zwW5hxokl9XwVym7Qvl1OKhya2jVCDNGSVp8EVKJD
 sqaH8jwcgIVc1HLuc2d2/aodxeN7qsnw775a76bh31KXe+OcnKkN+jeKHoIjBKmJnU0D
 asFlmd3ndNX4rqH2v0syPh9AkCCDYuVmkLLrRVUnGxZpy69YA+cvqrk92XYbBJgr0hmb
 r/WQ==
X-Gm-Message-State: AOAM531QUR9kMUiwJR1G2LOidCMFB77Kf4RC1wcDJ618QDJ0DWhjaGDO
 40vuWC5urZSGW8CTdkaXuXJSfv1kSYg=
X-Google-Smtp-Source: ABdhPJzU4YqC0ghtyKkFG++9rjOw/dI8lPN21KwMTr8VeJvEVRAC3GBFaeyQ+JVaLKouFYPMx8le2g==
X-Received: by 2002:a65:6251:0:b0:374:6621:9fe8 with SMTP id
 q17-20020a656251000000b0037466219fe8mr10303084pgv.254.1645879544972; 
 Sat, 26 Feb 2022 04:45:44 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm11725653pjg.24.2022.02.26.04.45.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:45:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 0/4] cutils: Introduce bundle mechanism
Date: Sat, 26 Feb 2022 21:45:31 +0900
Message-Id: <20220226124535.76885-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

v2: Rebased to the latest QEMU.

Akihiko Odaki (4):
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  ui/icons: Use bundle mechanism
  net: Use bundle mechanism

 configure             | 13 +++++++++++++
 include/net/net.h     |  2 +-
 include/qemu/cutils.h | 19 +++++++++++++++++++
 meson.build           |  6 +++---
 net/tap.c             |  6 +++++-
 qemu-options.hx       |  4 ++--
 softmmu/datadir.c     | 35 ++++++++++++-----------------------
 ui/cocoa.m            | 20 +++++++++++---------
 ui/gtk.c              |  8 +++++---
 ui/sdl2.c             | 18 +++++++++++-------
 util/cutils.c         | 33 +++++++++++++++++++++++++++++++++
 11 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.32.0 (Apple Git-132)


