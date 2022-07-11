Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EEF56FE71
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAqOR-0006l7-PU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oAqLw-0004UC-Ab
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oAqLs-0007SF-Ed
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657534155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+H824DlSsosl5dtnyZ5T3h+5Jau52lxgB6StUTE2lo4=;
 b=PbXUIPTtw6Lt/mWPoIeGLFSCRznm7q31065U/VEOBxEegATfKG6YSBNCoehiWysmqohv88
 cq38ZuCuwJF+HA3wAQV0/m3wzM2hocVOubQ6PbNm41kg1yzS2lAIb57zWoPYMAAPP/RL1E
 xK6zm42i7F4EZ9rLacNIMVouxZuRCu8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-us2WxENhPm-a2enNpN2GPw-1; Mon, 11 Jul 2022 06:09:13 -0400
X-MC-Unique: us2WxENhPm-a2enNpN2GPw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31c8c7138ebso41085317b3.17
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 03:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+H824DlSsosl5dtnyZ5T3h+5Jau52lxgB6StUTE2lo4=;
 b=CULT9EHo4hRAV301zZW5RuCGPvwOEo2hRJmQWYDg8i8qVe3PmIF6xOHAajvH8pJiyJ
 24aniCDf4m6Qh9kEvrqW88U6jc6BFU/F2LdeuyNAqX1Yi81t5htlK8/jgEUVrskM0XAn
 JKXGZ6ylYWnEMCCfq2ocdiKINvT0B3QbSeilxnsSk6XhCEnCR0BnW+CVoqYJLETrABxr
 vxbl9i1btOaSxSh9IA6ijT6sSv6hLYnk++Vj4wFNKmhsg6iJ7AgwE3N0erc+9NVbipkn
 HmF+UhY9TbUdQpoKK4+xzoNnNMfOVG5lbMC3QKhscVjmLUtejEq1WrCjkSxPqajnvnJb
 Mq0A==
X-Gm-Message-State: AJIora+yaGm1pdSO4FuUfSjS7oXqCZypKrpTaiZIwMEQTnUBWSK7/Nir
 de05/mJymhtq3mm6wD5uc37aKu0NhNBeL43v9w8MMtZAFvc91wTONNFHPcR+4kRULc2ZJ5+jWgm
 WSWe53P1VIgfTQz8X3Ic6LsqIrshf9vM=
X-Received: by 2002:a25:e004:0:b0:66e:36a5:adfa with SMTP id
 x4-20020a25e004000000b0066e36a5adfamr15088145ybg.349.1657534153250; 
 Mon, 11 Jul 2022 03:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUlEU2NU1p6ZYc/TOoNdH9wJn7xlrWLkG58jOitRJgJjbfrIaM+ACz7wgjVk0EFPH13qwKaIxblTn/sd8lYTQ=
X-Received: by 2002:a25:e004:0:b0:66e:36a5:adfa with SMTP id
 x4-20020a25e004000000b0066e36a5adfamr15088133ybg.349.1657534153014; Mon, 11
 Jul 2022 03:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220705200543.2366809-1-mcascell@redhat.com>
 <20220709002241.222q4rphpim4lf74@mozz.bu.edu>
In-Reply-To: <20220709002241.222q4rphpim4lf74@mozz.bu.edu>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 11 Jul 2022 12:09:02 +0200
Message-ID: <CAA8xKjXhdCkRgTPBBUahAAVEP_-jNbDp1XTg8PhzTeH=BFGeGg@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
To: Alexander Bulekov <alxndr@bu.edu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Alexander,

Thanks for the reproducer! It looks like ABORT, CLEAR QUEUE and BUS
DEVICE RESET messages can all cancel the current request, so yes I
guess a similar change is needed there, too. Will try to send a v2
soon.

Best regards.


On Sat, Jul 9, 2022 at 2:22 AM Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 220705 2205, Mauro Matteo Cascella wrote:
> > Set current_req->req to NULL to prevent reusing a free'd buffer in case of
> > repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
> >
> > Fixes: CVE-2022-0216
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > ---
> >  hw/scsi/lsi53c895a.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> > index c8773f73f7..99ea42d49b 100644
> > --- a/hw/scsi/lsi53c895a.c
> > +++ b/hw/scsi/lsi53c895a.c
> > @@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
> >          case 0x0d:
> >              /* The ABORT TAG message clears the current I/O process only. */
> >              trace_lsi_do_msgout_abort(current_tag);
> > -            if (current_req) {
> > +            if (current_req && current_req->req) {
> >                  scsi_req_cancel(current_req->req);
> > +                current_req->req = NULL;
> >              }
> >              lsi_disconnect(s);
> >              break;
> > --
> > 2.35.3
> >
> >
>
> Hi Mauro,
> https://gitlab.com/qemu-project/qemu/-/issues/972#note_1019851430
> This reproducer crashes, with this patch applied. Maybe it is some
> different bug though - I'm not sure.
>
> With -trace lsi*
>
> lsi_reg_write Write reg DSP1 0x2d = 0x00
> lsi_reg_write Write reg DSP2 0x2e = 0x40
> lsi_reg_write Write reg DSP3 0x2f = 0x36
> lsi_execute_script SCRIPTS dsp=0x364001d0 opcode 0x58000008 arg 0x0
> lsi_execute_script_io_set Set ATN
> lsi_execute_script SCRIPTS dsp=0x364001d8 opcode 0x26010000 arg 0x5a41ae0d
> lsi_do_msgout MSG out len=65536
> lsi_do_msgout_busdevicereset MSG: BUS DEVICE RESET tag=0x0
> lsi_do_msgout_select Select LUN 0
> lsi_do_msgout_abort MSG: ABORT TAG tag=0x0
>
> In busdevicereset, there are also scsi_req_cancel calls. Do they need
> similar changes?
>
> -Alex
>


--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


