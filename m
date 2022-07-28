Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173D584033
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:41:54 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3lv-00083k-35
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3eU-000108-4n
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3eQ-0003QT-P6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDeZRzB7kiyB1aueSJHYUq3cBYP03Ow2XF95M0TPAHE=;
 b=jAnkVWePufNWVWBNZS+DmxZAsfLx9to9UcXuCZG5OKQV+/PUL87UxN2oY2g7kepKpApeKd
 PjqXl8d+N1imY6UjALiF5ms4HamY7NLkZSmfGFLaUx96qNM1bJKHWoyk9SYfUW6QHKSAXv
 kW7oKF6b0Vz1kjmacX70gye8Ar2qaxc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-WqBRsJUeP3mhwrCzlkRrCA-1; Thu, 28 Jul 2022 09:34:02 -0400
X-MC-Unique: WqBRsJUeP3mhwrCzlkRrCA-1
Received: by mail-qv1-f72.google.com with SMTP id
 f8-20020a056214076800b0047421aaa4c0so1324646qvz.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wDeZRzB7kiyB1aueSJHYUq3cBYP03Ow2XF95M0TPAHE=;
 b=XzzlE3qNQX/31Y8lv5SXbwV7ZGmPs8bsaQSWvWHkx7HUKSuyE9JQP17gTguCGrdOBe
 BRIJcYCbZRcQ5/SkovH41v7apAqFP6NP4xKC4y4WX4qYaiYQRmKzYbwv5MkqaVSOTYQ/
 EpOy7mhHZIBVSXCHc5cv+ISc1eZuqD39I2/wjpVEo4eGA4AU143Aaxx5ubtMW+LUx+ue
 YylUgKoI69NOAY6rUDngBBP7chRI4GDLla8anxMMKnVRA0IkodiG0caoUcUSKAZVDzWg
 Pq0h+4Ss6aTvspYQ7t0DJLQ8yFx9fWrhYgwhD3LW7t3+l2OcB86KiEjo2l43peSR627d
 +wJw==
X-Gm-Message-State: AJIora8NvGL9i0l1M9itZNcgAox4WB73B3IYu5Vma1Cu5JY1ye2x1++R
 wp+nViRSKeN73kXHRbmLY1j1ayQejtJYgrY2M3AazZjHNvVwwQs6SBw4kDlZJAG0n1ywN3XG5Q8
 mdtdQnkbyCy6DY8A=
X-Received: by 2002:a37:97c1:0:b0:6b5:8968:6a97 with SMTP id
 z184-20020a3797c1000000b006b589686a97mr20586882qkd.108.1659015241558; 
 Thu, 28 Jul 2022 06:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scd5nPHdqjEjq9hIoPOZ42tYSpdjg0VxuTcK+xAc0SjYh8kXk2dFbLWTqijAUyj4tzh+8g2Q==
X-Received: by 2002:a37:97c1:0:b0:6b5:8968:6a97 with SMTP id
 z184-20020a3797c1000000b006b589686a97mr20586854qkd.108.1659015241151; 
 Thu, 28 Jul 2022 06:34:01 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05620a241500b006b249cc505fsm562478qkn.82.2022.07.28.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:34:00 -0700 (PDT)
Date: Thu, 28 Jul 2022 09:33:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 1/2] migration-test: Use migrate_ensure_converge() for
 auto-converge
Message-ID: <YuKQRlS0VBSX4iHr@xz-m1.local>
References: <20220722145654.81103-1-peterx@redhat.com>
 <20220722145654.81103-2-peterx@redhat.com>
 <75f92280-97b9-1ace-be12-ebc2993d2066@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <75f92280-97b9-1ace-be12-ebc2993d2066@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 03:04:27PM +0200, Thomas Huth wrote:
> On 22/07/2022 16.56, Peter Xu wrote:
> > Thomas reported that auto-converge test will timeout on MacOS CI gatings.
> > Use the migrate_ensure_converge() helper too in the auto-converge as when
> > Daniel reworked the other test cases.
> > 
> > Since both max_bandwidth / downtime_limit will not be used for converge
> > calculations, make it simple by removing the remaining check, then we can
> > completely remove both variables altogether, since migrate_ensure_converge
> > is used the remaining check won't make much sense anyway.
> > 
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   tests/qtest/migration-test.c | 17 +----------------
> >   1 file changed, 1 insertion(+), 16 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 71595a74fd..dd50aa600c 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1776,14 +1776,6 @@ static void test_migrate_auto_converge(void)
> >        * so we need to decrease a bandwidth.
> >        */
> >       const int64_t init_pct = 5, inc_pct = 50, max_pct = 95;
> > -    const int64_t max_bandwidth = 400000000; /* ~400Mb/s */
> > -    const int64_t downtime_limit = 250; /* 250ms */
> > -    /*
> > -     * We migrate through unix-socket (> 500Mb/s).
> > -     * Thus, expected migration speed ~= bandwidth limit (< 500Mb/s).
> > -     * So, we can predict expected_threshold
> > -     */
> > -    const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
> >       if (test_migrate_start(&from, &to, uri, &args)) {
> >           return;
> > @@ -1818,8 +1810,7 @@ static void test_migrate_auto_converge(void)
> >       /* The first percentage of throttling should be equal to init_pct */
> >       g_assert_cmpint(percentage, ==, init_pct);
> >       /* Now, when we tested that throttling works, let it converge */
> > -    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
> > -    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
> > +    migrate_ensure_converge(from);
> >       /*
> >        * Wait for pre-switchover status to check last throttle percentage
> > @@ -1830,11 +1821,6 @@ static void test_migrate_auto_converge(void)
> >       /* The final percentage of throttling shouldn't be greater than max_pct */
> >       percentage = read_migrate_property_int(from, "cpu-throttle-percentage");
> >       g_assert_cmpint(percentage, <=, max_pct);
> > -
> > -    remaining = read_ram_property_int(from, "remaining");
> > -    g_assert_cmpint(remaining, <,
> > -                    (expected_threshold + expected_threshold / 100));
> > -
> 
> I'm getting this on FreeBSD:
> 
> ../tests/qtest/migration-test.c:1771:13: error: unused variable 'remaining'
> [-Werror,-Wunused-variable]
>     int64_t remaining, percentage;
>             ^
> 1 error generated.
> 
> Did you try this with -Werror ?

Thanks for catching that, I'll start to do so and repost.

-- 
Peter Xu


