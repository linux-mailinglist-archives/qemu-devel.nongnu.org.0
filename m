Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94F6FCAC1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:07:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPrK-0002rw-88; Tue, 09 May 2023 12:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPrA-0002qg-MS
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPr3-00027Y-QE
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683648380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z21JnC5BY0M1XmAdkG4ocetEWXODhmZVA7aYnM60GLA=;
 b=KXGQgK/9pJb39CwwYOVHxn7plohhsGSzRRn9YCx3J2uNES16DM9Tc5NWcOsCF2VjlMgRbh
 S3dJipznP158hNFzAVrH/D8EwqrM39+sssJGctCD1YoMtHdlW1qdBgxxJ8HrCqbyHL8ImI
 viBQnvw8IXbj1QY1GAo7/M1SFeeoIxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-eZgpyoHjN0CquD8Pwk4NYQ-1; Tue, 09 May 2023 12:06:18 -0400
X-MC-Unique: eZgpyoHjN0CquD8Pwk4NYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A180180C8C4
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 16:06:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59C53492C13;
 Tue,  9 May 2023 16:06:18 +0000 (UTC)
Date: Tue, 9 May 2023 11:06:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Message-ID: <oap6l2hud3ag5ooguea6r6kpujtghpbii7iqjktjnt4lyjrdvq@5wwwwy27aj3d>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-7-eblake@redhat.com>
 <a9216c0d-86df-410d-d32e-6d6fd65acc30@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9216c0d-86df-410d-d32e-6d6fd65acc30@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 09, 2023 at 02:31:08PM +0200, Hanna Czenczek wrote:
> On 08.05.23 22:03, Eric Blake wrote:
> > Add some more strings that the user might send our way.  In
> > particular, some of these additions include FIXME comments showing
> > where our parser doesn't quite behave the way we want.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >   tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 215 insertions(+), 11 deletions(-)
> 
> I wonder: The plan is to have "1.5e+1k" be parsed as "1.5e" + endptr ==
> "+1k"; but "0x1p1" is not parsed at all (could be "0x1" + "p1"). Is that
> fully intentional?

Pre-series: "1.5e+1k" is parsed as "1" ".5e+1" "k", no slop
Post-series: "1.5e+1k" is parsed as "1" ".5" "e", slop "+1k"

If you call qemu_strtosz(,NULL,), both versions still give EINVAL
error (pre-patch: we detected an exponent in the middle portion of the
parse, which is not allowed; post-series: we detect slop, which is not
allowed).  If you call qemu_strtosz(,&endptr), the pre-patch version
fails with EINVAL but the new code succeeds.  But of all the callers,
the only one that passed non-NULL endptr did it's own check that *slop
is only whitespace ("+1k" fails that check), so the end result is that
at the high level, we reject "1.5e+1k" from the user, but the
rejection is now at a different point in the call stack.  The reason I
made the change is that it was less code to guarantee that the
internal qemu_strtod_finite() is passed a string that cannot possibly
contain an exponent, than to blindly call qemu_strtod_finite() on an
arbitrary suffix and then check after the fact on whether an exponent
was actually consumed as part of that parse.

For "0x1p1", the parse is "0x1" plus slop "p1" (unchanged by the
series).  This is rejected with EINVAL (the moment you have hex, we
insist on no suffix or slop, regardless of endptr being NULL or not).
I could have changed it similar to how I changed "1.5e+1k" to allow
the parse at the qemu_strtosz layer and then detect the slop at the
caller, but that was more lines of code and I didn't feel like it was
worth it.

Either way, the unit tests accurately cover the difference in parse
behavior, and I tried to make the documentation (by patch 11/11) be
consistent as well.  But since this is why we have a review process,
I'm open to feedback if you think I need to tweak which parse styles
we should be favoring.

> 
> (Similarly, "1.1.k" is also not parsed at all, but the problem there is not
> just two decimal points, but also that "1.1" would be an invalid size in
> itself, so it really shouldn’t be parsed at all.)

"1.1k" is a valid (if unusual) size.  This particular test addition
did not happen to improve coverage for my final code, but given that
qemu_strtod_finite(".1.k") would stop parsing after the ".1" and still
be pointing at '.', and our read-out-of-bounds was caused by assuming
that qemu_strtod_finite() failures leave *endptr == '.' (which was
invalidated for ".9e999" failing with ERANGE), it didn't hurt to add
the coverage.

> 
> I don’t think it matters to users, really, but I still wonder.

If any of our callers had actually done something like: "size %llx
followed by junk %s" with the parsed value and the junk string, then
it would matter.  But since all of the callers either passed in NULL
endptr (and got EINVAL before even knowing how much of the string was
parsed) or insisted that the junk be whitespace only, and did not
print details about the parsed value before reporting such errors,
you're right that I don't see this as mattering to end users.  But it
took me quite a bit of audit time to convince myself of that.

> > @@ -2875,6 +3056,20 @@ static void test_qemu_strtosz_trailing(void)
> >       err = qemu_strtosz(str, NULL, &res);
> >       g_assert_cmpint(err, ==, -EINVAL);
> >       g_assert_cmphex(res, ==, 0xbaadf00d);
> > +
> > +    /* FIXME overflow in fraction is buggy */
> > +    str = "1.5E999";
> > +    endptr = NULL;
> > +    res = 0xbaadf00d;
> > +    err = qemu_strtosz(str, &endptr, &res);
> > +    g_assert_cmpint(err, ==, 0);
> > +    g_assert_cmpuint(res, ==, EiB /* FIXME EiB * 1.5 */);
> > +    g_assert(endptr == str + 9 /* FIXME + 4 */);
> 
> This is “correct” (i.e. it’s the value we’ll get right now, which is the
> wrong one), but gcc complains that the array index is out of bounds
> (well...), which breaks the build.

Huh - wonder what build settings you are using that I wasn't for
seeing that warning - but it makes total sense that 'str + 9' would
trigger a build failure if we don't pad str with enough '\0' to keep
things in bounds.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


