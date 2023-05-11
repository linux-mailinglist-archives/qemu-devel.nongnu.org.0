Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE46FF160
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:17:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5DH-00025i-Pz; Thu, 11 May 2023 08:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5DD-00023d-LT
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:15:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5DC-0004GM-1l
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:15:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307c040797bso1094066f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683807355; x=1686399355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MejxumRnuSGg7jrrW4GFadwuYfhh5Wksuh5AZWmp/QQ=;
 b=M2GTZCieAh49O9tw7hIRAvdCWc+ectUGE3N4S/NHB0HqU6VpDqBbRH8tcFDC5NhTDx
 tcxZ+Z8hSVo4knLUveJ70TUnbFBb9zSy+bwUqmHdM6NqEuaxhS4b3254QC88rA+Q2a3u
 99DsFFut3IGw8maPASCD2AW5c4A1jgcubeQifJsVIcDaufv2ls9rXB/AN7JtBBz2pj9S
 gqhtgGFGTKTEv033isRw102JouWwgT8nvTlrHQ/E5LrUC2DtPmoEyQMRmxD+1CXKD/TT
 lUOltQaX0QxDhhCwjGXlrLQZsKo4lqeGBYxA8A+F0tZXu2RXjE1R8RYQy08AUsOQW8sO
 SLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683807355; x=1686399355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MejxumRnuSGg7jrrW4GFadwuYfhh5Wksuh5AZWmp/QQ=;
 b=XHIw/B0DEOrj/8VYp+IPTkH1TmwGfEqqlbnNWsYNVjHY7dc8EJxhHHvSVp8jIqWC00
 HcQ/7410LXWn1Mjz2lW9vG2z1/9wI0ui0F62kGx0ntzMZBjiUc+Nq9OYyKKzdHsc4OVf
 4i3xKjxsubuWCvU+KtgV862t5FwLPrgn1J6KWDV6CZS+VVl1p8doYmRv3TaYuVSOW3G1
 xDp5sMYZtQGoTOvZ1sWMJxArb2jIQReqzCeKYeELhugEr6VemNVJdHjsny5LA/Fbj2gx
 DERjvPapVPuDyqHyCr19JjrjNcYTVrazo7pV01QVAfs+UDfUr9yJqAHZ13ADcTMKtInh
 GzKw==
X-Gm-Message-State: AC+VfDyoNvULiO1EuoZF2EUX6Kj5ZNZkgGGH8xnpBTMlDV6oM576EeJg
 58A3d6vttfZGXnV2nTWMXzATPE2oL2NwVH5OIbw=
X-Google-Smtp-Source: ACHHUZ52DqI1A4BILk9pHS5cdSV9gqoAwpk7Q2ONTNoIwJFpl6B7Z+ZadHP2q1o/81lCzp7VcQi3og==
X-Received: by 2002:a5d:4578:0:b0:306:31e0:958 with SMTP id
 a24-20020a5d4578000000b0030631e00958mr14941101wrc.15.1683807355412; 
 Thu, 11 May 2023 05:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee5fa61f45sm25430649wmb.3.2023.05.11.05.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 05:15:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 0/2] docs/interop: Convert QMP related txt docs to rst
Date: Thu, 11 May 2023 13:15:51 +0100
Message-Id: <20230511121553.3356127-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset deals with a couple of the old .txt files
that are still hanging around in docs/interop: qmp-spec.txt
and qmp-intro.txt. Patch 1 converts qmp-spec to rST and
integrates it into the manual. Patch 2 takes the only
interesting parts of qmp-intro.txt (the example command
lines) and puts those into qemu-options.hx so we can
delete the old .txt file.

v1->v2 changes:
 * some trivial tweaks suggested by Eric
 * all patches have been reviewed

Markus, will you take this series through your tree,
or do you prefer something else?

thanks
-- PMM

Peter Maydell (2):
  docs/interop: Convert qmp-spec.txt to rST
  docs/interop: Delete qmp-intro.txt

 docs/interop/index.rst                      |   1 +
 docs/interop/qmp-intro.txt                  |  88 -----
 docs/interop/{qmp-spec.txt => qmp-spec.rst} | 337 +++++++++++---------
 qemu-options.hx                             |  28 +-
 4 files changed, 208 insertions(+), 246 deletions(-)
 delete mode 100644 docs/interop/qmp-intro.txt
 rename docs/interop/{qmp-spec.txt => qmp-spec.rst} (55%)

-- 
2.34.1


