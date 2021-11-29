Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001274613C9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 12:21:59 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrejO-0007DB-Ll
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 06:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mreht-0006QH-3q
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrehp-0002V8-Ay
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638184819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1ia0dHFRDo8DJlvLL4lCSMg8Jds3RdjvgxBE949ZYM=;
 b=GdWmMDm4zG2SxzjE9GmEkAeBnfgJ23Af+9f8wME295yUOCXF6dnUzKrMUn0LeJwjl5dZZ3
 TPRglsB8b4DwWpj4iDhgwp5lbOeVu3+tGfhAOSKkQ3f7V/aYFFXHGA/WJQHjUUsFDdPW2i
 y4eTT5ucrNJfi3Z8KcPIWQyho+8wUxc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-CkP19RrGPMWtY7K9J25SnQ-1; Mon, 29 Nov 2021 06:20:12 -0500
X-MC-Unique: CkP19RrGPMWtY7K9J25SnQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so2724275wrw.9
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 03:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=s1ia0dHFRDo8DJlvLL4lCSMg8Jds3RdjvgxBE949ZYM=;
 b=kKfJ86hdR0Xgh5bFMUA73h4id2bjVku/0OitI5rtVDJdm0t8vuPM9VxhvHPunNSJVy
 fzrs+xhaxiMX5vdWbXW6So3HlFstabzsYfxprjT58iP9eWpOf2Nt0+KWLouI9BBNUsfo
 G7/55Dp04Mhg+e12FIo9c70l5n8usanWCEwnf+2Lbnfw1OZ3bPBZeJ5JOKiLw2n7npYo
 41KIrbU2FyowMous9y0JjdKBRqdMWGgX0pfNRGdQ3wpbBOUQ1hYezjqHdP+/6nXImgvT
 fZkF2zxvszQEBOuJjGlMwXxjQajmXxOWc2R7fxmF6pbnGm1jYkYtaFWI3i2NnzKn9F9n
 LsZA==
X-Gm-Message-State: AOAM533c6MbcysVneKJ4Oq9d5eWTSGPdogSomgkAs6PW2me0XndMIE0c
 2d7+ZDd2T/qAsnESyk7ICBY2ROfoVpCVOWg0ZyxTMduhnZdFY8qwAGCWe5LYWgvHuULC5TFjyK5
 4VKSdLGK0NeeeEAU=
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr33451847wrz.159.1638184811112; 
 Mon, 29 Nov 2021 03:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3tvMmUV5xACERkxkaI7UXKKwJiO3svwoTKzAlRFCRHn4d+TU0g+79lCB3ocXLlhvU5SN5Jw==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr33451825wrz.159.1638184810924; 
 Mon, 29 Nov 2021 03:20:10 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n184sm18223217wme.2.2021.11.29.03.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 03:20:10 -0800 (PST)
Date: Mon, 29 Nov 2021 11:20:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaS3aKW6AWH4JAeR@work-vm>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YaECIGJAPAtB+n8/@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: qemu-devel@nongnu.org, Li Zhang <lizhang@suse.de>, cfontana@suse.de,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > When doing live migration with multifd channels 8, 16 or larger number,
> > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > 
> > At sender's side:
> > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > is called because one thread fails on qio_channel_write_all when
> > the network problem happens and other send threads are blocked on sendmsg.
> > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > to wait for the threads terminated.
> 
> Isn't the right answer here to ensure we've called 'shutdown' on
> all the FDs, so that the threads get kicked out of sendmsg, before
> trying to join the thread ?

I agree a timeout is wrong here; there is no way to get a good timeout
value.
However, I'm a bit confused - we should be able to try a shutdown on the
receive side using the 'yank' command. - that's what it's there for; Li
does this solve your problem?

multifd_load_cleanup already kicks sem_sync before trying to do a
thread_join - so have we managed to trigger that on the receive side?

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


