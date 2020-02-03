Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6A15072B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 14:27:38 +0100 (CET)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyblJ-00082Y-3C
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 08:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iybjQ-0006oa-Tr
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:25:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iybjP-0000Ib-Ft
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:25:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36263)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iybjP-0000FV-68
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:25:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id p17so17074114wma.1
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 05:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrpVsiUs6maDoxI52Ji1ELuLeZ2YXtfwRtyJnu/VVjQ=;
 b=whpGWpmt7Kyk+E1838clsfZ5FRzTbPUEFfaqdN5kzoce3WMb/PDT8kazcA2FdE2zIA
 CeEXZxOA4KkEhVyZdeGhMF8+22NEwv6E63IQBuvrAlQG0JKeOU+MkfsIrIwUEL04upHn
 dfiiF50iArvC52wUybYs8rX+AZ2jKdo5HocTKOblVDBGvTWtFwKV5ha1KmFQ0Eoa5BRt
 +fMkbL/dJcdd/pZHJxe3VPdFRvvhye1c+9dtzImrY8NZkh1ctMLb0/YDPwNR/534Helg
 s0Nc04xc+ObZprYYVDo9rV75YOHDh4hap6TjZaC0AjD5Kl7MWELKjHIrTdtlV531Bdk7
 bsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrpVsiUs6maDoxI52Ji1ELuLeZ2YXtfwRtyJnu/VVjQ=;
 b=bE+l6XgdgoZDZXCzImJMjSkGOw0Nj5yCHfrgxU9PhvWH0jD+nKKTCqZqvUDPu7pjmX
 11Ve3houOd4omgJS1qMtLtd2SxXe8HQeLra+3lrD1XEsfW/k1hRi7B9LEGKWnrc+VyPZ
 wXi/OrW9gYHFJGzuWv2LB+TlfNXRkzV8NVzBQQcj7HlM9quDeysr4QzKAl6zGI4kDZvN
 GI0jqJRaU9blljz95pbrG81MAxjX18aSpTcN5gHwDZeRyjCqzt/K40L/eglA1rQSms7b
 /YI9DEBLaDtmlfP2N9Sb6o3VP6hdcgbKP7d2Lj09gi/AuO7VuwwCwpvFpK31eGIyAZ6r
 j6RQ==
X-Gm-Message-State: APjAAAWnr/MzgqGvAcqKXzTBcDLw7izsnohBvNHkxGzzNSf8sAXjR6ZS
 /TvyJnscEG2U+pGsvqdlQEql0r63Hq5GeQ==
X-Google-Smtp-Source: APXvYqw7rUU0eIQqmRpDpXzgyrHsS14Hf7pvykrhyElT7Do6ZFifYJKXMttY7PGvjLO/NgIcUej0AA==
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr29103258wmg.34.1580736336744; 
 Mon, 03 Feb 2020 05:25:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s16sm26100534wrn.78.2020.02.03.05.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:25:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] configure: Check that sphinx-build is using Python 3
Date: Mon,  3 Feb 2020 13:25:31 +0000
Message-Id: <20200203132533.21850-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


We want to assume that all the Python we write is running
with at least Python 3.5; configure checks that for our scripts, but
Sphinx extensions run with whatever Python version sphinx-build
itself is using. At the moment our Sphinx extensions all work under
Python 2, but the one I'm working on for handling parsing QAPI docs
out of the JSON is going to want to include some of the scripts/qapi
Python which is more complicated and definitely now 3-only.  In any
case, allowing some bits of our Python code to run under Python 2
is setting a beartrap for our future selves. It's nicer to fail
cleanly rather than let users stumble into corner cases we don't
test and don't want to support even if they happen to work today.

Patch 1 adds a --sphinx-build=/path/to/binary option, so that
if the user has a system where the default 'sphinx-build' on
the $PATH is Python 2 they can tell configure to use a different one.

Patch 2 makes the Sphinx conf.py fail for old Pythons, and
makes configure handle and present the error to the user.

Alex: do you have a way to test this patchset with readthedocs
before it hits master? I'm not sure what version of Python
their sphinx-build is using. If we need to I think we can
force a Python version with a .readthedocs.yml file in our
git repo:
https://docs.readthedocs.io/en/stable/config-file/v2.html
but if they default to a new enough Python anyway then we
needn't bother.

thanks
-- PMM

Peter Maydell (2):
  configure: Allow user to specify sphinx-build binary
  configure: Check that sphinx-build is using Python 3

 configure    | 22 +++++++++++++++++++---
 Makefile     |  2 +-
 docs/conf.py | 10 ++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.20.1


