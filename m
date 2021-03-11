Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61A33722E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:13:11 +0100 (CET)
Received: from localhost ([::1]:46510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKBi-0001V5-Cl
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKKAB-0000P5-6v
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lKKA8-0000PC-18
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615464690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R5QGBaLoowQUhwx37lPPp4B+Y0kLBA7iDJi4GPKSuw=;
 b=LMVX7wguLFC7mFSn7KnzsSQa6TmSwG4gkS3gOHnj/EOXLcLUX3CQzccPtQvUzVrWpOJNuf
 6yfPTZ+1yRgwsHnohKA/aQslHfhQ2UY9VTRihbPJh8iZjXuW/fsmF8hmExShV4i/ZoR/gJ
 kwDHMeS/1znKy1dFu43a2/qOUoMg2Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-_mQt-ffNOSuBrCiM5Gv5wg-1; Thu, 11 Mar 2021 07:11:28 -0500
X-MC-Unique: _mQt-ffNOSuBrCiM5Gv5wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56014100C618;
 Thu, 11 Mar 2021 12:11:27 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCFC196E3;
 Thu, 11 Mar 2021 12:11:25 +0000 (UTC)
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: Fam Zheng <famforupstream@gmail.com>
References: <20210310141752.5113-1-fam@euphon.net>
 <8aeb8f65-d467-958d-6434-152d758c3d7a@redhat.com>
 <CAGNx5+3HSEFxEhzGicF5n5g53KnZJ=5GxKN_QAhL7cMhj+oKAA@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e69b5979-6ab0-f823-b27a-8592595e2b4f@redhat.com>
Date: Thu, 11 Mar 2021 13:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAGNx5+3HSEFxEhzGicF5n5g53KnZJ=5GxKN_QAhL7cMhj+oKAA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.03.21 17:35, Fam Zheng wrote:
> 
> 
> On Wed, 10 Mar 2021 at 15:02, Max Reitz <mreitz@redhat.com 
> <mailto:mreitz@redhat.com>> wrote:
> 
>     On 10.03.21 15:17, fam@euphon.net <mailto:fam@euphon.net> wrote:
>      > From: Fam Zheng <famzheng@amazon.com <mailto:famzheng@amazon.com>>
>      >
>      > null-co:// has a read-zeroes=off default, when used to in security
>      > analysis, this can cause false positives because the driver doesn't
>      > write to the read buffer.
>      >
>      > null-co:// has the highest possible performance as a block driver, so
>      > let's keep it that way. This patch introduces zero-co:// and
>      > zero-aio://, largely similar with null-*://, but have
>     read-zeroes=on by
>      > default, so it's more suitable in cases than null-co://.
>      >
>      > Signed-off-by: Fam Zheng <fam@euphon.net <mailto:fam@euphon.net>>
>      > ---
>      >   block/null.c | 91
>     ++++++++++++++++++++++++++++++++++++++++++++++++++++
>      >   1 file changed, 91 insertions(+)
> 
>     You’ll also need to make all tests that currently use null-{co,aio} use
>     zero-{co,aio}, because none of those are performance tests (as far as
>     I’m aware), so they all want a block driver that memset()s.
> 
>     (And that’s basically my problem with this approach; nearly everyone
>     who
>     uses null-* right now probably wants read-zeroes=on, so keeping null-*
>     as it is means all of those users should be changed.  Sure, they were
>     all wrong to not specify read-zeroes=on, but that’s how it is.  So
>     while
>     technically this patch is a compatible change, in contrast to the one
>     making read-zeroes=on the default, in practice it absolutely isn’t.)
> 
>     Another problem arising from that is I can imagine that some
>     distributions might have whitelisted null-co because many iotests
>     implicitly depend on it, so the iotests will fail if they aren’t
>     whitelisted.  Now they’d need to whitelist zero-co, too.  Not
>     impossible, sure, but it’s work that would need to be done.
> 
> 
>     My problem is this: We have a not-really problem, namely “valgrind and
>     other tools complain”.  Philippe (and I guess me on IRC) proposed a
>     simple solution whose only drawbacks (AFAIU) are:
> 
>     (1) When writing performance tests, you’ll then need to explicitly
>     specify read-zeroes=off.  Existing performance tests using null-co will
>     probably wrongly show degredation.  (Are there such tests, though?)
> 
>     (2) null will not quite conform to its name, strictly speaking.
>     Frankly, I don’t know who’d care other than people who write those
>     performance tests mentioned in (1).  I know I don’t care.
> 
>     (Technically: (3) We should look into all qemu tests that use
>     null-co to
>     see whether they test performance.  In practice, they don’t, so we
>     don’t
>     need to.)
> 
>     So AFAIU change the read-zeroes default would affect very few
>     people, if
>     any.  I see you care about (2), and you’re the maintainer, so I can’t
>     say that there is no problem.  But it isn’t a practical one.
> 
>     So on the practical front, we get a small benefit (tools won’t
>     complain)
>     for a small drawback (having to remember read-zeroes=off for
>     performance
>     tests).
> 
> 
>     Now you propose a change that has the following drawbacks, as I see it:
> 
>     (1) All non-performance tests using null-* should be changed to zero-*.
>        And those are quite a few tests, so this is some work.
> 
>     (2) Distributions that have whitelisted null-co now should whitelist
>     zero-co, too.
> 
>     Not impossible, but I consider these much bigger practical drawbacks
>     than making read-zeroes=on the default.  It’s actual work that must be
>     done.  To me personally, these drawbacks far outweigh the benefit of
>     having valgrind and other tools not complain.
> 
> 
>     I can’t stop you from updating this patch to do (1), but it doesn’t
>     make
>     sense to me from a practical perspective.  It just doesn’t seem
>     worth it
>     to me.
> 
> 
> But using null-co:// in tests is not wrong, the problem is the caller 
> failed to initialize its buffer.

Then I don’t see why we’d need zero-co://.

Max


