Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD273109C9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:06:51 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yws-0003tg-Ac
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7ysd-0001Go-9O
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:02:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7ysZ-0003Sy-4H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UXXPjhCjUEGj24mtyxcWLaMD2aYKKB1oh8Tn7hzU4go=;
 b=GX8Teb6d/W3ibQ1YjFFLsxT/vPLjGwdIkFagGapww2o+4Fk1/g8aGBK8eN0hFqrnCXZA0k
 ZLswhKs6s+6fQjSuWpxPxwDgw4KEAVkvEcs3MGtZPdEGqo+GsltpaAyWXzgKZ4FdpEtnZQ
 vTVP5C1fKsy9PbBaUic+los6o/9SYyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-BJKvWlKqObSTQt1RPqemrA-1; Fri, 05 Feb 2021 06:02:12 -0500
X-MC-Unique: BJKvWlKqObSTQt1RPqemrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDD261966321;
 Fri,  5 Feb 2021 11:02:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8464160C15;
 Fri,  5 Feb 2021 11:02:09 +0000 (UTC)
Date: Fri, 5 Feb 2021 11:02:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <20210205110206.GD908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210204190708.1306296-2-eblake@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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

On Thu, Feb 04, 2021 at 01:07:06PM -0600, Eric Blake wrote:
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
> previously lacked any coverage of the latter.  We do have existing
> clients that expect a hex parse to work (for example, iotest 33 using
> qemu-io -c "write -P 0xa 0x200 0x400"), but strtod() parses "08" as 8
> rather than as an invalid octal number, so we know there are no
> clients that depend on octal.  Our use of strtod() also means that
> "0x1.8k" would actually parse as 1536 (the fraction is 8/16), rather
> than 1843 (if the fraction were 8/10); but as this was not covered in
> the testsuite, I have no qualms forbidding hex fractions as invalid,
> so this patch declares that the use of fractions is only supported
> with decimal input, and enhances the testsuite to document that.
> 
> Our previous use of strtod() meant that -1 parsed as a negative; now
> that we parse with strtoull(), negative values can wrap around module
> 2^64, so we have to explicitly check whether the user passed in a '-'.
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
> were rejected or inadvertenly accepted before).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 


> diff --git a/util/cutils.c b/util/cutils.c
> index 0b5073b33012..0234763bd70b 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -241,10 +241,21 @@ static int64_t suffix_mul(char suffix, int64_t unit)
>  }
> 
>  /*
> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
> - * other error.
> + * Convert size string to bytes.
> + *
> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
> + * T/t for TB, with scaling based on @unit, and with @default_suffix
> + * implied if no explicit suffix was given.
> + *
> + * The end pointer will be returned in *end, if not NULL.  If there is
> + * no fraction, the input can be decimal or hexadecimal; if there is a
> + * fraction, then the input must be decimal and there must be a suffix
> + * (possibly by @default_suffix) larger than Byte, and the fractional
> + * portion may suffer from precision loss or rounding.  The input must
> + * be positive.

Even though the test suite gives some illustrations, I think we should
document here the patterns we're intending to support. IIUC, we aim for

[quote]
The size parsing supports the following syntaxes

 - 12345   - decimal, bytes
 - 12345{bBkKmMgGtT} - decimal, scaled bytes
 - 12345.678 - fractional decimal, bytes
 - 12345.678{bBkKmMgGtT} - fractional decimal, scaled bytes
 - 0x7FEE  - hex, bytes

The following are intentionally not supported

 - octal
 - fractional hex
 - floating point exponents
[/quote]

> + *
> + * Return -ERANGE on overflow (with *@end advanced), and -EINVAL on
> + * other error (with *@end left unchanged).
>   */

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


