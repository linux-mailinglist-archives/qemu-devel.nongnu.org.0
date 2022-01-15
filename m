Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1E48F9A4
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:24:21 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rT9-0001yX-NI
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQi-0008Qc-4s
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 17:21:48 -0500
Received: from [2a00:1450:4864:20::32d] (port=45776
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQg-0000d6-KH
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 17:21:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so13097395wme.4
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9x33SKmuccOPBnIOni9qflM/+GMe9iP0bONb6a7cmM=;
 b=GDL9Q5VNAg02uJEtLPF55fngprQ9Gj8Rfr/7roCFAwSJQvDXsyK/rBcT+QrLa1/D0/
 3lDqC6DoEaT2K3KCub+lOiMAPC+5EjqC9ktiDqXPJPpxU+gwtAF6VBXn5kpkEbBeBY//
 Amfmbr2roag6tuf9/vgGMK4/HaHsVvLAnK2sNTUQkIMlAcrE9DucPhZ+9QKWCwT6cLfr
 wGguHCHW6ih/Q4vL0906xORh6PY+g0mPBo2ooFaWsu7tubHc4LOsmCSKwDPkYF1D3dld
 135yEt3ZRfU7oebapiU+hI2VqUPBo3hMVnDemcpSuQi/n/XfTnDgdqIDGivLmeiFePZK
 d5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j9x33SKmuccOPBnIOni9qflM/+GMe9iP0bONb6a7cmM=;
 b=Gz0dBxI2EEhAhhMry4p8YtfDhVkwx38wJw32L40fIWuDFUZPuH5UOj35iutM2+8Fmf
 tYkrwwbwXxkD/UdQkz02tPW9cfASyrKDoTIr7V31GlO02/XUlTlW05NfM9xbKHcghiT3
 xdEWmNMN63gk+2GYcZ7zj9sPeblrxrYwVUsKj0OScUfCrKUFscxVrE3fZnsGgaw4DrJQ
 KUosxOn/Wi7KxkxfGFSlBa9GL9MX1JRqtsBQH99ktgW4N+yq2VowiJijeuWXmEfw+hrp
 XFNyFYi65rAe3OjJxFeErLFtBQ5mpGGtgFk8mUNKVOIYCdWKsQYV1u8CPIyJGqANpL4G
 ioaA==
X-Gm-Message-State: AOAM533izpCDc6j1SwXWJgOI+eWUtkpvGAIAE5sg5ncFVYKdiE2CWpB4
 4lwJY0keBuu0ZBAcrd2iQN7X+owmGm4=
X-Google-Smtp-Source: ABdhPJzd+4TNbPZ5ND6/JO7xeC9UfoASZccjW0+YdR5gaUa28dw1Hf/ngvYhqyM7/lPer9yIuV/LpA==
X-Received: by 2002:a05:600c:1f0f:: with SMTP id
 bd15mr9667322wmb.117.1642285304991; 
 Sat, 15 Jan 2022 14:21:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id g15sm9555024wrm.2.2022.01.15.14.21.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 14:21:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] make check-block a meson test
Date: Sat, 15 Jan 2022 23:21:39 +0100
Message-Id: <20220115222143.341587-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes "meson test" run the block layer tests, reporting
their outcome in the same way as the other TAP tests.

Based-on: <20211223183933.1497037-1-vsementsov@virtuozzo.com>

Paolo Bonzini (4):
  scripts/mtest2make: add support for SPEED=thorough
  build: make check-block a meson test
  qemu-iotests: require at least an argument to check-block.sh
  check-block: replace -makecheck with TAP output

 meson.build                      |  5 ++--
 scripts/mtest2make.py            | 20 ++++++++++---
 tests/Makefile.include           | 16 ++---------
 tests/check-block.sh             | 45 +++++++++++++----------------
 tests/meson.build                |  1 +
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   | 30 +++++++++++++++++++
 tests/qemu-iotests/testenv.py    | 30 +++++++++----------
 tests/qemu-iotests/testrunner.py | 49 +++++++++++++++++---------------
 9 files changed, 117 insertions(+), 85 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build

-- 
2.33.1


