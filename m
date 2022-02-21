Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D74BEB5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:49:45 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEgq-0000aS-U7
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:49:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMEfM-0007PT-TK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMEfK-0006kv-I8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645472889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MlmC7N1UqyMNrC4kRGc6UvwAShG1Q/2M20NdTS3HQjM=;
 b=WnjVKD70PMkTPr9jyWV3UL0WDADAtfp+SUoReiQfUQnMEqrIKh+Nb//Za8dI12mIgOp8So
 9sbmyKiOdbqWXZFBRrryF1L12zINLdSYBtM4lLhLUA9Rgvz9C5Iyme2sQoIWE7/JJIPQl1
 FKMIoAYlvs6wjP5DYvBlR26CdTmVRUY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-p7ujxKalPaabcu6BGdUdeA-1; Mon, 21 Feb 2022 14:48:08 -0500
X-MC-Unique: p7ujxKalPaabcu6BGdUdeA-1
Received: by mail-lj1-f198.google.com with SMTP id
 x8-20020a2ea7c8000000b00246215e0fc3so4504623ljp.8
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MlmC7N1UqyMNrC4kRGc6UvwAShG1Q/2M20NdTS3HQjM=;
 b=IEM2z5cwt0l+RsBU3x7TTnTQKuYkPVeiJH2e2sxi3Q1fTUR9xvF8yjl1AjWfDjT1wc
 jF8IG1yEjeiFYbPPd/CLPMU7sIxs8djshO7S3hMbiSrWe+BJlNAK4llblfwNqmrQAMtw
 ND7p+s0NuUD4buTl51FBptbOxs1j2YDhAbFTO8OBAvAvSFu3anfEthDW37H56o8tBdZJ
 JmcOIGFVVI59Vn6y6TfkQJ5akIc6iCQXPkBjxnpwFiS+LH3Ba0l0tLqw9a9G2QfQfWbc
 zC8KzK1K6TdrRD+iUByUf0643qxrxCRo4JBo4iyMQVw9V68ZadR1OD/JloFJUsn5eD1Y
 GB+A==
X-Gm-Message-State: AOAM531kCkgN56NxzB/rGfXmAfhJbMeeWfGnPSyQcnlgFIVrLpXTJ90u
 wZCrEwOJee1d9MdQrnFZyqJFdPLhTWUAjs1fKbJf7E/Kwuz7q/wTsavrQiAvs3qdGqcPoJuVQGz
 J0zx/ym+CD/rB3nBjCIQi4lLKUd5xwMI=
X-Received: by 2002:a05:651c:1687:b0:241:113a:4093 with SMTP id
 bd7-20020a05651c168700b00241113a4093mr16016376ljb.162.1645472887223; 
 Mon, 21 Feb 2022 11:48:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEU+FfZaEJQaTT79eG9fwwFXycpAWg9mv8HWV+OzFKLXQccJ79Cporha8rHq/uKQY7VG26nJllMVPP4mGqj5o=
X-Received: by 2002:a05:651c:1687:b0:241:113a:4093 with SMTP id
 bd7-20020a05651c168700b00241113a4093mr16016353ljb.162.1645472886918; Mon, 21
 Feb 2022 11:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <YgHT2AzvnHYun6j4@xz-m1.local>
 <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
 <87v8xcaxh8.fsf@secure.mitica>
In-Reply-To: <87v8xcaxh8.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 21 Feb 2022 16:47:56 -0300
Message-ID: <CAJ6HWG7Agru1nwuo-b6BANL8qP6XhK6ksEziJ7PCwwoMG_oNWA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 2:36 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras Soares Passos <leobras@redhat.com> wrote:
> > Hello Peter, thanks for reviewing!
> >
> > On Mon, Feb 7, 2022 at 11:22 PM Peter Xu <peterx@redhat.com> wrote:
> >>
> >> On Tue, Feb 01, 2022 at 03:29:03AM -0300, Leonardo Bras wrote:
> >> > -void multifd_send_sync_main(QEMUFile *f)
> >> > +int multifd_send_sync_main(QEMUFile *f)
> >> >  {
> >> >      int i;
> >> > +    bool flush_zero_copy;
> >> >
> >> >      if (!migrate_use_multifd()) {
> >> > -        return;
> >> > +        return 0;
> >> >      }
> >> >      if (multifd_send_state->pages->num) {
> >> >          if (multifd_send_pages(f) < 0) {
> >> >              error_report("%s: multifd_send_pages fail", __func__);
> >> > -            return;
> >> > +            return 0;
> >>
> >> I've not checked how it used to do if multifd_send_pages() failed, but.. should
> >> it returns -1 rather than 0 when there will be a return code?
> >
> > Yeah, that makes sense.
> > The point here is that I was trying not to modify much of the current behavior.
>
>     if (qatomic_read(&multifd_send_state->exiting)) {
>         return -1;
>     }
>
>         if (p->quit) {
>             error_report("%s: channel %d has already quit!", __func__, i);
>             qemu_mutex_unlock(&p->mutex);
>             return -1;
>         }
>
> This are the only two cases where the current code can return one
> error.  In the 1st case we are exiting, we are already in the middle of
> finishing, so we don't really care.
> In the second one, we have already quit, and error as already quite big.
>
> But I agree with both comments:
> - we need to improve the error paths
> - leonardo changes don't affect what is already there.
>



>
> > I mean, multifd_send_sync_main() would previously return void, so any
> > other errors would not matter to the caller of this function, which
> > will continue to run as if nothing happened.
> >
> > Now, if it fails with flush_zero_copy, the operation needs to be aborted.
> >
> > Maybe, I should make it different:
> > - In any error, return -1.
> > - Create/use a specific error code in the case of a failing
> > flush_zero_copy, so I can test the return value for it on the caller
> > function and return early.
>
> We need to add the check.  It don't matter if the problem is zero_copy
> or the existing one, we are under a minor catastrophe and migration has
> to be aborted.

Ok, I will fix that so we can abort in case of any error.
Maybe it's better to do that on a separated patch, before 5/5, right?

>
> > Or alternatively, the other errors could also return early, but since
> > this will change how the code currently works, I would probably need
> > another patch for that change. (so it can be easily reverted if
> > needed)
> >
> > What do you think is better?
> >
> >
> >> >          }
> >> >      }
> >> > +
> >> > +    /*
> >> > +     * When using zero-copy, it's necessary to flush after each iteration to
> >> > +     * make sure pages from earlier iterations don't end up replacing newer
> >> > +     * pages.
> >> > +     */
> >> > +    flush_zero_copy = migrate_use_zero_copy_send();
> >> > +
> >> >      for (i = 0; i < migrate_multifd_channels(); i++) {
> >> >          MultiFDSendParams *p = &multifd_send_state->params[i];
> >> >
> >> > @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
> >> >          if (p->quit) {
> >> >              error_report("%s: channel %d has already quit", __func__, i);
> >> >              qemu_mutex_unlock(&p->mutex);
> >> > -            return;
> >> > +            return 0;
> >>
> >> Same question here.
> >
> > Please see above,
> >
> >>
> >> >          }
> >>
> >> The rest looks good.  Thanks,
>
> Later, Juan.
>

Thanks for the feedback!

Best regards,
Leo


