Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E1334101
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:02:58 +0100 (CET)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0MS-0007N8-0t
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK0Jg-0005av-08
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:00:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK0Jd-0000p3-6N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615388400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQRYBYPmYyvH3fSFve6U8Sp1o+myTSKbUExe828sWis=;
 b=Jd1ENTFlhFzRmngcORLhAwpnu0zFvlJQKJHxMI8QF6WAX9ARgNPqEDD80v89fRM6kji3wT
 s2KnGc6KSdOlCIMAfjzeDCdakSGbg7hJJw4Ldh0PodqMe8mWkmZ1xm31EKACNz7jvPtpaR
 Wq62xrzPIORFX7k1KUncqLpPNheN/9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-gHMQHPg1MO2nE9oYNdriOA-1; Wed, 10 Mar 2021 09:59:57 -0500
X-MC-Unique: gHMQHPg1MO2nE9oYNdriOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF99D801817;
 Wed, 10 Mar 2021 14:59:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-151.ams2.redhat.com
 [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0671D5886A;
 Wed, 10 Mar 2021 14:59:54 +0000 (UTC)
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: fam@euphon.net, qemu-devel@nongnu.org
References: <20210310141752.5113-1-fam@euphon.net>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8aeb8f65-d467-958d-6434-152d758c3d7a@redhat.com>
Date: Wed, 10 Mar 2021 15:59:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310141752.5113-1-fam@euphon.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.03.21 15:17, fam@euphon.net wrote:
> From: Fam Zheng <famzheng@amazon.com>
> 
> null-co:// has a read-zeroes=off default, when used to in security
> analysis, this can cause false positives because the driver doesn't
> write to the read buffer.
> 
> null-co:// has the highest possible performance as a block driver, so
> let's keep it that way. This patch introduces zero-co:// and
> zero-aio://, largely similar with null-*://, but have read-zeroes=on by
> default, so it's more suitable in cases than null-co://.
> 
> Signed-off-by: Fam Zheng <fam@euphon.net>
> ---
>   block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)

You’ll also need to make all tests that currently use null-{co,aio} use 
zero-{co,aio}, because none of those are performance tests (as far as 
I’m aware), so they all want a block driver that memset()s.

(And that’s basically my problem with this approach; nearly everyone who 
uses null-* right now probably wants read-zeroes=on, so keeping null-* 
as it is means all of those users should be changed.  Sure, they were 
all wrong to not specify read-zeroes=on, but that’s how it is.  So while 
technically this patch is a compatible change, in contrast to the one 
making read-zeroes=on the default, in practice it absolutely isn’t.)

Another problem arising from that is I can imagine that some 
distributions might have whitelisted null-co because many iotests 
implicitly depend on it, so the iotests will fail if they aren’t 
whitelisted.  Now they’d need to whitelist zero-co, too.  Not 
impossible, sure, but it’s work that would need to be done.


My problem is this: We have a not-really problem, namely “valgrind and 
other tools complain”.  Philippe (and I guess me on IRC) proposed a 
simple solution whose only drawbacks (AFAIU) are:

(1) When writing performance tests, you’ll then need to explicitly 
specify read-zeroes=off.  Existing performance tests using null-co will 
probably wrongly show degredation.  (Are there such tests, though?)

(2) null will not quite conform to its name, strictly speaking. 
Frankly, I don’t know who’d care other than people who write those 
performance tests mentioned in (1).  I know I don’t care.

(Technically: (3) We should look into all qemu tests that use null-co to 
see whether they test performance.  In practice, they don’t, so we don’t 
need to.)

So AFAIU change the read-zeroes default would affect very few people, if 
any.  I see you care about (2), and you’re the maintainer, so I can’t 
say that there is no problem.  But it isn’t a practical one.

So on the practical front, we get a small benefit (tools won’t complain) 
for a small drawback (having to remember read-zeroes=off for performance 
tests).


Now you propose a change that has the following drawbacks, as I see it:

(1) All non-performance tests using null-* should be changed to zero-*. 
  And those are quite a few tests, so this is some work.

(2) Distributions that have whitelisted null-co now should whitelist 
zero-co, too.

Not impossible, but I consider these much bigger practical drawbacks 
than making read-zeroes=on the default.  It’s actual work that must be 
done.  To me personally, these drawbacks far outweigh the benefit of 
having valgrind and other tools not complain.


I can’t stop you from updating this patch to do (1), but it doesn’t make 
sense to me from a practical perspective.  It just doesn’t seem worth it 
to me.

Max


