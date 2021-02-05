Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD7310C7F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:17:33 +0100 (CET)
Received: from localhost ([::1]:51456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81vQ-00044V-9G
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81ti-0003UY-EF
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81tQ-0006On-QO
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612534528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ljw2wLhpi9oYkBLh7xIF1ZgGHNv8l9odOL91z775Gio=;
 b=i4VOzPDoomZyv/yYtXWhswzLQzDBma5Wpgk+3jlmvsdDmTer8kjDpTtynEF/5j32aXJ/eS
 3XHrF8EaJW02X1qlzupsHG1HarwCZEiAKDk16yn7tJ5XBxGbCJ6u5kDS6jOBrY/x+ICdfV
 oOwEkab1svZ/ftk61Mjr0QYUX2lB6bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-X4B9pbt9MxK7XYGTKbmEJQ-1; Fri, 05 Feb 2021 09:15:26 -0500
X-MC-Unique: X4B9pbt9MxK7XYGTKbmEJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A6F0192AB7A;
 Fri,  5 Feb 2021 14:15:25 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 517A65DEF9;
 Fri,  5 Feb 2021 14:15:24 +0000 (UTC)
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <20210205102805.GA30079@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <03923751-7a8e-2e64-6eab-b49c604d4590@redhat.com>
Date: Fri, 5 Feb 2021 08:15:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205102805.GA30079@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 berrange@redhat.com, qemu-block@nongnu.org, tao3.xu@intel.com,
 qemu-devel@nongnu.org, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:28 AM, Richard W.M. Jones wrote:
> On Thu, Feb 04, 2021 at 01:07:06PM -0600, Eric Blake wrote:
>> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
>> the keyval visitor), and it gets annoying that edge-case testing is
>> impacted by implicit rounding to 53 bits of precision due to parsing
>> with strtod().  As an example posted by Rich Jones:
>>  $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>>    'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>>  write failed: Input/output error
>>
>> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
>> out of bounds.
>>
>> It is also worth noting that our existing parser, by virtue of using
>> strtod(), accepts decimal AND hex numbers, even though test-cutils
>> previously lacked any coverage of the latter.  We do have existing
>> clients that expect a hex parse to work (for example, iotest 33 using
>> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
>> rather than as an invalid octal number, so we know there are no
>> clients that depend on octal.  Our use of strtod() also means that
>> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
>> than 1843 (if the fraction were 8/10); but as this was not covered in
>> the testsuite, I have no qualms forbidding hex fractions as invalid,
>> so this patch declares that the use of fractions is only supported
>> with decimal input, and enhances the testsuite to document that.
>>
>> Our previous use of strtod() meant that -1 parsed as a negative; now
>> that we parse with strtoull(), negative values can wrap around module
> 
> ^^ modulo
> 
> The patch looked fine to me although Vladimir found some problems
> which I didn't spot.  I have a question: What happens with leading or
> trailing whitespace?  Is that ignored, rejected or impossible?

leading whitespace: ignored (because both strtod() pre-patch, and now
strtoull() post-patch, do so for free).  And that is why we have to
memchr() (and not strchr(), as pointed out by Vladimir) for a '-' sign,
because merely checking *nptr=='-' would be wrong in the presence of
leading space.

trailing whitespace: treated the same as any other trailing garbage
(again, what strtod() and strtoull() give you for free).  If endptr was
non-NULL, then *endptr now points to that trailing space; if it was
NULL, the parse is rejected because of the trailing garbage.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


