Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D285251FEBE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:49:27 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3lO-0002EJ-N9
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no3Sh-0007NA-8j
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:30:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no3Se-0000oJ-Jx
 for qemu-devel@nongnu.org; Mon, 09 May 2022 09:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652102994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UR4X593eGME8YBS7I7Pk1/lPNecwXNGtGQqyWIvr3DY=;
 b=NiZ2ltSV8q4bokFiJRBrNfYSu3rAPnueMA07dLgIYZo7xgfzLHbFXPA1FwRm2uhoN32CmZ
 eOoID8KdwK2BFbNftuAfdPrd9fhUsN88DMjcHvHxar0SbtmIG/EyL4wCXRXeaBaCbg65rc
 xmHB/XtwPsMYLWNstKyMiI0yw/OXCFw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-YuaaPYjvMKqbObzbKiJY_w-1; Mon, 09 May 2022 09:29:53 -0400
X-MC-Unique: YuaaPYjvMKqbObzbKiJY_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso5765291wrd.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 06:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UR4X593eGME8YBS7I7Pk1/lPNecwXNGtGQqyWIvr3DY=;
 b=P6o3HWesm6ShXXFRdYLtmPMRSPyZsW2cOf0ZwOxnaqeNVtaxZiVwSCWTVxZYO5r2Zk
 jPJ6tAh5Y8b9lMEtmTFB3ckYreppl6sSQvpI/Agr8+dVlVV5xC+P/rYWWdt2lMGDaj2P
 Auiv9vYeo5MyVkVd8d7K/q4iXHqORB9ZpMmwHbI397ORmXTeaGCicnvyTZ/tNlR4ZVvK
 8XcLUL2BUONUfUoY6tYjjRufZ+rh/P82p6GvNUY+g/aIo7/rY9+FZqTf/LcmsoYIDgn6
 CEX1x4ELWQBC8XTI3/mgAAwPJoeNtBCPLyq+XxVXon7aR8CI5tnUTdf9Y8pZ+xmKb2jM
 TBug==
X-Gm-Message-State: AOAM532u5+Lcc4c36UOIp53jRgRo4QyOdj8YGuc7VA2QJbduFQhjc1mQ
 EG+A28YpBo6U1it07xXMkrdoiMlmq+hBtIQO07YidJSFPEYApNTpthhyW0TLp78+kPQBOjUFDmL
 XhWjt0RD1Pb1qQ10=
X-Received: by 2002:a5d:4d8e:0:b0:20a:c54d:242c with SMTP id
 b14-20020a5d4d8e000000b0020ac54d242cmr13793236wru.338.1652102990964; 
 Mon, 09 May 2022 06:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn7GfjiRmlvrnZVqtyRoLEFAu5pX20ScmDHLe6i0AYv2Z6ZLmItPzu68KocmshtFGx7Kctew==
X-Received: by 2002:a5d:4d8e:0:b0:20a:c54d:242c with SMTP id
 b14-20020a5d4d8e000000b0020ac54d242cmr13793212wru.338.1652102990690; 
 Mon, 09 May 2022 06:29:50 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d530d000000b0020c5253d8fasm11079757wrv.70.2022.05.09.06.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:29:49 -0700 (PDT)
Date: Mon, 9 May 2022 14:29:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 3/9] tests: add migration tests of TLS with PSK
 credentials
Message-ID: <YnkXS4KfADwk8/Y1@work-vm>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-4-berrange@redhat.com>
 <20220428134625.btsehtdftmwvs76m@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428134625.btsehtdftmwvs76m@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Eric Blake (eblake@redhat.com) wrote:
> On Tue, Apr 26, 2022 at 05:00:42PM +0100, Daniel P. Berrangé wrote:
> > This validates that we correctly handle migration success and failure
> > scenarios when using TLS with pre shared keys.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qtest/meson.build             |   7 +-
> >  tests/qtest/migration-test.c        | 159 +++++++++++++++++++++++++++-
> >  tests/unit/crypto-tls-psk-helpers.c |  18 +++-
> >  tests/unit/crypto-tls-psk-helpers.h |   1 +
> >  4 files changed, 177 insertions(+), 8 deletions(-)
> > 
> 
> >  
> > -static void test_precopy_unix(void)
> > +static void test_precopy_unix_plain(void)
> >  {
> >      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> >      MigrateCommon args = {
> > @@ -922,6 +1020,19 @@ static void test_precopy_unix(void)
> >      test_precopy_common(&args);
> >  }
> >  
> > +static void test_precopy_unix_tls_psk(void)
> > +{
> 
> This function is unguarded...
> 
> > +    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> > +    MigrateCommon args = {
> > +        .connect_uri = uri,
> > +        .listen_uri = uri,
> > +        .start_hook = test_migrate_tls_psk_start_match,
> > +        .finish_hook = test_migrate_tls_psk_finish,
> > +    };
> > +
> > +    test_precopy_common(&args);
> > +}
> > +
> >  static void test_precopy_unix_dirty_ring(void)
> >  {
> >      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> > @@ -1026,7 +1137,7 @@ static void test_xbzrle_unix(void)
> >      test_xbzrle(uri);
> >  }
> >  
> > -static void test_precopy_tcp(void)
> > +static void test_precopy_tcp_plain(void)
> >  {
> >      MigrateCommon args = {
> >          .listen_uri = "tcp:127.0.0.1:0",
> > @@ -1035,6 +1146,34 @@ static void test_precopy_tcp(void)
> >      test_precopy_common(&args);
> >  }
> >  
> > +#ifdef CONFIG_GNUTLS
> > +static void test_precopy_tcp_tls_psk_match(void)
> 
> ...while everything else is #ifdef CONFIG_GNUTLS...
> 
> >  static void *test_migrate_fd_start_hook(QTestState *from,
> >                                          QTestState *to)
> >  {
> > @@ -1497,8 +1636,20 @@ int main(int argc, char **argv)
> >      qtest_add_func("/migration/postcopy/unix", test_postcopy);
> >      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> >      qtest_add_func("/migration/bad_dest", test_baddest);
> > -    qtest_add_func("/migration/precopy/unix", test_precopy_unix);
> > -    qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
> > +    qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
> > +#ifdef CONFIG_GNUTLS
> > +    qtest_add_func("/migration/precopy/unix/tls/psk",
> > +                   test_precopy_unix_tls_psk);
> > +#endif /* CONFIG_GNUTLS */
> > +
> > +    qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
> > +#ifdef CONFIG_GNUTLS
> > +    qtest_add_func("/migration/precopy/tcp/tls/psk/match",
> > +                   test_precopy_tcp_tls_psk_match);
> 
> ...including use of the function.
> 
> > +    qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
> > +                   test_precopy_tcp_tls_psk_mismatch);
> > +#endif /* CONFIG_GNUTLS */
> > +
> 
> With the missing #ifdef added in,

OK, ifdef added in queuing

> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


