Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C06FD16E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 23:29:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwUsc-0008Jc-5S; Tue, 09 May 2023 17:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwUsZ-0008JB-GI
 for qemu-devel@nongnu.org; Tue, 09 May 2023 17:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwUsX-0006dh-0f
 for qemu-devel@nongnu.org; Tue, 09 May 2023 17:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683667691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtI7GdfFYTCWiIFK4K3Fvvuh8d3qBWm8LZjNIY9ky2k=;
 b=TiF/coJhUKB8KZc+IMf/OOD7IA8lRYf/NjGKdNnnqrSR+CXTj0pTKGtt4icoHcr1g45VYK
 VsE4GY0jj73Xn/UW52KMqa/egfLKDrqooz5ppKSOHjXgTa7T973/U/WsU5l2w3YAWAU6tY
 6HaE+VyEK0vFLGwYEpASXP57rZ393tw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-XMC2hxAUOPek7R_aAlMCyw-1; Tue, 09 May 2023 17:28:10 -0400
X-MC-Unique: XMC2hxAUOPek7R_aAlMCyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4B0D857DD7
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 21:28:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F562026D25;
 Tue,  9 May 2023 21:28:08 +0000 (UTC)
Date: Tue, 9 May 2023 16:28:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 11/11] cutils: Improve qemu_strtosz handling of fractions
Message-ID: <bmvo2jg7jb2jmr3ezvqa3ymvuldon54cy3gv5mugplwd542rnk@lhr7d5ulqc5d>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-12-eblake@redhat.com>
 <40919a58-2bb2-f156-ddc0-49c117a8f031@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40919a58-2bb2-f156-ddc0-49c117a8f031@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 09, 2023 at 07:54:30PM +0200, Hanna Czenczek wrote:
