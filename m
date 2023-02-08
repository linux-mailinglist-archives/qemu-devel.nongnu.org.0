Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDC68F891
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqiw-0003Un-Ml; Wed, 08 Feb 2023 15:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPqiu-0003TI-Be
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPqir-00072y-4t
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675886835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S/O1l/VXo9/bqpY5VTLlHSTCZ3oXn2E77iRcXrgYpio=;
 b=f1qwYJyiByZpgNCnjPxlzsftM0r9VduBPuxpOHJcEZWMTPpZyvcNoVB0rJsj9DD7vIqSki
 rWeXX0KQTJx33hJ+uKWcxSjgIt7Ve0L1qNkMhYPO+FJv6IN4BfRn9FZT0uQudF7gyFq/wx
 Y+a4gXBXXp/mGsmH+7XO27QZGMELUJI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-SVQ3f2yTNqKLkSOOHjyVQA-1; Wed, 08 Feb 2023 15:07:13 -0500
X-MC-Unique: SVQ3f2yTNqKLkSOOHjyVQA-1
Received: by mail-qk1-f197.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so12880896qkl.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/O1l/VXo9/bqpY5VTLlHSTCZ3oXn2E77iRcXrgYpio=;
 b=Ubk3urQt9rAtWTzzPZPwmRoVnxRmqIwS8qrgX7RSEA6AYoiyzuxU2jQ3ddY4emRwSV
 EwTnEJmI9yHYc5bm5M4x/+dv7IdLSvQQNqPHz3gBd65E21ITmC3kSfdNNZ9upcn/KaXH
 DaQgm9ZIF2g3Uv/V8VnP1XGOhRBw/dcoXbb1I5JbVaKxH2ie7JHCa7+a2xDBxwLsPDF7
 tCQ5/XC4MxwzeNNRUj6RaPkdavTHtE7O9MsYiE1NB4/O+Tkqj9NMRrG5BNGXlApwA8/o
 1F5SkoS/zlhdpRTlLY2+iggZcvyL7UPPaGls5zayIdoQPt1UKoXSsawdSZjD6tGkJDLm
 u8EQ==
X-Gm-Message-State: AO0yUKVh4KfNLEzipWPKECMQJvgTIfYVznQf0HSUBATw8vFC4lZTF5Qa
 7wGBceEaqTsITOcgTeiaQaxYjG7ovH0zm6vE1cIktIwJY6I2tcWE8SytaYczZI0G60J4UbZXon/
 pw0y6+HZIgm/QuAI=
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr16463799qtf.4.1675886833332; 
 Wed, 08 Feb 2023 12:07:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+7cqy6/lJ1sw4Ao1+1Tm4/585iBW8ZPp7er3bF9+20Bh2j57RAjBw5gISqhSW45RkI9Lo5Dg==
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr16463769qtf.4.1675886833094; 
 Wed, 08 Feb 2023 12:07:13 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 f10-20020ac840ca000000b003b84b92052asm11967166qtm.57.2023.02.08.12.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:07:12 -0800 (PST)
Date: Wed, 8 Feb 2023 15:07:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v2 3/3] migration: Postpone postcopy preempt channel to
 be after main
Message-ID: <Y+QA7xoqBqMyh3MM@x1n>
References: <20230202212458.726496-1-peterx@redhat.com>
 <20230202212458.726496-4-peterx@redhat.com>
 <87h6vw9d42.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h6vw9d42.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 08:22:05PM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Postcopy with preempt-mode enabled needs two channels to communicate.  The
> > order of channel establishment is not guaranteed.  It can happen that the
> > dest QEMU got the preempt channel connection request before the main
> > channel is established, then the migration may make no progress even during
> > precopy due to the wrong order.
> >
> > To fix it, create the preempt channel only if we know the main channel is
> > established.
> >
> > For a general postcopy migration, we delay it until postcopy_start(),
> > that's where we already went through some part of precopy on the main
> > channel.  To make sure dest QEMU has already established the channel, we
> > wait until we got the first PONG received.  That's something we do at the
> > start of precopy when postcopy enabled so it's guaranteed to happen sooner
> > or later.
> >
> > For a postcopy recovery, we delay it to qemu_savevm_state_resume_prepare()
> > where we'll have round trips of data on bitmap synchronizations, which
> > means the main channel must have been established.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> But I still think that our channel setup is overcomplex (famous last
> words, specially thinking that I designed it, sniff).

:)

I think it's more of my fault, when not noticing I have had a chance to add
at least a channel handshake for the new preempt ones, knowing that the
migration handshake never being there.

It'll be even better if that'll be provided by QIOChannel, or some higher
level abstraction layer so we can have named QIO channels that
automatically pair each other for two QEMU instances.

I'll take away the R-b, thanks.

-- 
Peter Xu


