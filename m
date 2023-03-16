Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFEA6BCC33
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckap-0005Tp-Gj; Thu, 16 Mar 2023 06:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pckam-0005T6-MO
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:12:17 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pckak-0008KM-Jc
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:12:16 -0400
Received: by mail-pg1-x532.google.com with SMTP id t83so579749pgb.11
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678961533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fc4pvrXgtE2ZNMIye4ezRHM5j5pVsWdJIf0ztbDxvtI=;
 b=N2tqkpfkaBMsGrNkgT6vrhJ+DPrYMQyHPurXodMzvc3rPSjNfNivHgtNA0q6byLdbh
 ZPZDefF0WTreViOtkp2jZ1aLMCur6Yk0+lQC7iUHMjg6H0dQgPUn7EqsQj+BWSBrzklV
 o013OB35LbXqsoNcwpfoyCw+LQZFRObpKjDpD7um0Nwh43bmUoOl9NSc8w/OHjdSsoU+
 cmjvcWonxXecDrimw8kAXH8o1rdL8/L5xMmWsDRmchbhgnehCtxRzqRnBNr71+m3XhRU
 SRhExSD7D2YUGZ+wY3Up8hiJozvCCzfeu86kUsDiGhuzQQzgurVuVy3Cbt7JhGdEysFE
 CKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fc4pvrXgtE2ZNMIye4ezRHM5j5pVsWdJIf0ztbDxvtI=;
 b=FB7mhvsKohMmfpCeyiWis4V1djcQZ2/7t9HEOKf/xZ7tblQGt7wNnwELoGsfUTA+GX
 Se3LsaaeV6siPfFSpBDmscxmlzODp68Zv0wkRe3dqdqOvv5bisSbmdb/Hy+w3tdDU36x
 wBw50ifsO1wFSxO7Kt/H0OCmCwRF1KT20lceXPT7uYMjWClB1RDiEqnn5T3hh2MEPn9+
 Xwx0PXIp472TFBbtwhGvn9Sag3FvleJZwNPY+KZ9frLGi3Zrbavs691DNnIhHlgbSgiW
 N9BFj4WsfZ7Zdt2a9/ZLNMZbnsJ3ePc5oTAD8gegwNIXCDUkr1v+V9+WkQyKA+K6Ov9J
 Cv2Q==
X-Gm-Message-State: AO0yUKUBYRtNiDfAf3LnSmTMIAERPAufWK0O4bMMwyTi09t111bPHmex
 K6ccgNJoPrLBT/6DyT/YZNZ5Y99gjAfvVY865eKeVw==
X-Google-Smtp-Source: AK7set/GKiGcBbYiBgeDjc570C5QykzDxWeONgaPRBnJY5X+7OcrzZzUyhxg+m7LHAbwMrT+rOFwg1W8zDWHoFonvKo=
X-Received: by 2002:a05:6a00:10d0:b0:625:d7e6:51a0 with SMTP id
 d16-20020a056a0010d000b00625d7e651a0mr1409260pfu.1.1678961532862; Thu, 16 Mar
 2023 03:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 10:12:01 +0000
Message-ID: <CAFEAcA9MGK2hs9PQ3FDG6jhc-UZja6Zfjg4_NEBmJL7OfTwYHA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Mon, 13 Mar 2023 at 03:39, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>  target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>



Applied to target-arm.next, thanks.

-- PMM

