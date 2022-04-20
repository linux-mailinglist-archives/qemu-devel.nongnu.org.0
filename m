Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565050917A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:39:59 +0200 (CEST)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhH7G-0001Mz-LP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhH5o-000058-Se
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhH5l-0008If-04
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650487103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39mdfvJxO7sxCLfj5BxHjk12f5Di9DqmJMpufz1Y7lY=;
 b=W1wzqBtrtV2Z4dnK9UT9x1tbUJM71eKPY2WqV/KTL5QwEtRNyUnZH9X+f9ULrCp+ttwo/r
 yASjBPS6ZkJD3UsKWEUNcxxrW3b0eS+pJnq6CTkm/MSGEia9ASqCXIRgnoAI9dzkeltd+n
 T/G/QWjB7SNQe1VSsb+nyrQCNx5ko14=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-wfIA51jaPzioozypnzzmAw-1; Wed, 20 Apr 2022 16:38:22 -0400
X-MC-Unique: wfIA51jaPzioozypnzzmAw-1
Received: by mail-io1-f72.google.com with SMTP id
 g20-20020a056602151400b00654afb7ec5dso1960144iow.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=39mdfvJxO7sxCLfj5BxHjk12f5Di9DqmJMpufz1Y7lY=;
 b=qPWzBaxemf/26F89d6GLuDwiqMONzFvl7qZICWZJRdTRtm4Oyu8w/sGDHoAmgZ9bSo
 ZWTR4FzpleWnkhB9X7yA031opA9sCb7i0R/uw1Vab0tin8kTPM/ZyHXApXo0O8HfZ/do
 yZpelfAK98bpjjymkrHAqbDN8I2J7OJ4btp2Czd6mAahKH17GnLrHCxk2+0DG56BYxN2
 wQFNVqZqEMgpVydOXBf43BSIj0RkeuToPzin+FfOZJ5IA1xmPT5BWczbiB2J3mFPpi0m
 p11yllAnDXsCq5XaSeOrtuLQUmfj7tqJFT0hlEHBu8ZxZfPK539/92bzkH5a9CCbuO1A
 fkCg==
X-Gm-Message-State: AOAM531ZR1GlHons+Rc+0QMRSXGm6Q59/DRMMx/HiAmFuIyOHbNHLhgk
 iuN/YCyWzoKOFcMsmn3db/hCkRjLf6Irx7zsm4u9uQFvXgijQAXdHJoi+F3BmKdFBxH94X7Gh/B
 UMjgFmsed55nrqjY=
X-Received: by 2002:a5d:8555:0:b0:654:a4c8:35b3 with SMTP id
 b21-20020a5d8555000000b00654a4c835b3mr6658787ios.47.1650487101383; 
 Wed, 20 Apr 2022 13:38:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE9QFo0QN0E+fbVGW68FTTBgBWLuwMv/D4DnkoCJP2120ETc538JGc7zRVah9oehm6X8f4Vg==
X-Received: by 2002:a5d:8555:0:b0:654:a4c8:35b3 with SMTP id
 b21-20020a5d8555000000b00654a4c835b3mr6658779ios.47.1650487101108; 
 Wed, 20 Apr 2022 13:38:21 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056e02158700b002c61541edd7sm11879188ilu.3.2022.04.20.13.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:38:20 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:38:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 18/19] tests: Add postcopy tls recovery migration test
Message-ID: <YmBvOrUZa98gYmav@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-19-peterx@redhat.com>
 <Yl/xl5zrzmX5urH9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/xl5zrzmX5urH9@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:42:15PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:56AM -0400, Peter Xu wrote:
> > It's easy to build this upon the postcopy tls test.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 27 +++++++++++++++++++++------
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 80c4244871..7288c64e97 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1058,15 +1058,15 @@ static void test_postcopy_tls(void)
> >      test_postcopy_common(&args);
> >  }
> >  
> > -static void test_postcopy_recovery(void)
> > +static void test_postcopy_recovery_common(MigrateStart *args)
> >  {
> > -    MigrateStart args = {
> > -        .hide_stderr = true,
> > -    };
> >      QTestState *from, *to;
> >      g_autofree char *uri = NULL;
> >  
> > -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> > +    /* Always hide errors for postcopy recover tests since they're expected */
> > +    args->hide_stderr = true;
> > +
> > +    if (migrate_postcopy_prepare(&from, &to, args)) {
> >          return;
> >      }
> >  
> > @@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
> >      /* Restore the postcopy bandwidth to unlimited */
> >      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
> >  
> > -    migrate_postcopy_complete(from, to, &args);
> > +    migrate_postcopy_complete(from, to, args);
> > +}
> > +
> > +static void test_postcopy_recovery(void)
> > +{
> > +    MigrateStart args = { };
> > +
> > +    test_postcopy_recovery_common(&args);
> > +}
> > +
> > +static void test_postcopy_recovery_tls(void)
> > +{
> > +    MigrateStart args = { .postcopy_tls = true };
> > +
> > +    test_postcopy_recovery_common(&args);
> >  }
> >  
> >  static void test_baddest(void)
> > @@ -2164,6 +2178,7 @@ int main(int argc, char **argv)
> >      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> >  #ifdef CONFIG_GNUTLS
> >      qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
> > +    qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
> 
> It is important that a test name is *NOT* a prefix for another
> test name, as that makes it harder to selectively run individual
> tests with '-p' as it does a pattern match.
> 
> Bearing in mind my comments on the previous patch, I think we want
> 
>     /migration/postcopy/recovery/plain
>     /migration/postcopy/recovery/tls/psk

Again, I can try to take all the suggestions in the next version, but note
that there's no obvious reason on how we name them..  It's:

  /XXX/Feature1
  /XXX/Feature2
  ...

Now what we're saying is: /XXX/Feature1/Feature2 is better than
/XXX/Feature2/Feature1.

And IMHO that really does not matter..

To be strict, for features that are compatible between each other, the only
sane way to write them is:

  /XXX/Feature1
  /XXX/Feature2
  /XXX/Feature1+Feature2

And we make sure there's an ordered list of features.  But then we still
lose the ultimate goal of allowing us to specify one "-p something" to run
any tests that FeatureX is enabled.  Sometimes we simply run a superset or
subset then it's good enough at least to me.

IOW, we may need something better than the path-form (-p) of qtest to
achieve what you wanted, IMHO.

Thanks,

-- 
Peter Xu


