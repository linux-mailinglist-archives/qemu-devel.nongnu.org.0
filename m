Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155783C2A92
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 23:00:01 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xbL-000060-Mt
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xa3-0007rx-1o
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:58:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xa0-0004eM-6j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:58:38 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y4so8675281pgl.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 13:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FqtAtTDLB22k3jBXuPhUN3rBqIRDELB51/iO5u7aBlk=;
 b=iJV4gWYr08uAg6m8BkNElfjEv84Bnxh0eBHigv8fDuMRZ+fYBskmT6oqgh12goG3s7
 BG7ZBadOEvCczC2Hk0rAky5YW7DeA/N1/4Eno+4iy5VaOlKn3P2cmwu6sy1vJEkVtJuy
 wrafyMCvYwN4jI5EeMDw8UdWLh/aGRZCPuXLEAS+p68xHD2jSDO7ixQ6kYBkB8gVWnL6
 9HZdBthtwsHU7SbHf+/kJYDLPt12nRsBzoA6yBjB1PZxfaWnfkbNNgjE2b7rB6pyd386
 8dCYckTrCXL4h94mTFVm4Pct6QCeJddH/YiDWqGaiBRvdCBbfrT9ZEh+IbtjwrJL4JFi
 Xz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FqtAtTDLB22k3jBXuPhUN3rBqIRDELB51/iO5u7aBlk=;
 b=NNfWgpip+ejMMwLn/vhiqFyjuod05aCNw3J/8786Z3mIWDUcJuT5vfCwuD6R4IDyGK
 sBBzunTWPOAFyZU2rSqaa8aAjxuxCRo7WYDgJolrnN6BXNPqRXbsMe2AdIWNi0hz4nHf
 2hL9hrd+bejdHwPReD2WU3RwgTFAOenPx+bkiD8JiYXtFMI8uVa2Wli8NvRkL7G+yTVA
 i0hCJnTETuGGOFuInJDCwKaGrE7Y4zkBaLXJ1k90O5U7TD/nmyZ/ikYPi9p95RGYXMo1
 ZXx+ASxraV+u3KzltaXKnWeu7xxq9e3PuSfBMklvXuBe6abG46S1UDV1L++LH+VrR2DH
 x1uw==
X-Gm-Message-State: AOAM5309LR+5OC5DPcmT7qQaUlnyWP6b5hM0wHi0EsARBdJkZqH3ZLE0
 b96GXx9FvgBwegJg/QRC+Pk=
X-Google-Smtp-Source: ABdhPJzNomwjr8ykQ8A/lXKfCyYyvU+wID2pmq6PDXWlVi5JbmpEuOzPmRGsX44qn5m5uiryovvflg==
X-Received: by 2002:a63:f711:: with SMTP id x17mr32738014pgh.226.1625864314033; 
 Fri, 09 Jul 2021 13:58:34 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 y10sm6326257pjy.18.2021.07.09.13.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 13:58:33 -0700 (PDT)
Date: Sat, 10 Jul 2021 05:58:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/4] target/openrisc: Cache constant 0 in DisasContext
Message-ID: <YOi4dwNXTAAQ9DrK@antec>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708213754.830485-4-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:37:53PM -0700, Richard Henderson wrote:
> We are virtually certain to have fetched constant 0 once, at the
> beginning of the TB, so we might as well use it elsewhere.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>


