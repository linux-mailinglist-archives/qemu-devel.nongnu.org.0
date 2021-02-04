Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC330FBB5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:40:44 +0100 (CET)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jYZ-0004t1-MU
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7iYM-00009G-GS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7iYF-0004RB-4E
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KgUq3yI+TT9pqb/LiChxlmhxDG4V2GKo2YRQAXMAxvk=;
 b=h0Nwfu/x6wCxFkQ8dKKeP37Io+/nhpgwZGFywwaKbIKfsWpda7DpF7+3P18AnjwjZt6mHc
 Bn/nxqpR5GZfXsQmT177eFkTB+q0PgxWcChetI58rdX3HMtoG9mIoYglIXr9O0YUNEs9xe
 nz86M3oVju9Orxs9y5m7osTPeH0sPzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-sFP3i82WPhiOJkXyrDykoA-1; Thu, 04 Feb 2021 12:36:10 -0500
X-MC-Unique: sFP3i82WPhiOJkXyrDykoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22B2B8D9733;
 Thu,  4 Feb 2021 17:35:43 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC8645D6D7;
 Thu,  4 Feb 2021 17:35:38 +0000 (UTC)
Date: Thu, 4 Feb 2021 17:35:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210204173536.GM3039@work-vm>
References: <20210204150208.367837-1-stefanha@redhat.com>
 <161245534386.30579.2853899336444305293@c667a6b167f6>
MIME-Version: 1.0
In-Reply-To: <161245534386.30579.2853899336444305293@c667a6b167f6>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, berrange@redhat.com, slp@redhat.com, groug@kaod.org,
 ppandit@redhat.com, virtio-fs@redhat.com, alex@alxu.ca, stefanha@redhat.com,
 lersek@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* no-reply@patchew.org (no-reply@patchew.org) wrote:
> Patchew URL: https://patchew.org/QEMU/20210204150208.367837-1-stefanha@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210204150208.367837-1-stefanha@redhat.com
> Subject: [PATCH v5 0/3] virtiofsd: prevent opening of special files (CVE-2020-35517)
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
>    db754f8..1ba089f  master     -> master
>  - [tag update]      patchew/20210204014509.882821-1-richard.henderson@linaro.org -> patchew/20210204014509.882821-1-richard.henderson@linaro.org
>  - [tag update]      patchew/20210204124834.774401-1-berrange@redhat.com -> patchew/20210204124834.774401-1-berrange@redhat.com
>  * [new tag]         patchew/20210204150208.367837-1-stefanha@redhat.com -> patchew/20210204150208.367837-1-stefanha@redhat.com
>  * [new tag]         patchew/20210204153925.2030606-1-Jason@zx2c4.com -> patchew/20210204153925.2030606-1-Jason@zx2c4.com
> Switched to a new branch 'test'
> b5bb803 virtiofsd: prevent opening of special files (CVE-2020-35517)
> 0d88a79 virtiofsd: optionally return inode pointer from lo_do_lookup()
> be6aa23 virtiofsd: extract lo_do_open() from lo_open()
> 
> === OUTPUT BEGIN ===
> 1/3 Checking commit be6aa2319875 (virtiofsd: extract lo_do_open() from lo_open())
> ERROR: return of an errno should typically be -ve (return -ENOMEM)
> #70: FILE: tools/virtiofsd/passthrough_ll.c:1674:
> +        return ENOMEM;

This is intended

> total: 1 errors, 0 warnings, 114 lines checked
> 
> Patch 1/3 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 2/3 Checking commit 0d88a7925a83 (virtiofsd: optionally return inode pointer from lo_do_lookup())
> 3/3 Checking commit b5bb8039eb3c (virtiofsd: prevent opening of special files (CVE-2020-35517))
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210204150208.367837-1-stefanha@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


