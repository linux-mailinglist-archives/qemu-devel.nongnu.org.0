Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF951213492
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 09:01:53 +0200 (CEST)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrFh9-0007yh-Cu
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 03:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrFfi-0007Jk-4H
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 02:59:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59800
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jrFfg-0000qZ-L1
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 02:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593759580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/GkJIY29fUKqgwOdTIkfrFhzud7jQdbqtraGtS19KJc=;
 b=WJ8A3i66kYUv3FDhR6lNSePAtfoAQvcLSsjGb//KXA3zLLTslCqPAG4u9/CGMrrNWv6QAz
 XkyRSJWCp/J6vO2x0YQB7kxIEyP5BG8goHGD6P7FW7aR85YAN2v6TXFGncqBFo7pKkr4Qe
 Lmz4mABfEauAEKn/Q7tn8BUruzBmdXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-RlN0ldO_Ni-T3o7fObWajw-1; Fri, 03 Jul 2020 02:59:35 -0400
X-MC-Unique: RlN0ldO_Ni-T3o7fObWajw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27C19185B3B7;
 Fri,  3 Jul 2020 06:59:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E00273FC7;
 Fri,  3 Jul 2020 06:59:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AB6B1138648; Fri,  3 Jul 2020 08:59:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 35/44] error: Eliminate error_propagate() with
 Coccinelle, part 2
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-36-armbru@redhat.com>
 <cb3ec58e-8eb3-510b-92a3-71f6e19151bf@redhat.com>
Date: Fri, 03 Jul 2020 08:59:32 +0200
In-Reply-To: <cb3ec58e-8eb3-510b-92a3-71f6e19151bf@redhat.com> (Eric Blake's
 message of "Thu, 2 Jul 2020 13:06:54 -0500")
Message-ID: <87blkxxewb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 02:53:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 7/2/20 10:49 AM, Markus Armbruster wrote:
>> When all we do with an Error we receive into a local variable is
>> propagating to somewhere else, we can just as well receive it there
>> right away.  The previous commit did that with a Coccinelle script I
>> consider fairly trustworthy.  This commit uses the same script with
>> the matching of return taken out, i.e. we convert
>>
>>      if (!foo(..., &err)) {
>> 	...
>> 	error_propagate(errp, err);
>> 	...
>>      }
>>
>> to
>>
>>      if (!foo(..., errp)) {
>> 	...
>> 	...
>>      }
>>
>> This is unsound: @err could still be read between afterwards.  I don't
>> know how to express "no read of @err without an intervening write" in
>> Coccinelle.  Instead, I manually double-checked for uses of @err.
>>
>> Suboptimal line breaks tweaked manually.  qdev_realize() simplified
>> further to placate scripts/checkpatch.pl.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   block.c              |  6 ++----
>>   block/blkdebug.c     |  7 ++-----
>>   block/blklogwrites.c |  3 +--
>>   block/blkverify.c    |  3 +--
>>   block/crypto.c       |  4 +---
>>   block/file-posix.c   |  6 ++----
>>   block/file-win32.c   |  6 ++----
>>   block/gluster.c      |  4 +---
>>   block/iscsi.c        |  3 +--
>>   block/nbd.c          |  8 ++------
>>   block/qcow2.c        | 13 ++++---------
>>   block/raw-format.c   |  4 +---
>>   block/sheepdog.c     |  8 ++------
>>   block/ssh.c          |  4 +---
>>   block/throttle.c     |  4 +---
>>   block/vmdk.c         |  4 +---
>>   block/vpc.c          |  3 +--
>>   block/vvfat.c        |  3 +--
>>   blockdev.c           |  3 +--
>>   hw/intc/xics.c       |  4 +---
>>   hw/vfio/pci.c        |  3 +--
>>   net/tap.c            |  3 +--
>>   qom/object.c         |  4 +---
>>   23 files changed, 32 insertions(+), 78 deletions(-)
>
> Small enough to review each instance.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

I tried *really* hard to make part 1's script powerful and safe, to give
the unsafe / manual parts (this commit and next) a chance of meaningful
review.  Thanks for providing it!


