Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879D530FD49
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:52:21 +0100 (CET)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kfs-0007aC-Ja
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7kUQ-0002xW-CR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7kUN-0006DZ-0C
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612467625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCISnYEw1lBcrt1lUzzawz6S50OwTEDXUq2xi1WHWXM=;
 b=gjh9rBIbUUxw3LRkzHCot8rNIwrIN+T5+5PYG+Bo7IuV0uIUn6TOYniRBspV3CNXueZSd7
 y088hS7+Qm3cVf/s6V18MXGI3GqHj6HNRai/yOM3mJUIgMPQPcPxsMQ6dBaCTO+o4jAdxc
 6+Yujt0/kl8ia9Cb/43L+WOhNk84v6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-lrFmOSAROZSFOINktlN1xg-1; Thu, 04 Feb 2021 14:40:23 -0500
X-MC-Unique: lrFmOSAROZSFOINktlN1xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23FE51015C9C;
 Thu,  4 Feb 2021 19:40:22 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F4B5DA2D;
 Thu,  4 Feb 2021 19:40:10 +0000 (UTC)
Date: Thu, 4 Feb 2021 19:39:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 0/5] virtiofs queue: Security fix
Message-ID: <20210204193947.GP3039@work-vm>
References: <20210204183439.546918-1-dgilbert@redhat.com>
 <161246668791.30579.7760426288477164722@c667a6b167f6>
MIME-Version: 1.0
In-Reply-To: <161246668791.30579.7760426288477164722@c667a6b167f6>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: virtio-fs@redhat.com, groug@kaod.org, stefanha@redhat.com,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* no-reply@patchew.org (no-reply@patchew.org) wrote:
> Patchew URL: https://patchew.org/QEMU/20210204183439.546918-1-dgilbert@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210204183439.546918-1-dgilbert@redhat.com
> Subject: [PULL 0/5] virtiofs queue: Security fix
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20210204183439.546918-1-dgilbert@redhat.com -> patchew/20210204183439.546918-1-dgilbert@redhat.com
> Switched to a new branch 'test'
> cc58a0c virtiofsd: Add restart_syscall to the seccomp whitelist
> bc881ed virtiofsd: Add _llseek to the seccomp whitelist
> 449b30f virtiofsd: prevent opening of special files (CVE-2020-35517)
> 5da12fe virtiofsd: optionally return inode pointer from lo_do_lookup()
> 3690387 virtiofsd: extract lo_do_open() from lo_open()
> 
> === OUTPUT BEGIN ===
> 1/5 Checking commit 3690387a3bc2 (virtiofsd: extract lo_do_open() from lo_open())
> ERROR: return of an errno should typically be -ve (return -ENOMEM)
> #72: FILE: tools/virtiofsd/passthrough_ll.c:1674:
> +        return ENOMEM;

That's expected and OK.

> total: 1 errors, 0 warnings, 114 lines checked
> 
> Patch 1/5 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 2/5 Checking commit 5da12fe61f50 (virtiofsd: optionally return inode pointer from lo_do_lookup())
> 3/5 Checking commit 449b30fcc7be (virtiofsd: prevent opening of special files (CVE-2020-35517))
> 4/5 Checking commit bc881ed54ee8 (virtiofsd: Add _llseek to the seccomp whitelist)
> 5/5 Checking commit cc58a0c7f1a0 (virtiofsd: Add restart_syscall to the seccomp whitelist)
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210204183439.546918-1-dgilbert@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


