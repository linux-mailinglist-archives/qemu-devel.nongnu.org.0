Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62547EB0F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 05:05:49 +0100 (CET)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0bq0-0002wD-C0
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 23:05:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0bgR-0005kb-DP
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:55:55 -0500
Received: from [2607:f8b0:4864:20::1031] (port=40697
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0bgP-0003LK-Vq
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:55:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so10415177pjo.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 19:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cmnea4NL3ha6Sj4iihgOp6Pptcm5icMLsjSadxv6kc=;
 b=iN4fIhx0lJKignw3aU1GyAMDis8LTFJQdXybor38H90hw4Z3FQkvZ2JlrOPkf2W8/V
 BSIF8fVL2YUN3FtYyGgEzeBJRbAbqvAqKILujMWkVpUCLEmCI9d2oCdf47crzMEzeeCJ
 JDmFr0N7JnLgcBcQlsUsGd61wEZUotMbMXZVzuiMjRrRg2j+wU4vpnyxtzI8Wl70iwwB
 NJieu7wNDNyfuJQsWFVzYYY+aXNo4gEj4X1OqNmXS+0BpdFGPDVXMz36htoHs8QAZ7Sc
 Dew2O6HqhS+VznKn9PA2UN4BF2pXCZZGQB2W1Qrlq0BDKGFwqiDjN40syfllZXLyyOhp
 NOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cmnea4NL3ha6Sj4iihgOp6Pptcm5icMLsjSadxv6kc=;
 b=eg1Y/9mqpCJ9J8220u0P/ksWQoDBJ/v/Q8MySGSFRSGRD8splbLWRtF4GYqdyaRwB2
 vrlzC7nE0+QxngRw04UX5daVK0Aqu2k27O1msm4QLD5BAD41Do5T4ptjqlLuO4yzCOGQ
 nYwKGBbBulAgCR8Tl+E7d+XsQZr033I5u0nXX4O8zaRavPEwUjpksyxIWZh0V/VQmYlw
 afNWBkSnVci4pt+24Iw7m47e0ef/GfOMB/w4kMDXbAbclV60t6o4Xz5TfUYQIF+I1jas
 rkzgQUXtHZ9KBbH+npCdkSYPzzOenhm5lhh34OuI6NFmk2vQbQBNPhVOq0q3jue+CAQk
 hYJQ==
X-Gm-Message-State: AOAM532qcgrtn1cKg/a1IsbuB0rs2Upe+4NkwfbUI0RqwuNrH2hn3EUl
 g4MC6MWwkKCdgGn8L8pb6mpQ+J3EeNq0qA==
X-Google-Smtp-Source: ABdhPJzofX1fMXxLnCWhsqP9n7mbgHNy/hLAL6YjGhjb4mXRRD1EuFNobNQqtbyrfWMQpetu9HrbMQ==
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr4764725pll.46.1640318152597; 
 Thu, 23 Dec 2021 19:55:52 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id t21sm6102718pgn.28.2021.12.23.19.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 19:55:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/tcg: Fix float_{convs,madds}
Date: Thu, 23 Dec 2021 19:55:39 -0800
Message-Id: <20211224035541.2159966-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We didn't read the fp flags early enough, so we got whatever
came out of the guest printf.  With careful review of the
hexagon output, we would have seen this long ago.


r~


Richard Henderson (2):
  tests/tcg/multiarch: Read fp flags before printf
  test/tcg/ppc64le: Add float reference files

 tests/tcg/multiarch/float_convs.c |   2 +-
 tests/tcg/multiarch/float_madds.c |   2 +-
 tests/tcg/hexagon/float_convs.ref | 152 +++---
 tests/tcg/hexagon/float_madds.ref |  48 +-
 tests/tcg/ppc64le/float_convs.ref | 748 +++++++++++++++++++++++++++++
 tests/tcg/ppc64le/float_madds.ref | 768 ++++++++++++++++++++++++++++++
 6 files changed, 1618 insertions(+), 102 deletions(-)
 create mode 100644 tests/tcg/ppc64le/float_convs.ref
 create mode 100644 tests/tcg/ppc64le/float_madds.ref

-- 
2.25.1


