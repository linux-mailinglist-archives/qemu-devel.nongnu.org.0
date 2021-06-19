Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BBF3AD7ED
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 06:58:24 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luT3n-0004Bq-Du
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 00:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2X-0002uK-8J
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2V-0000ML-KG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:04 -0400
Received: by mail-pf1-x432.google.com with SMTP id z26so9303049pfj.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAPBhSHIww3Y4KARBL9+L3iSrp1KeAElN0D+pomMotI=;
 b=OWg02n3wFiTV4skkn8Jn69+XQSfY5EFzgkCOmM5EMK4y55OGr3r+RY/mYwCwjLVnAj
 ayx53N9Ilquf5dkT2KIMFzKc0+ptZFHyd3hadHCVRF7oyhlg6XfyzBu6ENzBZ2KufLRK
 baH62k8ArJe/j4XI0GX2KC/yWdtMocxe748aMz8N218AAuDWWZvTK610F1DWjd2n3EUW
 WCUvdkytBdagdl5/g/r3kAVISloNXAbvXm3OBKBsOoXjel+ylZB6+ajrQOqijxDFxY1C
 fSfrX/bkdJ0o0C5ebWlRl2Zm6ew7G8gR0uo9UDFjeVpBGR/+e1ZWGtFp+qvKrWrKRWuq
 S8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAPBhSHIww3Y4KARBL9+L3iSrp1KeAElN0D+pomMotI=;
 b=moNyP7Q0RUoE99m2ZssUTvrc003IHlQwx04+3M+VU+edqzzuRziZcXfhz+JOBiEpTZ
 XeIjCZYTbwK0urfLkdhuCz6FYWlspyYqVn+6ZtHqrTRG0MVSNgyYnTs4CX/PaXNtqaOt
 BC4JD/IGP5KxGLtncuYexMmGPaJ0qJe4jSfUhI2lVxyyJ4O4d/dgvoq+jisGY+ibCarJ
 1IIdI7yJpnaPGcB1/L9OQNQJ+4eInTnbXOCgj7dZ80qZRTxXof2EpOHO/FOLmP5SZyHe
 Gx0Z7JtVbSzC6gjzn7TB5OI4WSDaBDgFm9HJHpcAKawjjVgTIN46oQtXADKjTKCoZcpw
 OqIw==
X-Gm-Message-State: AOAM533sUo4oviURQR9BY/eUOc8QRm3lfb165B2gXq4nWc3hvjuJu+0T
 UWjFzxJJp5TNLUli3CaW+pJu4mIorX+J8w==
X-Google-Smtp-Source: ABdhPJyysNosFuDOX5fTqJK2yexbJZsGuvzJqcnRIsmI5Z2juYl7j4v+i4SukMWxwSdAkzl0WSEKzQ==
X-Received: by 2002:a63:5915:: with SMTP id n21mr13285061pgb.58.1624078621567; 
 Fri, 18 Jun 2021 21:57:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i6sm11581378pgg.50.2021.06.18.21.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 21:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg: Fixes for temp_allocate_frame
Date: Fri, 18 Jun 2021 21:56:58 -0700
Message-Id: <20210619045700.46907-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan, I think this will resolve #367 for you -- please test.


r~


Richard Henderson (2):
  tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
  tcg: Allocate sufficient storage in temp_allocate_frame

 tcg/tcg.c                  | 41 ++++++++++++++++++++++++++++----------
 tcg/sparc/tcg-target.c.inc | 16 +++++++++------
 2 files changed, 40 insertions(+), 17 deletions(-)

-- 
2.25.1


