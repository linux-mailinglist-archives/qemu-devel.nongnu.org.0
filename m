Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA514D48B3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:11:48 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJW5-0006z7-5F
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nSIwv-0002ph-FT
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nSIwq-0006Aw-7Y
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646919318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dN5Qc9yBMN0V308xkd4BS+POyEmgMco1WMTUA9iqkws=;
 b=I7j/nlY3BAN0isBd4vMOcWxH3xQiYjz31qRE13AXKIqhZqiEife6zZf2H988L3FIdhI2VP
 eE5sPxttIFTqxh4W96yBBfasUfuKXM4vXAfglYFhts0TcXDcPge9h+Ml22BHfNX1ddF+h/
 oJDGFkoXKUOJpei4O7EgQ1O52K4ESGU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-k1uvak-sOhqA8hhvz6mGEw-1; Thu, 10 Mar 2022 08:35:12 -0500
X-MC-Unique: k1uvak-sOhqA8hhvz6mGEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so4066161wma.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dN5Qc9yBMN0V308xkd4BS+POyEmgMco1WMTUA9iqkws=;
 b=Zx33P9x7yRyxc4Dxm04AcnHno6p/a5KmaUDRbz1vHPqtCDGK38XnHDad3oVMazDhms
 c/CzB0ikjiw+ikUQyxvr0dWsg+T7EOnsmllhhXUx3MGt3WAYTcfeJWR/1yAG7jeICHOg
 M/OiNCg/AncOXidM/DdzhI+14GzSC8Is/yb20J3mdx3r1pSVabAmy6Yd4wLY1qxeXD4Q
 SVvSlOKp8lN5nIi1+q4VNRXlAjwL3pFB5i6XDVUpUuiCDKLZYeNodJAm8uvTp0d8+DR3
 te9lJ8FOtd5RKu/BvoJc0uKUmI8fhf7QpJWY8twomZkz/YbggX91mjxYDE6zybX1TrsI
 I60w==
X-Gm-Message-State: AOAM533fHSecQSYeY7pLanU31ofi83VJyvl5IjOSkX8Bs/OPMm+kghBw
 /Fa4pUGh+Ltk0lnEDqqexCNSkc9Bw/6OP30+TvD1K2EdGbHxVq8X+eqa9C6MS1r5NY4ZhTY0aqX
 Bst24knf+Ad1r3mg=
X-Received: by 2002:adf:d21a:0:b0:1f0:2598:bace with SMTP id
 j26-20020adfd21a000000b001f02598bacemr3519852wrh.132.1646919311256; 
 Thu, 10 Mar 2022 05:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwraG6s9pscPYQjlrk9bqXol0keEVomDfzGECM/3xqvkymWvy+nXO+KxhoYtpTLDgH9YDMLpQ==
X-Received: by 2002:adf:d21a:0:b0:1f0:2598:bace with SMTP id
 j26-20020adfd21a000000b001f02598bacemr3519828wrh.132.1646919310946; 
 Thu, 10 Mar 2022 05:35:10 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b001f1d7822865sm4126459wrb.43.2022.03.10.05.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 05:35:10 -0800 (PST)
Date: Thu, 10 Mar 2022 13:35:08 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
Message-ID: <Yin+jBIHTwkTfaiF@work-vm>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com>
 <YiWra21XaVV9Fdv/@xz-m1.local> <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
 <YinZLBo77h9X9kvX@redhat.com>
 <CAJ+F1CLhb-svEFTR4ehzu69a2PnJn0ZT-=TTRZ_FQedkODAW6g@mail.gmail.com>
 <Yinieq97rqFqfjK4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yinieq97rqFqfjK4@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Mar 10, 2022 at 03:11:08PM +0400, Marc-André Lureau wrote:
