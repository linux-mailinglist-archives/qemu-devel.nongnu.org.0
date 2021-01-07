Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D132ED149
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:03:10 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVsb-000509-Gk
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqI-0003wA-Pm
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:46 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqF-0006u4-9t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:45 -0500
Received: by mail-ej1-x633.google.com with SMTP id d17so9766558ejy.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tceWVfGy+fhbgKB7GwKBsGZSC3IWon9d63vNzsK59uE=;
 b=cltTP7q4ozT9d7xsIaGof9huUO6LQKVzGjfC/Vwc+ouYcV2LS4I6wkK2764uG+CNBi
 7fHh+Mre6eaz5cNCVgJC89v49JubH2Yb+M4xA79RrpcH4IAifL0gv6fhFYq3e1/+PT6P
 EpgmfOKO8T4GS5nGedv/pL1uXxGWTpPh16gBiUW/Fq9cV3ni3E9AMpMBhpi5fRybWOCS
 kyjYx0KWae9oHK5Yhu58qvIppAcrnOI6IfJ3lvLzxrJoRXsib3IYCPnLqDxosuduEjFp
 q9hEfoVQ8uEp1PzI9vr/KZWlElz5TY0gYxfRJaCpach3fYtB7qNCqnRv/DiyMRpGy4Z0
 qX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tceWVfGy+fhbgKB7GwKBsGZSC3IWon9d63vNzsK59uE=;
 b=f5yNi3T7XmLGre9Tc+v7/bq68AjgZKrYPlDEMzdJTopnxllhwhlfC7z1oFk80QCisG
 SZ6HctbphRjHsZGh8PE5h2jznFMbEcKpcAofjUznS1IOD/piwqd9NN0tIg7PjCfZKbE+
 f7yaky64YkwXbktMCNZ5mqKDv9DMubvJyWL5zR5ul4F4FT6+Q/XZrLt4A1Ljb5mSjHuP
 JZJ5Bn4wxzB04HkGE4RRsTALSbmtSyQolJowiS8RcgO9rO5uBh6Vk0fiYeIut2cfzFMv
 U3CtDhcz+jLPjWxKXs6Kb/53LoJb6cb2RLFZhFLCZotoAR7hiy2WrG+4mWZc4AF2Bfgx
 nFXw==
X-Gm-Message-State: AOAM530FaL3wmXSILwmNMqOhIvqkXpOEWicJ8P2chCXgBCLSzlkqlggz
 FYUnROppPtHw1Dhorb+CIWpd53Z0Dxt28g==
X-Google-Smtp-Source: ABdhPJzx+lCoUTeXZa6g3Qf3UIfLfMgHtg+8Peb+KpBkBuTHkaQ1bvTejUitbw8vHwXHxFyF1Bju/w==
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr6451710ejd.374.1610028041705; 
 Thu, 07 Jan 2021 06:00:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/8] Automatically convert configure options to meson
 build options
Date: Thu,  7 Jan 2021 15:00:31 +0100
Message-Id: <20210107140039.467969-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v2 of a concept that was first posted last September.  In the
meanwhile more options have been added to Meson, so the effect of the
change can hopefully be evaluated more accurately.  At least, the amount
of lines removed in the configure script is larger than the size of
the script itself!

Regarding the code itself, the main change is that the script has been
rewritten from Python to Perl.  The reasons for this are detailed in
the commit message.

For the parsing of an option to be completely automatic, there must be
no mentions of the corresponding variable in configure.  Patches 1 to
6 clean up some of the stragglers to enable more automatic conversions.
The only remaining options to be split between configure and Meson are
capstone, git, slirp, default_devices, cfi and xen.

Paolo

Paolo Bonzini (8):
  build-system: clean up TCG/TCI configury
  cocoa: do not enable coreaudio automatically
  gtk: remove CONFIG_GTK_GL
  configure: move X11 detection to Meson
  configure: move GTK+ detection to Meson
  configure: move Cocoa incompatibility checks to Meson
  configure: quote command line arguments in config.status
  configure: automatically parse command line for meson -D options

 Makefile                                |  11 +
 configure                               | 459 ++-------------
 disas/meson.build                       |   2 -
 docs/devel/build-system.rst             |  49 +-
 meson-buildoptions.json                 | 717 ++++++++++++++++++++++++
 meson.build                             | 100 ++--
 meson_options.txt                       |  13 +-
 scripts/configure-parse-buildoptions.pl | 205 +++++++
 ui/gtk.c                                |  16 +-
 ui/meson.build                          |   9 +-
 10 files changed, 1073 insertions(+), 508 deletions(-)
 create mode 100644 meson-buildoptions.json
 create mode 100755 scripts/configure-parse-buildoptions.pl

-- 
2.29.2


