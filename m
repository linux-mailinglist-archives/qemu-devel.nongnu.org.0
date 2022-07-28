Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4E584308
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:24:34 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5NJ-0006QM-9l
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH5Aw-0002dJ-Jr
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH5Au-0005LW-Mt
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659021104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Fxpl60zAyEoxJZOb074sYjEHyQMTlN42THtevp4wVE=;
 b=gn4b2cgc4uQ13rlqzmrN953DYg6RHe6G3OYYH7gya35sOXR0eJMWjC+ZNSVeruuvUE371B
 a6T2Y2pcWJRkJpxf/DNi8tG1OSsxHklTaDmU2opsvA0fdHAMeRzMgljIMtY34qcUIstmn/
 LZ0bPlCs3PcsCyCSx2nu71UBFM0nViI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-V7fyQDSONAiwbq8usaeFFA-1; Thu, 28 Jul 2022 11:11:42 -0400
X-MC-Unique: V7fyQDSONAiwbq8usaeFFA-1
Received: by mail-qv1-f71.google.com with SMTP id
 lp8-20020a056214590800b004744f4ad562so1498202qvb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7Fxpl60zAyEoxJZOb074sYjEHyQMTlN42THtevp4wVE=;
 b=CD8IhOeJCHAVvW/kjVw82DS74QOnWQQARYR8GVDc+YVxzSTYQ1H+IGpAUBxSSnFw8A
 AXd/uxHFVd6q9ZPaGSZxSzn+qETHmdVs40zFEFWwM+lD0Wx4rGKM3egEf/F3RVt0E4+c
 sPZw22HcZMIw8Gqe3uMyd6p1L8OUOTJXmkZ6/2T6RfZPASl+7wESpLE47T+ehjspXwvX
 rEfk60h6Zj5xEuCYRFi8ArHSIfMGobhdq5YRq5+v31zKZXk4+2iZ+2h7U1cniFIX2pGP
 KkOM+kE+ZU6myTCPY3ZmtqA+tJd7k2X2l1xF5S6QU1MW4PL24PZzR7ipN91GK3bfzVpD
 CNbA==
X-Gm-Message-State: AJIora9Ji8SvBb78uExoS01WNOMzApBqKDrwo4gX5/QawvsVWXKrXiT8
 gKVG7YB2edmmEnHTudhQeYScU/xmCUaVO3rO9s47fGItLk7MtAQeIQi8sKKcVEE/1J4RyoqJwLi
 JLAtgPRQlDsJfRac=
X-Received: by 2002:ac8:5cc3:0:b0:31f:782:8588 with SMTP id
 s3-20020ac85cc3000000b0031f07828588mr23626232qta.594.1659021102324; 
 Thu, 28 Jul 2022 08:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3n2ylSPoupQgT+hlvJXblKVQPHVPqezw1oBbDVw5OlU5vjqwE1t0Fq4eebXrUNjHtH+3yMg==
X-Received: by 2002:ac8:5cc3:0:b0:31f:782:8588 with SMTP id
 s3-20020ac85cc3000000b0031f07828588mr23626209qta.594.1659021102085; 
 Thu, 28 Jul 2022 08:11:42 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 fu10-20020a05622a5d8a00b0031f319ce7cesm578849qtb.73.2022.07.28.08.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 08:11:41 -0700 (PDT)
Date: Thu, 28 Jul 2022 11:11:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 0/2] migration-test: Allow test to run without uffd
Message-ID: <YuKnLOHbJ5iktZld@xz-m1.local>
References: <20220728133516.92061-1-peterx@redhat.com>
 <10edefb1-3764-d0e5-f4be-0738224fcb04@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10edefb1-3764-d0e5-f4be-0738224fcb04@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 28, 2022 at 04:44:49PM +0200, Thomas Huth wrote:
> On 28/07/2022 15.35, Peter Xu wrote:
> > v2:
> > - Fix warning in patch 1 [Thomas]
> > - Collected R-b for Daniel
> > 
> > Compare to v1, this added a new patch as reported by Thomas to (hopefully)
> > allow auto-converge test to pass on some MacOS testbeds.
> > 
> > Please review, thanks.
> > 
> > Peter Xu (2):
> >    migration-test: Use migrate_ensure_converge() for auto-converge
> >    migration-test: Allow test to run without uffd
> > 
> >   tests/qtest/migration-test.c | 67 +++++++++++++++---------------------
> >   1 file changed, 27 insertions(+), 40 deletions(-)
> 
> Seems to work now:
> 
> https://api.cirrus-ci.com/v1/task/4760264934424576/logs/build.log
> 
> Citing:
> 
> " 2/59 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         OK
> 218.87s   33 subtests passed"
> 
> Tested-by: Thomas Huth <thuth@redhat.com>

Thanks!

-- 
Peter Xu


