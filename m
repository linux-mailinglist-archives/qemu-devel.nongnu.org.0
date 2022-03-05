Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D544CE450
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 11:59:21 +0100 (CET)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQS89-00067p-0d
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 05:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6e-00044L-Md
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:48 -0500
Received: from [2a00:1450:4864:20::32f] (port=35734
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6d-0002Qb-2s
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so8572565wmj.0
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0dfROMJZXW9l7pNXbMWCLpRguTZiBURRNc9RE8/h2rI=;
 b=mGkImEbzDSSAK15zZ0HEbXxlCh7FEHV8pyGThhDnD2FPpl4mZegg8kgz1T6x6/Ck+Z
 IYFCvQkUF6W0/Q0slhis7pqNXyM9iyJOg3GUdxwdapOT6g7MjuB6MQ3vMu7Y6wLn+03j
 8ejt+gEbf4JyA57OH0bdHJ1t9OXbijqZLxLV7x/ojTRJXgQ3Yw9zy2yrqp5e3fyFvYlA
 C2ekobk86gAuhJhhRHDx8EDzZFRKLk7ZvCAGLG5yjT21opCUWO0N9VIkQd9YOSY9jOsZ
 UTiXV/38pICy7rDU31HrMKdeupn8ynyWoyVAJzirQtJyDSpcSVo6cctKGcWGna7QTUOS
 3PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0dfROMJZXW9l7pNXbMWCLpRguTZiBURRNc9RE8/h2rI=;
 b=KbOziUY4NruEG1HQILzR0BsWxgTEUZWwKNyVOhaQwPiVuAUv26pNoVZwTaxrs8/1uP
 YQZ0nbCkEY5EMM8o0FUVpUqoDETrUZifRP9r9Xv2XakYOm2ZtUN7/9bcJssLipUgOE/c
 agfHO6Q9oWMtP6XYP/xU9iptY0isg1vh1bFL8H/9SuU6qSPhlSPxn9yHXQSNwL+hF/Iz
 LCYcgXNCh5yYGy4PK1AlxUL2B3bRQXgY89EtMAs8uyf8xxKnKGdW86i4xombzxEnlJUS
 qCsOqwDIeS5QUtrRlOdtCz5X5gO5FtkoE68d9WuNOPpDMZIk7+JVP0swhylFsI0n9kIl
 YNAw==
X-Gm-Message-State: AOAM532maL5f4W5uZNwE4f68KAEMbeIKbs3PJ/wV3HNbKPchLUrVMtCm
 0QqLpLeyFyqyHfAA0/aj7Ts30cTnVTZrVQ==
X-Google-Smtp-Source: ABdhPJyKk+9+rWWCQuI6T3Z5+q/eB9jWFaeZ3nU8Ij6/TvdXo/RMpnPWJM46RHSV4WdgRDOaZaoytg==
X-Received: by 2002:a05:600c:19d4:b0:389:771e:3c4f with SMTP id
 u20-20020a05600c19d400b00389771e3c4fmr2013590wmq.23.1646477865369; 
 Sat, 05 Mar 2022 02:57:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm24079324wmq.0.2022.03.05.02.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 02:57:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] windows installer: Fix warnings, mouse-over descriptions,
 item order
Date: Sat,  5 Mar 2022 10:57:40 +0000
Message-Id: <20220305105743.2384766-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we build our Windows installer, there are some warnings
generated:

 warning 7998: ANSI targets are deprecated
 warning 6000: unknown variable/constant "{Section_i386}" detected, ignoring (macro:_==:1)
 warning 6000: unknown variable/constant "{Section_i386w}" detected, ignoring (macro:_==:1)

(you can see these in the relevant gitlab CI job logs).
This series fixes them; one of them is flagging up an actual bug.
It also fixes the basically-random order we were listing the
emulators in.

I noticed while working on this that we list the emulators in
basically random order (whatever glob.glob() returns); so I start off
with fixing that in patch 1 by adding a sorted() call.

The "ANSI targets" warning is just complaining that we don't declare
our installer to be a Unicode installer. Doing so silences the
warning, and would allow us to include non-ASCII text in messages
(which we don't currently need). The resulting installer won't run on
Win95/98/ME, but we don't support those anyway. Fixed in patch 2.

The "unknown variable" warnings are about a real problem: we generate
installer sections for each emulator executable using the nsis.py
script, but still have a fixed and very out of date list of mouse-over
description text in the qemu.nsi file. So if you build the installer
for a configuration which doesn't include either i386 or alpha then
you get warnings about the mouse-over text defined for the
non-existent sections; and we don't provide any mouse-over text for
anything other than i386 and alpha. Patch 3 makes the nsis.py script
also generate a second installer script fragment with mouseover text
for all and only the sections it generates in the existing fragment.
The generated text is not particularly pretty or informative, but at
least it's there and clarifies the "GUI" vs "not GUI" versions of each
executable.

Tested by building the installer executable via the gitlab
'cross-win64-system' CI job and test-installing it on a Windows 10 VM
I had to hand.

thanks
-- PMM

Peter Maydell (3):
  nsis installer: List emulators in alphabetical order
  nsis installer: Suppress "ANSI targets are deprecated" warning
  nsis installer: Fix mouse-over descriptions for emulators

 qemu.nsi        |  8 ++++----
 scripts/nsis.py | 17 ++++++++++++++---
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.25.1


