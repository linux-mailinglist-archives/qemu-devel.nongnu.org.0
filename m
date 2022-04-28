Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD3F5135A9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:49:51 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4Wk-0007C6-Iw
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk4Tp-0002jK-6I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk4Tm-0003uq-Dg
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651153605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nObETNwr+VEAhHgVn2FsQRHDBiF2H3rKsUwta3JSYdU=;
 b=PDITKJO+iJ2DgGr46dpqcLnTaDGpuiqM/REcFHAp2B1zR/n/PMhK3EeTgcKERxEmQDtSsg
 MDRPCO9useEu9so483fZvmp1fhSTbmRkkqLuK7r4nJCHpkibwSXlt089V6XMkOeBlI1dkn
 H48a6HR+zaQAc8EyHuIMnQMUKwlnVjU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-bZ73B3whMUiZFtkXq_dLSQ-1; Thu, 28 Apr 2022 09:46:44 -0400
X-MC-Unique: bZ73B3whMUiZFtkXq_dLSQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 m10-20020adfc58a000000b0020ac7ba78b8so1944723wrg.14
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 06:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nObETNwr+VEAhHgVn2FsQRHDBiF2H3rKsUwta3JSYdU=;
 b=rDRY+j+5rYCZtTEPEspk7GVOFMoClgn4z975EfdoZ06BsMRWKAJserPUFeYaatHSg2
 CozgM415rTPx7H9UbsL6+tIgmaPWI1trwSnpjvi6QU4S+nFfRNtfOaClDUTgwoWNZ+hK
 Bf33/cu8cMhTwKZxQgWEImFLxokZVjqbODqQOm4V7DhKAYqa+kj1pHJcSStM1TvRI9H0
 9xYMwVUnszdp0J71FcFcEt9D2AwIoU0PNZ5OOsP77Qy6w5oXNUJnOh7ZoVMCkQ/GecUg
 +/rcY/Z8nbP8IbHbRcopplyPJ5x39PGS1W/uULL1rVpgYakwzzEb1QW/KKm0DPiIEfLG
 boJA==
X-Gm-Message-State: AOAM532SuLgR3FDf2yR41ZDlWytglVKsNHPgXjdRYbGZ4MV4ESk4LB5I
 l1iuuc0V2PbSHwEtISVjoffrnlPRkixwMqo2qzJbXlyxbddhhqrtwfWfEW2fsn8aUF57RejtN5n
 mrn+wIRfNdbbiJW8=
X-Received: by 2002:a05:600c:500a:b0:392:4dd9:b5b3 with SMTP id
 n10-20020a05600c500a00b003924dd9b5b3mr40542822wmr.190.1651153602982; 
 Thu, 28 Apr 2022 06:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1nlJlmLLdXULsvd0u5fFK1Q1AP7zMKmLJ+aOSPcflFvylmRrpEO1EOfJMY74GpDRry5o24w==
X-Received: by 2002:a05:600c:500a:b0:392:4dd9:b5b3 with SMTP id
 n10-20020a05600c500a00b003924dd9b5b3mr40542791wmr.190.1651153602754; 
 Thu, 28 Apr 2022 06:46:42 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v11-20020a056000144b00b0020a9c02f60dsm17563684wrx.50.2022.04.28.06.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 06:46:41 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:46:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Message-ID: <YmqavzSjWY2jn+wX@work-vm>
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-7-leobras@redhat.com>
 <Ymh/pjIxBNCCNa9L@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymh/pjIxBNCCNa9L@xz-m1.local>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Apr 26, 2022 at 08:06:55PM -0300, Leonardo Bras wrote:
> > Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> > sending the header packet and the memory pages happens in the same
> > writev, which can potentially make the migration faster.
> > 
> > Using channel-socket as example, this works well with the default copying
> > mechanism of sendmsg(), but with zero-copy-send=true, it will cause
> > the migration to often break.
> > 
> > This happens because the header packet buffer gets reused quite often,
> > and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
> > to send the buffer, it has already changed, sending the wrong data and
> > causing the migration to abort.
> > 
> > It means that, as it is, the buffer for the header packet is not suitable
> > for sending with MSG_ZEROCOPY.
> > 
> > In order to enable zero copy for multifd, send the header packet on an
> > individual write(), without any flags, and the remanining pages with a
> > writev(), as it was happening before. This only changes how a migration
> > with zero-copy-send=true works, not changing any current behavior for
> > migrations with zero-copy-send=false.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 15fb668e64..07b2e92d8d 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -617,6 +617,7 @@ static void *multifd_send_thread(void *opaque)
> >      MultiFDSendParams *p = opaque;
> >      Error *local_err = NULL;
> >      int ret = 0;
> > +    bool use_zero_copy_send = migrate_use_zero_copy_send();
> >  
> >      trace_multifd_send_thread_start(p->id);
> >      rcu_register_thread();
> > @@ -639,9 +640,14 @@ static void *multifd_send_thread(void *opaque)
> >          if (p->pending_job) {
> >              uint64_t packet_num = p->packet_num;
> >              uint32_t flags = p->flags;
> > -            p->iovs_num = 1;
> >              p->normal_num = 0;
> >  
> > +            if (use_zero_copy_send) {
> > +                p->iovs_num = 0;
> > +            } else {
> > +                p->iovs_num = 1;
> > +            }
> > +
> >              for (int i = 0; i < p->pages->num; i++) {
> >                  p->normal[p->normal_num] = p->pages->offset[i];
> >                  p->normal_num++;
> > @@ -665,8 +671,19 @@ static void *multifd_send_thread(void *opaque)
> >              trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> >                                 p->next_packet_size);
> >  
> > -            p->iov[0].iov_len = p->packet_len;
> > -            p->iov[0].iov_base = p->packet;
> > +            if (use_zero_copy_send) {
> > +                /* Send header first, without zerocopy */
> > +                ret = qio_channel_write_all(p->c, (void *)p->packet,
> > +                                            p->packet_len, &local_err);
> > +                if (ret != 0) {
> > +                    break;
> > +                }
> > +
> 
> Extra but useless newline.. but not worth a repost.  Looks good here:

I removed that.

> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> Thanks,
> 
> > +            } else {
> > +                /* Send header using the same writev call */
> > +                p->iov[0].iov_len = p->packet_len;
> > +                p->iov[0].iov_base = p->packet;
> > +            }
> >  
> >              ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> >                                           &local_err);
> > -- 
> > 2.36.0
> > 
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


