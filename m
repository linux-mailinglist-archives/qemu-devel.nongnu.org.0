Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA8426873
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:06:19 +0200 (CEST)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnhh-000800-S1
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYndE-0005IA-HB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mYnd6-0006g7-CI
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633690890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3Le4MG/sH+0J17/DA3PcBuwRRGIPbf8AqLU211Mo2w=;
 b=b2zX06XSLR8iAMMwnvw3fplookrect98P60PmSDntFly+9UScu5UMKj7i2NeACAvLtOpVX
 7lHJm7ZQUKAsfB4blmgKydrXkKQj0BXw3Q+3/3AdwyjLWOFI9hdbry4Oz+2nFi8xC/Yqef
 RDOh67joJ9FaKqgJJBGCLqnGDi1VHYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-mIx1sSxjM12PXwYVWlgFNg-1; Fri, 08 Oct 2021 07:01:14 -0400
X-MC-Unique: mIx1sSxjM12PXwYVWlgFNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D06CC802CB5;
 Fri,  8 Oct 2021 11:01:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5205460CCC;
 Fri,  8 Oct 2021 11:01:10 +0000 (UTC)
Date: Fri, 8 Oct 2021 12:01:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Approaches for same-on-same linux-user execve?
Message-ID: <YWAk88MtPDufjzmK@redhat.com>
References: <877deoevj8.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <877deoevj8.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: assad.hashmi@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>, qemu-arm@nongnu.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 03:32:19PM +0100, Alex Bennée wrote:
> Hi,
> 
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
> 
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.
> 
> There are some hacks you can apply at a local level like tweaking the
> elf header of the binaries you want to run under emulation and adjusting
> the binfmt_mask appropriately. This works but is messy and a faff to
> set-up.
> 
> An ideal setup would be would be for the kernel to catch a SIGILL from a
> failing user space program and then to re-launch the process using QEMU
> with the old processes maps and execution state so it could continue.
> However I suspect there are enough moving parts to make this very
> fragile (e.g. what happens to the results of library feature probing
> code). So two approaches I can think of are:
> 
> Trap execve in QEMU linux-user
> ------------------------------
> 
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.
> 
> 
> Add path mask to binfmt_misc
> ----------------------------
> 
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).
> 
> Are there any other approaches you could take? Which do you think has
> the most merit?

Could a new Linux personality flag be useful in combination with a
new flag in binfmt_misc.

eg a flag "E" for binfmt_misc which indicates the rule must only be
applied if the process is execve()d with PER_USE_BINFMT personality
set.

That would let you add a native match rule to binfmt_misc without
it affecting your system initially. To then run native binaries via
qemu-user you just need to set the personality() flag and the only
that  sub-process tree gets redirected.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


