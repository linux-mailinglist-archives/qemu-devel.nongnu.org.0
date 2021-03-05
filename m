Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05F32E743
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 12:34:03 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI8iZ-0003bt-1c
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 06:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8hY-0002oH-CP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:33:00 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8hV-0000tN-JA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 06:33:00 -0500
Received: by mail-ej1-x634.google.com with SMTP id lr13so2772585ejb.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 03:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lZVhhR3YgpTzjn8evdkRljvwW27x0grWX/6TbXEihkQ=;
 b=bEZ4lBZjN9FQo1zZ7gUgBaPF+bSHLSMkGawzRBNGsq935l2vkvEHkOk9Jc2AszjCjG
 QGWkCidKGSdOlNXIV4/ZWL5UVM5abBEaOPX/U5IUZZLE/2zSB1hfvMVtOkL+02vgT7jU
 nUBbxqH/stcweQh266KoA6KAYrHGX17bhb/Nsab74GsEy+jhZRrcm7N9W51TuDcE+me6
 po3+ZvQnYd1T5N+srcbKYwjb6Bc2XlbDY4OKd5RmwN5hiaR+XSOIK8KgA7W+Z5aO0zpd
 yowZ0fEtS3rnZdGFg2gZQn/HByuTcnNoKCkGJc5j+EY/IVLTSbD/Jw+WYPhv95Id1cG4
 2t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lZVhhR3YgpTzjn8evdkRljvwW27x0grWX/6TbXEihkQ=;
 b=cdVXLumXXXVXMV87fXU1AQfDtt2SRNkPYccCzHNUHjfrGwC92Or1CkSGfSi72wqZNm
 On4MbHOHYSuN8BNLHNjYcnEuNp8t8Y2edkmxVMc0xtsVPJIDcMhPrT41pJ+5zXa39yHm
 IoKqTa3nnuua2SiqrUHJZ3E8Q1ahK9khA+k0qIsIXLmKc4H68NM9STkHA11yQ1bdMB+e
 UmNsgaRjQLl7vNeGawD9QO1YKQjW7qacZ3ki0hccdCQKQiAPtpPutxogTcYTjRcjjaYE
 XqStkNWtWasWBZxrv3ZIr6hWlsJ09oml+8+arPb83LWd0PtFoXkzS9j3PSQPRnErrSq5
 +v1A==
X-Gm-Message-State: AOAM532wt44eotoDWOqH5fG8xoqDumstRDUMu+ml/128viJ74AhZ0NFb
 EEmcD1m5N0NhGUkE1DL82iWFV7G+DmtSWRxruvUaSQ==
X-Google-Smtp-Source: ABdhPJw2qt1D6hMMlStPzeaYXtOfFqRRbDSramqnHqzihdygL2qUFbqPvUTZEwB6M5vjoGiW9+i0ft8BgY7YwgKnDHw=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr1817959ejj.4.1614943976226; 
 Fri, 05 Mar 2021 03:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20210224230532.276878-1-richard.henderson@linaro.org>
 <874ki0bhi1.fsf@linaro.org>
In-Reply-To: <874ki0bhi1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:32:40 +0000
Message-ID: <CAFEAcA8OFQJxCeGB9aF1P3UwJTddRb6fMuOJbNKMYs+ktw+izg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Speed up aarch64 TBL/TBX
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 09:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Always perform one call instead of two for 16-byte operands.
> > Use byte loads/stores directly into the vector register file
> > instead of extractions and deposits to a 64-bit local variable.
> >
> > In order to easily receive pointers into the vector register file,
> > convert the helper to the gvec out-of-line signature.  Move the
> > helper into vec_helper.c, where it can make use of H1 and clear_tail.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Looked marginally slower on the (1!) run I did but probably in the noise
> and the generated code looks nicer.



Applied to target-arm.next, thanks.

-- PMM

