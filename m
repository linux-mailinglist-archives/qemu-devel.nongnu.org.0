Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A764461B5D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 16:51:59 +0100 (CET)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mriwf-0008HG-5v
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 10:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrium-0006uD-2h
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 10:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mriuh-0006Kr-85
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 10:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638200994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHAvgacYRnBj2iCFEdQ4XsTbr6TIgQ2+5Exj25K1drk=;
 b=WkjE2n1P4RRpzbT3Kyl6M5rmQofhQGoGRyivC8kxwg0PlwLAAA5dQLu3ii1xGLfceo+QPu
 0SA4MSIDqOJsdQ2s1xXJSGoYhnsldgFweoeqnuXzHUqbgFx5Ybffdsg5oRTngLyCBKaML7
 CSVU9JaXVmM3QXbWnqysnlElaXtgItQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-HcGeou_APzaolSbx_Cl0AQ-1; Mon, 29 Nov 2021 10:49:52 -0500
X-MC-Unique: HcGeou_APzaolSbx_Cl0AQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so11062533wms.8
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 07:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zHAvgacYRnBj2iCFEdQ4XsTbr6TIgQ2+5Exj25K1drk=;
 b=3w7QhyWI/djq6Tnw+K+eWv6GtZk3HlcT5d9kFjpnK4UFlDbOiwD7syxuci89W7a6zO
 hIQ0pm01TcFL2Eu5IJcJXQ6tDVN89PGFwbBDBShAtBO7Fx2JmmS65NHBLwQ+SYZpxHhy
 NR2E149Qfag4VpbvgyfSmCgk4fEKva5sjJktwVmn+ZLF8tBG2s4MrL8JvkIbMOmEOGuZ
 zzRGNC7RlykoFrU42fKWgUuWz0vFRk6pqJV+0OCe2hrjKDoanmXpWKA6G3YZIUWJ8qCD
 HdhaNXenV9/Ifj7WK/s7g1sic09VsAodBgiK/3OmkFWr3tSNFXCfWcnvbAYrWADZcldv
 Gd/Q==
X-Gm-Message-State: AOAM532zXT6IXyPbfS8aXURNS6YKt/n6cjLnOrd00jcYTpUZzEAZN27X
 bscqVguMFyOauH/66lcd6Bib1ipeWsmKjB9Iz59thDde5gK2bCRAbUkgmIArwYKsS+c6oG4X33C
 bPY/afvFD6khGWUo=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr37362061wmh.104.1638200991593; 
 Mon, 29 Nov 2021 07:49:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUa+9CU/MiIOtiaOzQ7MzicyLRlGUufC3hIZViOeINvr+azlYUQjqaLuBhSepsxBfFo4p8QA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr37362032wmh.104.1638200991361; 
 Mon, 29 Nov 2021 07:49:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t127sm21085281wma.9.2021.11.29.07.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 07:49:50 -0800 (PST)
Date: Mon, 29 Nov 2021 15:49:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaT2nMsL18cZxPgk@work-vm>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com> <YaS3aKW6AWH4JAeR@work-vm>
 <YaTqfO1ZqUanlA7K@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YaTqfO1ZqUanlA7K@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-devel@nongnu.org, Li Zhang <lizhang@suse.de>, cfontana@suse.de,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Nov 29, 2021 at 11:20:08AM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > > > When doing live migration with multifd channels 8, 16 or larger number,
> > > > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > > > 
> > > > At sender's side:
> > > > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > > > is called because one thread fails on qio_channel_write_all when
> > > > the network problem happens and other send threads are blocked on sendmsg.
> > > > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > > > to wait for the threads terminated.
> > > 
> > > Isn't the right answer here to ensure we've called 'shutdown' on
> > > all the FDs, so that the threads get kicked out of sendmsg, before
> > > trying to join the thread ?
> > 
> > I agree a timeout is wrong here; there is no way to get a good timeout
> > value.
> > However, I'm a bit confused - we should be able to try a shutdown on the
> > receive side using the 'yank' command. - that's what it's there for; Li
> > does this solve your problem?
> 
> Why do we even need to use 'yank' on the receive side ? Until migration
> has switched over from src to dst, the receive side is discardable and
> the whole process can just be teminated with kill(SIGTERM/SIGKILL).

True, although it's nice to be able to quit cleanly.

> On the source side 'yank' is needed, because the QEMU process is still
> running the live workload and thus is precious and mustn't be killed.

True.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


