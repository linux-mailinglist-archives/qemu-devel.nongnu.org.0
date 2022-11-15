Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52233629430
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:21:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ous6h-0007ah-BC; Tue, 15 Nov 2022 04:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ous6e-0007Wc-7B
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:19:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ous6c-0004ob-9Q
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668503985;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nPAmylOoEwlBBRK7L/VHpaIWyynNrrSlD4Sx6EILJ8c=;
 b=S43hElKU/qlApmoPbOUoH1ODL5IImc9tJsI1AOBXmr9lCkFpMicboAXMb04W3Ya1o0pQXs
 /kpgxCJVhBBgV25azblvVxtLlV91OCu7qbyrAUuapqboovXypA6nKid8Q97hXyZYzdymSM
 FUNG+/GC/R7efqbvGXZ5i8ssZj1JckU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-768_9fIEPNeKHnkGT-8BfA-1; Tue, 15 Nov 2022 04:19:43 -0500
X-MC-Unique: 768_9fIEPNeKHnkGT-8BfA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso2563124wrb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 01:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPAmylOoEwlBBRK7L/VHpaIWyynNrrSlD4Sx6EILJ8c=;
 b=Qcgyb6/3cEv0Vpe8vpSAGP/Pp0T/c7/9mPcIYDG63/s7xPoeJgJUVdC/VXh7zBG2mU
 MZaNsavF9Fgc3+yPQMkdqFxbX3ClJl2Jj9gpw8/4G9+avuimRLd7XnDyvsCAfJvNCeKT
 4RZ/z8lB2p/0OLLBv36bxWnoFMeLcGoGkLPkql/N9lGGZxK+P9adTiU4asH582OHP1Ac
 RsoyFt0/Ro1LRuqUGEbfjgtn7hJYTvJRRNt3SVaKofC2nu3Rj4Da5t5kQH7+HqRcxfmL
 jFM2xusEXSF8ffuTrrJlO+N+MjPmKnBSQucVIMjqh9PdY5ttrjxmK2S1Lou226G+U4uw
 doNg==
X-Gm-Message-State: ANoB5pk76pMlb476ocOVytUtsjoimF8jkr/pvhDbkrHYTT3r0cTSnbDy
 WS/hE9Th9qgff+f75UqSgETA2IevOFy+ukVXYcavR4yCpUDM+djbplRIIBVh47lPPeXNLSU6d8n
 j7AeJCmfl/71wf/g=
X-Received: by 2002:a5d:528c:0:b0:22f:da60:345 with SMTP id
 c12-20020a5d528c000000b0022fda600345mr9936884wrv.218.1668503982382; 
 Tue, 15 Nov 2022 01:19:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7dByMplU4mRwMsWi/CN744Q6UVV9zdpYUw5qNjqnvmUtG/RYg8BGo7ysMoALU7+zLM097MeA==
X-Received: by 2002:a5d:528c:0:b0:22f:da60:345 with SMTP id
 c12-20020a5d528c000000b0022fda600345mr9936868wrv.218.1668503982143; 
 Tue, 15 Nov 2022 01:19:42 -0800 (PST)
Received: from localhost ([31.4.176.165]) by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b003cf75f56105sm17054070wmk.41.2022.11.15.01.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 01:19:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
In-Reply-To: <Y0g6i6z3K4mglmPb@x1n> (Peter Xu's message of "Thu, 13 Oct 2022
 12:19:23 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-7-peterx@redhat.com> <Y0buySbboE3xOVoQ@work-vm>
 <Y0b+i6vliRkBC2MI@x1n> <Y0g6i6z3K4mglmPb@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Tue, 15 Nov 2022 10:19:40 +0100
Message-ID: <8735akh8wj.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Oct 12, 2022 at 01:51:07PM -0400, Peter Xu wrote:
>> On Wed, Oct 12, 2022 at 05:43:53PM +0100, Dr. David Alan Gilbert wrote:
>> > * Peter Xu (peterx@redhat.com) wrote:
>> > > Don't take the bitmap mutex when sending pages, or when being throttled by
>> > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
>> > > but seems still helpful).
>> > > 
>> > > It prepares for the possibility of concurrently sending pages in >1 threads
>> > > using the function ram_save_host_page() because all threads may need the
>> > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
>> > > qemu_sem_wait() blocking for one thread will not block the other from
>> > > progressing.
>> > > 
>> > > Signed-off-by: Peter Xu <peterx@redhat.com>
>> > 
>> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> > 
>> > although a comment above the reclaration of ram_save_host_pages saying
>> > it can drop the lock would be veyr good.
>> 
>> Let me add that.  Thanks,
>
> A fixup to this patch attached to touch up the comment for
> ram_save_host_page().

Reviewed-by: Juan Quintela <quintela@redhat.com>


