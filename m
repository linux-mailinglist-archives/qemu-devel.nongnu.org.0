Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91B3403CF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:49:24 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqDT-0002dA-CZ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMq9e-0000qF-Nx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMq9b-0005h7-1t
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616064321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cz1WHJMAf2Ucc4LQY8VmHo9rnZ8v7mIPWBwVpw3skGk=;
 b=CrhLTmA9evHiy6a1+ajTq1PH7MTMtnz4Eh8gq912F9UfRNakiEknJBJq9MTzs8E8nOvJLe
 wJsELGVq+4WmpcC2BjRcqTlg8PCVRBWygfgVKxdBWWjmu+g0t+qIij3CUPmgMQW1YX+iYP
 Dv0tmgvklkLMKMibjOMXdJaUa+fUcrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-mENbnXq5OdKtX3QnROJm1g-1; Thu, 18 Mar 2021 06:45:19 -0400
X-MC-Unique: mENbnXq5OdKtX3QnROJm1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF6C180FCA2;
 Thu, 18 Mar 2021 10:45:18 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA366A83C;
 Thu, 18 Mar 2021 10:45:17 +0000 (UTC)
Date: Thu, 18 Mar 2021 10:45:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: of AVR target page size
Message-ID: <YFMvO/79vcSFOEix@work-vm>
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 18 Mar 2021 at 10:25, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> > Oh yes, just:
> >
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 52537f14ac..a7269955b5 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -81,6 +81,8 @@
> >  /* 0x80 is reserved in migration.h start with 0x100 next */
> >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> >
> > +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
> > +
> >  static inline bool is_zero_range(uint8_t *p, uint64_t size)
> >  {
> >      return buffer_is_zero(p, size);
> > @@ -4090,5 +4092,6 @@ static SaveVMHandlers savevm_ram_handlers = {
> >  void ram_mig_init(void)
> >  {
> >      qemu_mutex_init(&XBZRLE.lock);
> > +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= (1 << TARGET_PAGE_BITS_MIN));
> >      register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
> >  }
> >
> >
> > works; lets keep that in mind somewhere after Michael fixes AVR.
> 
> You don't have a great deal of headroom even after getting AVR
> to change, by the way -- TARGET_PAGE_BITS_MIN for Arm is 10.
> So you might want to think about ways to eg reclaim usage of
> that "obsolete, not used" RAM_SAVE_FLAG_FULL bit.

Yep, I've been warning anyone who adds one for ages

> Also, what does the
>  /* 0x80 is reserved in migration.h start with 0x100 next */
> comment refer to? migration.h has no instances of "RAM_SAVE"
> or 0x80 or 1 << 7...

It looks like it got moved to qemu-file.h a few years ago
as RAM_SAVE_FLAG_HOOK.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


