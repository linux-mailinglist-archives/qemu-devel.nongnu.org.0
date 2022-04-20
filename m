Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2B509158
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:22:48 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGqd-0001jF-4k
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGjf-0006nZ-Jg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhGjd-0004dJ-2J
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650485732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WdD20cVPg3dN9/1JR8CCs9G4E01N/r4vv2vIfNp7v0=;
 b=BEq+N31bg9GRj/O5wD6PF0V9LSWeKa0VCprkMQ+XaByWVUvZ4WOh6rWbrPHs6XYgGasmRb
 Q6rlVxAMnF+A0vQcsI5m8VIak4kIZ21AnWcTKXoq8WVPjyHunVLDVpNQW1Fd/mJ9sIoN1X
 ksytPaoLnpyVWiVaaTCfW7t0pAymFnA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-WxO9tBy2O-q3Qjyh6IhLhQ-1; Wed, 20 Apr 2022 16:15:31 -0400
X-MC-Unique: WxO9tBy2O-q3Qjyh6IhLhQ-1
Received: by mail-il1-f200.google.com with SMTP id
 m11-20020a056e020deb00b002cbde7e7dcfso1541410ilj.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9WdD20cVPg3dN9/1JR8CCs9G4E01N/r4vv2vIfNp7v0=;
 b=T9PbRAhZkAnQU9cMT4pP5KUcf7u5IY01naoHdiG2BZeDv76REohZWBHC+XQO0HlzI0
 sCrQo1kBGCRKNVkNikWa/5ru5SBujLPUfKlbIm+lcKbLh2ZiLJZJ16RPSIK+YpvmWOBc
 9OCuntcgoiFJez1qwpH+PJG3ptcf4TQeH1VLogh0o8D2LphEP+vk8616uTLXS20L+ksM
 xdYvK7M5FnCTUh5IM+Wa4tCRWxQk46h+nUas0ZC1lkAExAO6eurkFjojb3r5LLTxfyMS
 PhKwbicjj2KBP26t+tMZlAB7F0I1qcWXiK9BjystLYzx/6c2SzU/LGmGPu3OxAOivygK
 6aQw==
X-Gm-Message-State: AOAM533KoW6NtE/dGliVOt8/O0v7Jc2LmNWPgyzFPVtff/HftbVK8ZXB
 xCN5OPW3VT1qorl8nM56bwTaykqXkZRJ3TBLo6RwcSy5tafvFD8D+n+AnBPxrsRMLlY2g7BgCAA
 o8Dx3G+HSuvcfP9A=
X-Received: by 2002:a05:6602:26cb:b0:648:f391:c37d with SMTP id
 g11-20020a05660226cb00b00648f391c37dmr9936475ioo.198.1650485730562; 
 Wed, 20 Apr 2022 13:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgaOu3iBLI/JGBa1tvbTVahJ/0+E2g+xZjoZtlTkkWMTxQZTO7MoTyG8cvpUUSjLW5Q/62jQ==
X-Received: by 2002:a05:6602:26cb:b0:648:f391:c37d with SMTP id
 g11-20020a05660226cb00b00648f391c37dmr9936466ioo.198.1650485730321; 
 Wed, 20 Apr 2022 13:15:30 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a056e02104a00b002cbd0996ce8sm10818087ilj.16.2022.04.20.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:15:29 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:15:28 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 17/19] tests: Add postcopy tls migration test
Message-ID: <YmBp4ITzQw12tTor@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-18-peterx@redhat.com>
 <Yl/w2wRDIm5frmaU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/w2wRDIm5frmaU@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Apr 20, 2022 at 12:39:07PM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:55AM -0400, Peter Xu wrote:
> > We just added TLS tests for precopy but not postcopy.  Add the
> > corresponding test for vanilla postcopy.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 43 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index d9f444ea14..80c4244871 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -481,6 +481,10 @@ typedef struct {
> >      bool only_target;
> >      /* Use dirty ring if true; dirty logging otherwise */
> >      bool use_dirty_ring;
> > +    /* Whether use TLS channels for postcopy test? */
> > +    bool postcopy_tls;
> > +    /* Used only if postcopy_tls==true, to cache the data object */
> > +    void *postcopy_tls_data;
> >      const char *opts_source;
> >      const char *opts_target;
> >  } MigrateStart;
> > @@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
> >          return -1;
> >      }
> >  
> > +    if (args->postcopy_tls) {
> > +        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
> > +    }
> > +
> >      migrate_set_capability(from, "postcopy-ram", true);
> >      migrate_set_capability(to, "postcopy-ram", true);
> >      migrate_set_capability(to, "postcopy-blocktime", true);
> > @@ -1004,7 +1012,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
> >      return 0;
> >  }
> >  
> > -static void migrate_postcopy_complete(QTestState *from, QTestState *to)
> > +static void migrate_postcopy_complete(QTestState *from, QTestState *to,
> > +                                      MigrateStart *args)
> >  {
> >      wait_for_migration_complete(from);
> >  
> > @@ -1015,19 +1024,38 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
> >          read_blocktime(to);
> >      }
> >  
> > +    if (args->postcopy_tls) {
> > +        assert(args->postcopy_tls_data);
> > +        test_migrate_tls_psk_finish(from, to, args->postcopy_tls_data);
> > +        args->postcopy_tls_data = NULL;
> > +    }
> > +
> >      test_migrate_end(from, to, true);
> >  }
> >  
> > -static void test_postcopy(void)
> > +static void test_postcopy_common(MigrateStart *args)
> >  {
> > -    MigrateStart args = {};
> >      QTestState *from, *to;
> >  
> > -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> > +    if (migrate_postcopy_prepare(&from, &to, args)) {
> >          return;
> >      }
> >      migrate_postcopy_start(from, to);
> > -    migrate_postcopy_complete(from, to);
> > +    migrate_postcopy_complete(from, to, args);
> > +}
> > +
> > +static void test_postcopy(void)
> > +{
> > +    MigrateStart args = { };
> > +
> > +    test_postcopy_common(&args);
> > +}
> > +
> > +static void test_postcopy_tls(void)
> 
> test_postcopy_tls_psk() 
> 
> > +{
> > +    MigrateStart args = { .postcopy_tls = true };
> > +
> > +    test_postcopy_common(&args);
> >  }
> >  
> >  static void test_postcopy_recovery(void)
> > @@ -1089,7 +1117,7 @@ static void test_postcopy_recovery(void)
> >      /* Restore the postcopy bandwidth to unlimited */
> >      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
> >  
> > -    migrate_postcopy_complete(from, to);
> > +    migrate_postcopy_complete(from, to, &args);
> >  }
> >  
> >  static void test_baddest(void)
> > @@ -2134,6 +2162,9 @@ int main(int argc, char **argv)
> >  
> >      qtest_add_func("/migration/postcopy/unix", test_postcopy);
> 
> Rename this to /migration/postcopy/unix/plain
> 
> >      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> > +#ifdef CONFIG_GNUTLS
> > +    qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
> 
> And this to /migration/postcopy/unix/tls/psk  so we match the precopy test
> naming convention I started

I can do all the renamings.

But note that I explicitly didn't add psk just because for postcopy it's
the same to use either psk or other ways to do encryption - we're testing
the tls channel paths not any specific type of TLS channels.

I wanted to use that trick to make sure people are aware we don't really
need other types of tls tests for postcopy, because the tls-type specific
code paths should have been covered in tls specific precopy tests.

I guess I'll add a comment showing that instead of using a vague naming.

Thanks,

-- 
Peter Xu