> > Hi
> > 
> > On Thu, Mar 10, 2022 at 2:56 PM Daniel P. Berrangé <berrange@redhat.com>
> > wrote:
> > 
> > > On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
> > > > On 07/03/2022 11.06, Daniel P. Berrangé wrote:
> > > > > On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
> > > > > > On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
> > > > > > > The QMP commands have a trailing newline, but the response does
> > > not.
> > > > > > > This makes the qtest logs hard to follow as the next QMP command
> > > > > > > appears in the same line as the previous QMP response.
> > > > > > >
> > > > > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > > > > ---
> > > > > > >   tests/qtest/libqtest.c | 3 +++
> > > > > > >   1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > > > > > > index a85f8a6d05..79c3edcf4b 100644
> > > > > > > --- a/tests/qtest/libqtest.c
> > > > > > > +++ b/tests/qtest/libqtest.c
> > > > > > > @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
> > > > > > >           }
> > > > > > >           json_message_parser_feed(&qmp.parser, &c, 1);
> > > > > > >       }
> > > > > > > +    if (log) {
> > > > > > > +        g_assert(write(2, "\n", 1) == 1);
> > > > > > > +    }
> > > > > >
> > > > > > Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> > > > >
> > > > > You need to check the return value of write() otherwise you'll get a
> > > > > compile failure due to a warn_unused_result attribute annotation.
> > > > >
> > > > > I don't think G_DISABLE_ASSERT is a problem as we're not defining
> > > > > that in our code.
> > > >
> > > > You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT.
> > >
> > > I don't think we need to do that, per existing common practice:
> > >
> > > $ git grep '\bg_assert('  | wc -l
> > > 2912
> > >
> > > $ git grep '\bg_assert(' tests | wc -l
> > > 2296
> > >
> > >
> > On the topic of assert() usage, it would be nice to state clearly when to
> > assert() or g_assert().
> > 
> > g_assert() behaviour is claimed to be more consistent than assert() across
> > platforms.
> > 
> > Also -DNDEBUG is less obvious than -DG_DISABLE_CHECKS or -DG_DISABLE_ASSERT.
> 
> Personally I would make QEMU build error if NDEBUG or G_DISABLE_ASSERT
> was defined, as running with asserts disabled will lead to unsafe code.
> We rely on asserts firing to avoid compromise of QEMU when faced with
> malicious data.

That's not enough; glib allows many of the asserts to be made non-fatal
by a runtime flag, by calling g_test_set_nonfatal_assertions
(see glib commit a6a875068779) - I made checkpatch disallow the use of
these g_assert's in the main code in commit 6e93895

Dave

> > I would remove assert.h and prevent from using it back, but I might be
> > missing some reasons to still use it.
> 
> As a metric we've got massive use of both families of asset
> 
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' | sed -e 's/.*://' | sort | uniq -c
>      17 assert (
>    5196 assert(
>    2913 g_assert(
>      29 g_assert_cmpfloat(
>     662 g_assert_cmphex(
>    1745 g_assert_cmpint(
>      20 g_assert_cmpmem(
>     407 g_assert_cmpstr(
>     756 g_assert_cmpuint(
>     169 g_assert_false(
>     138 g_assert_nonnull(
>      22 g_assert_null(
>     167 g_assert_true(
> 
> But for the tests/ subdir, g_assert family is a clear favourite
> 
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' tests  | sed -e 's/.*://' | sort | uniq -c
>       1 assert (
>     759 assert(
>    2297 g_assert(
>      29 g_assert_cmpfloat(
>     661 g_assert_cmphex(
>    1744 g_assert_cmpint(
>      20 g_assert_cmpmem(
>     406 g_assert_cmpstr(
>     754 g_assert_cmpuint(
>     169 g_assert_false(
>     138 g_assert_nonnull(
>      22 g_assert_null(
>     167 g_assert_true(
> 
> 
> This split doesn't appear to have changed all that much over time.
> Going back to v3.0.0 we see similar ballpark figures
> 
> $ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' | sed -e 's/.*://' | sort | uniq -c 
>      18 assert (
>    3766 assert(
>    2210 g_assert(
>      23 g_assert_cmpfloat(
>     310 g_assert_cmphex(
>    1352 g_assert_cmpint(
>      11 g_assert_cmpmem(
>     324 g_assert_cmpstr(
>     489 g_assert_cmpuint(
>      88 g_assert_false(
>      73 g_assert_nonnull(
>       8 g_assert_null(
>      46 g_assert_true(
> [berrange@catbus qemu]$ git grep -E -o '\b(assert|g_assert(_[a-z]+)?)\b\s?\(' tests | sed -e 's/.*://' | sort | uniq -c 
>     566 assert(
>    1876 g_assert(
>      23 g_assert_cmpfloat(
>     309 g_assert_cmphex(
>    1351 g_assert_cmpint(
>      10 g_assert_cmpmem(
>     323 g_assert_cmpstr(
>     488 g_assert_cmpuint(
>      88 g_assert_false(
>      73 g_assert_nonnull(
>       8 g_assert_null(
>      46 g_assert_true(
> 
> 
> Removing either 'assert' or g_assert would be a massive amount of code
> churn, for no real functional benefit.
> 
> I would personally encourage the more specific g_assert_* variants, to
> improve the error messages, but that's really minor.
> 
> IMHO we can accept that all of the above are valid to use and worry
> about more important things.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


