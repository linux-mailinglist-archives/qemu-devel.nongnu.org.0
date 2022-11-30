Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA763D1A4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0JGI-0004IV-Od; Wed, 30 Nov 2022 04:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p0JGG-0004I1-Q2
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p0JGD-0007Nc-Hr
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669800008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6S4lFcVOFEpGISmWKQNAAJHEhh5DKmU92X//Tl/Byyw=;
 b=FD/jxR8Rw2bz9GczkgE1WKYpl0TlWvmW06PAE9n8c3xs2EpjSKdbLUkNv4CivZ9Frobs6P
 2q2tQ2z/7Tm5bpBZxz7J1d5BugWiEiOkdcJq3TH+adkZDa0OpsHtSrqG7i/TDjUJ8S4+le
 a8kBWCDSGgHfAgH4mKPAlWbWVIA3D5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-zmbyE8-9O1O9mNr4lL5zjQ-1; Wed, 30 Nov 2022 04:20:06 -0500
X-MC-Unique: zmbyE8-9O1O9mNr4lL5zjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so720098wmp.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 01:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6S4lFcVOFEpGISmWKQNAAJHEhh5DKmU92X//Tl/Byyw=;
 b=x/YZSi9YSha6fqYsdNQKdr9H0B+baxw/6uko8pX7O0dkQx+22hnshsHvB30UmoWbNY
 WPscR2+8HY3ZZ7lCfsSzyxSKRrYwZClh/qFa8AFbZypMR7svHwCaj6kC6zUFKrF7TNBm
 1Jsp9m9TCzFkTX2sFX817jwgRZmhJez/D53tc9x32yIu6EWrc16/uQl599XSjGMwi071
 rzIECpVwhnqP01LeOz6Vz4rkc50Sq+vd3smFo2ZbrhT/k6FpFZ/BQijaVqDii/XLhQvr
 KeR4pdYlevpisCmTTlnb2herIErPwRIeEGJZXfb8N9urjdyDEltXYda7K8ly9zZ/pH1F
 i2tQ==
X-Gm-Message-State: ANoB5pmPpI8fBczZcQwQpJa2Ldygh8wK7J4MstawEDzLbrLqLxPW6/zJ
 0VgcsoVDwL+g1C7wtGKBa/khduyMx2lQc/a/OwGfnlnw+hOrdZAKPV+5p6qn83XOCjboxQd8/3a
 ep6NrUIvih+VeHSM=
X-Received: by 2002:a05:6000:5c5:b0:22f:6a99:19f3 with SMTP id
 bh5-20020a05600005c500b0022f6a9919f3mr36582153wrb.165.1669800004993; 
 Wed, 30 Nov 2022 01:20:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf48QbtvdvFqx2wmzl1V+XQ0UP8gwXvIc38/+0hsAsx3uWPzqZdjo/RG4CXUULYNSIU5hhpC8Q==
X-Received: by 2002:a05:6000:5c5:b0:22f:6a99:19f3 with SMTP id
 bh5-20020a05600005c500b0022f6a9919f3mr36582131wrb.165.1669800004729; 
 Wed, 30 Nov 2022 01:20:04 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003c71358a42dsm6741380wma.18.2022.11.30.01.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 01:20:04 -0800 (PST)
Date: Wed, 30 Nov 2022 09:20:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org
Subject: Re: QEMU 7.2 non-deterministic migration-test CI failure
Message-ID: <Y4cgQnMooD3/ffv5@work-vm>
References: <Y4aAfdzTqY3mHUUH@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4aAfdzTqY3mHUUH@fedora>
User-Agent: Mutt/2.2.7 (2022-08-07)
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

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> Hi,
> The following cross-i386-tci migration-test failure was triggered by CI:
> 
> >>> MALLOC_PERTURB_=133 G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-i386 /builds/qemu-project/qemu/build/tests/qtest/migration-test --tap -k
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> Could not access KVM kernel module: No such file or directory
> qemu-system-i386: Unknown savevm section type 126
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 11 (Segmentation fault) (core dumped)
> TAP parsing error: Too few tests run (expected 14, got 2)
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3397205431
> 
> When I retried the test succeeded. I haven't managed to reproduce it
> locally yet either.
> 
> Any ideas?

Hmm, that's not good; I've not seen that error before, but:

QEMU_VM_SECTION_FOOTER= 0x7e

It probably means the destination read the wrong amount on a previous
section; probably something conditional on a state which is why
it only triggers sometimes.

Although,  that would normally trigger a
'Missing section footer for ...'

rather than end up hitting that error.

I can try letting it soak on one of my test machines.

Dave


> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


