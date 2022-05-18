Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806E52B940
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:59:17 +0200 (CEST)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIKi-0001fV-03
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrI1j-0004xX-60
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrI1g-0004m3-AE
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652873975;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IZXgwYQBWBUre2U4v4GZwP7YvUtl/5o7i0dBn9QgwA0=;
 b=PKJw7VMtqa5TUWend6pZQOplsMLTJn3BUI1tCNc+cedVfuKd5aFUMu8e0l8FmPWDBbOibf
 wvxQiI5T/okJPIXP5ijdI28eHzRCL1Im5f3GP2vj5LnBUc0GnxcnFhkCPediGUFlgiuqWw
 /O6oWf74TZBWmG/+h74S1op4FjsbSlU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-8LUZ6PFmMte1CST0_2Nkgw-1; Wed, 18 May 2022 07:39:34 -0400
X-MC-Unique: 8LUZ6PFmMte1CST0_2Nkgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so2765871wml.8
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 04:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=IZXgwYQBWBUre2U4v4GZwP7YvUtl/5o7i0dBn9QgwA0=;
 b=fQaMNdUTBfRgCWlx2HbD68EvsE2nRinh7tvEauoD3hHAJsE14k0eJ5ALD97PnSdigO
 A9C+F8uLVHbRbwFy79eAFytE7tWtp4dbSZ37khQ553d5IMOIQFVjm2Z1yejPoN0Kyovt
 DIfMI2Hr//Y/1pLyRTwjf9n7gOjB9bZT6a4ZGNtARnv48oDUL8jQr3kAE4sdC715j/Z7
 rDYGQc0nwS9nxe2zWS8qHba7oor+cG9PZAoxTNKOYtinII1jalTSp1KUnreARYMeR4Qu
 OCn3gUf14dSQOxLik3zp60IQPMX+Q4jc+Xd55FewmtMxwRJhlOkot+cFGUlhdA6dI1ec
 guRA==
X-Gm-Message-State: AOAM530vT9cTeV0wvHGSoBYuMRFKNW784ya7Gt+l4RlLxzC/x+ztnHAY
 lcIwiD8EK/Cjq23Ng35f5KE+eCxwsvdSoy3EdrCUBdAb82BMtc0SBYfnuBhLO1/g0iI3CLWgyKl
 Dl5d1H4UF+0ZKPXo=
X-Received: by 2002:a05:6000:18ac:b0:20c:ba84:1260 with SMTP id
 b12-20020a05600018ac00b0020cba841260mr23182886wri.379.1652873972866; 
 Wed, 18 May 2022 04:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv+X5F6gjpl6FfUMx34JtlPTf9RHGK1SnJ6DCPowworS0UT/HbzKRFR26Zlbmsju8hJo0j0Q==
X-Received: by 2002:a05:6000:18ac:b0:20c:ba84:1260 with SMTP id
 b12-20020a05600018ac00b0020cba841260mr23182866wri.379.1652873972685; 
 Wed, 18 May 2022 04:39:32 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 r19-20020adfb1d3000000b0020cd0762f37sm1756009wra.107.2022.05.18.04.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 04:39:32 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  Avihai Horon
 <avihaih@nvidia.com>,  qemu-devel@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>,  Mark Bloch <mbloch@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
In-Reply-To: <20220517160844.GV1343366@nvidia.com> (Jason Gunthorpe's message
 of "Tue, 17 May 2022 13:08:44 -0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
 <20220517160844.GV1343366@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 18 May 2022 13:39:31 +0200
Message-ID: <87ilq3f4ss.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, May 17, 2022 at 10:00:45AM -0600, Alex Williamson wrote:
>
>> > This is really intended to be a NOP from where things are now, as if
>> > you use mlx5 live migration without a patch like this then it causes a
>> > botched pre-copy since everything just ends up permanently dirty.
>> > 
>> > If it makes more sense we could abort the pre-copy too - in the end
>> > there will be dirty tracking so I don't know if I'd invest in a big
>> > adventure to fully define non-dirty tracking migration.
>> 
>> How is pre-copy currently "botched" without a patch like this?  If it's
>> simply that the pre-copy doesn't converge and the downtime constraints
>> don't allow the VM to enter stop-and-copy, that's the expected behavior
>> AIUI, and supports backwards compatibility with existing SLAs.
>
> It means it always fails - that certainly isn't working live
> migration. There is no point in trying to converge something that we
> already know will never converge.

Fully agree with you here.

But not how this is being done.  I think we need a way to convince the
migration code that it shouldn't even try to migrate RAM.  That would
fix the current use case, and your use case.

>> I'm assuming that by setting this new skip_precopy flag that we're
>> forcing the VM to move to stop-and-copy, regardless of any other SLA
>> constraints placed on the migration.  
>
> That does seem like a defect in this patch, any SLA constraints should
> still all be checked under the assumption all ram is dirty.

And how are we going to:
- detect the network link speed
- to be sure that we are inside downtime limit

I think that it is not possible, so basically we are skiping the precopy
stage and praying that the other bits are going to be ok.

>> It seems like a better solution would be to expose to management
>> tools that the VM contains a device that does not support the
>> pre-copy phase so that downtime expectations can be adjusted.
>
> I don't expect this to be a real use case though..
>
> Remember, you asked for this patch when you wanted qemu to have good
> behavior when kernel support for legacy dirty tracking is removed
> before we merge v2 support.

I am an ignorant on the subject.  Can I ask how the dirty memory is
tracked on this v2?

Thanks, Juan.


