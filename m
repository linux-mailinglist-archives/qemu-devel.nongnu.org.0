Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34F3FCE99
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:35:06 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLAT9-0006u8-VA
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLANh-0002up-0h
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLANf-0000Gf-HL
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630441755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uN/QQ4eLEghcpOMl8+bghErVI915PBdeRDZ+XB0Skic=;
 b=PCoguApH/Goiv3CkKbAJqOiqi7fpcfIp0hF7Lon60rbXvnvYiKmu+jTowlS0zWalkBMJQZ
 v0tYm4IaiHLVpZXEnM+GEfJzLMo9Vfr9+ixxWbXQjMK3B0DAWdLRX1WBim9xsnmF6BmzyJ
 GKP5kWfDRElY1ldCkOw92Vq5pZOZnTs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-GwQvP-B8N264eT-vaYXgvA-1; Tue, 31 Aug 2021 16:29:12 -0400
X-MC-Unique: GwQvP-B8N264eT-vaYXgvA-1
Received: by mail-qv1-f72.google.com with SMTP id
 jq13-20020ad45fcd000000b0036c273baa23so342710qvb.8
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 13:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uN/QQ4eLEghcpOMl8+bghErVI915PBdeRDZ+XB0Skic=;
 b=RmI5x6XzkM6xIrIkE97497pwEYHD74ACS9tDtSpg5yzmzBSOWE40oDAsQ+97jjp/lx
 RstDEKVJ6N4FSvtS4nHeD+BjbYnhPvM4VLOztbG01CWMRGPTl/LlUIZFj4P4qvw9YFs2
 +64gFmLUhNIpv7fBcdc1XhiG7ylRewf3O+eLp61zsVEPMBX5VVInjbDqcO0dHoT8HQwx
 p29eCtoDV1S+0fdHXeVG6KDLNYWu2ukBfCC3tMaUMH8cp1h15YbDrx//bv9mBn55QhL+
 b8jMm1e1Mb93lnVnGELEVbpMFuNkRwjVH0iz2qcQ4ld6m6Wzlhg4tAH0IDNknPx9sXsU
 P1zw==
X-Gm-Message-State: AOAM532SvGqobcEiKV40MwDxwu1NavJT0veBhsvxQnjfbeuClT7JD12A
 VOb0UqgwdOBP6njeI4N+oMNXg1XeHM37N7eDH4xnp3lc2n1aLiomwk/BbpwsYKccK58jp33ArZH
 xNHNetzElMtGrYkk=
X-Received: by 2002:a05:620a:2a07:: with SMTP id
 o7mr4820409qkp.213.1630441751462; 
 Tue, 31 Aug 2021 13:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxunpDTehjJtp8uPfbkCYjrgSDEyOXSbca7RCOcPK0k+7So1ajVb2j9QXt9GZsbu5h6ntgAPg==
X-Received: by 2002:a05:620a:2a07:: with SMTP id
 o7mr4820396qkp.213.1630441751258; 
 Tue, 31 Aug 2021 13:29:11 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id a185sm14565129qkg.128.2021.08.31.13.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:29:10 -0700 (PDT)
Date: Tue, 31 Aug 2021 16:29:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YS6RFcQnZEhE8XpG@t490s>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YS4rulGV9eueB04H@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 02:16:42PM +0100, Daniel P. Berrangé wrote:
> On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > 
> > Change the send_write() interface of multifd, allowing it to pass down
> > flags for qio_channel_write*().
> > 
> > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > other data being sent at the default copying approach.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd-zlib.c | 7 ++++---
> >  migration/multifd-zstd.c | 7 ++++---
> >  migration/multifd.c      | 9 ++++++---
> >  migration/multifd.h      | 3 ++-
> >  4 files changed, 16 insertions(+), 10 deletions(-)
> 
> > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> >              }
> >  
> >              if (used) {
> > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > +                                                          &local_err);
> 
> I don't think it is valid to unconditionally enable this feature due to the
> resource usage implications
> 
> https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> 
>   "A zerocopy failure will return -1 with errno ENOBUFS. This happens 
>    if the socket option was not set, the socket exceeds its optmem 
>    limit or the user exceeds its ulimit on locked pages."
> 
> The limit on locked pages is something that looks very likely to be
> exceeded unless you happen to be running a QEMU config that already
> implies locked memory (eg PCI assignment)

Yes it would be great to be a migration capability in parallel to multifd. At
initial phase if it's easy to be implemented on multi-fd only, we can add a
dependency between the caps.  In the future we can remove that dependency when
the code is ready to go without multifd.  Thanks,

-- 
Peter Xu


