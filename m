Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AC324709
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:43:40 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2sd-0002vS-82
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lF2rJ-0002KP-Nw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lF2rH-0003xA-UO
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7loNY6a/CYvNtMJopL3QUeRwqTiWCpARGe5VL/q/8gs=;
 b=PgRL9zUgUEx2Y6UNAxqZ3EIlqc1bwxTKkwc5W0mL+ugBE3aB3vrE8I0ca2h1LOQPjKCqtd
 Hl1dRuv34ztev2/IUMNZMmOP9jXYqkqHQPCAJR3sFzyFrmziY5LeP7DjDKkoVnqtsTp/Cv
 Vzz7iVsPAGQH0J0o+cBz+1hq7Nj+uus=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-4y5VKvXbOKOClQvgi65qRw-1; Wed, 24 Feb 2021 17:42:07 -0500
X-MC-Unique: 4y5VKvXbOKOClQvgi65qRw-1
Received: by mail-ej1-f69.google.com with SMTP id n25so1529723ejd.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7loNY6a/CYvNtMJopL3QUeRwqTiWCpARGe5VL/q/8gs=;
 b=B9DBKOkCjUJubQ3WlAOCjCX0gGZq2xSj8sG3EboRX28DFBHtsvQpSIiISQHtf8JpGK
 O6Q63ScknXxClAHkoR8c0opr7tWM23priv6NyEcHXgfsRXo0Qa9BHkrNlfb7NoX3R6lx
 zelqWILC+FcAbJd4B3OknTtZweG+bQeVdGLd6ULsYimtNgf89p5nJ/SX1e00581eS/By
 Nu09Q95pPGt2D49PAhD6lHdwMobU/MRCsKQep0RQNalA6pATGBKTOkTyBwZdGUdVdOen
 E/+SU8dj0FZl23VuVArzW1RDEeks6eE1kf2xhY45pZ2SYiAdg9/ZFivUxtqCw7DL+3PC
 sxKg==
X-Gm-Message-State: AOAM53242hjpzHm4wHBZHJI9nMcZhgDD1BfXlbm1r57C+HW5qBdoOs3m
 xOr89auHku1rsH/c9rX9XYbrQxBogYgKzIT4Ax+A1QqRd1uAabFHnPVRMkluAARy+bn8NCTmAad
 Ba0WiJtOF3RVaOFo=
X-Received: by 2002:aa7:c905:: with SMTP id b5mr45125edt.161.1614206525814;
 Wed, 24 Feb 2021 14:42:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX6wHCinOs4mbPbm2b7t4ZXywkzoSCLQSDAz3ddGk0HJEmKYxvUxfEaGzcRz0oxz/i60stnA==
X-Received: by 2002:aa7:c905:: with SMTP id b5mr45085edt.161.1614206525568;
 Wed, 24 Feb 2021 14:42:05 -0800 (PST)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id w24sm2387595edv.67.2021.02.24.14.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:42:04 -0800 (PST)
Date: Wed, 24 Feb 2021 17:41:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v7 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210224173205-mutt-send-email-mst@kernel.org>
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
 <1614156452-17311-2-git-send-email-acatan@amazon.com>
 <20210224040516-mutt-send-email-mst@kernel.org>
 <d63146a9-a3f8-14ea-2b16-cb5b3fe7aecf@amazon.com>
MIME-Version: 1.0
In-Reply-To: <d63146a9-a3f8-14ea-2b16-cb5b3fe7aecf@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au,
 rafael@kernel.org, ebiggers@kernel.org, borntraeger@de.ibm.com,
 sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de, jannh@google.com,
 raduweis@amazon.com, asmehra@redhat.com, Adrian Catangiu <acatan@amazon.com>,
 rppt@kernel.org, luto@kernel.org, gil@azul.com, oridgar@gmail.com,
 colmmacc@amazon.com, tytso@mit.edu, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 02:45:03PM +0100, Alexander Graf wrote:
