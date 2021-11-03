Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28210444963
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:11:40 +0100 (CET)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miMbi-0000QK-RR
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miMaO-00074w-7H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miMaL-0003D2-GR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635970211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NPhlW+zgKgqB7tbckfM+N+iVjTu2IbFQsjXBtFnVqjE=;
 b=arpc9WQBbrUx1MqJBT7qlaGX5AxIaF5gN4lXoSFqCQM1xia8JYtILrBOp5NQhW4c9/+PsI
 dc5SRZvQ4NRQt9rTmPwLVetRO8Z4d5of4Nuwfx3tEe7ayIMuv8GCPCWR21HlGhpmO5aGeB
 Y06elk8/Mtz725GfBDwZDo/KZaEmuWY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-WF39eaVeMOedcl92MABDVg-1; Wed, 03 Nov 2021 16:10:10 -0400
X-MC-Unique: WF39eaVeMOedcl92MABDVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1121410wms.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=NPhlW+zgKgqB7tbckfM+N+iVjTu2IbFQsjXBtFnVqjE=;
 b=2a7VL3XL+TWjySxQC3kpeGEbCiq3wnze9DKFrX2pGtei+yn44kH8hZVH3AptNOMYRR
 aHORzMeoUG9xMhgC2ufWN+3Fz2cEnWVuw9/EVO8EyvyZUCqxIaL/9npRLrXuM1HbKObV
 iXOFSJZgSHmxDFGLgIaAbVxxUfFHivHilDev2RYVQ8IER/G7gAQVdmLHSKQHWx1r/oaT
 TzGhJpjjAHUlYKnjzJrl4Chv0RB80d4Wnrd0eGMX4Z1wxx+whKgMvpuZOQeylPwyVfBX
 ThgbL/GEvssOYwrAKiRhESoBWG+Jze+OiyO/+FdcPLPvjsY0+VBb20GwwHrwPME/PbB8
 Xuag==
X-Gm-Message-State: AOAM5328IC2MHk1bloLDGB33jlMTLpOjulypQaIpm9JUNCHktkenrHtR
 mUR2Qa/0gXyamWwXe5dj9VavqLdrZpWKITh/krXwh/xUveQeiSHPl6+gnU6nFDs0uildXjaplZN
 Mrv3uYpTqTSu1Ew4=
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr6330026wmq.76.1635970209647; 
 Wed, 03 Nov 2021 13:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyneIrLez/Rkj1w7mRwq6qW9d97aBL7kPHeZOKaOyqXg7GyLh2Mu1tQpwSxARnbZoQQ0mhaRg==
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr6330001wmq.76.1635970209457; 
 Wed, 03 Nov 2021 13:10:09 -0700 (PDT)
Received: from localhost (62.117.184.100.dyn.user.ono.com. [62.117.184.100])
 by smtp.gmail.com with ESMTPSA id f19sm2880483wmq.34.2021.11.03.13.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:10:08 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] postocpy: Check that postocpy fd's are not NULL
In-Reply-To: <YYLqcx/Y9EqhZKhG@work-vm> (David Alan Gilbert's message of "Wed, 
 3 Nov 2021 20:00:51 +0000")
References: <20211103193129.23930-1-quintela@redhat.com>
 <YYLqcx/Y9EqhZKhG@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 03 Nov 2021 21:10:07 +0100
Message-ID: <87r1bxgfvk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> If postcopy has finished, it frees the array.
>> But vhost-user unregister it at cleanup time.
>
> I must admit to being confused as the double migrate case vs migrate
> once and shutdown. It might just be an ordering thing?
>
> I notice that  'vhost_user_backend_cleanup' does:
>     if (u->postcopy_fd.handler) {
>         postcopy_unregister_shared_ufd(&u->postcopy_fd);
>         close(u->postcopy_fd.fd);
>         u->postcopy_fd.handler = NULL;
>     }
>
> where as the other caller, 'vhost_user_postcopy_end'
> does:
>     postcopy_unregister_shared_ufd(&u->postcopy_fd);
>     close(u->postcopy_fd.fd);
>     u->postcopy_fd.handler = NULL;

I think that we want ta make here the check to see if it has already
been freed.

> maybe it would be better to fix them to do the same if check?

But even there, I think that it is more robust that we don't try to
access a NULL pointer.

I.e. there are two things that we can fix here:
- postcopy unregister
- vhost use of postcopy unregister

> (Also note 'post*o*cpy' typo in title, and probably worth a
>   Fixes: c4f7538 ?)

Sure.

What do you think?

Later, Juan.

> Dave
>
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/postcopy-ram.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>> index e721f69d0f..d18b5d05b2 100644
>> --- a/migration/postcopy-ram.c
>> +++ b/migration/postcopy-ram.c
>> @@ -1457,6 +1457,10 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
>>      MigrationIncomingState *mis = migration_incoming_get_current();
>>      GArray *pcrfds = mis->postcopy_remote_fds;
>>  
>> +    if (!pcrfds) {
>> +        /* migration has already finished and freed the array */
>> +        return;
>> +    }
>>      for (i = 0; i < pcrfds->len; i++) {
>>          struct PostCopyFD *cur = &g_array_index(pcrfds, struct PostCopyFD, i);
>>          if (cur->fd == pcfd->fd) {
>> -- 
>> 2.33.1
>> 


