Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C940B8B5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:07:35 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQEiM-00083b-Gk
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQEfX-0006Em-VP
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQEfS-000799-VR
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631649872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CIWgRXiCCkdddAmRC5IKD1Us657In3Z4wsiBx4rH18A=;
 b=H5iBJB83XuCeC8RbFpJXpXCurZ74MyhVXyr+V7MjpDaoSgtZ7+wrMliAHzSUs4cwsrEyuf
 crYVfmyd5b81Bkd6kF3qPEOpw1OSVQQmpLtt6xlr2B0l5DDbIhMZgIprSgzzN0/qS3iI3V
 QFTNf737GaHl8Dv1HfyY7e9o8/9H3us=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-PIEp2gJNMWW_MhZZPxlIyw-1; Tue, 14 Sep 2021 16:04:27 -0400
X-MC-Unique: PIEp2gJNMWW_MhZZPxlIyw-1
Received: by mail-pg1-f200.google.com with SMTP id
 g15-20020a63564f000000b00261998c1b70so156735pgm.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 13:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CIWgRXiCCkdddAmRC5IKD1Us657In3Z4wsiBx4rH18A=;
 b=OrWgUI5KNPpgiEyNvTM9GxBiL6hLqtuFIYrwnQkfZ/zBdHgfTToZ9WCjnHnch/qJJz
 J5wsppp8IdH5GKdr2nKmFkLtmc6gx+DFjAvZB3M4c7D+U6WLUaTygCF7Iv/rl4YBUr2I
 9KsvDF0ymd8gOXZaQPoCu3EDpxXJUObTzbrHYBAMet2/WF+S8BpU9bSEmEgeCRhEj9SK
 IAd8ZXeztICapcqE4Pn4qvAx9WodpTZVDZQ90muJQxbpIJJ9Yun92nShemv9D8uOwAtm
 woFkwgSPY6dq41/fMFPuKj81qPh+lVN3shtxYFXlSJ91BFbj6U76ifCR9lUCahRvFaHD
 kukw==
X-Gm-Message-State: AOAM532psw3BzQ0MyreKvNis9UNBsqMUAbQzV6LufbGES/gbtoM5/q7+
 QJx41a1QG+zSJ9+hN1CnY2xSMpweyIGCWSEPfETUcd+Fh43vKn0XCKP0i/X6+eZiDTOAsDztr+C
 22V29hke3aTT9kWh96khNsRVq1BjMNKM=
X-Received: by 2002:a05:6a00:88b:b0:43d:e85f:e9ee with SMTP id
 q11-20020a056a00088b00b0043de85fe9eemr6574447pfj.46.1631649866199; 
 Tue, 14 Sep 2021 13:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyig4/hfUdqmbNd7XTBQ0ZY8GyRCq31Ywh1W3iPiYEikzg8bXZNQjbRhWeOeijiOU0nA7VvMVpnCgMoPoU0cM0=
X-Received: by 2002:a05:6a00:88b:b0:43d:e85f:e9ee with SMTP id
 q11-20020a056a00088b00b0043de85fe9eemr6574421pfj.46.1631649865884; Tue, 14
 Sep 2021 13:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
In-Reply-To: <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 14 Sep 2021 17:03:59 -0300
Message-ID: <CAKJDGDZT1yCKMTy9ugNoDEiXcF_44UAjaZxFEY2USasuhjDPRg@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 4:18 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 13 Sept 2021 at 11:19, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Currently we define a lot of jobs for our custom runners:
> > for both aarch64 and s390x we have
> >  - all-linux-static
> >  - all
> >  - alldbg
> >  - clang (manual)
> >  - tci
> >  - notcg (manual)
> >
> > This is overkill.  The main reason to run on these hosts is to get
> > coverage for the host architecture; we can leave the handling of
> > differences like debug vs non-debug to the x86 CI jobs.
> >
> > The jobs are also generally running OK; they occasionally fail due to
> > timeouts, which is likely because we're overloading the machine by
> > asking it to run 4 CI jobs at once plus the ad-hoc CI.
> >
> > Remove the 'allow_failure' tag from all these jobs, and switch the
> > s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
> > This will let us make the switch for s390x and aarch64 hosts from
> > the ad-hoc CI to gitlab.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> It looks like this change has resulted in pipelines ending
> up in a "blocked" state:
>
> https://gitlab.com/qemu-project/qemu/-/pipelines
>
> I'm not sure why this is -- is it perhaps because there were
> other jobs that depended on the now-manual-only jobs ?
> Can somebody suggest a fix ?

There are a couple of issues listed on GitLab main repository
reporting the same behavior. When you remove the allow_failure: true,
it is set to the default, false. As other stages may depend on that
job and it is now set to not allow failure, the pipeline is marked as
blocked.

Some people reported setting the jobs to allow_failure: true "solved"
the problem.

References:
https://gitlab.com/gitlab-org/gitlab/-/issues/39534
https://gitlab.com/gitlab-org/gitlab/-/issues/31415
https://gitlab.com/gitlab-org/gitlab-foss/-/issues/66602

>
> thanks
> -- PMM
>


