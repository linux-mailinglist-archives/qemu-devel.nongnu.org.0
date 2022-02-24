Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973194C3035
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:28 +0100 (CET)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGK3-00064u-1M
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHM-0003HI-KE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:40 -0500
Received: from [2607:f8b0:4864:20::42b] (port=38586
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHJ-0008IM-Mw
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:39 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x18so2214126pfh.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMg8wr6hrIc7UXHm2m/IOpdeLyp2sc/RFVgQkHdE07c=;
 b=MmO/0uIuEs4JJ2KJV7nrIBqzBNUQiviE2VPn8eYC2CcORG8wxwxu7q0Yy9dXdBZs4n
 BnDaSBRoUvpzD13oITUc4/c8OJJ+wHomAMVIyRrYKDyGueB4Vzj4bmuJVrOR4tt5Y8iS
 AjRN1c8eEoNI/pmablV3SvCJhbxX+V+jxeP/rNYqsD3zsmK4wcd9GSVc9w6eiviLWndt
 0jszRijiFN/MVF1kCYRurzLiMNtu54mdOtDRuHZWH0ODEw7dmVH6PQhVSV19eSd6fmCq
 PqWOu5SW8tJOaLB/Q/vUpzHcFjOMG8KStNelma4pjQV7PliRNyoINgaxcW5RBqEwqN3O
 FG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMg8wr6hrIc7UXHm2m/IOpdeLyp2sc/RFVgQkHdE07c=;
 b=OH3ELApUcTAj7yodHQ2/aNfzN2Q4w99cizqD/Gv/KtKg4XYKnoHyzq0g9FpUBCN8Ze
 EYmF6Mjrk70g58edNlQMU4ZAwMQ6ZcTkWkF2GuFwFGIUzwfhTfFyw9k9BY/UTk+K78EM
 d3MiwCJS/SR9Sk5udR8V8vdJkxBhjXflqhbl3P8kQdWpZIs6QBa7Hq5OR4s86QRVH+Lr
 aJPRiW4TwA2b0iH3u4vzdXAQUtK1jUifRx6orXboQJtzwQ+Tr1QmLhg2Y4Ru/bNwRJLS
 8bsgmgbLJDmLnfk6fWS/Fq9veQDdz9K3KCDD1dTwHMk8T01G8XnMLfNXUxEBM5ks9b2u
 qAFw==
X-Gm-Message-State: AOAM531u4RQIeXuTv5yeNoo+CGCoRDc2EtIETrOeA5biaaczZppR1d+0
 H1y/GCccoxH5r6Luio3b1IEWkgMMdq4M9g==
X-Google-Smtp-Source: ABdhPJyPx+LN/Dx8+5Aq3wmCT98OS57bB8xf6V8h1+qmcrisRbI/RJGdSKhF7aH5uJSWR0/oOx+2aw==
X-Received: by 2002:a63:4913:0:b0:373:cf7f:6cd1 with SMTP id
 w19-20020a634913000000b00373cf7f6cd1mr2797686pga.296.1645717416134; 
 Thu, 24 Feb 2022 07:43:36 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] tcg/s390x: updates for mie2 and mie3
Date: Thu, 24 Feb 2022 05:43:23 -1000
Message-Id: <20220224154333.125185-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While reviewing David Miller's updates for mie3 for target/s390x,
I realized that most of those are useful on the code generation
side as well.  Then I stepped back and looked at what other
feature extensions had been missed.

Our new s390x ci host is a z15, so this new code gets exercised,
at least minimally.  I need to get some other bits configured to
do more comprehensive testing, e.g. avocado and risu.  But in the
meantime...


r~


Richard Henderson (10):
  tcg/s390x: Distinguish RRF-a and RRF-c formats
  tcg/s390x: Distinguish RIE formats
  tcg/s390x: Support MIE2 multiply single instructions
  tcg/s390x: Support MIE2 MGRK instruction
  tcg/s390x: Support MIE3 logical operations
  tcg/s390x: Create tgen_cmp2 to simplify movcond
  tcg/s390x: Support SELGR instruction in MOVCOND
  tcg/s390x: Use tgen_movcond_int in tgen_clz
  tcg/s390x: Use vector ctz for integer ctz
  tcg/s390x: Implement ctpop operation

 tcg/s390x/tcg-target-con-set.h |   7 +-
 tcg/s390x/tcg-target.h         |  37 +--
 tcg/s390x/tcg-target.c.inc     | 469 ++++++++++++++++++++++++++-------
 3 files changed, 404 insertions(+), 109 deletions(-)

-- 
2.25.1


