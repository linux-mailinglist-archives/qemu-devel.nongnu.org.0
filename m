Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB74D92B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:42:59 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTx9G-0000fd-7I
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:42:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nTx7r-0008If-EX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nTx7l-0005g6-Fy
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647312084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiRSKgG3uJx/l7ebIEBJlOXgLMswGZ1PXBJDNVdAB34=;
 b=GktdE4MdDHFiXpSmP/WwMmksAeNOYabcyzWuwVD4s8mf3+L8XJo2z1VMHZksqUnSWeXOl7
 bllVvFFt2iM+FR/784Q5+zFP7sI6IpYuqM3Wit9MlSL1t2YDbjgFVWIBthHelaYBUp4u2O
 7xKy6qL2+r8ly7uDOoJr39GDvvLPjiA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-7bictFfpMHmcLVORUgEZUA-1; Mon, 14 Mar 2022 22:41:22 -0400
X-MC-Unique: 7bictFfpMHmcLVORUgEZUA-1
Received: by mail-pf1-f197.google.com with SMTP id
 c70-20020a624e49000000b004f69bac03d0so10646513pfb.13
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 19:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GiRSKgG3uJx/l7ebIEBJlOXgLMswGZ1PXBJDNVdAB34=;
 b=6CSEkl4za74AoBgUiw46DJu2owBeiG8r6cmM7MLb68DF+bLHI7+/JC+5lbf1AH5awJ
 opa/kIwc8/V/MnM/E2SxcZ1PFj3i/03NAcNarqoSu6PwFqRpNHSyZe6y2A5tdU1DVXvr
 FjiT2njsrfFY8RoBH/1WBFo0jy7r+KWkXkc54htivJjhh+V9tm4AKTmOQSn5D4eBTMy+
 UFkSZXz6K33Fpx2xlfhe8+wiXLTMpPdKOdGtwbXNYbYXUnrFSnFBu0q05K4DbXd3r1pY
 fON6kNKtSzTEfkSjebhuuGqXdbF/R5xWr8LBY284FXXTVq1+1H/C2pOoxq7qhNHTEx5h
 fXWA==
X-Gm-Message-State: AOAM53144QrtH0CPCJuOA4+KlGCdVR9La3psTkQw14qTCOjUgL27vlZ/
 YnzzjWSAraqwCkyGaSFc3UZBaj71Z9tFxKvwrXKY0XjlBIKzGiZqICR4mF9oHhzXyQIc/Re/uPv
 lxEV0cyHGQ1rEPhY=
X-Received: by 2002:a17:90b:1052:b0:1bf:5024:c2a7 with SMTP id
 gq18-20020a17090b105200b001bf5024c2a7mr2142148pjb.218.1647312080323; 
 Mon, 14 Mar 2022 19:41:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlE5Qcy5yUPQHHmxH8+4ITF1dOu6MPNtz5gtsH9h2LmGvSgpWS7aRq/PtkMlHCG4PG91xjcA==
X-Received: by 2002:a17:90b:1052:b0:1bf:5024:c2a7 with SMTP id
 gq18-20020a17090b105200b001bf5024c2a7mr2142131pjb.218.1647312080025; 
 Mon, 14 Mar 2022 19:41:20 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.110])
 by smtp.gmail.com with ESMTPSA id
 d27-20020a63735b000000b003813c1e4a52sm4295388pgn.33.2022.03.14.19.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 19:41:19 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:41:12 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi/8yJfkTm3ubkWU@xz-m1.local>
References: <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <Yi+BbRJ9lbJ4ku9L@work-vm>
 <CAFEAcA_z2M2_MyWXT7iUKAFzpj1vWsw0DPV7o4YHp2d-1scf9g@mail.gmail.com>
 <Yi+HhvvlurQdW/Oq@work-vm> <Yi+PKfznFlm9MT1A@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yi+PKfznFlm9MT1A@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 06:53:29PM +0000, Daniel P. Berrangé wrote:
> On Mon, Mar 14, 2022 at 06:20:54PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Mon, 14 Mar 2022 at 17:55, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > > One thing that makes this bug investigation trickier, incidentally,
> > > > > is that the migration-test code seems to depend on userfaultfd.
> > > > > That means you can't run it under 'rr'.
> > > >
> > > > That should only be the postcopy tests; the others shouldn't use that.
> > > 
> > > tests/qtest/migration-test.c:main() exits immediately without adding
> > > any of the test cases if ufd_version_check() fails, so no userfaultfd
> > > means no tests run at all, currently.
> > 
> > Ouch! I could swear we had a fix for that.

https://lore.kernel.org/qemu-devel/20210615175523.439830-2-peterx@redhat.com/

I remembered for some reason that pull (containing this patch) got issues
on applying, and that patch got forgotten.

> > 
> > Anyway, it would be really good to see what migrate-query was returning;
> > if it's stuck in running or cancelling then it's a problem with multifd
> > that needs to learn to let go if someone is trying to cancel.
> > If it's failed or similar then the test needs fixing to not lockup.
> 
> This patch of mine may well be helpful:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03192.html
> 
> when debugging my TLS tests various mistakes meant I ended up with
> a failed session, but the test was spinning forever on 'query-migrate'.
> It was waiting for it to finish one iteration, and never bothering to
> validate that the reported status == active.
> 
> If that patch was merged, it might well cause the test to abort in an
> assertion rather than spining forever, if status == failed.
> 
> Of course someone would still need to find out why it failed, but
> none the less, I think assert is nicer than spin forever.

Agreed.

-- 
Peter Xu


