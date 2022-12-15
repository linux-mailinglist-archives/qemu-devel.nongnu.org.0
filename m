Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907864DBCE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5njL-0000f2-88; Thu, 15 Dec 2022 07:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5njC-0000ZT-Ap
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p5njA-0005Yn-4o
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671108763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTehIzywCjQh+9Wm4JN+kKevvjY6rBIeh2C7A0of5oA=;
 b=D5b++zB6O36eiEg64zUu5KPnDr/oxXzHBoZ7JEYAA1+o+pPR8hcji4MewQn69ODXHtD1ql
 14zC5FmWa9Jw/EEoHp0vMNB4FmTDtSXxU6rl1oVj9blWmCfoXE2X4g4pQjrL9/D52xkGE5
 1WAFH7vgvx/cksyZesSa/wbkgpB+cCs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-4739DvYKPwy1c_-DIaRyPw-1; Thu, 15 Dec 2022 07:52:42 -0500
X-MC-Unique: 4739DvYKPwy1c_-DIaRyPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i13-20020adfa50d000000b0024cdcc92637so628702wrb.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YTehIzywCjQh+9Wm4JN+kKevvjY6rBIeh2C7A0of5oA=;
 b=Hkx52rUakf12T9zDFnlD8OIPOxHM/AHg8Ho/G7AVIJKIH6uhNQhdLWzqJgUNsCw95L
 2lnp8Ln5I7AzFx+71eiblwqB4m+SFu34QahGtYUGL5y3cW6VzkSVfVsRizp3d8RJ2AQm
 8jLTocvN42SvHRTaxJxSHUvNI3zRigXiujPhoAae/EHRj+2ReieT2mnDpagllY7p/we4
 6eL19cNjv7P6l4MgW5ja4M7EjLixNDCHbKEHnKH3RtyzuiT6KvoUQCAYXEJVJG7cwmZ3
 f5c9UkE/HBvbA0piV75bZN/bZC2eigjV3N2CRVt//FtitcVrjKjtuu6n4tEZqqeSJ22z
 STBg==
X-Gm-Message-State: ANoB5pmGC+kjty3DhIpNxdg4ZQP3fSHEHpv++1Qq2r5otGd4O6f/irxZ
 GDjvRf9BugxTaF945XxTjCO9lh5T4g/qymbpK1YZbRLV2ALESCw/3OIM20Ueqzul4Cy7Myvz48q
 15+nqNlZAyWoGVRA=
X-Received: by 2002:a05:600c:5386:b0:3c6:e63d:b893 with SMTP id
 hg6-20020a05600c538600b003c6e63db893mr21752964wmb.2.1671108760731; 
 Thu, 15 Dec 2022 04:52:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7lDWqIUH3XQWeSCnM8lV0wq+Ib545hoZQ/f9oDwZPGFfhzd+/V8nBkgSI6P17ZEHCeFh9f2Q==
X-Received: by 2002:a05:600c:5386:b0:3c6:e63d:b893 with SMTP id
 hg6-20020a05600c538600b003c6e63db893mr21752956wmb.2.1671108760480; 
 Thu, 15 Dec 2022 04:52:40 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05600c218800b003cfd0bd8c0asm6208073wme.30.2022.12.15.04.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:52:40 -0800 (PST)
Date: Thu, 15 Dec 2022 12:52:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
Message-ID: <Y5sYlkZ6q4/B7B2v@work-vm>
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
 <Y5sHtDP4vyEjhIan@work-vm>
 <CAFEAcA-PHqcGYMDj9OXKdY40Hb_rHCM9eeuh1rSnFL5-SyTfhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-PHqcGYMDj9OXKdY40Hb_rHCM9eeuh1rSnFL5-SyTfhg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 15 Dec 2022 at 11:40, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > Hi; I see this migration qtest failure on my x86 macos box:
> > >
> > >
> > > ▶  32/591 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> > > assertion fail
> > > ed: (!g_str_equal(status, "failed")) ERROR
> > >  32/591 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> > >            ERROR          152.27s   killed by signal 6 SIGABRT
> > > ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> > > stderr:
> > > query-migrate shows failed migration: Unable to write to socket: Broken pipe
> > > **
> > > ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> > > assertion failed: (!g_str_equal(status, "failed"))
> > > Assertion failed: (pid == s->qemu_pid), function qtest_wait_qemu, file
> > > ../../tests/qtest/libqtest.c, line 207.
> > >
> > > (test program exited with status code -6)
> > > ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > >
> > > and similarly:
> > >
> > > ▶  34/591 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> > > assertion failed: (!g_str_equal(status, "failed")) ERROR
> > >  34/591 qemu:qtest+qtest-i386 / qtest-i386/migration-test
> > >            ERROR          169.44s   killed by signal 6 SIGABRT
> > > ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> > > stderr:
> > > query-migrate shows failed migration: Unable to write to socket: Broken pipe
> > > **
> > > ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
> > > assertion failed: (!g_str_equal(status, "failed"))
> > > Assertion failed: (pid == s->qemu_pid), function qtest_wait_qemu, file
> > > ../../tests/qtest/libqtest.c, line 207.
> > >
> > > (test program exited with status code -6)
> > > ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > >
> > > It seems to be fairly consistent. Any ideas what it might be?
> > > Maybe the QEMU process has already exited before the test binary
> > > gets round to querying the status ?
> >
> > Yes, it sounds like it, can you get a backtrace to figure out which test
> > it was in/where it was upto when it died?
> 
> The logfile says it had just done
> ok 23 /aarch64/migration/multifd/tcp/plain/none
> so I think the one it was in the middle of when it failed was
> /aarch64/migration/multifd/tcp/plain/cancel.
> Similarly the log suggests the x86 failure was for
> /i386/migration/miltifd/tcp/plain/cancel.
> 
> It doesn't seem to repro running manually, my guess is that
> it happens because the machine is heavily loaded doing the
> whole build-and-test cycle.

Yeh; I think we'll still need a backtrace or better qmp log though to
figure it out.
If I read that correctly, what that test does is:

   start 'from'
   start 'to'
   slow migrate from->to
   <cancel>
   start 'to2'
   migrate from->to2

I'd only expect the 'to' to quit by itself, and I don't think we should
be doing a 'failed' check on a destination (I don't think).
Even if the migration finished quickly 'from' shouldn't just quit - so
the QMP should still be working, so we shouldn't get the broken pipe on
the actual qmp pipe.
Assuming then it's a broken socket on the migration stream, that sounds
like a bug - a 'cancel' might cause the destination to get an error
but the source shouldn't - it should know it's cancelling.

Dave

> thanks
> -- PMM
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


