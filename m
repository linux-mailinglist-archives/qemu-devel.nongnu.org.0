Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BC5F2C08
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:38:23 +0200 (CEST)
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGxy-0006Be-Cj
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofGrt-0003Yn-IH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofGrp-00016J-0v
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664785920;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcpRE/i3oFhWtJrGFqdPUnenqVblXPLATCC9lX7v2E8=;
 b=EiTUJK2SJzxNma8D6OiA8xidwzWSVayhQ+tBoVoZBxAYyaK6eYPlPBZ58o2dNRpG1SJki1
 8tQoOEykH14I7KHQNPXu2j3nVWLO17VuNOxx0q4I6ur3EIvEqkRHgcANlmk+voa0tn9OA0
 AFrBFkGLMmP83riXxszKvOEnzKBqmPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-LGZVcIIhO6is_M91G8zieg-1; Mon, 03 Oct 2022 04:31:56 -0400
X-MC-Unique: LGZVcIIhO6is_M91G8zieg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58D9A81172A;
 Mon,  3 Oct 2022 08:31:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623F81402BDA;
 Mon,  3 Oct 2022 08:31:55 +0000 (UTC)
Date: Mon, 3 Oct 2022 09:31:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36
 sys/mount.h
Message-ID: <Yzqd+Pyuy7fC4wj3@redhat.com>
References: <20220802164134.1851910-1-berrange@redhat.com>
 <878rlzkz37.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rlzkz37.fsf@igel.home>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Sat, Oct 01, 2022 at 11:34:20PM +0200, Andreas Schwab wrote:
> On Aug 02 2022, Daniel P. Berrangé wrote:
> 
> > This patch removes linux/fs.h, meaning we have to define
> > various FS_IOC constants that are now unavailable.
> 
> This breaks a lot of ioctl emulations, as it lacks their definitions:

Urgh, very sorry about that. I of course tested it compiled, but not
realizing a bunch of ioctls were #ifdef'd, so we ended up silently
disabling them.

> 
> #define BLKGETSIZE64                   _IOR(0x12,114,size_t)
> #define BLKDISCARD                     _IO(0x12,119)
> #define BLKIOMIN                       _IO(0x12,120)
> #define BLKIOOPT                       _IO(0x12,121)
> #define BLKALIGNOFF                    _IO(0x12,122)
> #define BLKPBSZGET                     _IO(0x12,123)
> #define BLKDISCARDZEROES               _IO(0x12,124)
> #define BLKSECDISCARD                  _IO(0x12,125)
> #define BLKROTATIONAL                  _IO(0x12,126)
> #define BLKZEROOUT                     _IO(0x12,127)
> 
> #define FIBMAP                         _IO(0x00,1)
> #define FICLONE                        _IOW(0x94, 9, int)
> #define FIGETBSZ                       _IO(0x00,2)

With the exception of FICLONE from 2015, all the others here have exited
in Linux header since 2012. Given that length of time there's no reason
for us to conditionalize their usage. We want to see failure if they're
unexpectedly missing from headers.

I'll prepare a patch to fix all this.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


