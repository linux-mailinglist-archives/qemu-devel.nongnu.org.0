Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336284BAB68
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:04:57 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKnxM-000476-St
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKnvY-0002oY-Tg
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKnvV-00037d-CZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645131776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMTWnyWpBmervrPypyC/+bVFRmSNBkugqzlIvJjAY/Y=;
 b=O+1NIwIbgnI8iEIcUluMJVnonunTuUwqsQcP/FS3FiL1xnPaQM7/dHrlZ1HyN0a2UDRLWT
 gRLkDsfPuWkuUkYZqQe/hhBbC/bFKJIudWXCI+qYwxMyg8k4Pu+IoCKgk3B13LwUfynnbP
 YfMw5tR0nke443apTDedb9Sm7CUCl7I=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-Qy8Qy2LlOIOqyeSxI9eGXQ-1; Thu, 17 Feb 2022 16:02:53 -0500
X-MC-Unique: Qy8Qy2LlOIOqyeSxI9eGXQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 v8-20020ab036a8000000b0033cc15dc051so2584520uat.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fMTWnyWpBmervrPypyC/+bVFRmSNBkugqzlIvJjAY/Y=;
 b=3mnc5JrWCCD7IsZTprAuK1/VswswFx2JWDMijwDBJOH8qMp+H3nmIz10IU+uinyURQ
 6g8yiLpK1Hf4QbL7rzlAyv2R/m8W5eAJCcwWFbVrbxOSlozJj7VGtUkGCN5e8WkBfe3S
 liRN4Xek4xqQburyqW2M3aVY8bzBnBJvlj0FXlTuOmU3Lfv2QJ/hWB3u8M9G9OMHe8VF
 omOvCvwf5YSq+h3n8VFJMznla1UO/IwQI7fYPqqqP5SBDMca8T22zQSNOtFc7OBtR3ba
 d6Y4v5wAaeg9yWy+MTE601V3rxCOt1gejIU47Zv0z9zDBTsaiSOOqV8pEcPEmpsFUPwP
 opcQ==
X-Gm-Message-State: AOAM531jIxXMjx8ASXQmchpIuPiF0w658Zf+PnT5cVxiM/vaWNxdM7DQ
 irVJXAKO/D6GRgPgoQ9rbuNHwtcjQ/gcIa3VFHrmKuR79tr8SN8g9fCGnxcBCZIhKrRe0Ottl+o
 oJABx2t9sxl+edH3nVuVBf1jsn7wjHXQ=
X-Received: by 2002:ab0:280f:0:b0:33c:ead3:23d7 with SMTP id
 w15-20020ab0280f000000b0033cead323d7mr2001341uap.50.1645131773217; 
 Thu, 17 Feb 2022 13:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1z9XmAFIYoBnr8hoStdUwutxeRrYOtRn9tyJnCXQROnfG8XxevZdIcDNr0iPmMgCyS27VgA96NKiWJ+T2mbc=
X-Received: by 2002:ab0:280f:0:b0:33c:ead3:23d7 with SMTP id
 w15-20020ab0280f000000b0033cead323d7mr2001327uap.50.1645131772904; Thu, 17
 Feb 2022 13:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20220120142259.120189-1-hreitz@redhat.com>
 <3462d5d7-3032-421f-f2d2-d6564e9927a4@redhat.com>
In-Reply-To: <3462d5d7-3032-421f-f2d2-d6564e9927a4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Feb 2022 16:02:41 -0500
Message-ID: <CAFn=p-Ywz_mOMuuSxcJaUocuGSASnC-mDHnBFEK0MR7NpcZa6g@mail.gmail.com>
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 12:14 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> Ping
>
> (I can take it too, if you=E2=80=99d like, John, but you=E2=80=99re liste=
d as the only
> maintainer for hw/ide, so...  Just say the word, though!)
>

Sorry, I sent you a mail off-list at the time where I said you were
free to take it whenever you like. Why'd I send it off-list? I don't
know....

Please feel free to send this with your next block PR.

--js

> On 20.01.22 15:22, Hanna Reitz wrote:
> > When we still have an AIOCB registered for DMA operations, we try to
> > settle the respective operation by draining the BlockBackend associated
> > with the IDE device.
> >
> > However, this assumes that every DMA operation is associated with an
> > increment of the BlockBackend=E2=80=99s in-flight counter (e.g. through=
 some
> > ongoing I/O operation), so that draining the BB until its in-flight
> > counter reaches 0 will settle all DMA operations.  That is not the case=
:
> > For TRIM, the guest can issue a zero-length operation that will not
> > result in any I/O operation forwarded to the BlockBackend, and also not
> > increment the in-flight counter in any other way.  In such a case,
> > blk_drain() will be a no-op if no other operations are in flight.
> >
> > It is clear that if blk_drain() is a no-op, the value of
> > s->bus->dma->aiocb will not change between checking it in the `if`
> > condition and asserting that it is NULL after blk_drain().
> >
> > The particular problem is that ide_issue_trim() creates a BH
> > (ide_trim_bh_cb()) to settle the TRIM request: iocb->common.cb() is
> > ide_dma_cb(), which will either create a new request, or find the
> > transfer to be done and call ide_set_inactive(), which clears
> > s->bus->dma->aiocb.  Therefore, the blk_drain() must wait for
> > ide_trim_bh_cb() to run, which currently it will not always do.
> >
> > To fix this issue, we increment the BlockBackend's in-flight counter
> > when the TRIM operation begins (in ide_issue_trim(), when the
> > ide_trim_bh_cb() BH is created) and decrement it when ide_trim_bh_cb()
> > is done.
> >
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2029980
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> > v1:
> > https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html
> >
> > v2:
> > - Increment BB=E2=80=99s in-flight counter while the BH is active so th=
at
> >    blk_drain() will poll until the BH is done, as suggested by Paolo
> >
> > (No git-backport-diff, because this patch was basically completely
> > rewritten, so it wouldn=E2=80=99t be worth it.)
> > ---
> >   hw/ide/core.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
>


