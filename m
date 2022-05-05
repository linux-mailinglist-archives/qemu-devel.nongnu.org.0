Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215851BB19
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:56:01 +0200 (CEST)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXHE-0002wo-5p
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWz1-0004bT-WD
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:37:13 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWyw-0003nH-Uy
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:37:09 -0400
Received: by mail-yb1-xb35.google.com with SMTP id m128so6429737ybm.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OUAkmqd3TtLJ9iASsoXg/T6HT031NA44UWZejGJNkw=;
 b=tNH226wCxGwwG0aYTLDibDNB+qffgIoWSvyOG5RTTkd83aSU0sE+PlAb3zxpoYYraT
 C4Csw0dkmo1TG0wl6fbcFD3SvmbHKN/9CvztA4BYEDANc1ng5DFXg1NJRBIx+2caDM6J
 g6AD0s9li0JwMPI0e2kdpGE0lOP0mOGQiEQoHioeOAPNGZL4ipTmv3WpVBmRWHs9Uuio
 suESSNsH7LK4cZpIZpBhvVqR+LYWG4iAp6qu/ifg+e3pRT/1Dtp6aotbrEAZw92sDrmZ
 5j5Uv13nKRQ+cioHgL1eS+1Pt8R6xsIyXu2xrQexjTXi8lbc8QNo05MhkleAtRumnhox
 GEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OUAkmqd3TtLJ9iASsoXg/T6HT031NA44UWZejGJNkw=;
 b=mDo64kh1I/IbSNiP4PvlhkcheZYRmpJVggxWdI5iJ5Z8JGFNI9N0oWzBiEVdW0Nfwq
 sbX4HGYkiEzffvwj8RCVHDke4wv9+tq8y63kV51CRWMGFcplhpq6sDijEI33nx/0Z1R1
 KA6Pscb57RDhFVAm+uPcB+sPIGTeG829t9pq7q9kzu005pVnSiRt6asObUG1QAMcmY3S
 5coWeR5dwZE+sNdWTVEv51RY0xbMOP3304x8pjkwjWfK32j67g1xxe/l9jU7AhkGFiRP
 b7BVRn2A03+uMLItW9TFJu02CAwHW8lMZI9qldYNbhKAtjy9ZPg05DmRHuDOg8EbXh8n
 C/Nw==
X-Gm-Message-State: AOAM533HI6Qh05L7f9qi0kznGWBz20oRybTuThh2yB1f2Tk2yx7O+Clt
 TZf52DeZ2n9TUJkgwixkjVEfUDgJttf1UN+ZluT77Q==
X-Google-Smtp-Source: ABdhPJwM/J0JZA4nwSw3YHqGyhjEDr3T4/tq0YQLZfo0Mr/oapHZs93K9FvKrCnhg+Ja7GUdHBrEoMeuj+L9ZLDXNuI=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr20855991ybq.67.1651739825939; Thu, 05
 May 2022 01:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220428132717.84190-1-alex.zuepke@tum.de>
In-Reply-To: <20220428132717.84190-1-alex.zuepke@tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:36:55 +0100
Message-ID: <CAFEAcA_vtq2M7X2o2QydkcEZbaVtmA6FdOqxgYLmdSwfYsNBUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
To: Alex Zuepke <alex.zuepke@tum.de>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Thu, 28 Apr 2022 at 14:28, Alex Zuepke <alex.zuepke@tum.de> wrote:
>
> The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
> to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
> we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.
>
> Signed-off-by: Alex Zuepke <alex.zuepke@tum.de>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

