Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75054671CC6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI80d-0007SU-Gm; Wed, 18 Jan 2023 07:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pI80a-0007Rh-7k
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pI80Y-0001zs-Na
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674046657;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxK2u2EXRhEVgrOgAbbHgTYHsQl0AM/OXiCcee9OMdI=;
 b=bEbz+P652vKjrZMLhlinnsEUkESOMFPWMyi9KfaIWUZWNQ4YspOZgt9ZFosJMXrJyhYgc7
 k8hbQIz3WMAP8KTABaZDGFsOjgFpJBNQSBZXpq25F81RuL9VogbZkqTVU+Gxf8J//Pu7GO
 Ey/lkMXorvvvLRiYhb/uqyGsMULeZQ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-e8VwoTSIMwikjQBmzWt8rQ-1; Wed, 18 Jan 2023 07:57:34 -0500
X-MC-Unique: e8VwoTSIMwikjQBmzWt8rQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAFD538149AC;
 Wed, 18 Jan 2023 12:57:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCFF640C6EC4;
 Wed, 18 Jan 2023 12:57:32 +0000 (UTC)
Date: Wed, 18 Jan 2023 12:57:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Message-ID: <Y8fsutLZrA5BkcB2@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
 <9231dd89-355e-3aa2-c4c7-b462af0ff67f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9231dd89-355e-3aa2-c4c7-b462af0ff67f@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 18, 2023 at 01:55:49PM +0100, Thomas Huth wrote:
> On 17/01/2023 11.44, Daniel P. Berrangé wrote:
> > On Tue, Jan 17, 2023 at 11:32:42AM +0100, Thomas Huth wrote:
> ...
> > > - Instead of doing "cat meson-logs/testlog.txt" in the CI
> > >    scripts, we switch to "tail -n 1000 meson-logs/testlog.txt"
> > >    instead
> > 
> > Tail requires that it has consumed the entire doc before it prints
> > anything. This in turn implies that the test suite has finished.
> > IOW, we'll get zero output if it hangs IIUC.
> 
> I was referring to the places where we are dumping the testlog.txt like this:
> 
>  make --output-sync -j`nproc` check
>    || { cat meson-logs/testlog.txt; exit 1; }
> 
> See .gitlab-ci.d/custom-runners/* or .gitlab-ci.d/windows.yml for example. I
> assume it should be ok to switch to "tail" instead of "cat" there?

Yes, it would be OK, bug lets make sure meson-logs/testlog.txt is included
as an artifact published by the job, so we can access the full set if
needed


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


