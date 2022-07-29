Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682258546B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:24:33 +0200 (CEST)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTiy-00071X-3g
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgI-0002of-Lz
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgH-0003nI-14
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 a7-20020a17090a008700b001f325db8b90so4442348pja.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yrNXvR5SDhzk1Kea8x0D3TbhVNsRnNV13MNmFiraebI=;
 b=vjKeLZYW3+aab8SRnTUqEz1rDfxIU+2ZTmiRUBkRNmUmbUvdjTvGXWZYi/r2SldE95
 gxz/b9v5uZEhgakRTSlwVhNIwJlkxlrnvlxg+y4kePvn3QoPwUxMwM7440HXpD0zV9Pf
 2jNYiNji/CSLRp2pZHlMuf7LjwoWb5Imvdwz7Kah6kPnFvR3jpV07//hB2TENUHecPGd
 iT2z97lYSF4TbdXAm0mLMCpzhSgF2D7hCts378XB7A+qi7V6Vi83ebVbfrStSXqi54TP
 irH371w1Wq3PkKesLEWoYBAUdrW2GD8MQd6TiXPj9o4rWu0PvzIM/zItKgdnQv08O5m5
 GAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yrNXvR5SDhzk1Kea8x0D3TbhVNsRnNV13MNmFiraebI=;
 b=sWd1LvXxIViXQum8yVj5unyX8MJY4VTzyzwVTP+EGXFz6f0CC60YfzRIGC5gqJwl+e
 FUkNcGTXQeCJ+kil5wtdER7BiSbly6VGx+bw4j22w1n8TY9LdCytPhI2Mdn8EXgwPQ5u
 XHWiSjgSs/8oWoGvbBvC7eINzpvybZ4AE7K+ts2dFLrmurBKBeiyKvp4TpEN6gxvRPNF
 6M3FtRXHHdyZGess4trY0gdB2HQnEnfxaMgdMlTmYRyQuE7FDIKL1CBPY+U38wb3Yh7s
 aqGP+eQxtGM3PlN44+5pcwKhuYQuOFwFcPo5RvsT+NdIF0pkN3+CVG97Lv/tDStjBdZq
 Y07w==
X-Gm-Message-State: ACgBeo0Q1jOpYIkpuvQ3ZoGcHQf3qjYpxLmSbx69T/Bkmr6J8LldFj+F
 k8s87KWcXc1+vvNZZkdWmgYcEXWmRJnovw==
X-Google-Smtp-Source: AA6agR4dxAJagWdtx/YLqL9y2VIwW8TLKV9osUjkCIHC0vf8PtPN1WzCVnc/3F4Aqw4kxeBiADt2Tg==
X-Received: by 2002:a17:902:7e84:b0:16d:be50:f729 with SMTP id
 z4-20020a1709027e8400b0016dbe50f729mr4898902pla.16.1659115302640; 
 Fri, 29 Jul 2022 10:21:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902aa9200b0016bb24f5d19sm3881039plr.209.2022.07.29.10.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:21:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	qemu-ppc@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH for-7.1? 0/2] Re-enable ppc32 as a linux-user host
Date: Fri, 29 Jul 2022 10:21:39 -0700
Message-Id: <20220729172141.1789105-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is, technically, a regression from 6.2, so it's not
implausible to apply before rc1.  Thoughts?


r~


Richard Henderson (2):
  common-user/host/ppc: Implement safe-syscall.inc.S
  linux-user: Implment host/ppc/host-signal.h

 linux-user/include/host/ppc/host-signal.h |  39 ++++++++
 common-user/host/ppc/safe-syscall.inc.S   | 107 ++++++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 linux-user/include/host/ppc/host-signal.h
 create mode 100644 common-user/host/ppc/safe-syscall.inc.S

-- 
2.34.1


