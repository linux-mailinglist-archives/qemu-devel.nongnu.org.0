Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA64D9FBD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 17:17:06 +0100 (CET)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9r7-0002fM-P8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 12:17:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU9pG-0001bQ-0w
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU9pC-0007tD-Mm
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 12:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647360902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RDctXT/lZtjkn19xFE+eAy3PgzAbC69/mw4yZDE5a4Q=;
 b=H5AVFciMv51kMm9y69T7VBKPS6FUTW32NFGgrRavM1I466mzqB8BM2Tsx6c9Oe4yIOsutt
 MZe+wAvmwwLn6fdvtpm5CQF7qPOtCdSCjyFtC9l3pIyYMYi+0gpAIfhtRKt1neKNTxapx1
 x8CAeNIDpd9dkqACtXGYXTga0EkQGjs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-FtnYoa-MOze2YrhpzoKwrw-1; Tue, 15 Mar 2022 12:14:57 -0400
X-MC-Unique: FtnYoa-MOze2YrhpzoKwrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 14-20020a05600c028e00b003897a4056e8so1347004wmk.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 09:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RDctXT/lZtjkn19xFE+eAy3PgzAbC69/mw4yZDE5a4Q=;
 b=hFabAIbuaAkHx6+uYSqG6MQaB5e+JQjhOwo7kD3e7/GckdqDcXjIjuvSFKH5tDR0Rq
 AShqKb93lrMbcaxTS5F4CZJqS1iIQ/A5NQ0YRklZj9y0+i+G0HP9Qze25FGOYPFeDj27
 3mfWGzGWSKbSNau/m3uuyjypQm+E+GBdgRyXlq0uBJIqSjmfkm6PqT8hF1yC0pS1vhvp
 hTP1kirmIgUg5Huh6khTWEsIHh9nd0SrLWvYu3f3eMG+SxW9bdyRP1wOaTaa1oQRrn78
 gtJrfw2IYzBZ2BrDP21gcOyI0vFrp2F9JQyFgEGTQl0jjfdVF5PW5ReHseh4WTK+ATyY
 XbVA==
X-Gm-Message-State: AOAM532TXMR7RWsSifQ3aZ6wzLNV35bMEuCNoAq9rFqheMI2gnjHo5vN
 lAueBhZECYZ3lgqIq77xtBP2G8Cs0f1BzFeVJ+54XaaOdsxJxZX5bp+e+CBf8VcqlpFp4B6i7FT
 ba5NHEzuekbUEOo8=
X-Received: by 2002:a5d:4a8f:0:b0:1f0:4af2:4e29 with SMTP id
 o15-20020a5d4a8f000000b001f04af24e29mr20786574wrq.519.1647360895777; 
 Tue, 15 Mar 2022 09:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoD9PN1q34ht1rQhfBYnMwfFHCvXGoBIa/EAitvZ7TEjlUiRah3zDbVDSckV8mkUWEaoP4Rg==
X-Received: by 2002:a5d:4a8f:0:b0:1f0:4af2:4e29 with SMTP id
 o15-20020a5d4a8f000000b001f04af24e29mr20786545wrq.519.1647360895470; 
 Tue, 15 Mar 2022 09:14:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6a03000000b001f06621641fsm15701700wru.96.2022.03.15.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:14:54 -0700 (PDT)
Date: Tue, 15 Mar 2022 16:14:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
Message-ID: <YjC7fLmIvB+o95nA@work-vm>
References: <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 15 Mar 2022 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 14 Mar 2022 at 19:44, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On Mon, 14 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > I just hit the abort case, narrowing it down to the
> > > > /i386/migration/multifd/tcp/zlib case, which can hit this without
> > > > any other tests being run:
> > >
> > > > This test seems to fail fairly frequently. I'll try a bisect...
> > >
> > > On this s390 machine, this test has been intermittent since
> > > it was first added in commit 7ec2c2b3c1 ("multifd: Add zlib compression
> > > multifd support") in 2019.
> >
> > I have tried (on current master) runs of various of the other
> > migration tests, and:
> >  * /i386/migration/multifd/tcp/zstd completed 1170 iterations without
> >    failing
> >  * /i386/migration/precopy/tcp completed 4669 iterations without
> >    failing
> >  * /i386/migration/multifd/tcp/zlib fails usually within the first
> >    10 iterations (the most I ever saw it manage was 32)
> >
> > So whatever this is, it seems like it might be specific to the
> > zlib code somehow ?
> 
> Maybe we're running into this bug
> https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
> ("zlib: compressBound() returns an incorrect result on z15") ?

The initial description of compressBound being wrong doesn't
feel like it would cause that; it claims it would trigger an error
(I'm not sure how good we are at spotting that!); but then later
in the description it says:

'Mistakes in dfltcc_free_window OF and especially DEFLATE_BOUND_COMPLEN,
  (incl. the bit definitions), may cause various and unforseen defects'

Certainly looks like a 'various and unforseen defect'.

Dave

> That bug report claims it doesn't affect focal, though, which
> is what we're running on this box (specifically, the zlib1g
> package is version 1:1.2.11.dfsg-2ubuntu1.2).
> 
> A run with DFLTCC=0 has made it past 60 iterations so far, which
> suggests that that does serve as a workaround for the bug.
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