> On 08.05.23 22:03, Eric Blake wrote:
> > We have several limitations and bugs worth fixing; they are
> > inter-related enough that it is not worth splitting this patch into
> > smaller pieces:
> > 
> > * ".5k" should work to specify 512, just as "0.5k" does
> > * "1.9999k" and "1." + "9"*50 + "k" should both produce the same
> >    result of 2048 after rounding
> > * "1." + "0"*350 + "1B" should not be treated the same as "1.0B";
> >    underflow in the fraction should not be lost
> > * "7.99e99" and "7.99e999" look similar, but our code was doing a
> >    read-out-of-bounds on the latter because it was not expecting ERANGE
> >    due to overflow. While we document that scientific notation is not
> >    supported, and the previous patch actually fixed
> >    qemu_strtod_finite() to no longer return ERANGE overflows, it is
> >    easier to pre-filter than to try and determine after the fact if
> >    strtod() consumed more than we wanted.  Note that this is a
> >    low-level semantic change (when endptr is not NULL, we can now
> >    successfully parse with a scale of 'E' and then report trailing
> >    junk, instead of failing outright with EINVAL); but an earlier
> >    commit already argued that this is not a high-level semantic change
> >    since the only caller passing in a non-NULL endptr also checks that
> >    the tail is whitespace-only.
> > 
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1629
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >   tests/unit/test-cutils.c | 51 +++++++++++------------
> >   util/cutils.c            | 89 ++++++++++++++++++++++++++++------------
> >   2 files changed, 88 insertions(+), 52 deletions(-)
> 
> [...]
> 
> > diff --git a/util/cutils.c b/util/cutils.c
> > index 0e056a27a44..d1dfbc69d16 100644
> > --- a/util/cutils.c
> > +++ b/util/cutils.c
> 
> [...]
> 
> > @@ -246,27 +244,66 @@ static int do_strtosz(const char *nptr, const char **end,
> >               retval = -EINVAL;
> >               goto out;
> >           }
> > -    } else if (*endptr == '.') {
> > +    } else if (*endptr == '.' || (endptr == nptr && strchr(nptr, '.'))) {
> 
> What case is there where we have a fraction but *endptr != '.'?

Bigger context:

result = qemu_strtou64(nptr, &endptr, 10, &val);
// at this point, result is one of:
//  a. 0 - we parsed a decimal string, endptr points to any slop
//  b. -EINVAL - we could not recognize a decimal string: multiple reasons
//  b.1. nptr was NULL (endptr is NULL)
//  b.2. nptr was "" or otherwise whitespace only (endptr is nptr)
//  b.3. the first non-whitespace in nptr was not a sign or digit (endptr is nptr)
//  c. -ERANGE - we saw a decimal string, but it didn't fit in uint64 (endptr is
//    past first digit)
if (retval == -ERANGE || !nptr) {
    // filter out c. and b.1
    goto out;
}
if (retval == 0 && val == 0 && (*endptr == 'x' || *endptr == 'X')) {
    // a, where we must decipher between "0x", "00x", "0xjunk", "0x1", ...
    // not changed by this patch, and where we give -EINVAL if we see any trailing
    // slop like "0x1." or "0x1p"
} else  if (*endptr == '.' || (endptr == nptr && strchr(nptr, '.'))) {
    // The left half is possible in both a. (such as "1.5k")
    // and b.3. when '.' was the first slop byte (such as ".5k")
    // The right half is possible only for b.3 when '.' was not the first slop
    // (needed for covering " +.5k")
    // At this point, b.2. has been filtered out

...

> 
> >           /*
> >            * Input looks like a fraction.  Make sure even 1.k works
> > -         * without fractional digits.  If we see an exponent, treat
> > -         * the entire input as invalid instead.
> > +         * without fractional digits.  strtod tries to treat 'e' as an
> > +         * exponent, but we want to treat it as a scaling suffix;
> > +         * doing this requires modifying a copy of the fraction.
> >            */
> > -        double fraction;
> > +        double fraction = 0.0;
> > 
> > -        f = endptr;
> > -        retval = qemu_strtod_finite(f, &endptr, &fraction);
> > -        if (retval) {
> > +        if (retval == 0 && *endptr == '.' && !isdigit(endptr[1])) {
> > +            /* If we got here, we parsed at least one digit already. */
> >               endptr++;

The 'retval == 0' check could equally be written 'endptr > nptr' (the
two are synonymous based on the conditions of a.; we cannot get here
under b.3); the '*endptr == '.' is necessary so that if nptr=="1junk",
we use 'j' as the scaling suffix rather than trying to skip past a
non-present '.'; and the '!isdigit(endptr[1])' is necessary so that
"1.k" does not result in us trying to call strtod(".k") which would
fail for an unexpected EINVAL.  Basically, this branch handles all
cases where we've seen at least one digit and the only thing between
digits and a possible scaling suffix is a single '.', so strtod is not
worth using.

> > -        } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
> > -            endptr = nptr;
> > -            retval = -EINVAL;
> > -            goto out;
> >           } else {
> > -            /* Extract into a 64-bit fixed-point fraction. */
> > +            char *e;
> > +            const char *tail;
> > +            g_autofree char *copy = g_strdup(endptr);
> > +

If we get into this branch, we could be in condition a. (such as
"1.1k" where endptr is ".1k") or in b.3 (such as ".5k" where endptr is
".5k", but also thinks like " junk." where endptr is " junk." or even
".k").  But we've already proven we don't need to worry about "0x1p1"
(filtered above in the hex code), and at this point we strip all
exponents (if endptr is ".9e999", copy is ".9")...

> > +            e = strchr(copy, 'e');
> > +            if (e) {
> > +                *e = '\0';
> > +            }
> > +            e = strchr(copy, 'E');
> > +            if (e) {
> > +                *e = '\0';
> > +            }
> > +            /*
> > +             * If this is a floating point, we are guaranteed that '.'
> > +             * appears before any possible digits in copy.  If it is
> > +             * not a floating point, strtod will fail.  Either way,
> > +             * there is now no exponent in copy, so if it parses, we
> > +             * know 0.0 <= abs(result) <= 1.0 (after rounding), and
> > +             * ERANGE is only possible on underflow which is okay.
> > +             */
> > +            retval = qemu_strtod_finite(copy, &tail, &fraction);

...so that by the time we do try qemu_strtod_finite(), it is either a
valid floating point fraction with at least one digit and no exponent
and possibly some slop (such as ".5k" or " +.5" - will produce retval
= 0 or -ERANGE for underflow, based on the previous patch to
qemu_strtod_finite) or complete junk with retval = -EINVAL where there
was a '.' but other characters appeared first (such as " junk.") or
where there are no digits but also no scaling suffix (such as ". ";
hmm, looks like I could get more coverage if I add ". " and ".k" to my
unit tests in v2).

> > +            endptr += tail - copy;
> > +        }
> > +
> > +        /* Extract into a 64-bit fixed-point fraction. */
> > +        if (fraction == 1.0) {
> > +            if (val == UINT64_MAX) {
> > +                retval = -ERANGE;
> > +                goto out;
> > +            }
> > +            val++;
> > +        } else if (retval == -ERANGE) {
> > +            /* See comments above about underflow */
> > +            valf = 1;
> 
> It doesn’t really matter because even an EiB is just 2^60, and so 1 EiB *
> 2^-64 (the resolution of our fractional part) is still less than 1, but:
> 
> DBL_MIN * 0x1p64 is 2^-(1022-64) == 2^-958, i.e. much less than 1, so I’d
> set valf to 0 here.
> 
> (If you put “.00000000000000000001” into this, there won’t be an underflow,
> but the value is so small that valf ends up 0.  But if you put `.$(yes 0 |
> head -n 307 | tr -d '\n')1` into this, there will be an underflow, setting
> valf to 1, even though the value is smaller.)

Oh, good point.  I was trying to say that "1.000B" (for any amount of
zeroes) is okay (all zeroes in the fraction is needless typing but not
an ambiguous value regardless of rounding), while "1.0001B" (for any
amount of zeroes) is not (you can't request a non-zero fraction
without a scale larger than bytes, even if the fraction you do request
rounds to zero at your chosen scale).  But you have come up with a
counter-case where I didn't quite achieve that.

But I think the solution to that is not to treat underflow as valf =
0, but rather to alter this snippet:

-            valf = (uint64_t)(fraction * 0x1p64);
+            /*
+             * If fraction was non-zero, add slop small enough that it doesn't
+             * impact rounding, but does let us reject "1..00000000000000000001B".
+             */
+            valf = (uint64_t)(fraction * 0x1p64) | !fraction;

so that between the ERANGE branch and this slop, valf is guaranteed
non-zero if fraction contained any non-zero digits.  It looks like I
need to add yet another unit test before posting v2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


