Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4822D57D6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:02:51 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knImg-0001Uc-F8
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knIOS-0003vp-OW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knIOQ-0004Cq-34
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607593064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mf/adgfKFeKile1tLkT3J87Ko/YPeOsRRDsDiAafcVM=;
 b=BU+o1++ofT3uG90pJjULHUKybR9Pl8itY0VxmxcP7Gf3eXufMQ4rWJjK7D5rLuRoItQqyv
 tkix+KsvAlQB14RZ7okWSBIVTz/+MPT2uKh49XwtunM2duop05nhtx048pNs3CeFTGQLxM
 dzlc5alB3YjTyUwNe/Ue5/ZRVb6yM3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-WxiQZ0cXOTmi0VYyfzZIBw-1; Thu, 10 Dec 2020 04:37:40 -0500
X-MC-Unique: WxiQZ0cXOTmi0VYyfzZIBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 231D68145E0;
 Thu, 10 Dec 2020 09:37:39 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B612C5B4CE;
 Thu, 10 Dec 2020 09:37:31 +0000 (UTC)
Message-ID: <1617ff7ba621c1c356fe165fe46c2df97ca0d42e.camel@redhat.com>
Subject: Re: [PATCH v2 0/5] SCSI: fix transfer limits for SCSI passthrough
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 10 Dec 2020 11:37:30 +0200
In-Reply-To: <29a0d8e6-53a8-e3ab-5bef-c978d79696bf@redhat.com>
References: <160752262015.25926.10971176014472074579@600e7e483b3a>
 <29a0d8e6-53a8-e3ab-5bef-c978d79696bf@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, pl@kamp.de, tom.ty89@gmail.com,
 ronniesahlberg@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-10 at 01:09 +0100, Paolo Bonzini wrote:
> On 09/12/20 15:03, no-reply@patchew.org wrote:
> > Patchew URL: https://patchew.org/QEMU/20201209135355.561745-1-mlevitsk@redhat.com/
> > 
> > 
> > 
> > Hi,
> > 
> > This series seems to have some coding style problems. See output below for
> > more information:
> > 
> > Type: series
> > Message-id: 20201209135355.561745-1-mlevitsk@redhat.com
> > Subject: [PATCH v2 0/5] SCSI: fix transfer limits for SCSI passthrough
> > 
> > === TEST SCRIPT BEGIN ===
> > #!/bin/bash
> > git rev-parse base > /dev/null || exit 0
> > git config --local diff.renamelimit 0
> > git config --local diff.renames True
> > git config --local diff.algorithm histogram
> > ./scripts/checkpatch.pl --mailback base..
> > === TEST SCRIPT END ===
> > 
> > Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> >  From https://github.com/patchew-project/qemu
> >   * [new tag]         patchew/20201209135355.561745-1-mlevitsk@redhat.com -> patchew/20201209135355.561745-1-mlevitsk@redhat.com
> > Switched to a new branch 'test'
> > 77c9000 block/scsi: correctly emulate the VPD block limits page
> > 61f49e1 block: use blk_get_max_ioctl_transfer for SCSI passthrough
> > 35c66d6 block: add max_ioctl_transfer to BlockLimits
> > 08ba263 file-posix: add sg_get_max_segments that actually works with sg
> > e9fd749 file-posix: split hdev_refresh_limits from raw_refresh_limits
> > 
> > === OUTPUT BEGIN ===
> > 1/5 Checking commit e9fd7498060c (file-posix: split hdev_refresh_limits from raw_refresh_limits)
> > 2/5 Checking commit 08ba263f565d (file-posix: add sg_get_max_segments that actually works with sg)
> > 3/5 Checking commit 35c66d636d83 (block: add max_ioctl_transfer to BlockLimits)
> > 4/5 Checking commit 61f49e1c953b (block: use blk_get_max_ioctl_transfer for SCSI passthrough)
> > 5/5 Checking commit 77c9000b7c30 (block/scsi: correctly emulate the VPD block limits page)
> > ERROR: braces {} are necessary for all arms of this statement
> > #39: FILE: hw/scsi/scsi-generic.c:204:
> > +            if (len < r->buflen)
> > [...]
> > 
> > total: 1 errors, 0 warnings, 28 lines checked
> > 
> > Patch 5/5 has style problems, please review.  If any of these errors
> > are false positives report them to the maintainer, see
> > CHECKPATCH in MAINTAINERS.
> > 
> > === OUTPUT END ===
> > 
> > Test command exited with code: 1
> > 
> > 
> > The full log is available at
> > http://patchew.org/logs/20201209135355.561745-1-mlevitsk@redhat.com/testing.checkpatch/?type=message.
> > ---
> > Email generated automatically by Patchew [https://patchew.org/].
> > Please send your feedback to patchew-devel@redhat.com
> > 
> 
> Time for v3?

I am waiting a bit to see if anything else pops up,
to avoid doing too much noise.


Best regards,
	Maxim Levitsky
> 
> Paolo
> 



