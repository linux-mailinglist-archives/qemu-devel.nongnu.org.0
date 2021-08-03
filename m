Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D30C3DE6F2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 09:03:38 +0200 (CEST)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAoSe-0006fG-Pn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 03:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mAoRZ-0005y5-RE
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:02:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mAoRW-0000n1-Lu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627974143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SLGJj5Xc0dAoQFsY4I/n65v2MWDN4yloZ45SMCxsGF8=;
 b=dNS4ktBUmjjJ1ZRaSBTzdFUsimjbsYHMYJoZKxKWM20ftWpkTrQDnbcTvi6XeV/GMxLBpH
 jyXyUZMQx0jhl1A0JLn9OBVw9yU1d2MP8dKnpbiHX+DDqqD6b3aGcIR+6n983/Ovkf/VGd
 4C+lQ/gVoLAh9EkUTI9LGlPdtY8jJQY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-zH-Xu0c7O6ucZE28lH_WRw-1; Tue, 03 Aug 2021 03:02:22 -0400
X-MC-Unique: zH-Xu0c7O6ucZE28lH_WRw-1
Received: by mail-lj1-f198.google.com with SMTP id
 b12-20020a2e858c0000b02901990f5ca735so3814492lji.22
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 00:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLGJj5Xc0dAoQFsY4I/n65v2MWDN4yloZ45SMCxsGF8=;
 b=ATWYE6Tb30ftneyN5FhM7FSYm4YS7AbX8dmTpzjzY1mQmLt1NT0cZ62IXZ/Zu3bsps
 gsfyRBrSfhGq3uLqjht5qC8LbLNK2n1CO8ffI8QJeASL+hysYfTP44aUVbAMoJ8C6GEG
 XU3wN80BiMD/wMLwoOUVVAkIE3SklMBvEc8uLsxw0t9TSpsu/bUrTDZXVDtrRsZjNRk2
 UJvjSvK9M6iYtSsFlKuwCZu9xdtF8iFhZtaxIvKuM3/U/riTnDj8NMQiXctClTlMqzdb
 DG6vF0pJWhCtM4GXv8U59b3sGSuCrKT4lgyuz1U3hsc3fpcAqgQPt5gbJxMe2/sYIdKK
 8DnQ==
X-Gm-Message-State: AOAM532ZaDu/wTOjcaoirkX2vuWF18VDj09jlMNUTjqJlOeNaALKL30k
 vWluoqX1is6P/En/OzxZVMpdwV+vU634wdgbR7Q2YlyLSJLhLSeS7O8DXfBoYVAurnKMzaI9aAa
 NnMUQx5pM2Zg2/9aXMzIWj9gM3vOIlTk=
X-Received: by 2002:ac2:446a:: with SMTP id y10mr14588771lfl.489.1627974140736; 
 Tue, 03 Aug 2021 00:02:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/KO9LuWCflrikzVCc3F1d2htKDgQFMYkRMwZg3T9LkBOWAWOdvJPC9cyuYtlQxKxc4/WtJhhjknoMg9XI5lE=
X-Received: by 2002:ac2:446a:: with SMTP id y10mr14588758lfl.489.1627974140477; 
 Tue, 03 Aug 2021 00:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210730074043.54260-1-leobras@redhat.com>
 <YQgQuCdc8jBKRyLc@work-vm>
In-Reply-To: <YQgQuCdc8jBKRyLc@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 3 Aug 2021 04:02:15 -0300
Message-ID: <CAJ6HWG7vqRYrQZVch_p-g097qZsb+4Z7uZgddn4R46zjtwR=RA@mail.gmail.com>
Subject: Re: [PATCH 1/1] migration: Terminate multifd threads on yank
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Dave,

> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 377da78f5b..744a180dfe 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -1040,6 +1040,17 @@ void multifd_recv_sync_main(void)
> >      trace_multifd_recv_sync_main(multifd_recv_state->packet_num);
> >  }
> >
> > +void multifd_shutdown(void)
> > +{
> > +    if (!migrate_use_multifd()) {
> > +        return;
> > +    }
> > +
> > +    if (multifd_send_state) {
> > +        multifd_send_terminate_threads(NULL);
> > +    }
>
> That calls :
>     for (i = 0; i < migrate_multifd_channels(); i++) {
>         MultiFDSendParams *p = &multifd_send_state->params[i];
>
>         qemu_mutex_lock(&p->mutex);
>         p->quit = true;
>         qemu_sem_post(&p->sem);
>         qemu_mutex_unlock(&p->mutex);
>     }
>
> so why doesn't this also get stuck in the same mutex you're trying to
> fix?

You are right, I got confused over the locks.
I need to get a better look at the code, and truly understand why this
patch fixes (?) the issue.

>
> Does the qio_channel_shutdown actually cause a shutdown on all fd's
> for the multifd?

As far as I tested, it does shutdown a single fd, but whenever this fd
fails in it's first sendmsg it causes migration to fail and all the
other fds get shutdown as well.

>
> (I've just seen the multifd/cancel test fail stuck in multifd_send_sync_main
> waiting on one of the locks).
>
> Dave
>

> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

I will do a little more reading / debugging in this code.
Thanks Dave!


