Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321CE4D9EF8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:44:58 +0100 (CET)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9M1-0007zo-7P
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:44:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9Ia-00028a-SZ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU9IW-0002m2-EH
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647358879;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RYUeyXj55nlsiI/Lt9+BBHG31YHsOA557KfgmExX8Hk=;
 b=Ah4AtWQCoIN3aJhF3C1xH7ujJ/Re5Xjlr7vsPsMHvZIV/+tFXzJEajEGX5O94ckvOhljwl
 wZFwfdLTZVET4BwpXEK7oJ7THFcnFIDD7a1/v2aTgsvD+g4/wXgFxed3VkeQV5HIoZ+2ci
 BjP1zrpfXRxaKS5CBHnAqK2yCyhkdrg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-Lmm4Jz00NZqGxdsxfIHSlQ-1; Tue, 15 Mar 2022 11:41:00 -0400
X-MC-Unique: Lmm4Jz00NZqGxdsxfIHSlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F032999B45;
 Tue, 15 Mar 2022 15:41:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC39400F8FE;
 Tue, 15 Mar 2022 15:40:57 +0000 (UTC)
Date: Tue, 15 Mar 2022 15:40:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: multifd/tcp/zlib intermittent abort (was: Re: [PULL 00/18]
 migration queue)
Message-ID: <YjCzhhCLHzpDoKl0@redhat.com>
References: <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
 <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 03:30:27PM +0000, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 15:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Maybe we're running into this bug
> > https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
> > ("zlib: compressBound() returns an incorrect result on z15") ?
> 
> Full repro info, since it's a bit hidden in this long thread:
> 
> Build an i386 guest QEMU; I used this configure command:
> 
> '../../configure' '--target-list=i386-softmmu' '--enable-debug'
> '--with-pkgversion=pm215' '--disable-docs'
> 
> Then run the multifd/tcp/zlib test in a tight loop:
> 
> X=1; while QTEST_QEMU_BINARY=./build/i386/i386-softmmu/qemu-system-i386
> ./build/i386/tests/qtest/migration-test  -tap -k -p
> /i386/migration/multifd/tcp/zlib ; do echo $X; X=$((X+1)); done
> 
> Without DFLTCC=0 it fails typically within 5 or so iterations;
> the longest I've ever seen it go is about 32.

So if this is a host OS package bug we punt to OS vendor to fix,
and just apply workaround in our CI ?  eg

$ git diff
diff --git a/.travis.yml b/.travis.yml
index c3c8048842..6da4c9f640 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -218,6 +218,7 @@ jobs:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
         - UNRELIABLE=true
+        - DFLTCC=0
       script:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


