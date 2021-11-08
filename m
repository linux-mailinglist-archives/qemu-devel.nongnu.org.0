Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8961E447C3E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:50:09 +0100 (CET)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0Lw-0002tI-Jj
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Kf-00024n-Il
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:48:49 -0500
Received: from [2a00:1450:4864:20::236] (port=41669
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Kc-000306-HU
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:48:49 -0500
Received: by mail-lj1-x236.google.com with SMTP id d11so6897827ljg.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yrxm3HZAZHHfZ6yOom6hrGKWBUxN4oKHriAO7oUE0IY=;
 b=kvqzRjpfNcHsg0bdTiRy4HZuGME1Fp1d5XpVksHZoT/pBhLkYR/sZUjStXpTQmVcdN
 JMRnZUz04ETeJmgJKueelTd8k6JFTYJ6qxSA6K5SlKAVaHwffNJCVCeOTdyBHnqjfUNi
 xqr2iAO4zJ0VwEPuoVHmha0C/iwhq7flNlNQ4QX+E6rcC+3B5BUafmvOPj/zkdxL4vHd
 4kwJfkxk/yB4FF7lorR8JPppt1eQdXNxcEN5mIy4nd6ummhPTpaJHsfpOWIbswhA+lte
 PGX7ymL+IbtexljBkSvx7fU4FQi2RoZUvu0XtkS2NTVs13fywyWmdP6C5jPP+pOwTsG9
 Ixsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Yrxm3HZAZHHfZ6yOom6hrGKWBUxN4oKHriAO7oUE0IY=;
 b=4BsVN0LQys4eRPtwsY2uGRNU2x1KbG1ZScXq76h6S2A4cVqeRjZKJejRw4yWYW0LL/
 88rKv3J+lHb4ZXOY7hSsJgBaxx/IiImM3s18zW0jFqNMy9JGQ3F9vLzCA0ZtZ01Mz64Y
 70tMMRRpqWryV+AkJFluRjn2uSKQzwYoEosrUdadFiBQAJSESzEzxh4wrXpWdMN870yu
 xK0ANC9iYX1XvCUUH9Hb3/TnmBcMv4h1TKZn8ZTJFZ13YDmERfRx3OU9ukMIIrpsIkVR
 gOJPkL86to5XYEf6edFWVuHY6YejOhAQWY8BAyE/+plWsbDQy4tvpUAosVoM5pQEOi8T
 1NXg==
X-Gm-Message-State: AOAM530pi8fVz1NYO801mXjksxYhXcCsSh4eVoRU2BpL9oGTnAicPkPL
 rHSAQqwPnP/ofANt+bYQOxmIdW7Heig=
X-Google-Smtp-Source: ABdhPJw4zD9M0vW3Vbe7ohH4OjwTmvjOIezZEbf7vtpDx3KDnhTaBe2tB89fLNLrENzR6hfB4OTPcw==
X-Received: by 2002:a17:907:3da6:: with SMTP id
 he38mr19232896ejc.151.1636361004277; 
 Mon, 08 Nov 2021 00:43:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nb17sm7743211ejc.7.2021.11.08.00.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:43:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] configure: propagate --extra-cflags and --extra-ldflags
 to meson compile tests
Date: Mon,  8 Nov 2021 09:43:18 +0100
Message-Id: <20211108084323.541961-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
tests, as they are supposed to be independent of the specific sets of
compilation flags used to build the programs.  However, the user can
still use CFLAGS or the toolchain file's LANG_args/LANG_link_args option
to specify -I or -L options that apply to cc.compiles/cc.links as well.

This is also the intended use of configure's --extra-cflags,
--extra-cxxflags and --extra-ldflags options.  For example, if
one has netmap's header in a nonstandard directory, up to commit
837b84b1c078bf3e909 it used to work fine to do:

.../configure --enable-netmap \
     --extra-cflags=-I/path/to/netmap/sys

but since the test was converted to meson, this does not work anymore.

The main change in the series is in patch 3, where these options are
passed to meson via the toolchain file, instead of via config-host.mak.
This solves the issue since the toolchain file's variables have the
same purpose as configure's --extra-*flags arguments.

Paolo


Paolo Bonzini (4):
  configure: simplify calls to meson_quote
  configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in config.status
  configure: propagate --extra-cflags and --extra-ldflags to meson
    compile tests
  configure: ignore preexisting QEMU_*FLAGS envvars

 configure | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

-- 
2.33.1


