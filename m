Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1B45DDFE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:50:27 +0100 (CET)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqH10-00054s-9S
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqGyx-0002M5-Ef
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:48:19 -0500
Received: from [2a00:1450:4864:20::329] (port=38454
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqGyu-0005On-OU
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:48:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso8659046wms.3
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ZiiAdoMXvpwVANGKUlqfPUaqJC3IGe25PRTFgj1iI8=;
 b=sMR3fOuByG0vt0k/ubQEkC8qUSFtgO9yCkGZn8tmlGJ/JKpdz+hMZTkbjSrUhLdMh3
 H/UG8I7Gbs5hreEY3TLymLCcjocwty/9FVMkDwH6mIuEpAzO5ZfUn6dKBhm8afc+jMzW
 8uBG0v+KRBy16UaGstuNc7fyQTyOSzK1qAYRB67wrSjQ9vIBqy/4gClO60D8gCZUNS+e
 /3lVGAwCQyFMM8KDDg52Dp4aMtM9kCHbgO5e70Gox9aKZYXaonAQ16hSqJ9gxpY/p4o8
 YTc1a4VKHQHjVMebFVLpHVoDN9oibDpj9qn/E0sfQdA/ddIRmDBHF0c8MSHVJU0FIUIK
 XvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZiiAdoMXvpwVANGKUlqfPUaqJC3IGe25PRTFgj1iI8=;
 b=Vz6D0SXsL1ElXpBUJM7PDNWntHIBtV8x0/qsIRWBBQDOiUFdb+JhNz75z/GazWzf9t
 ahhfUJNaNr5qDtLUMmIrM2V35mlPnYCYQsXkyKpV2ahAGdluUgRS/1DNq99mC5SEyJWR
 asP2W12CbXAEffhnS+Dy/PFGg2CRpmLvsmCIFDnZpWajTQbguKaf26yaEeLU+fuJLAgV
 TIQCHxYqehPh9jd2I6Ug+ENFcoHeyUgFIvRC4iZq8XtmOM+CikmMRvGN23VVenTZhXRR
 l+VNFNv5pMAYIFJDgbKDC/z4IH1JHEfNLRY2tzuLXugNsQa5vNyFDcWOUenP4XtYPEoI
 gxyA==
X-Gm-Message-State: AOAM533TtzrNSODuJRWH96c0yUiCAh1olknJxdROHT0/A3cOm98avdzE
 8AP+7R9T+R9ROgx19qrZL/2xCCQDdIsrFyynxqcnaw==
X-Google-Smtp-Source: ABdhPJzGMKGjXupe0MipChIplC8vTMBglf9Gjw8agYQXdXvBTctBNjuWnJ2LI6aGrkJsHzu+V9whMw96XTF8zi53gJ0=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr8492061wmg.37.1637855294918; 
 Thu, 25 Nov 2021 07:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
 <87v90gfejs.fsf@linaro.org>
In-Reply-To: <87v90gfejs.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Nov 2021 15:48:04 +0000
Message-ID: <CAFEAcA9OgVksrLHZ8m_aub_tUN1zp6y6_Ev06+Xo2zDpJaLJxw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, leif@nuviainc.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Nov 2021 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Shashi Mallela <shashi.mallela@linaro.org> writes:
>
> > When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> > to be enabled.This patch fixes the issue.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> in so far as it doesn't break the kvm-unit-tests but it also doesn't
> solve the:
>
>   irq 55: nobody cared (try booting with the "irqpoll" option)

For the fix to that try
https://patchew.org/QEMU/20211124202005.989935-1-peter.maydell@linaro.org/

-- PMM

