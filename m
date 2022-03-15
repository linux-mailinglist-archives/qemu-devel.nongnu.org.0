Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393C4DA0CE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:05:18 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUAbk-0006Tx-TH
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:05:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUAYX-0004y6-Od
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUAYU-00077B-Bh
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647363713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pd1mOyIYOh/jUZg1RDvcMzH0gCyPQYs2Vx858NAv0o=;
 b=JbYNLFxtPj9exxbYrOm60j1QHLbQ3VVbbj3pGuNdfEmFqC/nio3qpH3ExNGrShgDsUCcgM
 UhgDxhQiKbqvf1Bx9wPZVU63xqh4MZNhbJC3TzvD3QH4Ruxy4G0yUeDql/ifM9cwCsXliI
 ojkVU7AfyDWw0m3UhEQrkB+Rs+gOJTU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-GquYiujJNUmlv2zwel9BQA-1; Tue, 15 Mar 2022 13:01:38 -0400
X-MC-Unique: GquYiujJNUmlv2zwel9BQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1FE2999B45;
 Tue, 15 Mar 2022 17:01:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69189C44AE5;
 Tue, 15 Mar 2022 17:01:35 +0000 (UTC)
Date: Tue, 15 Mar 2022 17:01:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: multifd/tcp/zlib intermittent abort
Message-ID: <YjDGbFE9cx075lM8@redhat.com>
References: <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
 <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
 <YjCzhhCLHzpDoKl0@redhat.com>
 <2c9eab2b-a166-1722-4fc0-68b0e4abdd8e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2c9eab2b-a166-1722-4fc0-68b0e4abdd8e@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, f.ebner@proxmox.com,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 04:44:37PM +0100, Thomas Huth wrote:
> On 15/03/2022 16.40, Daniel P. Berrangé wrote:
> > On Tue, Mar 15, 2022 at 03:30:27PM +0000, Peter Maydell wrote:
> > > On Tue, 15 Mar 2022 at 15:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Maybe we're running into this bug
> > > > https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
> > > > ("zlib: compressBound() returns an incorrect result on z15") ?
> > > 
> > > Full repro info, since it's a bit hidden in this long thread:
> > > 
> > > Build an i386 guest QEMU; I used this configure command:
> > > 
> > > '../../configure' '--target-list=i386-softmmu' '--enable-debug'
> > > '--with-pkgversion=pm215' '--disable-docs'
> > > 
> > > Then run the multifd/tcp/zlib test in a tight loop:
> > > 
> > > X=1; while QTEST_QEMU_BINARY=./build/i386/i386-softmmu/qemu-system-i386
> > > ./build/i386/tests/qtest/migration-test  -tap -k -p
> > > /i386/migration/multifd/tcp/zlib ; do echo $X; X=$((X+1)); done
> > > 
> > > Without DFLTCC=0 it fails typically within 5 or so iterations;
> > > the longest I've ever seen it go is about 32.
> > 
> > So if this is a host OS package bug we punt to OS vendor to fix,
> > and just apply workaround in our CI ?  eg
> > 
> > $ git diff
> > diff --git a/.travis.yml b/.travis.yml
> > index c3c8048842..6da4c9f640 100644
> > --- a/.travis.yml
> > +++ b/.travis.yml
> > @@ -218,6 +218,7 @@ jobs:
> >           - TEST_CMD="make check check-tcg V=1"
> >           - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
> >           - UNRELIABLE=true
> > +        - DFLTCC=0
> >         script:
> >           - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
> >           - |
> 
> Sounds like a good idea - but you should certainly add a proper comment
> here, too, so that we can later remind ourselves to remove the workaround
> again.

FYI, I don't have time to actually test this for real with Travis right
now , so I'll leave it to someone else to test and submit a formal patch.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


