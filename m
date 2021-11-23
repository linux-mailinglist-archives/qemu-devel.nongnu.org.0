Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080C45AA94
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:53:45 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZzE-0000jA-JU
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpZsQ-0007SL-SB
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:46:42 -0500
Received: from [2a00:1450:4864:20::435] (port=37681
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpZsP-00063N-7Y
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:46:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id b12so40331636wrh.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fT1se1ZMcem8yAzBEjkdVN6j0Sf1AV9hhBoZDI1TbLI=;
 b=cNKQE1c3Zh+5SH7XWucI2xjibwXb6+C/D5pqVXH8t+yU1bR8a3+9tM0N2Rd0pm1udV
 jN0Me464rWrBP4XUTkuK9cJY6iTfNLi+1rx+/B2mIT5PQ7Uaiolrd1kiDVQKQuG20mdT
 LoxJxjcNz2q6bkY/CoZbuAkjUeCEhqdCWW6JB3PuV/t/3UVqB2PqBH/OQjlOSoh2Wew3
 LgofjTJhHkzpBwiEMB0A+SCJvzEL52MYc3bzJ6FyOvlQxJj12irBgqevZ97SoV5RuxEj
 rqIr17dcgkbl8p3gSPrlnx2ALWxpVaRazgs8sFZUIr6f04/wmO5xq6Ejxe8p2/SGFV/5
 wV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fT1se1ZMcem8yAzBEjkdVN6j0Sf1AV9hhBoZDI1TbLI=;
 b=grSm3QOv/8iLvF57R/YkvDvQfuex/HBRCEMyeCUZa2ojJ663IXMjznad/RscGzid9e
 C95OnRml8d10c+gWyJaQ3WHimNs9lqZeUo34vcGltBLWKSvPklByiM6KqYHK8VXbyns/
 b4R55E4cDydFUKhVIs2k7xsh9vtzu/OI9pX56YuoO9CT5EwhegoqdJgnwC3oe/VekSoD
 KJAjPlsJhLpwcWH0MxrOubSroJnJbS+vxaybUOWtaIxEnH2fmYC+498JBz8Y2lKDR0wA
 NmjCJY/hBIe1FVW88cx/9ghVRdn5/GgJFmaFRcAROEa0MItUdFtNy3uSfrF+T+e/+Z2I
 tenA==
X-Gm-Message-State: AOAM532HH1QXUv9thFKHkrEmAWd9uwjN6uNvawatLoU+ibEnR2M7Ysz3
 ELmmjnAv1xdBWqRt2rKCCtNqGYlZuZeRrj42PNJW3Q==
X-Google-Smtp-Source: ABdhPJz1kidocrn9q9tH9wJTCxZW5yPi3cV9yWkePsGCcngNyFMBKlNGJ4tKvHK7WBeP1dQiTzBw0pH+82PDIRE6cMQ=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr9539602wrs.263.1637689599230; 
 Tue, 23 Nov 2021 09:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20211123171031.975367-1-peter.maydell@linaro.org>
In-Reply-To: <20211123171031.975367-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Nov 2021 17:46:27 +0000
Message-ID: <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 17:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
> new highest priority pending LPI after changing the requested LPI
> pending bit.  However the overall highest priority pending interrupt
> information won't be updated unless we call gicv3_redist_update().
> We do that from the callsite in gicv3-redist_process_lpi(), but not
> from the callsite in icc_activate_irq().  The effect is that when the
> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
> pending in the data structure but still leave it in cs->hppi so will
> offer it to the guest again.
>
> The effect is that if we are using an emulated GICv3 and ITS and
> using devices which use LPIs (ie PCI devices) then Linux will
> complain "irq 54: nobody cared" and then hang (probably because the
> stale bogus interrupt info meant we never tried to deliver some other
> real interrupt).

Hmm; this is definitely a bug, but maybe it's not the cause of
the symptoms listed above -- I've just seen them again even
with this fix. I'll keep digging...

-- PMM

