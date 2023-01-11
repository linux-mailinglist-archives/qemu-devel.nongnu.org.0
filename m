Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B931666096
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe16-0001Ei-1B; Wed, 11 Jan 2023 11:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe13-0001EW-R0
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:31:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe12-0006Ax-2L
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:31:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t5so11220416wrq.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27tan1Xzmz+ELGbfmDtcVgnvcz3dakW07o8994uvbHg=;
 b=pydYCKwZlcuQWzjiTDSF8dwbQbNxUG7W7RnG0gpQG1I438lHst368JqfVyB+GB8Bek
 DnnWpUvGSqF+TC4mJS78zkpfDxjdU+NNgxxTEJ9amImC0UbqJhdyc7YGv7AuGpFLh+TQ
 m0Ijah76rNo6TOtTocorWPJvs2l6HqNW30lNwGVO6O/dTS8EutlUVEbaJTehfrexjuw1
 x6+ziNIEEqrN6PCptW1qWuzegsXfVRLqtqrbhfxChAveiNN0S2/3SaQrNbNGixi7jVw5
 9Ejkf5Zp8RMc7sdzoH//p9Otpsi4hUl7uhMRrOzRJoYVEB3ImMdydj1QTPBxOaF7Rylj
 Y89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27tan1Xzmz+ELGbfmDtcVgnvcz3dakW07o8994uvbHg=;
 b=kZOPTO7yWbOOtsJ/zuwv7qyMCiBVuPuIvbTgg8NJXm65aCxx/7zImgiqnjM2wF+El+
 zmgHhuGgu5nnZKXTLYfq80e9gRTENZineDxPUlCyuaM5SAqoSEoTIBsbXHaYeX1aJTMO
 Zvios2VUcOEUw+BBi2QTMdIBXKjfj7LLrpNgkQRQ3D2MZCgym5GA70ioiUkSzNyZZ+q4
 0im8sbaJTwteq1KvBoYoKBgvkwSnpPreiwMqyLFQJb2VCNlJx9S3cI+yByg5Dv4OZ9Js
 rRIUIX8rTLPRdYO3k95EFvbR/R7Urvvgz1aSlNLSu2qRQEI7HjBWLiSjQ3UdbiRfJDQ6
 bhsw==
X-Gm-Message-State: AFqh2koQchnvP44oKfV74OS6G3Qn00s+bc6076lZ6f/5bSoiNlUCQJLo
 /ZS4biQ1x4xokhIF4ij0E4JASTioW8xQ+ptD
X-Google-Smtp-Source: AMrXdXuUpBxzqZt4M2Bc75/WFRDdFMWn+FSSKC6pYfn6tIG+iROqHvLVz3b3L0EeWW9/p6LPEHQeaQ==
X-Received: by 2002:a5d:404c:0:b0:2bb:ea1d:e36e with SMTP id
 w12-20020a5d404c000000b002bbea1de36emr8776566wrp.15.1673454709988; 
 Wed, 11 Jan 2023 08:31:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b002368f6b56desm17074485wrr.18.2023.01.11.08.31.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:31:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Date: Wed, 11 Jan 2023 17:31:41 +0100
Message-Id: <20230111163147.71761-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implement Richard's suggestion to use __builtin_bswap().

Convert to __builtin_bswap() one patch per OS to simplify
maintainers review.

Since v2:
- Rebased adapting ./configure changes to meson

Since v1:
- Remove the Haiku/BSD ifdef'ry (Peter)
- Include the Haiku VM image from Alexander

Philippe Mathieu-Daudé (6):
  qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
  qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
  qemu/bswap: Remove <byteswap.h> dependency
  qemu/bswap: Use compiler __builtin_bswap() on Haiku
  qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
  qemu/bswap: Use compiler __builtin_bswap() on NetBSD

 include/qemu/bswap.h | 83 ++++++++------------------------------------
 meson.build          |  6 ----
 2 files changed, 15 insertions(+), 74 deletions(-)

-- 
2.38.1


