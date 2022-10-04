Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD035F403F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:48:59 +0200 (CEST)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeXq-00069M-65
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeVh-0004jP-IC
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeVd-0007P1-Q3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664876800;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLmH+R7aXiwIPURkIbdLOtJGdap2Q7t/xRpB8BXK5bc=;
 b=VGrU+cAcNyLueQX8jvB8tplxlvdzxpzIERm3wKry6i3in7QRFMP592G47EXAaxQr2YdB0x
 w17K+2CIoGv12VB0/UF9AzrGDEAox9PvNGDeTGKxrZ5F4FGGL9tKE5hp5wGHAz7X1nEeKn
 EIRJl0mjNSNvJI8vo6Vtnr7NeClw+qc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-mpdz_gMIP3uIaezz7lekaA-1; Tue, 04 Oct 2022 05:46:37 -0400
X-MC-Unique: mpdz_gMIP3uIaezz7lekaA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C99E1C05EB4;
 Tue,  4 Oct 2022 09:46:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E239492CA5;
 Tue,  4 Oct 2022 09:46:36 +0000 (UTC)
Date: Tue, 4 Oct 2022 10:46:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andreas Schwab <schwab@linux-m68k.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
Message-ID: <YzwA+oekCPBFeWKb@redhat.com>
References: <20220802164134.1851910-1-berrange@redhat.com>
 <878rlzkz37.fsf@igel.home> <Yzqd+Pyuy7fC4wj3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yzqd+Pyuy7fC4wj3@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 09:31:52AM +0100, Daniel P. Berrangé wrote:
> On Sat, Oct 01, 2022 at 11:34:20PM +0200, Andreas Schwab wrote:
> > On Aug 02 2022, Daniel P. Berrangé wrote:
> > 
> > > This patch removes linux/fs.h, meaning we have to define
> > > various FS_IOC constants that are now unavailable.
> > 
> > This breaks a lot of ioctl emulations, as it lacks their definitions:
> 
> Urgh, very sorry about that. I of course tested it compiled, but not
> realizing a bunch of ioctls were #ifdef'd, so we ended up silently
> disabling them.
> 
> > 
> > #define BLKGETSIZE64                   _IOR(0x12,114,size_t)
> > #define BLKDISCARD                     _IO(0x12,119)
> > #define BLKIOMIN                       _IO(0x12,120)
> > #define BLKIOOPT                       _IO(0x12,121)
> > #define BLKALIGNOFF                    _IO(0x12,122)
> > #define BLKPBSZGET                     _IO(0x12,123)
> > #define BLKDISCARDZEROES               _IO(0x12,124)
> > #define BLKSECDISCARD                  _IO(0x12,125)
> > #define BLKROTATIONAL                  _IO(0x12,126)
> > #define BLKZEROOUT                     _IO(0x12,127)
> > 
> > #define FIBMAP                         _IO(0x00,1)
> > #define FICLONE                        _IOW(0x94, 9, int)
> > #define FIGETBSZ                       _IO(0x00,2)
> 
> With the exception of FICLONE from 2015, all the others here have exited
> in Linux header since 2012. Given that length of time there's no reason
> for us to conditionalize their usage. We want to see failure if they're
> unexpectedly missing from headers.
> 
> I'll prepare a patch to fix all this.

I have a patch series here:

https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg00351.html

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


