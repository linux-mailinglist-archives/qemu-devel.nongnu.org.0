Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52946016C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 21:22:45 +0100 (CET)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr4Dc-0005tO-Ll
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 15:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Af-0003o2-1h
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:41 -0500
Received: from [2607:f8b0:4864:20::d31] (port=36600
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ac-0004tt-PK
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:40 -0500
Received: by mail-io1-xd31.google.com with SMTP id e144so15826554iof.3
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BTu58h7PZWSqj7PNJsIsHNNi6jv4Ed6zxO+99A0HWY=;
 b=PImjnLR+E6oHjuB0gPC5lCsoc9zOefNm3NweMMyFrkHm7cowplGK0Ekg07dwfT71B3
 YkiTFbYp+Mz4EgLMX9FEhO32wbPxrP6n6RccjyPBOglG/09UoaWeFgRHS5KHxZ5Pl2Rk
 6krV8ty6wfqLYTVS3zJbic+A6bRJOxuEYL4dD0U3fDAjjOBkEUocuV+SPhlBaBJl+P59
 9LDAtVq8uvVMRrW3OOADzKEzovKieFv5h9FeYTB1qFxCep1fKwhNNzCcfdvhNGizHKwW
 A14WZPx6aeIVGfwf66uaUfGAehqsBIA2cceEH7rLuA25aep+tzb+JKb005TxXnDQEYoY
 BzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8BTu58h7PZWSqj7PNJsIsHNNi6jv4Ed6zxO+99A0HWY=;
 b=pid+cZUxLRodfzzHG5eYye0ftn0LVGHFG4fYoY3emJMh7yvdZuXwf50PImZtCfCGfe
 xDaL5ncn0LR1siYvKBDNYXYylG6H54zkEJOXnupRuFiY1Lx8hhy3tFPmc7SUMDMAO2DU
 QsaAJCm7H4aH83KiN5ImmxYSXAW0FloqrTO9WEXlWO07ARWXOGypjI/JfSToAVg9ltlO
 CoVJpna74ga998IY3Zyv6MxnbNzVlKKGK6rPXAWdAwTxWeyK/sPgPEYqDCbrXprZFU12
 hASQH/6/veTaetARSHsn/XAhAL/OtLAK5mWxIkRu67IXYgoYg8wtwrP1eSbffIRBdUj0
 qcSw==
X-Gm-Message-State: AOAM532XP1DIkr3VvCvqh/7qi0O+sqvFLWY8eObGho8jpJA9NIFb0zrj
 2jhANbgN5N7gs/oRdtPw6YFRFtfHBFNS7tP5
X-Google-Smtp-Source: ABdhPJx+kGsuEGdbOhinFPHY4Bdv5LqHWuHaZcm3a37rTaf+kIyxVcEXjnmD7Hc2O0cOVe3laluq5A==
X-Received: by 2002:a05:6602:2d07:: with SMTP id
 c7mr49148163iow.46.1638044376629; 
 Sat, 27 Nov 2021 12:19:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h12sm3091632ila.81.2021.11.27.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 12:19:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 0/5] bsd-user-smoke: A simple smoke test for bsd-user
Date: Sat, 27 Nov 2021 13:18:41 -0700
Message-Id: <20211127201846.64187-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: arrowd@freebsd.org, kevans@freebsd.org, richard.henderson@linaro.org,
 f4bug@amsat.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a number of simple binaries that FreeBSD's clang can build on
any system. I've kept it simple so that there's no extra binaries that need to
be installed. Given the current state of bsd-user in the project's repo, this
likely is as extensive a set of tests that should be done right now. We can load
static binaries only (so these are static binaries) and hello world is the
canonical test. I have binaries for all the supported FreeBSD targets, but have
included only the ones that are in upstream (or in review) at this time.

In the future, I'll integreate with the tcg tests when there's more in upstream
they can test.  Since that requires putting together FreeBSD sysroots for all
the supported architectures for multiple versions, I'm going to delay that for a
while. I'll also integrate FreeBSD's 5k system tests when we're much further
along with the upstreaming.

The purpose of this is to give others doing changes in this area a standardized
way to ensure their changes don't fundamentally break bsd-user. This approach
will work for all setups that do a 'make check' to do their testing.

Based-on: 20211108035136.43687-1-imp@bsdimp.com

Warner Losh (5):
  h.armv7: Simple hello-world test for armv7
  h.i386: Simple hello-world test for i386
  h.amd64: Simple hello-world test for x86_64
  smoke-bsd-user: A test script to run all the FreeBSD binaries
  bsd-user-smoke: Add to build

 tests/bsd-user-smoke/h.amd64.S      | 28 +++++++++++++++++++++
 tests/bsd-user-smoke/h.armv7.S      | 37 +++++++++++++++++++++++++++
 tests/bsd-user-smoke/h.i386.S       | 39 +++++++++++++++++++++++++++++
 tests/bsd-user-smoke/meson.build    | 31 +++++++++++++++++++++++
 tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++
 tests/meson.build                   |  1 +
 6 files changed, 158 insertions(+)
 create mode 100644 tests/bsd-user-smoke/h.amd64.S
 create mode 100644 tests/bsd-user-smoke/h.armv7.S
 create mode 100644 tests/bsd-user-smoke/h.i386.S
 create mode 100644 tests/bsd-user-smoke/meson.build
 create mode 100644 tests/bsd-user-smoke/smoke-bsd-user

-- 
2.33.0


