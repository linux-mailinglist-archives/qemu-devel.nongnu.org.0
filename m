Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946154DCC03
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:05:09 +0100 (CET)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtYi-0002TR-0q
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:05:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUtUS-0006n0-Nb
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUtUP-0001Kd-31
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647536439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fI5p/6FUC6GFEBEZWd8RWxetguuwV2hxMw6wDUYRqV8=;
 b=SYJSwY1Kb5RG+Mz+6QQ+Sr7IvDx53T9B6YvT3ndqMfeaznSagtnShCbjuYC8YuQodOJuFK
 ezHk5W9nFu87cu2GRRi4ajN7WKck5TgAIb17+e/WRQmGncHOjkov2SN6+tZ6oWsCaYMU8V
 H/ic/PSV8sOppLluDDanPWdtPk066qg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-IWZcjFlgNtOCSWmb2b-ZxA-1; Thu, 17 Mar 2022 13:00:38 -0400
X-MC-Unique: IWZcjFlgNtOCSWmb2b-ZxA-1
Received: by mail-ua1-f69.google.com with SMTP id
 111-20020ab003f8000000b00352ab6f6681so1846232uau.20
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fI5p/6FUC6GFEBEZWd8RWxetguuwV2hxMw6wDUYRqV8=;
 b=pZeNkTQxXB4EaEDrD/8ie/VBwl1y9KsAZHB+vrwcJO8NKRMK9wlf4oKjBsFGJgz9hX
 UVI+5ESP53lknG9Wi4VRK/Y5YgfzcYKM9d2CMgVQG9BjLqUp3uHnt0K7tR79O9K4K1x7
 pyQe+aIdaaCHj6ycC3krQX4gIsPmBkNFFdC0VHvvlJ7mht+UiVKgd0ApjXQ6T1kqC8TL
 YYyaEkd1xR5DVl19Oj6dGKhsaoNgwFtz449lNDQ4GT0bNMyMuaufzMrQh7DEiCuZsKiN
 PpsTyEP5AmpD7+Rog7nx8kZHI22Vy6agr4g/5ZZlS5qh5aThlkieDi6bA0csppwu7MIY
 1oYQ==
X-Gm-Message-State: AOAM5307Uu23ELZM4+sa39TUNawa0Ok/7T80LoOlptRJpmFgUFS350dD
 fvSAVJ+LmdLYTZRtMqXbQDsXN6gv1x4kF47X5XYns2e2UOOI+foL/TsKdatm5qULFEzn8z8cJDB
 nX41AsULSwY7rOEL6Dgt3COTwby6X/Ro=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr1971931uar.109.1647536437263; 
 Thu, 17 Mar 2022 10:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoW4LIDdolsEo1FZmI9wTFjJhzalj/BRltyZ4HOWaCdTfJukqtqC8mbmAffVWdE5kXumQA1tI8qe18I+8b1y4=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr1971911uar.109.1647536436944; Thu, 17
 Mar 2022 10:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-15-jsnow@redhat.com>
 <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
In-Reply-To: <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 13:00:26 -0400
Message-ID: <CAFn=p-ab92NRL+E7RytaUo_1S1UB0_eq1EJLjfTGs2Sn_dqSuQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 11:39 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 09.03.22 04:54, John Snow wrote:
> > Add configurable filters to qemu_img_log(), and re-write img_info_log()
> > to call into qemu_img_log() with a custom filter instead.
> >
> > After this patch, every last call to qemu_img() is now guaranteed to
> > either have its return code checked for zero, OR have its output
> > actually visibly logged somewhere.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/iotests.py | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
>
>  From my POV, this is a regression because before this patch (not this
> series, though, admittedly), `img_info_log()` would throw an exception
> on error, and with patch 12 being as it is, it will revert to its
> pre-series behavior of not throwing an exception.  I prefer exceptions
> to failed reference output diffs, because an exception tells me which
> call failed.

Hm, yeah. I just need to figure out if *all* of the qemu_img_log()
calls are safe to enforce the return code of zero on... or how many
need work if I change the default behavior. Let me see what I can do.

I suppose it's maybe a bit late to try and squeak any of this in for
freeze, so I can roll everything back up into one big series again and
send a new revision.


