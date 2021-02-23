Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE8322F62
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:14:26 +0100 (CET)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbGT-0004UI-90
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbFO-0003xl-Lx
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:13:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbFM-0000yR-6h
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100394;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcgydohWU8EZ5dNqkvW5WRZ4AOS74VMFKVy431vWr90=;
 b=VV+YS75IWLrWO9XwQpReBaof1SmZM+G4flrjQRzrpAUcNa4dDMz4aFQURQri/WkV/uDQY5
 SArVy6ib9nNY6BNiwoP78vXHN9jf6hjmNFdcCajyFtyNSy3BtAQZEbFpvLzA4BGM1fJxcY
 U6vtw/5gHOM/19EyGGZVN2JheTG4UuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-mT4UfS9AO2m3Lt0hPMC_SQ-1; Tue, 23 Feb 2021 12:13:07 -0500
X-MC-Unique: mT4UfS9AO2m3Lt0hPMC_SQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF9818E8761;
 Tue, 23 Feb 2021 17:13:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B8B5C3FD;
 Tue, 23 Feb 2021 17:13:04 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:13:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/4] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <YDU3nca4MSZ9zChE@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-3-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-3-eblake@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, rjones@redhat.com, tao3.xu@intel.com, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 02:44:36PM -0600, Eric Blake wrote:
> We have multiple clients of qemu_strtosz (qemu-io, the opts visitor,
> the keyval visitor), and it gets annoying that edge-case testing is
> impacted by implicit rounding to 53 bits of precision due to parsing
> with strtod().  As an example posted by Rich Jones:
>  $ nbdkit memory $(( 2**63 - 2**30 )) --run \
>    'build/qemu-io -f raw "$uri" -c "w -P 3 $(( 2**63 - 2**30 - 512 )) 512" '
>  write failed: Input/output error
> 
> because 9223372035781033472 got rounded to 0x7fffffffc0000000 which is
> out of bounds.
> 
> It is also worth noting that our existing parser, by virtue of using
> strtod(), accepts decimal AND hex numbers, even though test-cutils
> previously lacked any coverage of the latter until the previous patch.
> We do have existing clients that expect a hex parse to work (for
> example, iotest 33 using qemu-io -c "write -P 0xa 0x200 0x400"), but
> strtod() parses "08" as 8 rather than as an invalid octal number, so
> we know there are no clients that depend on octal.  Our use of
> strtod() also means that "0x1.8k" would actually parse as 1536 (the
> fraction is 8/16), rather than 1843 (if the fraction were 8/10); but
> as this was not covered in the testsuite, I have no qualms forbidding
> hex fractions as invalid, so this patch declares that the use of
> fractions is only supported with decimal input, and enhances the
> testsuite to document that.
> 
> Our previous use of strtod() meant that -1 parsed as a negative; now
> that we parse with strtoull(), negative values can wrap around modulo
> 2^64, so we have to explicitly check whether the user passed in a '-';
> and make it consistent to also reject '-0'.  This has the minor effect
> of treating negative values as EINVAL (with no change to endptr)
> rather than ERANGE (with endptr advanced to what was parsed), visible
> in the updated iotest output.
> 
> We also had no testsuite coverage of "1.1e0k", which happened to parse
> under strtod() but is unlikely to occur in practice; as long as we are
> making things more robust, it is easy enough to reject the use of
> exponents in a strtod parse.
> 
> The fix is done by breaking the parse into an integer prefix (no loss
> in precision), rejecting negative values (since we can no longer rely
> on strtod() to do that), determining if a decimal or hexadecimal parse
> was intended (with the new restriction that a fractional hex parse is
> not allowed), and where appropriate, using a floating point fractional
> parse (where we also scan to reject use of exponents in the fraction).
> The bulk of the patch is then updates to the testsuite to match our
> new precision, as well as adding new cases we reject (whether they
> were rejected or inadvertently accepted before).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> Note that this approach differs from what has been attempted in the
> past; see the thread starting at
> https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00852.html
> That approach tried to parse both as strtoull and strtod and take
> whichever was longer, but that was harder to document.
> ---
>  tests/test-cutils.c              | 74 ++++++++++----------------
>  tests/test-keyval.c              | 35 +++++++++----
>  tests/test-qemu-opts.c           | 33 ++++++++----
>  util/cutils.c                    | 90 ++++++++++++++++++++++++--------
>  tests/qemu-iotests/049.out       | 14 +++--
>  tests/qemu-iotests/178.out.qcow2 |  3 +-
>  tests/qemu-iotests/178.out.raw   |  3 +-
>  7 files changed, 158 insertions(+), 94 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


