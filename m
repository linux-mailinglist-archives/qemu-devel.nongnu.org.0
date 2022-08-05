Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755D58A521
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:46:40 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoII-0004gz-QY
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoFi-00024k-Dp
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoFf-0003CM-09
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2kdNTR0noF7Q7oaOxep4+qrZwulyr3C2hOYRWPs8Kk=;
 b=Il8YirJYbY/AGxxbczDVmLwVnh5dl3J+z+A1s1by1AwlZQReDamknuAVbuVIyT7fETfqnF
 XIZwom4500cmjUTq279KFih3lX2Gr4XRRvvuGMrmETRtwLfb0+6TycBZaV5c9/B4YPBgqg
 bX6ySzYNakfSnj+J65nRXLMXc2ZILwU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-iQMRoV1XPDKaQXMrM6Zr1A-1; Thu, 04 Aug 2022 23:43:51 -0400
X-MC-Unique: iQMRoV1XPDKaQXMrM6Zr1A-1
Received: by mail-lf1-f69.google.com with SMTP id
 g16-20020ac24d90000000b0048aeea325ddso286983lfe.16
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z2kdNTR0noF7Q7oaOxep4+qrZwulyr3C2hOYRWPs8Kk=;
 b=Yf0a4p3CCSFKBZvk+Yt+vmyn+u4iJNJV6qff4UJOfBjbFON72zOIM/i3PzE07bflA8
 PG+wmxcrVzBYsqnMq5CaaDOhyCR1xXQa4pIbirGYXrf4S6UnSryYwMdUfo/Hf4q9HV8F
 Bw5d/aMciUk96A0TkQPw1seuxC3XTuJ8o58xwYiNqx/AlkEh2L5ExwOl4kK82U3+gvz1
 Y6B8Dur6JzUdJueYueWPRUfLyX6psyidfKYJMynNt2Kx29/6ByFWwdsL4GMBHZ1R/1K/
 +NFTNbuLcuPbsoLDmDnlmrTB0wR7CDkPDulLJcHZQ53QSVlg/KFk6xmqm7XrWaezCLAy
 V9Uw==
X-Gm-Message-State: ACgBeo3WYmXL+L2uHSaXCiQ62FYtWCQkDWFro6JtMI5Rm7LxDqlfxxZW
 85BvwBgrG1Reg1Ucg6hy4blEkewNy/tIHg+pO2XVeFKbHzE1XOfy2ZrH0VF9wMmoxT7Q61Ln20A
 Yzr0L6CypDg4Bo7wByFYqR6tXFshDSwc=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr1358612ljh.251.1659671030168; 
 Thu, 04 Aug 2022 20:43:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yuWZmI8ojBDeIHS1npGIJBfxi+1oUhg5oa5z7Qp7W/6Qvt1RPKrZVZhO3ZSR6kOJPW6ZqD2TLfMfDvmKCKis=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr1358605ljh.251.1659671029909; Thu, 04
 Aug 2022 20:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220729155932.2477385-1-peter.maydell@linaro.org>
 <CAFEAcA9rpCNrO33tiTUZw_BzVt77_5q_CKp_yBf3prw5C+bAxg@mail.gmail.com>
 <ae5f83e3-e005-cd0e-0978-029ee0fbc45e@linaro.org>
In-Reply-To: <ae5f83e3-e005-cd0e-0978-029ee0fbc45e@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:43:38 +0800
Message-ID: <CACGkMEvg5v2YukrT8aKLz7OD37d9CWQzKP32qyiSYhSL0Ek=SA@mail.gmail.com>
Subject: Re: [PATCH] hw/net/rocker: Avoid undefined shifts with more than 31
 ports
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Aug 4, 2022 at 11:27 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/4/22 03:45, Peter Maydell wrote:
> > Ping?
> >
> > thanks
> > -- PMM
> >
> > On Fri, 29 Jul 2022 at 16:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> In rocker_port_phys_link_status() and rocker_port_phys_enable_read()
> >> we construct a 64-bit value with one bit per front-panel port.
> >> However we accidentally do the shift as 32-bit arithmetic, which
> >> means that if there are more than 31 front-panel ports this is
> >> undefined behaviour.
> >>
> >> Fix the problem by ensuring we use 64-bit arithmetic for the whole
> >> calculation. (We won't ever shift off the 64-bit value because
> >> ROCKER_FP_PORTS_MAX is 62.)
> >>
> >> Resolves: Coverity CID 1487121, 1487160
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued.

Thanks

>
>
> r~
>
> >> ---
> >>   hw/net/rocker/rocker.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> >> index 31f2340fb91..d8f3f16fe87 100644
> >> --- a/hw/net/rocker/rocker.c
> >> +++ b/hw/net/rocker/rocker.c
> >> @@ -1010,7 +1010,7 @@ static uint64_t rocker_port_phys_link_status(Rocker *r)
> >>           FpPort *port = r->fp_port[i];
> >>
> >>           if (fp_port_get_link_up(port)) {
> >> -            status |= 1 << (i + 1);
> >> +            status |= 1ULL << (i + 1);
> >>           }
> >>       }
> >>       return status;
> >> @@ -1025,7 +1025,7 @@ static uint64_t rocker_port_phys_enable_read(Rocker *r)
> >>           FpPort *port = r->fp_port[i];
> >>
> >>           if (fp_port_enabled(port)) {
> >> -            ret |= 1 << (i + 1);
> >> +            ret |= 1ULL << (i + 1);
> >>           }
> >>       }
> >>       return ret;
> >
>


