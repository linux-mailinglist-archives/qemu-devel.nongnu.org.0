Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C8494595
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 02:39:27 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAMQA-0001Z8-Or
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 20:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMO4-0000mX-Nt
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 20:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAMO2-0004mG-7g
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 20:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642642632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dI323EfV528xVcuPNvuT5Af6sFUeVJ4KB4NMgX9CKKs=;
 b=PLjBhSWlPwvzvzU4bfD9svkcc1hSf8F4f2IYvpuJmDyX++AU8UZPxwpRKY8AbiMJyFQS51
 CWGlwiNlywfBvkFzW6YPMemTCpkwAovedlMA2SY2tsmaFeAZnFhjSUeq1wOTiMJzmr+ATB
 deRi4Rh3XOiuiI5I9ht5EwHL92+MqxY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-DlqQ67SZNFiIFMOmPoBsng-1; Wed, 19 Jan 2022 20:37:12 -0500
X-MC-Unique: DlqQ67SZNFiIFMOmPoBsng-1
Received: by mail-pl1-f198.google.com with SMTP id
 h9-20020a170902680900b0014adffcba60so740288plk.7
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 17:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dI323EfV528xVcuPNvuT5Af6sFUeVJ4KB4NMgX9CKKs=;
 b=rV8rm7FNjJxLAtzGjt0xXmYD8FB3aQEuPPXa46Oh7rnggZS997W6TcAQ8lqQb+mPrs
 4e17NXE4ASVO+9t+yV+WsPG0cQA11iDQ4TRhH0TwmgsPQX9YENEmDVSba9Np6U+wCDvk
 wZuxwMSMZIduN157TVa1thS0NIpPAgvsX+qUbxbT8EBximSCIFYW6YKOvMiXrLmh/W5j
 ZOLnngr0PkGDcQf/y6/UOaAEZoGY21l1YvpA/XfxYWbD/v3VCuHT9d1+tZghFE/2aXAJ
 GNQ0yC5Tg7REta22sKsCC976o430VMHrqi8sgtlrE5T8sY+xbZWdzpJa+gJdgk3hW4cN
 tiuw==
X-Gm-Message-State: AOAM531VAeUDmFPXyd0W5eF91pQz1GFXD2t8e5rhddiD/Cmtv3/iZ3AV
 DMgGJaCLuzEbHZIu15hkeUoYHGxv7ZCI6ecVOC8MweMz3g+2wpFYzg9h7FRJTVLoYxVBaL4wv+U
 ujhZjo8MWaTASRHs=
X-Received: by 2002:a17:90a:e454:: with SMTP id
 jp20mr7888063pjb.53.1642642630639; 
 Wed, 19 Jan 2022 17:37:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu21RuDu4kYsS1kTyAAiGM49PrwES/zeCQOYdv+mMWxR0soLH9zsiS2MOkWwEsqvo5DYOafg==
X-Received: by 2002:a17:90a:e454:: with SMTP id
 jp20mr7888046pjb.53.1642642630370; 
 Wed, 19 Jan 2022 17:37:10 -0800 (PST)
Received: from xz-m1.local ([94.177.118.77])
 by smtp.gmail.com with ESMTPSA id s2sm858121pfg.74.2022.01.19.17.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 17:37:09 -0800 (PST)
Date: Thu, 20 Jan 2022 09:37:03 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
Message-ID: <Yei8v4Cdw4VwSDod@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-5-leobras@redhat.com>
 <Yd/OkqOA96rnGggo@xz-m1.local>
 <CAJ6HWG77dmtpwCsOC7CRaNRCYmFAqTRRxURSTw7ACG0p=Uy-Sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG77dmtpwCsOC7CRaNRCYmFAqTRRxURSTw7ACG0p=Uy-Sw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 03:06:55PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Thu, Jan 13, 2022 at 4:02 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Jan 06, 2022 at 07:13:41PM -0300, Leonardo Bras wrote:
> > >  void migration_channel_process_incoming(QIOChannel *ioc)
> > >  {
> > > -    MigrationState *s = migrate_get_current();
> > >      Error *local_err = NULL;
> > >
> > >      trace_migration_set_incoming_channel(
> > >          ioc, object_get_typename(OBJECT(ioc)));
> > >
> > > -    if (s->parameters.tls_creds &&
> > > -        *s->parameters.tls_creds &&
> > > +    if (migrate_use_tls() &&
> > >          !object_dynamic_cast(OBJECT(ioc),
> > >                               TYPE_QIO_CHANNEL_TLS)) {
> > > +        MigrationState *s = migrate_get_current();
> > > +
> >
> > Trivial nit: I'd rather keep the line there; as the movement offers nothing,
> > imho..
> 
> The idea to move the 's' to inside the if  block is to make it clear
> it's only used in this case.

IMHO not necessary; I hardly read declarations for this, unless there's a bug,
e.g. on variable shadowing. Moving it downwards makes it easier to happen. :)

> 
> But if you think it's better to keep it at the beginning of the
> function, sure, I can change that.
> Just let me know.

Since there'll be a new version, that definitely looks nicer.

Thanks,

-- 
Peter Xu


