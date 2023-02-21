Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153369E5B5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:15:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWDq-00049D-0E; Tue, 21 Feb 2023 12:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWDn-00048W-Er
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:14:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWDk-00067r-Bc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676999656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7NOz6qU0litU3IseKpXz5gLwPRNf/z1bftHIkZ/UAM=;
 b=go38k8nAczcFhTFyjvZzUoISt+QOEtuVgZufoo2a8jsLoy9NTyg0ovm3IHEDdsxAoBKAig
 0tVev1amuwftCoWMiHYrziC6tLdCEmMZkyhHdwVPWjDP4lXU3x/g+5FplXy9LbxT+Huupc
 dMFx6NBGXh9K9JXIPplEIj1LQ6dH+80=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-ffeT1SY4NSGDv_tce5aGKQ-1; Tue, 21 Feb 2023 12:14:13 -0500
X-MC-Unique: ffeT1SY4NSGDv_tce5aGKQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 r3-20020ac84243000000b003b9a3ab9153so2119477qtm.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7NOz6qU0litU3IseKpXz5gLwPRNf/z1bftHIkZ/UAM=;
 b=CeUPYcYmAXsaxxB2iNGSpfGS1BOoOHl5E0ypHJDEJTP3BPNab/mgV0KUxStqHw8sQ7
 /Cx4mqsl2grJtz7ix1H0/5dRBkHB5PSAQKV1F3PJKr0HomLBpLevwHo8ES8hiklSZnDd
 t9xZ2MDYDfXUUQRI3dv8+IdAeeX78ufdi6ozEG4yPG41I2mIM4IhqINYLwhvnfrdtW5T
 95wt+OvRJbjWeo1dtzbGJD9r3uEWlw18uPSz2On7GBitVTRCSouwN8GZOhPM4Tn68v+i
 W2zPwaE6fA1ikLz2evZSoSOBESeV7j+kYM0nPM4CnIymBt0e9HB/mleal/cz+c4mapHm
 8tzA==
X-Gm-Message-State: AO0yUKVcP9gJtS1X7ZaKeSl7UFT/4RKJLI0M4NOeGm37aSdD4lYtwyEO
 GkGDTjwX6Gz4HXLjMRas7INtKti2SnryW37F1Q+6Fm7KE6XYT/MtwLt+AqcvZYC+fKB8PjMDQDR
 TsMv1S0P3qhD+tAI=
X-Received: by 2002:a05:622a:1002:b0:3b8:5199:f841 with SMTP id
 d2-20020a05622a100200b003b85199f841mr9648480qte.0.1676999650809; 
 Tue, 21 Feb 2023 09:14:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8ltRNZViRZ5q+gPopzvV5Uy5sMlg/wBxKLYeAQ3y0Bm/xuBGV8JBc78LtBAOk2LP37bi4LMQ==
X-Received: by 2002:a05:622a:1002:b0:3b8:5199:f841 with SMTP id
 d2-20020a05622a100200b003b85199f841mr9648444qte.0.1676999650443; 
 Tue, 21 Feb 2023 09:14:10 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 g1-20020ac842c1000000b003bd0f0b26b0sm729065qtm.77.2023.02.21.09.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 09:14:09 -0800 (PST)
Date: Tue, 21 Feb 2023 12:14:08 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: Disable migration-test
Message-ID: <Y/T74EG3REDW2DZR@x1n>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
 <Y/TlB36EjrWwr2ne@work-vm> <Y/Tsxp2dbkcTI1WD@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/Tsxp2dbkcTI1WD@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 21, 2023 at 04:09:42PM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 21, 2023 at 03:36:39PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > > Damn this is really going to impact the stability of migration if we
> > > > don't regularly test.
> > > > But fundamentally, I've never been able to debug much of the reports
> > > > that come from flakyness in gitlab ci; we're not getting the most basic
> > > > information like which subtest or where we're upto in the test which
> > > > makes it very very hard to debug.
> > > 
> > > Right, but if you want more information you need to change the
> > > tests and/or test harness to provide it.
> > 
> > I don't think the migration test is doing anything odd in that respect;
> > We've just got a bunch of qtest tests; having a test framework which
> > doesn't tell you which test failed is very difficult.
> 
> Right so the problem here is the use of 'bail out'. From the POV
> of the TAP output format that is an immediate termination, so there
> is nothing to report about which test was being run.
> 
> To make the failing test visible, it needs to NOT trigger a bail
> out, but instead report an "not ok" line, which will show the
> test case name. AFAIK, this is a limitation of glib's test harness
> and its adoption of TAP. You can't get the test case name printed
> until the test case is finished. And glib tests fail by calling
> assert, so they will inherantly trigger 'bail out' logic from a
> TAP POV.
> 
> IIRC, the historical non-TAP output format would output the test
> case name first, and then once done report ok/not ok.
> 
> The workaround would be for glib to use a TAP diagnostic line
> to print the test case it is about to run. It already uses the
> diagnostic lines to report test groups eg
> 
> $ ./build//tests/unit/test-io-channel-command
> # random seed: R02S0718b3006d3dcf15099db36b61dff3e8
> 1..4
> # Start of io tests
> # Start of channel tests
> # Start of command tests
> # Start of fifo tests
> ok 1 /io/channel/command/fifo/sync
> ok 2 /io/channel/command/fifo/async
> # End of fifo tests
> # Start of echo tests
> **
> ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
> Bail out! ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
> Aborted (core dumped)
> 
> 
> would have to be changed to report
> 
> $ ./build//tests/unit/test-io-channel-command
> # random seed: R02S0718b3006d3dcf15099db36b61dff3e8
> 1..4
> # Start of io tests
> # Start of channel tests
> # Start of command tests
> # Start of fifo tests
> # Running /io/channel/command/fifo/sync
> ok 1 /io/channel/command/fifo/sync
> # Running /io/channel/command/fifo/async
> ok 2 /io/channel/command/fifo/async
> # End of fifo tests
> # Start of echo tests
> # Running /io/channel/command/echo/sync
> **
> ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
> Bail out! ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
> Aborted (core dumped)
> 
> so we see exactly what was running.
> 
> Without this though, we can still figure out what was running. You
> have to look back for the previous 'ok' line and see what it was.
> Then locally run '/path/to/test -l' to list the test case names.
> The one you want is the one immediately after the last 'ok' (not ok)
> line.
> 
> Rather tedious for sure, but not impossible.
> 
> Worth an RFE for glib, but would be a while before we saw the benefit.
> 
> As a workaround, we could print out TAP diagnostic output ourselves
> in any qtests that we see as especially unreliable. A diagnostic
> output is any line printed on stdout that starts with a '# '

The other possible way is I'm wondering whether we can try to do a whole
stack dump when an assertion happened.

With a backtrace we can easily see the function pointer so that'll be
another way of knowing which test we're running, slightly more awkward than
dumping the names but probably still good enough for developers.

It also contains more information so sometimes we can already spot the bug
even before trying to reproduce.

Though I'm not sure whether it's easily feasible, e.g., the tests are
mostly using g_assert*() families and I've no idea of any good way to let
it happen if without replacing all of them to inject a dump.

Thanks,

-- 
Peter Xu