> > Above should try harder to explan what are the things that need to be
> > scrubbed and why. For example, I personally don't really know what is
> > the OpenSSL session token example and what makes it vulnerable. I guess
> > snapshots can attack each other?
> > 
> > 
> > 
> > 
> > Here's a simple example of a workflow that submits transactions
> > to a database and wants to avoid duplicate transactions.
> > This does not require overseer magic. It does however require
> > a correct genid from hypervisor, so no mmap tricks work.
> > 
> > 
> > 
> >          int genid, oldgenid;
> >          read(&genid);
> > start:
> >          oldgenid = genid;
> >          transid = submit transaction
> >          read(&genid);
> >          if (genid != oldgenid) {
> >                          revert transaction (transid);
> >                          goto start:
> >          }
> 
> I'm not sure I fully follow. For starters, if this is a VM local database, I
> don't think you'd care about the genid. If it's a remote database, your
> connection would get dropped already at the point when you clone/resume,
> because TCP and your connection state machine will get really confused when
> you suddenly have a different IP address or two consumers of the same stream
> :).
>
> But for the sake of the argument, let's assume you can have a connectionless
> database connection that maintains its own connection uniqueness logic.

Right. E.g. not uncommon with REST APIs. They survive disconnect easily
and use cookies or such.

> That
> database connector would need to understand how to abort the connection (and
> thus the transaction!) when the generation changes.

the point is that instead of all that you discover transaction as
a duplicate and revert it.


> And that's logic you
> would do with the read/write/notify mechanism. So your main loop would check
> for reads on the genid fd and after sending a connection termination, notify
> the overlord that it's safe to use the VM now.
> 
> The OpenSSL case (with mmap) is for libraries that are stateless and can not
> guarantee that they receive a genid notification event timely.
> 
> Since you asked, this is mainly important for the PRNG. Imagine an https
> server. You create a snapshot. You resume from that snapshot. OpenSSL is
> fully initialized with a user space PRNG randomness pool that it considers
> safe to consume. However, that means your first connection after resume will
> be 100% predictable randomness wise.

I wonder whether something similar is possible here. I.e. use the secret
to encrypt stuff but check the gen ID before actually sending data.
If it changed re-encrypt. Hmm?

> 
> The mmap mechanism allows the PRNG to reseed after a genid change. Because
> we don't have an event mechanism for this code path, that can happen minutes
> after the resume. But that's ok, we "just" have to ensure that nobody is
> consuming secret data at the point of the snapshot.


Something I am still not clear on is whether it's really important to
skip the system call here. If not I think it's prudent to just stick
to read for now, I think there's a slightly lower chance that
it will get misused. mmap which gives you a laggy gen id value
really seems like it would be hard to use correctly.


> > 
> > 
> > 
> > 
> > 
> > 
> > > +Simplifyng assumption - safety prerequisite
> > > +-------------------------------------------
> > > +
> > > +**Control the snapshot flow**, disallow snapshots coming at arbitrary
> > > +moments in the workload lifetime.
> > > +
> > > +Use a system-level overseer entity that quiesces the system before
> > > +snapshot, and post-snapshot-resume oversees that software components
> > > +have readjusted to new environment, to the new generation. Only after,
> > > +will the overseer un-quiesce the system and allow active workloads.
> > > +
> > > +Software components can choose whether they want to be tracked and
> > > +waited on by the overseer by using the ``SYSGENID_SET_WATCHER_TRACKING``
> > > +IOCTL.
> > > +
> > > +The sysgenid framework standardizes the API for system software to
> > > +find out about needing to readjust and at the same time provides a
> > > +mechanism for the overseer entity to wait for everyone to be done, the
> > > +system to have readjusted, so it can un-quiesce.
> > > +
> > > +Example snapshot-safe workflow
> > > +------------------------------
> > > +
> > > +1) Before taking a snapshot, quiesce the VM/container/system. Exactly
> > > +   how this is achieved is very workload-specific, but the general
> > > +   description is to get all software to an expected state where their
> > > +   event loops dry up and they are effectively quiesced.
> > 
> > If you have ability to do this by communicating with
> > all processes e.g. through a unix domain socket,
> > why do you need the rest of the stuff in the kernel?
> > Quescing is a harder problem than waking up.
> 
> That depends. Think of a typical VM workload. Let's take the web server
> example again. You can preboot the full VM and snapshot it as is. As long as
> you don't allow any incoming connections, you can guarantee that the system
> is "quiesced" well enough for the snapshot.

Well you can use a firewall or such to block incoming packets,
but I am not at all sure that means e.g. all socket buffers
are empty.


> This is really what this bullet point is about. The point is that you're not
> consuming randomness you can't reseed asynchronously (see the above OpenSSL
> PRNG example).
> 
> 
> Alex
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 


