Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951440DB71
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:39:25 +0200 (CEST)
Received: from localhost ([::1]:49342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQrbo-0008Mj-IB
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQrWG-0002aj-Rf
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:33:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQrWE-0002BD-AV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:33:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so5826486wme.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJXhb+tnEqQWjMjEHbumJndvoYeZdNemytrjthbTjtc=;
 b=oq0G8TRpnqwaJFxmGX5HrrtWblObjLUD5glLW7QoZ64MP9E5CgTmiIO7C1mKkaRLvj
 Le0OJrgq6GRBaZBAAd8JtrI1fEqVblDo4Uaup51MFmMx+OLmHVola0Ce2fNTRc59EZQ2
 CI6UFBETcLMWSO0WJ588ekb8V8Y+HjToXzUAqNZuZvBNN9UaD9Y3drrLNgwD9AJsYbwA
 H0TY5LNoFZ8lzFx/+6mtxHzoAkw56V+mIEnwEllow1Q4AyNpgfLQcgWfSwEPR4JgvqIt
 LebbaOvCbb8F0wgL1iUz4wK8Tbv1/th67ZvTxSYlEIM1ufrCUcZgLI4lRnfVXe59PFV5
 6zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJXhb+tnEqQWjMjEHbumJndvoYeZdNemytrjthbTjtc=;
 b=IbArHLMYhrY0bx5DsisF3egsQWeiC3lXIXqduOg5qsPyC3SpOGs65fBNvSgUtUbpCU
 XWD8DFUO3IaHMBmo2Qq0mbMmvKaFxAnC40JN5v1xKrYw4ZhD114BlCtySMgJBJN0MPmk
 Uotny4El5N1x9irmj/vXLG/8ygi+6BK6dULSB9JRJkZPVqLZW7dIkql/lfIM+oFiQyxj
 vRwQC30VDn6i5l0E8EjrKqq2p0qsDsEu87zih1htCyMA4sl0LuqBrgSg7VFh2R1gde4d
 qIwxIaN/lubKpxJOb1o+J9Cov1lKLs7CNdZmVQtLAFTxtiebsObPgpl5TlezX0/08d9g
 e/ag==
X-Gm-Message-State: AOAM530uEhK9zic33AOogr/W5PyAqpCM3cQQHEyjtdPrn5ep//YDZwmb
 MjmF9kNTgdgDNHw0wbD1g9TQkbrd+S4UGRHjZqE1pTpcfhg=
X-Google-Smtp-Source: ABdhPJzgAx1ITyN5WyC3Ot8G3VHodX2GWyUdoRdDV9SUbnAfqRwOo4iVb9ZbhI+PrFP4p3hL5dL4ZIJAKM10ZSMbVEI=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9971595wmo.21.1631799214193; 
 Thu, 16 Sep 2021 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210909122402.127977-1-eric.auger@redhat.com>
In-Reply-To: <20210909122402.127977-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 14:32:43 +0100
Message-ID: <CAFEAcA9gs4of2tw77YfYNjYKjoeBAHy0SknkCFNuZprGa-203Q@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gavin Shan <gshan@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 13:24, Eric Auger <eric.auger@redhat.com> wrote:
>
> The PL031 currently is not able to report guest RTC change to the QMP
> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> to qapi_event_send_rtc_change() when the Load Register is written. The
> value that is reported corresponds to the difference between the new
> RTC value and the RTC value elapsed since the base.
>
> For instance adding 20s to the guest RTC value will report 20:
> {'timestamp': {'seconds': 1631189494, 'microseconds': 16932},
> 'event': 'RTC_CHANGE', 'data': {'offset': 20}}
>
> Adding another extra 20s to the guest RTC value will report 40:
> {'timestamp': {'seconds': 1631189498, 'microseconds': 9708},
> 'event': 'RTC_CHANGE', 'data': {'offset': 40}}
>
> To compute the offset we need to track the origin tick_offset (the one
> computed at init time). So we need to migrate that field, which is done
> in a dedicated subsection. The migration of this subsection is disabled
> for machine types less or equal than 6.1.
>
> After migration, adding an extra 20s on the destination returns 60:
> {'timestamp': {'seconds': 1631189522, 'microseconds': 13081},
> 'event': 'RTC_CHANGE', 'data': {'offset': 60}}
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


> @@ -138,6 +140,7 @@ static void pl031_write(void * opaque, hwaddr offset,
>      switch (offset) {
>      case RTC_LR:
>          s->tick_offset += value - pl031_get_count(s);
> +        qapi_event_send_rtc_change(s->tick_offset - s->original_tick_offset);
>          pl031_set_alarm(s);
>          break;
>      case RTC_MR:

None of the other users of qapi_event_send_rtc_change()
seem to have to track the baseline time like this. Shouldn't
this be doing something involving using qemu_ref_timedate()
as the baseline that it uses to figure out the change value ?
(The other users do this via qemu_timedate_diff() but since we
start with a value-in-seconds we might want to expose some other
API in softmmu/rtc.c.)

thanks
-- PMM

