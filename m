Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C7511659
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:36:35 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfyE-0006N8-JO
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njft8-0007Gq-GL
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njft7-0001cw-2t
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z3iLFHeqkzC3PQOOfo55NlO7C+nci6R/W8P1xhnRUHQ=;
 b=Oa1r02N27IsmCv+3qo/+OPtCT02MdUQN828HxbAzWt2nhfZW4IB3CzZRPQzxCZfqC+5qP9
 mEAC0n3AOwRFHIaZTC6KnEESV7S3EPLABkn2rp4ezEGHn9yYzxBzyo+SUO+SV5VedqFDB2
 btK2Ds0+O7gBwojpLgZ/2t3AG+8hTno=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-FZua35QnNX2al7hPn9fEYA-1; Wed, 27 Apr 2022 07:31:15 -0400
X-MC-Unique: FZua35QnNX2al7hPn9fEYA-1
Received: by mail-lj1-f198.google.com with SMTP id
 m11-20020a2ea88b000000b0024db6246908so644756ljq.22
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3iLFHeqkzC3PQOOfo55NlO7C+nci6R/W8P1xhnRUHQ=;
 b=MN4OJMfR4Bul176Bm4RM9oFeMtoPG+XyfxxvzwxaaHiHJHadpfJsIYbVECGug4gfXZ
 VcGWbS9fHbAllDNbmZ3H+5VMProu5J+UAX+XPQ3r4a/vJtVSAjuMKWWt3qApmxm9xJHO
 MAbIa+o1n2q1rtcTi1hKv5YBbyb49PByFDyL1oOglDQcejZIolygFPKodiot/305Mvjw
 0+gu6P6bGvM3IgFtIMw43NyD/dTrIHzvk6BPyyv23fJvxVRDGpceJSG6YVJNXH6LfuvT
 cll7xqZX3HzyBiXn053frEJYTjTHtZbre80E5IZ1jS4k2dwJrsW12mOV2l0niuAJgYfy
 pXMQ==
X-Gm-Message-State: AOAM530XpL+mkKtTcfW6kGQAQNNCLlZtQGojDqynJbSPs7qlOtiqnqWP
 xcG1cS2dJb8xA0x30/fIKEHsicdYO83iewM9Z+jW6kXMKMSGZjmPq4aHqx3tlJn6x7nz3eetBni
 QfB1y6t0w40ZVb7o2SvpzB/uBWeqULU8=
X-Received: by 2002:a2e:6819:0:b0:244:c111:7444 with SMTP id
 c25-20020a2e6819000000b00244c1117444mr18146642lja.116.1651059073655; 
 Wed, 27 Apr 2022 04:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/nwt5UnU30Hme0S55zThV0gH9BvAoGH5M5H4qWRY2tB6BDRnJYVjK02AS4uZNBaMuswYFQUidlLbnAZHAmps=
X-Received: by 2002:a2e:6819:0:b0:244:c111:7444 with SMTP id
 c25-20020a2e6819000000b00244c1117444mr18146627lja.116.1651059073445; Wed, 27
 Apr 2022 04:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-8-leobras@redhat.com>
 <Ymh/svJH+MLS8L7I@xz-m1.local>
In-Reply-To: <Ymh/svJH+MLS8L7I@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Apr 2022 08:31:02 -0300
Message-ID: <CAJ6HWG4isRnTqmNre8aXncwcccc2zUc=Z3uOkEB1O3ffuj7OyA@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Peter Xu <peterx@redhat.com>
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
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 8:26 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Apr 26, 2022 at 08:06:56PM -0300, Leonardo Bras wrote:
> > Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> > writev + flags & flush interface.
> >
> > Change multifd_send_sync_main() so flush_zero_copy() can be called
> > after each iteration in order to make sure all dirty pages are sent before
> > a new iteration is started. It will also flush at the beginning and at the
> > end of migration.
> >
> > Also make it return -1 if flush_zero_copy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.
> >
> > This will work fine on RAM migration because the RAM pages are not usually freed,
> > and there is no problem on changing the pages content between writev_zero_copy() and
> > the actual sending of the buffer, because this change will dirty the page and
> > cause it to be re-sent on a next iteration anyway.
> >
> > A lot of locked memory may be needed in order to use multifd migration
> > with zero-copy enabled, so disabling the feature should be necessary for
> > low-privileged users trying to perform multifd migrations.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

Thanks for reviewing Peter!

Best regards,
Leo


