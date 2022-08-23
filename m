Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CA59EE4F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:40:03 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbcw-0004lP-QU
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbbA-0000iL-Nm
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbb8-00060f-67
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:11 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ds12-20020a17090b08cc00b001fae6343d9fso2292542pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kCKlV+zf/+KWnoaQDpjDkH5DqkgiAkurSSQsuBe0qEw=;
 b=qyF9c2wxelPMeLG50kw4PMQLX4WlsC4hPi+/2/nMtIOtKectWwyV/qR74mvbSG6S7v
 j+6jUZKcKZeQlyQ6M6Mb3cvN+P/6ilSXUTBcEQXngpoZYZ+Wd9JgfySerA2DoYkJafCN
 aJYDkzH/EwjMgVGsfD+cDdskZOyyi3cJSbhObQvAhyzSjHhBLSBcc18V3xdzkF014gm8
 8MCWJmmDaFG56foWYyjYPvV80pFYUe0OghX9h922Vj0+7/uq8BouDGrehrDMPo5FI9kS
 Fq0VKDttM0oW6/MWSvYdRI2l5ZRiM7bKSEBiAOraqKNk6l4dTsiHtvEpB8sBa18NVB/2
 90XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kCKlV+zf/+KWnoaQDpjDkH5DqkgiAkurSSQsuBe0qEw=;
 b=EAgrXBGoiYjCKrUBW+fuhVdy7ttGfH23QiC/2dsXaLzKVN5R/RASmf+cbFLaZVpK7h
 Ygw6iixNiABsbmwZC8OP8QjoUYcaiudgKgJhjKPAMHbMBTGwLjRT+HPRNXh5hBzvgTzr
 rsJXSvMEd03EcoDyeh7wsb7TP1ltNKJRtBrBOmMvTxtSCx9lAim8Q0JrHm0n9Pi2Kxb2
 WNRaBRuSZq4/x3F52xyrYTh40q6/iAzdz9G4+TkWTvhE1WlbglBWV4OEXnjcFPCbq+G0
 cxCS6l1fFi7KUgwVaTaWgo/mbxMcxuBVZkhd0AXZpMWf0adS6efa2m/UOR+farm0V9jt
 szgg==
X-Gm-Message-State: ACgBeo04Hajz5jsg4oN3xlkKFiBT70Nj80YfSiKr59XwkwYa43FhfHCX
 3DHEkJgnHiYOjrPLFe1a7wEdrliWgd+o8A==
X-Google-Smtp-Source: AA6agR778lK6885vkX+bXIaGz3O16Y5J5z3G2iqDMadGJs+bRXPDxg4vtKiyo5IW2vwKegXYcZjzDg==
X-Received: by 2002:a17:90a:7806:b0:1fa:e417:e03c with SMTP id
 w6-20020a17090a780600b001fae417e03cmr4959663pjk.221.1661290688226; 
 Tue, 23 Aug 2022 14:38:08 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a635253000000b0040d75537824sm5366403pgl.86.2022.08.23.14.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:38:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com,
	qemu-s390x@nongnu.org
Subject: [PATCH 0/2] target/s390x: s390_probe_access fixes
Date: Tue, 23 Aug 2022 14:38:03 -0700
Message-Id: <20220823213805.1970804-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, as pointed out by David; second by inspection.

I really wish there were a better way to structure this,
but alas, I don't see any alternatives that aren't just
different but similar amounts of ugly.


r~


Richard Henderson (2):
  Revert "target/s390x: Use probe_access_flags in s390_probe_access"
  target/s390x: Align __excp_addr in s390_probe_access

 target/s390x/tcg/mem_helper.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.34.1


