Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581323114D1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 23:21:21 +0100 (CET)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l89Tb-0007hq-Vl
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 17:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l89Rs-0007HA-DL
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:19:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1l89Rl-0001zp-PT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612563564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3ttDqGoj/5IJ/Gzv8rUT098UOA2NXbvxaEGsrn4O18=;
 b=Z/x3d7gdvhbHEoQsADW6wEdacv+Wnvz0T4A51at+rBs9KRszNWtuBkq6P1YT4dixDcuI9a
 jtyEP+zMSzQaX514za6y8H5OMYuHJYglOf6sNiP1lggVxK1PvoA23voTu9lGFVGk624cGj
 M9uYLMMQEolpnqpat3FzX52ab+nLzkk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-pZsaGhD6M7iI-vFXSmxObw-1; Fri, 05 Feb 2021 17:19:20 -0500
X-MC-Unique: pZsaGhD6M7iI-vFXSmxObw-1
Received: by mail-qk1-f200.google.com with SMTP id p123so5266591qke.8
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M3ttDqGoj/5IJ/Gzv8rUT098UOA2NXbvxaEGsrn4O18=;
 b=Z4z2791n7vzRXb+J1xfpfaR75phQAxN2oEIcSGN4uQ/VJF/itqUnonDPWrchn2v6Dw
 cyzPUHjxM90AotKzJWbmA2B4dASBA1LfkUDM0iuOEN+j6/duP6aTUGTqBLjPnt02GQlW
 im82YEXe83Sqbh7VS76qgCAPcMuBQXoWFWZFwIzwhRGADUQPjdEtnIhuSirw5LCVZdrZ
 BMbyYpCrudWRfbVugboFborcJpjsmR/JqD3c+aClZUzVALbl1yF8um9zCf2+zJefOUKM
 YYMvqcRpRkTVzo+GgJ0RfF45zD8x4enH64sgD37NKiEV8LhYM1d4AmViJwCooRvgdD5Z
 SDNw==
X-Gm-Message-State: AOAM531qd0uLbwFsObPQDqwwxQo58FGgTzhGqiTnpuW6nbYW95zg3CdW
 jAwb4qywfA2dlu6GVVe/8yD0pEmxbzFBWHltFHNRgRtOwkkgptTJgLvLsIaSW5RNh6t88zEVvAI
 iIPVurQxLZDpm0jI=
X-Received: by 2002:a0c:8f09:: with SMTP id z9mr6460636qvd.25.1612563560506;
 Fri, 05 Feb 2021 14:19:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlU3LNAtWcdpLGpfshSbsxHUukTRbRl3pvLlyi/8vamaSt5Ax1V1IIhYjFvfj6IAfXmhqsGQ==
X-Received: by 2002:a0c:8f09:: with SMTP id z9mr6460611qvd.25.1612563560299;
 Fri, 05 Feb 2021 14:19:20 -0800 (PST)
Received: from localhost ([181.191.236.144])
 by smtp.gmail.com with ESMTPSA id c14sm10755268qkl.18.2021.02.05.14.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:19:19 -0800 (PST)
Date: Fri, 5 Feb 2021 19:19:16 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [Avocado-devel] acceptance-system-fedora and
 acceptance-system-centos failing sporadically with timeout?
Message-ID: <20210205221916.djodrsrvsqelu4zp@laptop.redhat>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
 <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
 <ce8b4da1-4467-53e0-9dcb-203535fd5b96@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ce8b4da1-4467-53e0-9dcb-203535fd5b96@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, avocado-devel <avocado-devel@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I will try to give my two cents:

On Fri, Feb 05, 2021 at 03:31:40PM -0500, John Snow wrote:
> On 2/5/21 11:43 AM, Philippe Mathieu-Daudé wrote:
> > Cc'ing Avocado team & John (Python inferior exit delay?).
> > 
> > On 1/28/21 11:10 AM, Thomas Huth wrote:
> > > On 28/01/2021 10.45, Claudio Fontana wrote:
> > > > 
> > > > is it just me, or is the CI sometimes failing with timeout?
> > > > 
> > > > Fedora:
> > > > https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
> > > 
> > > I've sent a patch for that issue just yesterday:
> > > 
> > >   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06852.html
> > > 
> > > > CentOS:
> > > > https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
> > > 
> > > Never seen that one before - if you hit it again, could you please save
> > > the artifacts and have a look at the log file in there to see what's
> > > exactly the problem?
> > 
> > https://gitlab.com/philmd/qemu/-/jobs/1008007125
> > 
> >   (28/36)
> > tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ppc_mac99:
> > ERROR: Test reported status but did not finish (90.09 s)
> > 
> > Attached debug.log.
> > 
> 
> ¯\_(ツ)_/¯
> 
> I don't know what "reported status but did not finish" means.
> 
> The debug log looks like it passes, too, so... I don't know that this has
> much do with code I maintain yet. I'm sure the Avocado team will find me if
> I am wrong :)

Afaict, this happen when the process exceeds the deadline to finish.
Sometimes the test is finished but the "post test" stage is stucked
because of some reason.

Maybe setting 'runner.timeout.process_alive' to a higher number could help
here:

----
$ avocado config reference | grep process_alive -A 6

runner.timeout.process_alive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The amount of time to wait after a test has reported status but the
test process has not finished

* Default: 60
* Type: <class 'int'>
----

But I might be wrong. I know that Cleber was working with this, so
probably he could help here too.

--
Beraldo


