Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2554AB939
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:02:14 +0100 (CET)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1mf-0001as-KD
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:02:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH1iC-0008Ib-LD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH1iA-0004az-6I
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644231450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dBs/R/X2WJ0Ns1LiVfVw5w84zWZVg8swsZZOy1AXZgY=;
 b=TsOGOHcpvn9ybv54ik49i6UhxFUmJPeBlxKmVPOIEogHmzau143rlmhlu2dwi8UxnpE1Ye
 6u2IiN4JCixhyNEJtCxAqpRccnLF+ByOdcwOd32Wv7VTOAROEKW2+e1NcThHEg3OIgW7Mc
 KnLLN+Y5clrx4gFHfICkkHqOmdwypFc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-8R5d6F-YPSaE05DgVMRcnw-1; Mon, 07 Feb 2022 05:57:29 -0500
X-MC-Unique: 8R5d6F-YPSaE05DgVMRcnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so4379300wrc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 02:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dBs/R/X2WJ0Ns1LiVfVw5w84zWZVg8swsZZOy1AXZgY=;
 b=YrEGAsRX5YvT4jpZcFyt46aZ899tSahl+IvxktVHOi9F0RAptPS6wjpMnLAx7zzNN7
 PC62EgMq9BX7Snm4NqmqgXnW/AkgzSBpaEYp4cFuvl0BqiCsi+YAbp22PzawYmrOWTJz
 y+tQFxo4c707a3RAp6C9b7tf4ZW3I2NNAeRaV4rLUzvdcXFfAlMLNY/Xf9jLgdXQ8/Qy
 bFZHyDnkipOd7Elz7Sw3nXses0IrlOPsrHGJjrZxHWZkGswA8UeS8D7cg7cC/FQO0Nnp
 P++ofXNikNVhhJlssClVjuWVIejcEUtRecfDN+T+2SUAiOHJdsaOs02gYXbfI1bHL1Lk
 mJZA==
X-Gm-Message-State: AOAM530oIMKzxna0OVorVPjfrrtKgu5sUaWsBDQBl4HO0r0mCMnzPIrt
 BoVmm9GvicQEEW3b75DyO0gyoN2uLiN8uUnjIsbb85p/eC2yOk6DdboGeWgcBeFhVxFCaNLW1yy
 uPIjKAhMVeoBee2M=
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr7534051wrw.227.1644231448281; 
 Mon, 07 Feb 2022 02:57:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx0mUUNwIIChKiXQi50NzuV4CivOvErCjzdhndUnQRHHTPxRJGlQGBvCvLvHgwHoYJU8/DBQ==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr7534039wrw.227.1644231448148; 
 Mon, 07 Feb 2022 02:57:28 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id q13sm8954115wrm.58.2022.02.07.02.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 02:57:27 -0800 (PST)
Date: Mon, 7 Feb 2022 10:57:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <YgD7FZs9d1srvYG8@work-vm>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
 <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
 <20220207094717.5f92da9d@bahia>
 <a48d6e38-e420-fb34-899d-7d933b384089@amsat.org>
 <20220207114912.1efe2a27@bahia>
MIME-Version: 1.0
In-Reply-To: <20220207114912.1efe2a27@bahia>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Vivek <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Mon, 7 Feb 2022 11:30:18 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
> > On 7/2/22 09:47, Greg Kurz wrote:
> > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > Will Cohen <wwcohen@gmail.com> wrote:
> > > 
> > >> This patch set currently places it in 9p-util only because 9p is the only
> > >> place where this issue seems to have come up so far and we were wary of
> > >> editing files too far afield, but I have no attachment to its specific
> > >> location!
> > >>
> > > 
> > > Inline comments are preferred on qemu-devel. Please don't top post !
> > > This complicates the review a lot.
> > > 
> > > This is indeed a good candidate for osdep. This being said, unless there's
> > > some other user in the QEMU code base, it is acceptable to leave it under
> > > 9pfs.
> > 
> > virtiofsd could eventually use it.
> 
> 
> Indeed but virtiofsd is for linux hosts only AFAICT and I'm not aware of any
> work to support any other host OS.
> 
> Cc'ing virtio-fs people for inputs on this topic.

Indeeed, there's a lot of Linux specific code in the virtiofsd - I know
people are interested in other platforms, but I'm not sure that's the
right starting point.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


