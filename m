Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0E565E84
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:33:35 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8SlC-0006AG-Q0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8Sj9-0005Gh-2s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:31:27 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8Sj7-0005TH-Jl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:31:26 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r22so2817602pgr.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I0Vrv35SHNbsdWU5EFENuhNKiLs+3jg18ckVfM4vxw8=;
 b=IEJZ4b0d//BWjIk2az3SAlEl7bZgnyVR02Z3RmVrTRTOX71k8JyP2p7LC/8+8ZmtKf
 fLgBRixs30kSEEXPrGnMkdd6fTouzU9239TsTA/lYgNGJ+KluKO4yvH94zM8zxejhDVu
 tqIddFNxKqW7YNePjgHP59BevOFWq2BQWoDCOoYXRO/Xqhz7HHJ5j6e9Su3QP+PVnAt0
 aIqpq+zQ2FPzzSwExXg3IimpVwCs+6oFxPoKaK5RQFEZg/8Drblp2OiJf714sRNVsXDf
 LqB354jBzOocY/7plRDr+/fpb5VUr6LWdsGRuBsGq+UhIVehZvZNymg4fLgi+ah+2Z4i
 h2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I0Vrv35SHNbsdWU5EFENuhNKiLs+3jg18ckVfM4vxw8=;
 b=htSseSA1vnlNe24qgGFj7X1r1bprG5W1bEaryun0xC+HXCO1ggjk9d7QWcadTaC6nz
 iWnAFRnA/923h0VolW0L/Dmj66+UKwx0t8jdTfLSm9oFhzkrrmY/BePZmQEEYPxpvldf
 Tn+LjULl9ZGddPaCO4MyA/WSP1yKkkPpCxaY8S9odDb2+vJImwh8VVObNst0VYIPCiDZ
 3FfOQZzzG1bTqzljGUUyznhyQqq03e93FcPGRzaJXBuGrqbZXpDe0WwtV+P4ts8ETlrR
 WXNlzMNHMl8+FWDIIBJm6RjBvaQvtes7ASKYnCDzOrn0RcSBtFMaNmXZDYhq9dn+EFYK
 kumA==
X-Gm-Message-State: AJIora/1arRGxTtSRyBel3Yu1VY2OTfGb9IkkMV/HrTBS/R+9aO8widj
 OZnk25/mul52Wj/dZ8KIbBXXGQrGK6w=
X-Google-Smtp-Source: AGRyM1sweiJ0sqC+ddiirnPppX6YP3vh++xZQ6dtCoxdg0wOpL7TGtR6tMs+rKFakbntTjT2Q16Wwg==
X-Received: by 2002:a05:6a00:1908:b0:525:5dad:cb1c with SMTP id
 y8-20020a056a00190800b005255dadcb1cmr38054515pfi.47.1656966683999; 
 Mon, 04 Jul 2022 13:31:23 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6362c4000000b0040dad0ac789sm18934889pgb.88.2022.07.04.13.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:31:23 -0700 (PDT)
Date: Tue, 5 Jul 2022 05:31:21 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [PATCH v2 08/11] target/openrisc: Enable MTTCG
Message-ID: <YsNOGeXkHytGEUkW@antec>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-9-shorne@gmail.com>
 <13726190-bef1-a987-3158-0f60cac69d1f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13726190-bef1-a987-3158-0f60cac69d1f@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52c.google.com
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

On Mon, Jul 04, 2022 at 03:37:04PM +0530, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
> >       case TO_SPR(10, 1): /* TTCR */
> > -        cpu_openrisc_count_update(cpu);
> > +        if (cpu_openrisc_timer_has_advanced(cpu)) {
> > +            qemu_mutex_lock_iothread();
> > +            cpu_openrisc_count_update(cpu);
> > +            qemu_mutex_unlock_iothread();
> > +        }
> 
> Lock around the whole if, I think.  Otherwise looks good.

Well, actually the cpu_openrisc_timer_has_advanced read is done once outside the
lock as an optimization to avoid taking the lock when it is not needed. i.e. if
we have 4 cores that all try to update the clock at the same time in theory only
one will have to take the lock and update the shared timer.

But I do see that could be flawed as after it takes the lock the timer could
have been updated by then.  Ill move it inside and see if there is any
perfromance hit / increase in the sync-profile.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~

