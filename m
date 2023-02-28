Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD866A5D15
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2nU-0003HV-Td; Tue, 28 Feb 2023 11:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX2nT-0003HF-8l
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:25:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX2nR-00046G-5l
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677601540;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRHkYczZIw2nuJWSyoBVVqTFSFkBG5U1FrYNBZzyl/A=;
 b=e9p+0vVBEHNT/ZkNjH8a4lq6lJgqujs6pHg22aYeJTlT+T9VGj4u20SIeZYBfBcuSvDQCy
 bWSUJODKyXwg7FS0yfiJ/1a9HBtCGAEZ/8qRvT1N0ga7vdR5TH5weKL+zQIYx0y8JXYLNF
 5cqaIdMHqasMBRmigBgqpLTKi82x0S8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-c8LL0LV2MM245LUSiVYyFw-1; Tue, 28 Feb 2023 11:25:37 -0500
X-MC-Unique: c8LL0LV2MM245LUSiVYyFw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9551887A9EB;
 Tue, 28 Feb 2023 16:25:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89FC5492B0F;
 Tue, 28 Feb 2023 16:25:33 +0000 (UTC)
Date: Tue, 28 Feb 2023 16:25:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
Message-ID: <Y/4q+gZ6Q2738hmx@redhat.com>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
 <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
 <b4b60712-a94c-69f4-2de0-b9b5e08970fc@linaro.org>
 <16efff7f-afe7-7c92-bdbe-6b0920bf2438@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16efff7f-afe7-7c92-bdbe-6b0920bf2438@eik.bme.hu>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 28, 2023 at 04:05:30PM +0100, BALATON Zoltan wrote:
> On Mon, 27 Feb 2023, Philippe Mathieu-Daudé wrote:
> > On 27/2/23 18:47, BALATON Zoltan wrote:
> > > On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> > > > Unfortunately my patches had changes merged in. This now makes it hard to
> > > > show what really changed (spoiler: nothing that affects behavior).
> > > > 
> > > > As you probably noticed in the "resend" version of this iteration I split
> > > > off a patch introducing the priq properties. It belongs to the sub series
> > > > of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
> > > > to show up in `git blame` as the author of any of these changes. I
> > > > attributed it to you because this was really your change which
> > > > I'm not even
> > > > sure is legal.
> > > > 
> > > > Let's avoid such complications by keeping our series separate.
> > > 
> > > Let's cool down a bit. Philippe took some of the sm501 patches in
> > > his giant pull request (and a lot of your patches too) now so I'll
> > > wait until that lands and hope to get some review for the remaining
> > > patches too. Once that pull req is merged I'll rebase the remaining
> > > patches and resubmit the series also adding changes for reasonable
> > > review comments I get by then.
> > 
> > I'm sorry it took me so long, I was expecting these patches to be picked
> > up by other maintainers but everybody is very busy. I know you'll need
> 
> You have no reason to apologise really, you did a great job merging all the
> patches. I was thinking that because as you say every maintainer is very
> busy now and we also had CI outage for a few weeks should we consider
> extending the date until the freeze by one or two weeks? That would allow
> people to relax a bit and be able to consolidate and merge all still pending
> patches. Postponing the 8.0 release one or two weeks is probably better than
> missing a lot of changes until the next release in September. We'd still aim
> for the original freeze date but if we fail to meet that it would be more
> convenient to know there could be a possibility for extending it. But make
> it clear that this is only for this one time because of CI outage and
> additional maintainer load caused by that so not something that should be
> done regularly but under current circumstances I would consider it.

There's no need to change the release schedule IMHO. Subsystem maintainers
should continue to send pull requests as normal. Peter is still processing
PRs, albeit at a lower rate with adhoc CI. From the soft freeze POV what
matters is just that the PRs are posted on the mailing list before the
deadline. If they're posted in time, they're still valid for inclusion in
the release. Our CI allowance is reset at the end of today anyway.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


