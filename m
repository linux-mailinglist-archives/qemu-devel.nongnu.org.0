Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF930CAA7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:58:52 +0100 (CET)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70t1-0003th-OT
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70rN-0002PH-4x
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70rJ-0006co-Es
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612292223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kflt5NPltAOjCgxbZaliNy29kQqmzXd5pecOGchoezA=;
 b=PjQs9vwCMvbB5e4/wPVH5ZVAeA7ihNDK4m+Za4MjG0dM77TqbHnuIzv/BMXlM1P+lQj1Rj
 mVSfuPHI1mucODB5h+nUXZJbNYgdYK5cf4ue4gpSk3Uj+u98pxE7+jREQPE4/QV8J4k+xA
 1aVU2FhF8oeUeXvfY3l2Fx0qGWXZXQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-JGYubfHrNIScC6jbTsqZoA-1; Tue, 02 Feb 2021 13:56:58 -0500
X-MC-Unique: JGYubfHrNIScC6jbTsqZoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECAE51800D41;
 Tue,  2 Feb 2021 18:56:56 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA9310016FC;
 Tue,  2 Feb 2021 18:56:55 +0000 (UTC)
Subject: Re: [PATCH v10 12/12] migration: introduce
 snapshot-{save,load,delete} QMP commands
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210202154138.246464-1-berrange@redhat.com>
 <20210202154138.246464-13-berrange@redhat.com>
 <02126b54-f7eb-5ad7-b7f0-b66e60b26b50@redhat.com>
 <13b1d60e-ac6a-20c1-47e4-94c8292812b3@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cb8c5bbb-5007-d113-fa73-1529ad6249c0@redhat.com>
Date: Tue, 2 Feb 2021 12:56:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <13b1d60e-ac6a-20c1-47e4-94c8292812b3@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 12:43 PM, Vladimir Sementsov-Ogievskiy wrote:

>> Not this patch's fault: I find the name tests/qemu-iotests/tests/name to
>> be rather long and a bit repetitive; maybe we want to rename the
>> directory structure to something simpler, like:
>>
>> tests/iotests/name
>>
>> (that is, move the named tests into a sibling directory of
>> qemu-iotests/check, rather than a subdirectory).
> 
> Still, I think splitting test files from library (check, testenv,
> common.rc, etc) is a good thing.
> 
> I remember someone suggested to rename qemu-iotests to just io..
> 
> so we can have tests/io/tests/name
> 
> or may be, what about
> 
> tests/io/name
> 
> and
> 
> tests/io/lib/{check,testenv,common.rc,etc}

I like those.

> 
>> And maybe rename
>> qemu-iotests/check to something that requires less typing.  Oh, and
>> while I'm asking for rainbows and ponies, being able to run check from
>> the same directory where I run make, instead of having to change
>> directories, would be nice.  But as I said, that's a wish list for a
>> separate series.
> 
> 
> I run check from any directory with my script:
> 
> # cat /work/scripts/check
> #!/bin/bash
> 
> root=$(git rev-parse --show-toplevel) || exit
> 
> dir="$root/build/tests/qemu-iotests"
> check="$dir/check"
> 
> test -f "$check" || { echo "Can't find '$check'. Is it a Qemu git?";
> exit 1; }
> 
> cd "$dir"
> ./check $@

Useful idea, thanks.  I'm not sure whether we want it in git, but I
already have local hacks (symlinks and such) so that for most of my
development, I can run 'make' and then './qemu-nbd' in the same
directory where I run 'git update', even though I actually configured
within a './build' subdirectory, and I only have to 'cd build-clang;
make' or similar when testing an alternative environment.  This script
is another such hack I'd stick in my top-level directory to maintain my
personal guise of building locally.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


