Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848923C2A97
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 23:05:41 +0200 (CEST)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xgq-0003nY-9u
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 17:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xep-0002ww-BM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 17:03:35 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1xem-0006zM-P1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 17:03:35 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l11so6415279pji.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 14:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AEMeWRIGdx2cEw1AaEarFVPD0HYBEPjr3nDdONF5SK4=;
 b=XMtqi2mP674dtK2NFpS119Fj6Q/5QPBE1eLUd71m44IK5/UXA5dL0IgvrGThYYZCsw
 XxRSJx7dYDMCGks+VbB6YAiN/6Tk1dPivjfwcQKwx53K5RC7absyuFdaa+ZtYIxf/HgX
 rTws/BYfu5n/eB1ilOgocix8hJPADc59nFI+wL1tUe2UT+OQ2M4XOO4YDE5rA8IVa26z
 J93LTTOINVoBHNEe+lJp6m/Sl9WSpGojIoBnOe6MP7XXT7mBsTizYKv9gtng3HbsVDvy
 DGFXAS0e+MgXblVo84j/02WJJZ36u4zbt6AFPjkQmWYweV82AJ9LQ1HcZbqvHQkRrmcd
 2R6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AEMeWRIGdx2cEw1AaEarFVPD0HYBEPjr3nDdONF5SK4=;
 b=oNbBU1mRNtyxVQWrBhBpItyeYGYYKzYkpyW5IfPuF/kyouu31dyPV+D56S79ee1GwD
 kOdZ5K/11yfPAxsdqQXX0LBb+ALJgJTFnLHzxYAPGhXF/b8WKRZFVDeqzzbPSjvNv/cP
 yu2fKlz04xfOvG1ZkQMBVMKBOChEXXGbZLcg1lAA6nDRLa5XblODae3c3CZwQKWQ8hNV
 GIGhA2Ft30N5Z8CWxFW/ffrb/UZ2TEry8ais7PeJngr74NaXbxXn49BgYyuGh3fteotg
 2GEegriGElf/MAF2lTnl5eblTdvZfftIO0D+LV2zVbqeY3wpaANFUfh69qmMwv+kdnxY
 gIJg==
X-Gm-Message-State: AOAM530+eFGEiooeDDVcrq/6bcESGelI0GmhLdLM4L+9fyPiCm03wphr
 zfOhVOl+DorTgo51wHET1uo=
X-Google-Smtp-Source: ABdhPJwEpJj/DBz33gwgLPkNYdPV30QmkUSGzjql+nJICQcdrUsjzTFB+G4Hezm6eU3d/3ZJPFU3Xw==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr39364540pjt.14.1625864611317; 
 Fri, 09 Jul 2021 14:03:31 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 n5sm1847816pfv.29.2021.07.09.14.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:03:30 -0700 (PDT)
Date: Sat, 10 Jul 2021 06:03:28 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/4] target/openrisc: Use dc->zero in gen_add, gen_addc
Message-ID: <YOi5oA0V9GpJZDN3@antec>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708213754.830485-5-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102d.google.com
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

On Thu, Jul 08, 2021 at 02:37:54PM -0700, Richard Henderson wrote:
> We still need the t0 temporary for computing overflow,
> but we do not need to initialize it to zero first.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>


