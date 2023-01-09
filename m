Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9808766292A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtb3-0002Mq-J1; Mon, 09 Jan 2023 09:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtb0-0002Kg-Nu
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtay-0007ix-Vf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673276272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFp35U5ialGKUDVWZCtHlhnRVyRU9V3driWaRbXGU3o=;
 b=ag/bEcIx8YnR6u5V+ZhuQHvlt/IMVkxhDX9iYlnAGVBkWY7KMxFQiCAtmxDx0OxxxZNvB3
 lraM7zkyvm2yLVJjE0vA/4qaRpDGLuHa4wSI/vUraxg7tUVzmeRaRGwi3/SeVt7jaGoFDj
 0ug2y+SD/74mN9ElynhDmNv8toBn6jA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-lSFffoUfNOiYI8L2x9ii-Q-1; Mon, 09 Jan 2023 09:57:47 -0500
X-MC-Unique: lSFffoUfNOiYI8L2x9ii-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7B3E185A794;
 Mon,  9 Jan 2023 14:57:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59B10492B00;
 Mon,  9 Jan 2023 14:57:45 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:57:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5 1/2] tpm: convert tpmdev options processing to new
 visitor format
Message-ID: <Y7wrYwIuW1giyC33@redhat.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-2-jejb@linux.ibm.com>
 <92288ac5-c850-3d06-d047-0bb5ca1e3397@linux.ibm.com>
 <ecabd13c2b311d9f22f58d54737effe0ec966782.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecabd13c2b311d9f22f58d54737effe0ec966782.camel@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 05, 2023 at 03:34:50PM -0500, James Bottomley wrote:
> On Thu, 2023-01-05 at 09:59 -0500, Stefan Berger wrote:
> [...]
> > > @@ -2658,7 +2646,6 @@ void qemu_init(int argc, char **argv)
> > >       qemu_add_opts(&qemu_boot_opts);
> > >       qemu_add_opts(&qemu_add_fd_opts);
> > >       qemu_add_opts(&qemu_object_opts);
> > > -    qemu_add_opts(&qemu_tpmdev_opts);
> > >       qemu_add_opts(&qemu_overcommit_opts);
> > >       qemu_add_opts(&qemu_msg_opts);
> > >       qemu_add_opts(&qemu_name_opts);
> > > @@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
> > >                   break;
> > >   #ifdef CONFIG_TPM
> > >               case QEMU_OPTION_tpmdev:
> > > -                if (tpm_config_parse(qemu_find_opts("tpmdev"),
> > > optarg) < 0) {
> > > -                    exit(1);
> > > -                }
> > > +                tpm_config_parse(optarg);
> > 
> > The comment to v4 still applies:
> > 
> > $ qemu-system-x86_64 --tpmdev help
> > Supported TPM types (choose only one):
> >   passthrough   Passthrough TPM backend driver
> >      emulator   TPM emulator backend driver
> >         mssim   TPM mssim emulator backend driver
> > VNC server running on ::1:5900
> 
> So I think if I parse this correctly, your complaint is the help option
> no longer exit(1)'s?  It shouldn't do that because it's not a failure,
> but I can code it to exit(0).


Yes, 'help' options should 'exit(0)'


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


