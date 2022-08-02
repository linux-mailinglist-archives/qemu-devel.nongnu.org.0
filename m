Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819FC587566
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 04:06:58 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIhJB-0006kQ-6T
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 22:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oIhFt-0003Zx-B9
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 22:03:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oIhFr-0005B0-QS
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 22:03:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x2-20020a17090ab00200b001f4da5cdc9cso6968991pjq.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 19:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S6QeTRZehyEeuAg/fZYmmGDgW/s70yIYqa35AH9HThM=;
 b=LZ/GPEiAxTFF3lZ4yiMhFNn3dWOaAQVRpHLwi8H+4mBoTm0Fq9phnVdfPxw9hdatH8
 0QHrhXusc9QBV7XfuQOtLwxQsh1AlMAE9JB592MU/sFih2GMKBiQKgyc4TNerCkR293u
 HN7wpkkYNBQMNLSQylWy4GcH5134Rlyc5ZPF6fSUImUFZ+ATJI2psN8UVDSKbNWAtdn/
 fk22EOmUYID11oi6YzG8XkZ8bMSykkLY0BmJKo0q1xixLo1SXnJ7koOSkfCA8UQHhkqR
 x9zkwSlO4RRCnEwsVeqHZbcCBTuXmHfr2CUnlXZL2yAu/0MrkiqJzHWbcO2ufDyFTEBs
 6TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S6QeTRZehyEeuAg/fZYmmGDgW/s70yIYqa35AH9HThM=;
 b=V4KMhXiT84vTEkVc0UFu3GkqQj6ang+n52UE0k7HlbC3qLKX5C4yzeoBLD99yPTAvM
 X7J1DpPNHmsMtilHQtd+MY04Wf1E0CSqVafHOpINzkIrF6lqale62ZbDdnP0EinaQm2D
 rHTNIboZ5hmW5qQBbMa23sCfIg2JIJFhVW+aFqXIdHwBZw94Kq/y32WfeZMdqYdJYxO9
 OENqpVaSLzpkrczMHNvmwl6eJCaz7kEFPffpJHfhxz1PE5Q7j2BkxpQ3izhVrOFeUStM
 cPq0cPmmVrIcP5KFpu2JUEvKT9ZGIT7BYwwJbQHPSS99/Z/l6xTsJzQi9m92BK2QIctu
 phBA==
X-Gm-Message-State: ACgBeo1tjS07wHAo27g8lvVTzC7Vyl1c8OcjIB/7Kh9XHMOePsrcLdx6
 P55D7iP3vyuTT+fw7idvGJI=
X-Google-Smtp-Source: AA6agR4hKXmC9zPng5blHURtDKm6nbt8DtLJgHqx23XODiB/Bcou5E7jPaXn99X48HMQ+5623oiEMg==
X-Received: by 2002:a17:90a:8a8d:b0:1f3:155:3324 with SMTP id
 x13-20020a17090a8a8d00b001f301553324mr21376254pjn.89.1659405809883; 
 Mon, 01 Aug 2022 19:03:29 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e5c200b0016dbb5bbeebsm1931089plf.228.2022.08.01.19.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 19:03:29 -0700 (PDT)
Date: Tue, 2 Aug 2022 11:03:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [PATCH v3 08/11] target/openrisc: Enable MTTCG
Message-ID: <YuiF7wkIB+pREEy7@antec>
References: <20220729230117.3768312-1-shorne@gmail.com>
 <20220729230117.3768312-9-shorne@gmail.com>
 <a12ba704-b29c-a521-c664-7838c058ebf5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a12ba704-b29c-a521-c664-7838c058ebf5@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Jul 29, 2022 at 04:42:54PM -0700, Richard Henderson wrote:
> On 7/29/22 16:01, Stafford Horne wrote:
> > This patch enables multithread TCG for OpenRISC.  Since the or1k shared
> > syncrhonized timer can be updated from each vCPU via helpers we use a
> > mutex to synchronize updates.
> > 
> > Signed-off-by: Stafford Horne<shorne@gmail.com>
> > ---
> > Since v2:
> >   - Removed cpu_openrisc_timer_has_advanced lock optimization, measuring revealed
> >     it did not help much.
> > 
> >   configs/targets/or1k-softmmu.mak | 1 +
> >   target/openrisc/cpu.h            | 2 ++
> >   target/openrisc/sys_helper.c     | 7 ++++++-
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thank you,

I guess this whole series is a bit late for 7.1.0 now.

I will post the PR after 7.1.0 is released and target it for 7.2.0.

-Stafford

