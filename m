Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A62940F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 18:58:18 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUuxl-0004nC-IS
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 12:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kUudt-0007g6-2q
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:37:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kUudr-0000x0-21
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 12:37:44 -0400
Received: by mail-wr1-x442.google.com with SMTP id n15so2988218wrq.2
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUvzyLC3S8ewGAtFOTjsW1yymYYHuK0/PP7tAupcgoQ=;
 b=pwyEunGAnhbEna2alNctA+cz7Y9PGHNGD6tHNg8dnNVvrG8GsjYKmOD7mwcd6sjTab
 boYQGBFISOwYj7THCv2trajUsoyY1uY47bNtpin/TJV2AAt6YTd31E28SLzzU+BUuKnV
 7lUQlft1ykfMP3tCqM71ANuGh14DWB3BAef2zNvqnipY0uXyuHQHS94Je759H4iNz/y6
 zyWJUJqigc3F3uttaPc1+wYRTl/4482UJni3EITzvE0387jEuKTNYvltpktPktkTU9V9
 0StpxBbOkWstkB7l0px9muFfU+2mZyDoE/8MWK5y98vTDalAPb2F1jyqBAsGGJShNPMN
 sFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUvzyLC3S8ewGAtFOTjsW1yymYYHuK0/PP7tAupcgoQ=;
 b=jFiDCXgajkQmT0bqXl3DuWRU+xRtTsAUDR1gkZhg1OPgRwzlrovAgrHVLB6cyKRiKi
 nwPvviSDhpPSSVD3A6oFBp82O1CfJUYOy9+IP62BIGrWYSkxn7Z4k7QAAgFK0PTwAwxD
 jE7xyeVF2VdI5he6ebgUPz3HzCoXZ9/x5byVsv5X8y8tliLGdOLdwL8B7vCs46PWcgs9
 OLgcO9fKgbDSBtfNvx0wwBJbxYFqOJE76fBhowtLDKxszXJEqv49mkVrfnhmdB/LuKad
 ilorY3tskWTTiJjKlAqACZ3Jhl5j5aqQg26wr6m3zm5OPX/8HsR2Ri4gVa3aKC0sQ29r
 5VJw==
X-Gm-Message-State: AOAM533XdRBDWWjPIxPOEHV36w9AP74u4xKACvbnEx6AVCLtdL6cjdr3
 9dyn3CV+PWNI048IuGxg/tfLhA==
X-Google-Smtp-Source: ABdhPJypIGFR8tFQRVeYRZ/V1KtOZs7ts7TQQz+zxMNGLlE+nUEYu/8XnGdRc3YveXt6fBv/OH5fgw==
X-Received: by 2002:adf:82e5:: with SMTP id 92mr4291989wrc.192.1603211860901; 
 Tue, 20 Oct 2020 09:37:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v123sm3071305wme.7.2020.10.20.09.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 09:37:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFCA21FF7E;
 Tue, 20 Oct 2020 17:37:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  0/8] fpu: experimental conversion of float128_addsub
Date: Tue, 20 Oct 2020 17:37:30 +0100
Message-Id: <20201020163738.27700-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

This is the current state of my experiment to convert a 128 bit float
function (in this case addsub). The actual conversion was fairly
simple (basically a copy & paste with some tweaks for using the
unint128 inline functions). However I ran into a number of stumbles
with the int128.h support including casting of values like ~(Uint128)0
and messing around to handle things like missing __builtin support for
clz. I suspect having some of the #defines expand into uint128_*
functions plays some part in the 4x growth in code compared to the old
version. However the drop in performance is a lot less than that.

In terms of total code churn we replace each deleted line in
softfloat.c with 2 lines of new code although I suspect if we pressed
on we could reduce the diffstat deficit. Debugging the actual failures
was relatively painless with rr and the new code - perhaps because I
just find it easier to follow.

I've included your early patches as that happened to be the state of
my tree when I branched off. If we want to go forward with a more
complete conversion I guess we would need:

  - a more complete int128.h conversion (including fallback for non CONFIG_INT128)
  - seeing if some of the resulting code bloat can be reduced
  - seeing what scope there is for commonality of special case handling

I'm not a fan of having so much duplication but at least I personally
find the code is more readable.

Alex Bennée (3):
  int128.h: add bunch of uint128 utility functions (INCOMPLETE)
  tests/fp: add quad support to the benchmark utility
  softfloat: implement addsub_floats128 using Uint128 and new style code

Richard Henderson (5):
  softfloat: Use mulu64 for mul64To128
  softfloat: Use int128.h for some operations
  softfloat: Tidy a * b + inf return
  softfloat: Add float_cmask and constants
  softfloat: Inline pick_nan_muladd into its caller

 include/fpu/softfloat-macros.h |  80 ++--
 include/qemu/int128.h          | 122 ++++++
 fpu/softfloat.c                | 697 ++++++++++++++++++++-------------
 tests/fp/fp-bench.c            |  88 ++++-
 fpu/softfloat-specialize.c.inc |  39 ++
 5 files changed, 711 insertions(+), 315 deletions(-)

-- 
2.20.1


