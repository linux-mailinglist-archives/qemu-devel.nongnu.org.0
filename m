Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951730F494
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:08:24 +0100 (CET)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fJ1-0004KS-I4
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7fGK-0000h1-Tk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7fGA-0001o9-2N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjnuLebdgg68OAmcm3Nf9aujnlfMkNHqiDq51bsdBXM=;
 b=jAc4OQiGX1xsjuAHa6sZQ2yZiDGmhHf1DCxxUAXL7MJDMj3gH9TRQZNQutpaRjUnZpFbp9
 HFErIZDtpkSnXgluNJPzSoOZXTzFQr4i+1dEpFWZvj+BbI9eAHcgZyXQxujiKknVJZlZZ4
 YYn3uToleEwBXpCJm6I1pLSk9X8AHM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-NwTt3W1JMtaTTnOE6iRvKw-1; Thu, 04 Feb 2021 09:05:19 -0500
X-MC-Unique: NwTt3W1JMtaTTnOE6iRvKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83DA918CAE09;
 Thu,  4 Feb 2021 14:05:18 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A21BA7046F;
 Thu,  4 Feb 2021 14:05:14 +0000 (UTC)
To: "Richard W.M. Jones" <rjones@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com> <20210107105611.GB2673@redhat.com>
 <20210107122005.GC2673@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Message-ID: <61dbae79-7643-5464-7be8-3c067bd5527a@redhat.com>
Date: Thu, 4 Feb 2021 08:05:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210107122005.GC2673@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 6:20 AM, Richard W.M. Jones wrote:

>> Actually that's not the only problem.  It appears that we're unable to
>> read or write the last sector of this disk:
>>
>> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -r -f raw "$uri" -c "r -v $(( 2**63 - 2**30 - 512 )) 512" ' 
>> read failed: Input/output error
>>
>> $ nbdkit memory $(( 2**63 - 2**30 )) --run 'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" ' 
>> write failed: Input/output error
>>
>> You can play around with the constants.  I found it's possible to read
>> and write the non-aligned 512 bytes starting at 2^63-2^30-513.  Could
>> be a fencepost error somewhere in qemu?
> 
> Actually this is a pre-existing bug in qemu.
> 
> What happens is qemu-io calls qemu_strtosz("9223372035781033472")
> which returns 0x7fffffffc0000000 and no error.  That answer is plain
> flat out wrong.  The reason for that is qemu_strtosz uses floating
> point for the calculation(!) so is limited to 53 bits of precision and
> silently truncates.

I'm working a patch for that soon.  It was easy to fix things to parse
with full 64 bits of precision while still allowing a fractional bump
(for things like 1.5M), but harder to chase down all the spots in the
testsuite that are impacted by our parser now being more accurate.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


