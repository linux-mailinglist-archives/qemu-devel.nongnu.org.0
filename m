Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC584ACF7C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:07:51 +0100 (CET)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGr7-0001MB-VA
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHGpI-0000e3-4s
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHGpA-0004jj-R5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644289547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pp4WzGW4opqL/OnXWqB+K4W7J8DeO7zdyJnEB9/Th6c=;
 b=ggPP5RDAqoemHfDaxfNaUakqAzTuaC4Nnx/W4sQybmw2/WLlXNn3U/cF0kRr3TbMUNOEhi
 7giEMzsafRLJapiKezGZ5kkxAzLh1kOsCn0VVCcQkcDIhoSj2HALP69O0C0+E7HhivJOmK
 Hugi94kYheKjlB10g/KQg7wwkpsPGbU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-BaxVWrCoNVyU9epHEy9aMQ-1; Mon, 07 Feb 2022 22:05:46 -0500
X-MC-Unique: BaxVWrCoNVyU9epHEy9aMQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 7-20020aa79247000000b004cdd523525eso8636933pfp.19
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pp4WzGW4opqL/OnXWqB+K4W7J8DeO7zdyJnEB9/Th6c=;
 b=zPBxJlKpSeDngWY8UIklTVkdcv0/+4kq/b8JtPZ2ye7GN0a/8mK1TbapJXjs9r2DG2
 BLyGov4ZAI6S72NqxcNuuvOmBncQ6xH0t+PhrmJTf8z7nW3EjBsb/HDLDMlxqaERsQ1P
 X+1sBNcyaWnYdQjBo+xiWBb2xRb3zwsC9HTRADCd/7hoaW8A88KrrQUFFrETaoMWzmIg
 TR0N7G2/XRUDamoxJP7Zzbpv5DzXUYpg07KtEOJ1UqNFarUVXywdytTRVzM8U2relzl0
 NHHnCXMG+CnapG0+QkBBySTtR4gOUryHhG95M9L8Hn+4v02FX7cU/lbGOolqlXsUwmjl
 38wQ==
X-Gm-Message-State: AOAM532axb63TZMdEddR9BbgK+rtB/JElS7Q0Hf0M/y64uPqazq3x5dI
 /BbKi52zj/8mrUI0v4vunZz8/+XBeDxYlTMby0oAbpbeoPVyLf5nXL1nzkSIjZFVQ0H/FpRdGIA
 hAJ0lhzus2OJvil8=
X-Received: by 2002:a17:90a:760f:: with SMTP id
 s15mr2092839pjk.246.1644289544956; 
 Mon, 07 Feb 2022 19:05:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9z5xxt2AEsL8RlIApCEC0fcQAIFrGhjsEqtpDYw9fE+sufpi/xBjz/BiSkkKsz7cEQ+N54w==
X-Received: by 2002:a17:90a:760f:: with SMTP id
 s15mr2092807pjk.246.1644289544634; 
 Mon, 07 Feb 2022 19:05:44 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id t2sm12945688pfg.207.2022.02.07.19.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 19:05:44 -0800 (PST)
Date: Tue, 8 Feb 2022 11:05:36 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <YgHeAGoyVabw6uVb@xz-m1.local>
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <YgHT2AzvnHYun6j4@xz-m1.local>
 <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 11:49:38PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter, thanks for reviewing!
> 
> On Mon, Feb 7, 2022 at 11:22 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Feb 01, 2022 at 03:29:03AM -0300, Leonardo Bras wrote:
> > > -void multifd_send_sync_main(QEMUFile *f)
> > > +int multifd_send_sync_main(QEMUFile *f)
> > >  {
> > >      int i;
> > > +    bool flush_zero_copy;
> > >
> > >      if (!migrate_use_multifd()) {
> > > -        return;
> > > +        return 0;
> > >      }
> > >      if (multifd_send_state->pages->num) {
> > >          if (multifd_send_pages(f) < 0) {
> > >              error_report("%s: multifd_send_pages fail", __func__);
> > > -            return;
> > > +            return 0;
> >
> > I've not checked how it used to do if multifd_send_pages() failed, but.. should
> > it returns -1 rather than 0 when there will be a return code?
> 
> Yeah, that makes sense.
> The point here is that I was trying not to modify much of the current behavior.
> 
> I mean, multifd_send_sync_main() would previously return void, so any
> other errors would not matter to the caller of this function, which
> will continue to run as if nothing happened.
> 
> Now, if it fails with flush_zero_copy, the operation needs to be aborted.

Right, so how I understand is we'll fail anyway, and this allows us to fail
(probably) sooner.

> 
> Maybe, I should make it different:
> - In any error, return -1.
> - Create/use a specific error code in the case of a failing
> flush_zero_copy, so I can test the return value for it on the caller
> function and return early.
> 
> Or alternatively, the other errors could also return early, but since
> this will change how the code currently works, I would probably need
> another patch for that change. (so it can be easily reverted if
> needed)

Yeah, should work too to add a patch before this one.

> 
> What do you think is better?

I just don't see how it could continue if e.g. multifd_send_pages() failed.

The other thing is returning zero looks weird itself when there's obviously an
error.  Normally we could allow that but better with a comment showing why.
For this case it's more natural to me if we could just fail early.

Juan?

-- 
Peter Xu


