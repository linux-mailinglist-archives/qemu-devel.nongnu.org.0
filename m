Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E297F509173
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:31:34 +0200 (CEST)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGz7-0000qd-OF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGfI-00063y-8F
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGfD-00042O-UX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650485458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mg0ka7S60+FT+ypZdIXa8p6Zdpn+n3NCz3FqztDQGOo=;
 b=hJFrxpgmgqjn02elnkQxufoaI1kOdupDcK0fYDdenojdc4CE58pf6RzC0itbINZxgOBnE8
 ulgh4oDeeFEB4Sk7sTbj6gRG/u5GDeTsuaujgScGawkuinmQKHE5lcsNbRM5TlYfNDHB27
 2Yys/Y08z46D1CnG1F7IQNleekAJOnA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-TIzWVdR7P2GqXXBCIGsfiw-1; Wed, 20 Apr 2022 16:10:57 -0400
X-MC-Unique: TIzWVdR7P2GqXXBCIGsfiw-1
Received: by mail-io1-f69.google.com with SMTP id
 i19-20020a5d9353000000b006495ab76af6so1946625ioo.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mg0ka7S60+FT+ypZdIXa8p6Zdpn+n3NCz3FqztDQGOo=;
 b=w8kLNq3rqUfA9eVYlaj9dm8GoBtpgu3rWRFUymCeaEB9P4z51lY0AdZ17CZ5h4u/+Y
 pwwCTb5PnzWoDFQ0LHeqcKP0TtzQPk5Y3i5AHucDxbGn489qossnQIdETLztRHb3g/P4
 h2ReYbNtWxbD/wZtCcmu1eqWxHkwkEZPB9DjQTYSclTpR3Vu+4Co1zf7cqF6Pb7+Lp6z
 +WoVb/i54DSkioSjUMpIaVDaIEZ2eCErWaxiof+lKshJjO812cocJ5A+75A5xw+4ThBM
 3+8RVu3JPu/EOaT/vREue55pGmw8c29A7g4rICgrTObz78S50e5rSfHP0jsn8Vey58cx
 D7lw==
X-Gm-Message-State: AOAM532WhyCAsAMHIT3IP7f51xm2RtgIf9TzqbKpQ7TUv5kPycjOj6xc
 s996HHCbeEgxHlcQc8Rhw1bt+ODgsaSaRwNQvsBenUfd7Li1WON459PM/y4jkGf4aN1tBUplJWI
 ce1LCzRwGGzsEd7A=
X-Received: by 2002:a05:6638:ec3:b0:328:7d44:1df4 with SMTP id
 q3-20020a0566380ec300b003287d441df4mr8655499jas.173.1650485456853; 
 Wed, 20 Apr 2022 13:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbt5ls75MTOLmsmzH3NgktYLbZPXFcpNQGxULfPiLi18mDenzpBE7SD225lIZNyWmWQ01T7w==
X-Received: by 2002:a05:6638:ec3:b0:328:7d44:1df4 with SMTP id
 q3-20020a0566380ec300b003287d441df4mr8655489jas.173.1650485456594; 
 Wed, 20 Apr 2022 13:10:56 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05660229d200b0064c719946a8sm12913488ioq.34.2022.04.20.13.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:10:56 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:10:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 16/19] migration: Enable TLS for preempt channel
Message-ID: <YmBozpkQj4k4dCxb@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-17-peterx@redhat.com>
 <Yl/v+eFKjvlSajmA@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/v+eFKjvlSajmA@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:35:21PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:54AM -0400, Peter Xu wrote:
> > This patch is based on the async preempt channel creation.  It continues
> > wiring up the new channel with TLS handshake to destionation when enabled.
> > 
> > Note that only the src QEMU needs such operation; the dest QEMU does not
> > need any change for TLS support due to the fact that all channels are
> > established synchronously there, so all the TLS magic is already properly
> > handled by migration_tls_channel_process_incoming().
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/postcopy-ram.c | 60 +++++++++++++++++++++++++++++++++++-----
> >  migration/trace-events   |  1 +
> >  2 files changed, 54 insertions(+), 7 deletions(-)
> > 
> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index ab2a50cf45..f5ba176862 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -36,6 +36,7 @@
> >  #include "socket.h"
> >  #include "qemu-file-channel.h"
> >  #include "yank_functions.h"
> > +#include "tls.h"
> >  
> >  /* Arbitrary limit on size of each discard command,
> >   * keeps them around ~200 bytes
> > @@ -1552,15 +1553,15 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
> >      return true;
> >  }
> >  
> > +/*
> > + * Setup the postcopy preempt channel with the IOC.  If ERROR is specified,
> > + * setup the error instead.  This helper will free the ERROR if specified.
> > + */
> >  static void
> > -postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
> > +postcopy_preempt_send_channel_done(MigrationState *s,
> > +                                   QIOChannel *ioc, Error *local_err)
> >  {
> > -    MigrationState *s = opaque;
> > -    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> > -    Error *local_err = NULL;
> > -
> > -    if (qio_task_propagate_error(task, &local_err)) {
> > -        /* Something wrong happened.. */
> > +    if (local_err) {
> >          migrate_set_error(s, local_err);
> >          error_free(local_err);
> >      } else {
> > @@ -1574,6 +1575,51 @@ postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
> >       * postcopy_qemufile_src to know whether it failed or not.
> >       */
> >      qemu_sem_post(&s->postcopy_qemufile_src_sem);
> > +}
> > +
> > +static void
> > +postcopy_preempt_tls_handshake(QIOTask *task, gpointer opaque)
> > +{
> > +    MigrationState *s = opaque;
> > +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> 
> If using g_autoptr(QIOChannel) ioc = ...

New magic learned..

> 
> > +    Error *err = NULL;
> 
> local_err is normal naming 

OK.

> 
> > +
> > +    qio_task_propagate_error(task, &err);
> > +    postcopy_preempt_send_channel_done(s, ioc, err);
> > +    object_unref(OBJECT(ioc));
> 
> ...not needed with g_autoptr
> 
> > +}
> > +
> > +static void
> > +postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
> > +{
> > +    MigrationState *s = opaque;
> > +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> 
> If you use g_autoptr(QIOChannel)

Will use it here too.

> 
> > +    QIOChannelTLS *tioc;
> > +    Error *local_err = NULL;
> > +
> > +    if (qio_task_propagate_error(task, &local_err)) {
> > +        assert(local_err);
> 
> I don't think we really need to add these asserts everywhere we
> handle a failure path do we ?

Maybe I'm just over-cautious, yeah let me drop those.

Thanks,

-- 
Peter Xu


