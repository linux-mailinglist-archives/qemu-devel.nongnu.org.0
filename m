Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE03B680255
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMGPc-0007YQ-Kq; Sun, 29 Jan 2023 17:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPb-0007YA-3c
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pMGPZ-0000Vp-8A
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:44:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id l8so6889369wms.3
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WsbRZA5e02vWUBBoXG2xIQDNdseHqZPa1Z4AOPr9aAc=;
 b=SZKMlzACnIAjqiAzsYRgH4dWzUNQr2pw10HosnHv2SWOrs50GZOCLS+RXO1jCFAwXB
 qXzNuNY9GiFbhfmRELsoloXOWHV/BWzLtH+/e7j58pFxwQ4l3lbf9nSia1Dv1pSmTkkX
 BZ78tAE+OQvw8dd1fkM9zxjf9UDXw3KwaWw/L109LWkvd7qF8FTmrGT/2ZWzAOM+JQ9x
 fw5zo16RgPFHUucfzR3vXv7XTyfXYL1iA714b6bRxojD+4iyVUxNttqy/VIuAUKJDjrc
 /rr9lK7PBZIKFWshCymzalqF/tDksejOwyAH+HZDqJErYmn5CXhMumO07oHa77K4y4rZ
 ui4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WsbRZA5e02vWUBBoXG2xIQDNdseHqZPa1Z4AOPr9aAc=;
 b=uWyYKBAxOwguc66JjAKZEXrG0FAsX5sFb0zro+vlA0oDXJEFnvy6HlSpkpjWT61FhT
 R6zEQKCNx87+HiJom6w8yC9P5o21UEyhcmiNQJptw9E52Yb/WVN3Kx8Ru5MOLa1mx0IK
 ymLfbFKG49AghlWBASdfpOc3ugIJbql3xQ5CEz9fW98mHwLvCbs93evTz9OXcj7Gb100
 Y0TXcCNPNvjAsDm6F4v7D0MhxVQJXxUHda/4aCIOJ/ITyLiESB2AnG9mL8Mb9vhbAHas
 1bM5iCzZqGpFK2ao/5X6/z41Qp1ydPe0ArBVuGjJUG9ebbbQdweJ9ugYWxK3V8aMjNWc
 yuXw==
X-Gm-Message-State: AO0yUKVq8hG/Q7bL4cMkq3rZQojbyi2Ki+yT8ljgxZ1rbX/+CqjMPSfW
 iP3HahFLzWH8JPwNWhgCeL8A8g==
X-Google-Smtp-Source: AK7set+VrVf4FAiMpdXV5p5bAMbLuG7/vZOMLjbkBNpwEaf/Rdw8wMCvhyGO8sg6T/HxGcZDHMfbTg==
X-Received: by 2002:a05:600c:d4:b0:3dc:5362:134a with SMTP id
 u20-20020a05600c00d400b003dc5362134amr3356491wmm.9.1675032270774; 
 Sun, 29 Jan 2023 14:44:30 -0800 (PST)
Received: from localhost ([146.70.128.243]) by smtp.gmail.com with ESMTPSA id
 b48-20020a05600c4ab000b003db1ca20170sm1982976wmp.37.2023.01.29.14.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 14:44:30 -0800 (PST)
Date: Tue, 10 Jan 2023 23:01:50 -0500
From: Emilio Cota <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 ncopa@alpinelinux.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Message-ID: <Y740rpN1VLMV64Vp@cota-l14>
References: <20221004120047.857591-1-berrange@redhat.com>
 <Y4hP5HS8L4O6KsVO@cota-l14> <87cz93cpum.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz93cpum.fsf@linaro.org>
Received-SPF: softfail client-ip=2a00:1450:4864:20::333;
 envelope-from=cota@braap.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Thu, Dec 01, 2022 at 10:49:27 +0000, Alex Bennée wrote:
> Emilio Cota <cota@braap.org> writes:
> > On Tue, Oct 04, 2022 at 13:00:47 +0100, Daniel P. Berrangé wrote:
> > (snip)
> >> Can't say I especially like this but I'm out of other ideas for how
> >> to guarantee a solution. Users can't set env vars prior to launching
> >> QEMU user emulators when using binfmt.
> >
> > An alternative is to not use GSlice between fork/exec. I'm
> > not sure if within that region there are other users besides
> > GTree (GArray perhaps?), but if there aren't, then just using
> > a different binary tree implementation should do.
> 
> Hmm my distros version of GArray certainly does and that is used quite
> heavily across gdbstub and plugins.

Then we might have to also import a GSlice-free GArray ("QArray").
Currently we just deadlock on POSIX-compliant code, which is
unacceptable.

> > Untested patches using ccan's AVL tree: 
> >   https://github.com/cota/qemu/commits/avl
> >
> > Would that be more palatable?
> 
> I think generally we wouldn't want to have multiple implementations
> unless there was a definite benefit (c.f. QHT). That said I think
> Richard's latest optimisation work:
> 
>   Subject: [PATCH v2 0/7] accel/tcg: Rewrite user-only vma tracking
>   Date: Thu, 27 Oct 2022 22:12:51 +1100
>   Message-Id: <20221027111258.348196-1-richard.henderson@linaro.org>
> 
> brings in the kernel's interval tree (with unit tests). I wonder if the
> page_collection use of GTree could be converted to that?

Thanks. I looked into reusing this but I don't think it's a drop-in
replacement for GTree.

> I don't know how you would defend against re-introducing it into
> linux-user though aside from commentary.

To close the loop:
I've sent a patch series that imports GTree-sans-GSlice as QTree,
and uses that for TCG:
  https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02080.html

Thanks,
		Emilio

