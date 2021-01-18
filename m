Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4CE2F9C33
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:11:13 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RVA-00009n-L7
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RTR-0007Ic-W7
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RTQ-0002fk-3O
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610964562;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQifKEhJiWMwz+Sd1NZht2/U4poGM5wChXBd+LprkjE=;
 b=LB0BHsAs8zbPdUxzT0zll2X8dMwKLSn1S/UJArZlxBSlgmKCH/IemmjQcHKTkWxpwXUYd2
 8xscXZAx3yCaEN+tDxVYw/ehVTrjCObu5cIHouzMuoXf8aoWL666jdPJJlRV4eNJ+zSN3l
 T5RnTL8AnwnRHZN/d3kxfk3o2QTgKok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Be-yplPWM42BWeMdEI6e2g-1; Mon, 18 Jan 2021 05:09:19 -0500
X-MC-Unique: Be-yplPWM42BWeMdEI6e2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D361005513;
 Mon, 18 Jan 2021 10:09:18 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B291001281;
 Mon, 18 Jan 2021 10:09:16 +0000 (UTC)
Date: Mon, 18 Jan 2021 10:09:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
Message-ID: <20210118100914.GB1789637@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
 <20201110153505.GH869656@redhat.com>
 <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
 <1d3ef711-9509-f43b-11e0-d9ead8cc95af@redhat.com>
 <b0268ed2-0347-1c00-265c-910b2dc0f870@redhat.com>
 <93d7aa9e-4916-4c71-b017-36ccb5e410c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <93d7aa9e-4916-4c71-b017-36ccb5e410c8@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 10:26:15AM +0100, Philippe Mathieu-Daudé wrote:
> On 1/18/21 9:30 AM, Thomas Huth wrote:
> > On 17/01/2021 19.48, Philippe Mathieu-Daudé wrote:
> >> On 11/11/20 10:18 AM, Philippe Mathieu-Daudé wrote:
> >>> On 11/10/20 4:35 PM, Daniel P. Berrangé wrote:
> >>>> On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
> >>>>> The EDK2 jobs use the 'changes' keyword, which "makes it
> >>>>> possible to define if a job should be created based on files
> >>>>> modified by a Git push event." (see [1]). This keyword comes
> >>>>> with a warning:
> >>>>>
> >>>>>    Caution:
> >>>>>
> >>>>>      In pipelines with sources other than the three above
> >>>>>      changes can’t determine if a given file is new or old
> >>>>>      and always returns true."
> >>>>>
> >>>>> In commit 922febe2af we moved the YAML config file from the
> >>>>> repository root directory to the .gitlab-ci.d/ directory.
> >>>>>
> >>>>> We didn't respect the previous warning and disabled the
> >>>>> 'changes' filter rule, as the files are now in a (directory)
> >>>>> three above the YAML config file.
> >>>>
> >>>> This description is a bit wierd. I don't see how the location
> >>>> in the directory tree has any relevance here.
> >>>>
> >>>> IIUC the caution docs quoted above are referring to what triggered
> >>>> the pipeline. They're saying that if the trigger was not a "branch",
> >>>> "merge request", or "external pull request", then the "changes" rule
> >>>> always evaluates true.
> >>>>
> >>>> The "branch" source us a bit wierd though, as I'm not seeing
> >>>> how gitlab figures out which commits are "new" to the pipeline
> >>>> and thus whether the files were modified or not.
> >>>>
> >>>> Strangely qemu-project/qemu CI for master seems to be behaving
> >>>> correctly and skipping the jobs.
> >>>
> >>> What about this one?
> >>>
> >>> https://gitlab.com/berrange/qemu/-/jobs/827459510
> >>
> >> Ping?
> > 
> > Daniel's comment sounded like there are some changes required here, at
> > least to improve the commit message? So I was expecting a v2 here.
> > Please clarify Daniel's concerns, then I can either pick up this version
> > here or the v2 (in case you send one).
> 
> Sorry, this "ping" was for Daniel. I'm not sure how to continue,
> so shared an example in his namespace of "incorrect behavior".

Looking at pipelines than ran for me last week, I'm not seeing
ED2 being run, likewise for recent git master jobs on the main
repo.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


