Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A56FCA89
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:50:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPbO-0003Nw-Ss; Tue, 09 May 2023 11:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPbM-0003Nn-G9
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pwPbK-0007AL-Sl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLtdbCBLqqOw3rVHNJTCxLup5q/fO5YwKuIgd8rhJYg=;
 b=U5ICnEhp9Hbp4tgoGK/pSeuoBbeE4jN/GxghvvgI1zO9lJ2G/ayOhBkRjnvRtMy88feaXW
 NK2UlA0gFW4gl5mKQM1SSGjY8HRxPwKLiGC73dWZa0dcSL2DyzbY5oE/3gDvHAy9plj1ej
 YI4EXESuHHw7o4k+zpEkMt4dv9b1QBU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-4p0IdwneMBmS3kEp-kxigA-1; Tue, 09 May 2023 11:50:04 -0400
X-MC-Unique: 4p0IdwneMBmS3kEp-kxigA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B9EE3C17C61
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 15:50:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65EDE63F5F;
 Tue,  9 May 2023 15:50:03 +0000 (UTC)
Date: Tue, 9 May 2023 10:50:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Message-ID: <5wbzj4uo7wmgtzdlkj2emljhgho6vz5tt2v4u7zb7r6nzpkrne@cnb536ywhnkx>
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-7-eblake@redhat.com>
 <e2aca275-8a19-b0b7-8939-aefd29ce270b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2aca275-8a19-b0b7-8939-aefd29ce270b@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Tue, May 09, 2023 at 05:15:04PM +0200, Hanna Czenczek wrote:
> On 08.05.23 22:03, Eric Blake wrote:
> > Add some more strings that the user might send our way.  In
> > particular, some of these additions include FIXME comments showing
> > where our parser doesn't quite behave the way we want.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >   tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 215 insertions(+), 11 deletions(-)
> > 
> > diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
> > index afae2ee5331..9fa6fb042e8 100644
> > --- a/tests/unit/test-cutils.c
> > +++ b/tests/unit/test-cutils.c
> 
> [...]
> 
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
> > +
> > +    res = 0xbaadf00d;
> > +    err = qemu_strtosz(str, NULL, &res);
> > +    g_assert_cmpint(err, ==, -EINVAL);
> > +    g_assert_cmphex(res, ==, 0xbaadf00d);
> 
> Got it now!
> 
> Our problem is that `endptr` is beyond the end of the string, precisely as
> gcc complains.  The data there is undefined, and depending on the value in
> the g_assert_cmpuint() (which is converted to strings for the potential
> error message) it sometimes is "endptr == str + 9" (the one in the
> g_assert()) and sometimes isn’t.
> 
> If it is "endptr == str + 9", then the 'e' is taken as a suffix, which makes
> `res == EiB`, and `endptr == "ndptr == str + 9"`.
> 
> If it isn’t, well, it might be anything, so there often is no valid suffix,
> making `res == 1`.
> 
> So the solution is to set `str = "1.5E999\0\0"`, so we don’t get out of
> bounds and know exactly what will be parsed.  Then, at str[8] there is no
> valid suffix (it’s \0), so `res == 1` and `endptr == str + 8`.  This will
> then lead to the qemu_strtosz(str, NULL, &res) below succeed, because, well,
> it’s a valid number.  I suppose it failed on your end because the
> out-of-bounds `str[9]` value was not '\0'.
> 
> That was a fun debugging session.

Wow, yeah, that's a mess.  The very test proving that we have a
read-out-of-bounds bug is super-sensitive to what is at that location.
Your hack of passing in extra \0 is awesome; I'll fold that in whether
we need a v2 for other reasons, or in-place if we can take the rest of
this series as-is.  It all goes away at the end of the series,
anyways, once the out-of-bounds read is fixed.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


