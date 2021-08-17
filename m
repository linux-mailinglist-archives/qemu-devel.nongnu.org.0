Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F23EF249
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 20:54:49 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG4Ea-0006hk-RT
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 14:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mG4DP-0005Pj-63
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mG4DL-0001Xd-Rv
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 14:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629226409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xojA692/Nz9AO8HKeABiqeJHiecjMNyT4VrUW9oQk90=;
 b=cIQXiyV0Pl1FVJzatTWdGQdhjQWeu2y/3WLBn0ebutWtJzQtdz9cCW4hRp57RHjJkyI+YZ
 3U6ZQpF37G+2m2s62DCdSK/1Zu7f39pZSWkfK7RFR+f5s/1mvffcW8xbTld3+dKNDaatSW
 klRl5mRvgZIFUHnvFckM7KoMzXZgM+w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-FNc3YQ5qP1W09X4or-mnoQ-1; Tue, 17 Aug 2021 14:53:26 -0400
X-MC-Unique: FNc3YQ5qP1W09X4or-mnoQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x18-20020a5d49120000b0290154e9dcf3dbso6916267wrq.7
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 11:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xojA692/Nz9AO8HKeABiqeJHiecjMNyT4VrUW9oQk90=;
 b=VkIZxJKz/vyz5qNXTT2oz2cksU6aBCzf7lfZ149EUueMKwZ3y6keix/1s7NALEuDOM
 ZnKNSorTTIeDjU16B7FcSsknYF7cilv7xrYw+8hRpjHzAnsE80UjR9WqbUI1LJc1RUKO
 yRDEVn9FabwfTp98ut5TbRschF9OhrECb1kO3mOaKV7bxlVx+VpYrbgXytirWJxxt+dx
 hWhv9agj9900o3+pzQWl63SjPjndIQ+rsX837ivbk7ab2VHRy4sKESNQd2mLIQFhFn2G
 ZYHOME8T8cu9YPDTktSCCBGWoyYytCyq+lmeEPZ45jcs90goSdhKYxc1/OAMn2H4XB41
 GTYg==
X-Gm-Message-State: AOAM533u4lL4bwV/DabLTAbt65qZ3iiQICm05ljcvHq4YIpt29DmnKBS
 cKkoDt1VmkXv2cxdNJw6sdxCSi2u3P+7ZUkbx1ob88Krj+UdkuzuVs8BslKSaLfnbPkw/6874Rj
 h/CoZxXxf8FxKtxI=
X-Received: by 2002:adf:f541:: with SMTP id j1mr5829014wrp.180.1629226405426; 
 Tue, 17 Aug 2021 11:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWV+3tCMP1yJoTf7EcjQFEk/i53K0LlZyW3HwcCjhuAKO6bDw4NlcTNy3DmzsE51mcsHeo2A==
X-Received: by 2002:adf:f541:: with SMTP id j1mr5828999wrp.180.1629226405267; 
 Tue, 17 Aug 2021 11:53:25 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id q17sm3304312wrr.91.2021.08.17.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 11:53:24 -0700 (PDT)
Date: Tue, 17 Aug 2021 19:53:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Using loadvm with snapshot
Message-ID: <YRwFo6tuqCxUki8T@work-vm>
References: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
 <YRvjHiZmPkSuv//z@work-vm>
 <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gabriel Southern <gsouther@qti.qualcomm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 17 Aug 2021 at 17:27, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Gabriel Southern (gsouther@qti.qualcomm.com) wrote:
> > > Hi,
> > >
> > > Are there plans to support using -loadvm with -snapshot?
> > >
> > > I saw some past discussion on mailing list including bug that was closed earlier this year but no recent activity:
> > >
> > > https://lore.kernel.org/qemu-devel/162424905685.11837.7303570061857383641.malone@loganberry.canonical.com/
> > >
> > > Testing with latest qemu it looks like -loadvm still does not work when combined with -snapshot.
> > >
> > > I'm curious how complex it would be to implement this feature and if it may show up on QEMU roadmap in the future. Or if there is alterative command that can be used to save the state of a running VM and then use the same qcow to run multiple QEMU instances loading this VM state running in snapshot mode.
> 
> Do you know why -loadvm and -snapshot don't work together?
> It doesn't on the face of it seem like they would be incompatible...

No I don't; I've never actually used -loadvm - given that both the
snapshot mechanism and the load/savevm mechanism are fairly special
qcow2 hacks, it'll be a qcow2 level thing.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


