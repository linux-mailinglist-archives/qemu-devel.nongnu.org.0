Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A784541E14
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:25:53 +0200 (CEST)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhe4-0002ET-5u
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5f-0007Es-EQ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:15 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5d-0001MI-KR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so16493793pfe.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMtpnimZ5QgXW0nogoQSK/48rYQQQjk5GcZeidEuLkk=;
 b=RC0kdQV/uPNhqLm72RijpkLUF5L7QVTprW9SL39brQvjT6o5QBz4J/fq5YEncTAy8T
 bnRFmfZoSGbgv8VOgbXBUx1MLAVr2XzNj8XnNdJkomCDccym0iHRjZKkpkRGN6cwr/Uq
 zl0WINYYS6bIvE75X3ZGo8st8s+W/1cbm9ofMDcp8XQuXIMTCS4ih+4QF87wtGglBl6K
 0ghVFSHt1odqsJo/AFtyTOHy1+akXD0oo22n7JQFmraO3YHHf2PfW8WV9J0d5/Mx5PHY
 sDdLfHGNV7qGea+SDyOkmqzi3llNM32mdwR4nirxa4gTGqXgjqZoeCdsTp0jEJyhcECn
 45/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMtpnimZ5QgXW0nogoQSK/48rYQQQjk5GcZeidEuLkk=;
 b=pylZ5s2VKaEvP9J7w2nFvgd1A3qjF9jHdugdZbT4g+GkyEdsoBUno/5G+bBO7SpGna
 BY3b7KSc0oMpI1bBKl7PXYPzZfc+Qwmk8GCW7yUCPyzInIKxl6Dav0iNEEoZmY+Sv4WA
 haepEcmoTS8PM7U0OY/1//1bQRZ/CpOUmcRM4ohfJwS3KHt4MRK3XYPXl6D66bljbkXI
 aCmxFw0UzS9a75HnFLpRmf5YQie6I0SbHyYIG4adg9rWzBlB/K8X0df4Sq/DHJrWjtvz
 ir6s3wNXTfv8h+SEuxYWyREITfYWcAbOHpexe3lmqW9zqVa3DToUZ+ju2OzWkjs/vKLf
 vrvQ==
X-Gm-Message-State: AOAM530IYpKXf3mh1H2yUnsPwbj8hJoCg8dfqyn8qxRunOtGBqka6jbs
 QODBlh1yPpXrgHaXpL7X2XEnskxcQe4Hog==
X-Google-Smtp-Source: ABdhPJw4zgi9ObbjcHidDztcVnEnKyRrgXw5AHplUtACFJ0HhtEUG1PgZUpAvrVNUHBYpGKz1+dA7g==
X-Received: by 2002:a05:6a00:a04:b0:51b:6ea0:43ca with SMTP id
 p4-20020a056a000a0400b0051b6ea043camr30940093pfh.78.1654634772020; 
 Tue, 07 Jun 2022 13:46:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 14/53] semihosting: Move common-semi.h to
 include/semihosting/
Date: Tue,  7 Jun 2022 13:45:18 -0700
Message-Id: <20220607204557.658541-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This header is not private to the top-level semihosting directory,
so place it in the public include directory.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {semihosting => include/semihosting}/common-semi.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {semihosting => include/semihosting}/common-semi.h (100%)

diff --git a/semihosting/common-semi.h b/include/semihosting/common-semi.h
similarity index 100%
rename from semihosting/common-semi.h
rename to include/semihosting/common-semi.h
-- 
2.34.1


