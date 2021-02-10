Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DD31617D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:50:19 +0100 (CET)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9lCT-0007Vs-Ku
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9lBK-0006hF-K0
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9lBG-0001Pr-6o
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612946940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cUd7GxspA9qZQ/xZ52ElFd0r+CIa33Wh/LVNj7PBNc=;
 b=Z2Zy7OWlPVqYcPpMrK/pQoNe0SDRyrt4kUWwiuzfIE9nQYUVou1+HfNbiIcnw9GszC82ck
 MVHWcDPDpeZoRDpEMPpabpCkf/boOj+HNavIm8eAtA11xP3vhnmjf7F4/rlQYNuMMAkdBh
 jwWbnCGSJvAW05TltSGL5OesynmYI2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-Ndn834dkNOGgPoncevgWqQ-1; Wed, 10 Feb 2021 03:48:57 -0500
X-MC-Unique: Ndn834dkNOGgPoncevgWqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8C5814303;
 Wed, 10 Feb 2021 08:48:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 218F019C66;
 Wed, 10 Feb 2021 08:48:54 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix unsupported_imgopts for refcount_bits
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210209182745.501662-1-mreitz@redhat.com>
 <e1bdf41c-eddb-214f-1f4a-9fbfc477b73f@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3dfd32c3-3834-bdc6-de19-dfab9c3f56cc@redhat.com>
Date: Wed, 10 Feb 2021 09:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e1bdf41c-eddb-214f-1f4a-9fbfc477b73f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.02.21 19:49, Eric Blake wrote:
> On 2/9/21 12:27 PM, Max Reitz wrote:
>> Many _unsupported_imgopts lines for refcount_bits values use something
>> like "refcount_bits=1[^0-9]" to forbid everything but "refcount_bits=1"
>> (e.g. "refcount_bits=16" is allowed).
>>
>> That does not work when $IMGOPTS does not have any entry past the
>> refcount_bits option, which now became apparent with the "check" script
>> rewrite.
>>
>> Use \b instead of [^0-9] to check for a word boundary, which is what we
>> really want.
> 
> \b is a Linux-ism (that is, glibc supports it, but BSD libc does not).
> 
> https://mail-index.netbsd.org/tech-userlevel/2012/12/02/msg006954.html

:(

>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>> Reproducible with:
>> $ ./check -qcow2 -o refcount_bits=1
>> (The tests touched here should be skipped)
>>
>> I don't know whether \b is portable.  I hope it is.
>> (This is why I CC-ed you, Eric.)
> 
> No, it's not portable.  \> and [[:>:]] are other spellings for the same
> task, equally non-portable.
> 
>>
>> Then again, it appears that nobody ever runs the iotests with
>> refcount_bits=1 but me, and I do that on Linux.  So even if it isn't
>> portable, it shouldn't be an issue in practice... O:)
> 
> What exactly is failing?  Is it merely a case of our python script
> running the regex against "${unsupported_imgopts}" instead of
> "${unsupported_imgsopts} " with an added trailing space to guarantee
> that we have something to match against?

A bit of a hack, but one that indeed works, yes.  Thanks!

Max


