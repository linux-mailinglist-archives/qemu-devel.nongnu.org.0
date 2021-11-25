Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7345D57B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:31:45 +0100 (CET)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9EO-0004tN-Uj
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq9BW-0004AQ-6S
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:28:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mq9BU-0007cq-RU
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637825324;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=udhOkKnj+2LEnjcvkIw7NxUWQx+TGZ1aAy6dLKljFzA=;
 b=WkjRvox6sbDsFPqg3sCJ43iT57Geh1HlCFctk3dHsdxz/nD5SDWgIOVeuDH6E0nL2l2zUa
 WElGZUwH+pEPtUqOG2Du8vM5FiNPMGOHY+ILAWre6PX6cQGD31sp5DVTIu6/PRK9xCbf2p
 knmZ60JRMwW9ghtnrFvzqelNOyYEQMM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-AAH8xmSnPWSAvL2LNsClzA-1; Thu, 25 Nov 2021 02:28:42 -0500
X-MC-Unique: AAH8xmSnPWSAvL2LNsClzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so4439964wmc.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 23:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=udhOkKnj+2LEnjcvkIw7NxUWQx+TGZ1aAy6dLKljFzA=;
 b=0dGhIkxlmvaQzxuKpfFyZUFPA/DroHKIhjJv8+k7Eqp9UJSqI53KDD6WsP1RIPGZL1
 n0HxxfWmtoL2dvk9DtqW2oDxGvMN3tnawyNv535rm8h6y1k/sfcOvWt0lmC6vyw/hcCC
 LogL3ClGJvejJov0pHvjNWbOcbjrrWwXseOaxeWoTL4udfHL414zS2iVVuk1R6NDkQ63
 Jq/B2qUqtGUcWDyuuPUu4zW00px82yQew317c8wptENJApkjOoyjFr/MELmqrFwHEAdH
 37YqR4NQMMBo1ReTaWRBFHy8T9A6ZedCou244Gc/JrDlqCrIC0kr/nd2a8MpQ4PDog28
 Zkog==
X-Gm-Message-State: AOAM531Sg08EyROwE7pNrfQXofgr5D45LajWzQDh2nRq91sF1ALpw0h1
 4FOdG706Od2q3wSj142fpz9llNczlsIVs6yQBIsCdlIo0Dmnt7KMhKexd5vmH/nJcyBmKf617sz
 BOljCBjmNwwsqcgk=
X-Received: by 2002:adf:e512:: with SMTP id j18mr4333380wrm.532.1637825321714; 
 Wed, 24 Nov 2021 23:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf1Z0lkSzbs0maa4LW+FHGPGat2IqI5BIeJT5Vk4e8wN06YcPcVqf/omO+XgqxqMPUbts/1Q==
X-Received: by 2002:adf:e512:: with SMTP id j18mr4333363wrm.532.1637825321521; 
 Wed, 24 Nov 2021 23:28:41 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id z6sm2802102wmp.9.2021.11.24.23.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:28:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 03/23] multifd: Rename used field to num
In-Reply-To: <YZ6Ug+P2YjHndWKK@work-vm> (David Alan Gilbert's message of "Wed, 
 24 Nov 2021 19:37:39 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-4-quintela@redhat.com>
 <YZ6Ug+P2YjHndWKK@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 25 Nov 2021 08:28:40 +0100
Message-ID: <87a6hsg0d3.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We will need to split it later in zero_num (number of zero pages) and
>> normal_num (number of normal pages).  This name is better.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h |  2 +-
>>  migration/multifd.c | 38 +++++++++++++++++++-------------------
>>  2 files changed, 20 insertions(+), 20 deletions(-)
>> 
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 15c50ca0b2..86820dd028 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -55,7 +55,7 @@ typedef struct {
>>  
>>  typedef struct {
>>      /* number of used pages */
>> -    uint32_t used;
>> +    uint32_t num;
>
> What does 'used' actually mean here?

We allocate 128 pages for each "packet".
But we can ben handled less than that (we are at the end of one
iteration, the end of a ramblock, ...).
That is what used mean.

But later on the series, we enter with normal pages, and zero pages, and
naming get really confusing.  So, I moved to use *_num for everything.

Even after all the series, I didn't rename everything on multifd, only
the fields that I have to use sooner or later.

Later, Juan.


