Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82190480ED4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:16:24 +0100 (CET)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2OVr-0004gc-3W
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSZ-00020S-04
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:12:59 -0500
Received: from [2607:f8b0:4864:20::52a] (port=46756
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSW-0001Td-GR
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:12:58 -0500
Received: by mail-pg1-x52a.google.com with SMTP id i8so8782403pgt.13
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUccC/6LLpVEOSnkVTMuJy2Wfb7prxCbSw3oYnOtHY=;
 b=jqsapwLuIOlx2Fnk85plBNahbMqXbzA3gT2Fp5Pf59s5yGNYLIHCTG1iiKVDE14vPq
 mr+GXhYOGOfGOl0qFR1C4qz6d14cJCKWAA5PGccpzWbigP7UvL7iYZbLcpP2hureMGVL
 peY4NxfO423hoYFwNBxNvfl4kC5PW+Vkkh/VAFvI1KJU89a+mtxU/11v3/nC2UUCZSz6
 s+SzbqcSVRkakShX+VrHsEpoj3/M483eeogYNhoMvjbZSM1c7lzP8iipHYcXWBh7nZNl
 tNxEX63qpPu1ETL/Xq05GsC+QJDFtAwh+GX+7MIdhFUiwxDyjx1r1stF3tLuOLflxqZq
 LwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuUccC/6LLpVEOSnkVTMuJy2Wfb7prxCbSw3oYnOtHY=;
 b=R7VoAswo7pfnw+eYKL5e1Zjc2GJ70x86Jd7Llml/V4kxwKSQ31Sb6xN6nMxcOLFU7y
 Iq6Sj0CydEIyAxePtRT9S1/Kmoo7p4ul2suMIJ+/7yBmwFti6tnQsyNujvlLOyLvFwqS
 24FdJ0YNTaNC3yCub0a/7DC+EvzoTWQYUZ2lVcY3PKGVXDuKLh+jvy6x19JYBEiNJGPG
 a2AqkMB9gS4ZevX3vvUHIyiPTU75aDLqbiPBzJQI1Bghvf4DrxTd8rfGN1v2FvUL5YHD
 wXGFOF6tXRczDXSfq4vOVMo6uybSikApQr53F/8LyoP5O9HXRvcfjcAV2Jd0jEvlpkK0
 je/w==
X-Gm-Message-State: AOAM533/+bY3ZtLUjMpTVS8b9nG8B685XjDs7HGwyUyzFfZ4td17OYLs
 xQlFwBRt6h73bz9L7F7aNJj5YRzPLW8wQkGN
X-Google-Smtp-Source: ABdhPJxDcKId48pzTOIGy1lRnSD+BL4YmJ4rqC/jYqoh3jlCc99vtfm72TUtynBf/TfNZhtB36vpCg==
X-Received: by 2002:a63:6886:: with SMTP id
 d128mr21643736pgc.247.1640743974856; 
 Tue, 28 Dec 2021 18:12:54 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:12:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
Date: Wed, 29 Dec 2021 10:12:45 +0800
Message-Id: <20211229021250.29804-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

For vector widening and narrowing floating-point instructions, we should
use require_scale_rvf() instead of require_rvf() to check whether the
correspond RVF/RVD is enabled if either source or destination
floating-point operand is double-width of SEW. Otherwise, illegal
instruction exception should be raised.

e.g. For SEW=16, if the source/destination floating-point operand is
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
instruction exception will be raised. Similarly, for SEW=32, RVD
needs to be enabled.

Frank Chang (3):
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    widening fp insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    widening fp/int type-convert insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check funtion for
    narrowing fp/int type-convert insns

 target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
 1 file changed, 57 insertions(+), 21 deletions(-)

--
2.31.1


