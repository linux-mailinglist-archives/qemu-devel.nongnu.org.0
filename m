Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9808B4C2CE8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:24:49 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNE6y-0001v8-4o
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNE42-0000aA-82
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:21:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNE3y-0007Ts-I2
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645708901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4Ar2h/8kbyBcTZzdA42id5FZONTwO0pc2nVol1EuV8=;
 b=O8/9gkIFKtUqTxjGvzkkIDZcoIi7mfUzbEGThTpzkzV7tA0iI8mh0CBqO5scxKCbc+C9gY
 tRsiQ6/Fdmy2WeNNvQZz4Bi7L64gMrv5ZTjEiVGlWZtrJ7oXZH7B2kAyuAqgTNBdR+4zXR
 gyWyuvZQHb+n0Y5DqLngFWszyG+RYuk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-g9XgvzGjPMKY5VnVVz-X4g-1; Thu, 24 Feb 2022 08:21:38 -0500
X-MC-Unique: g9XgvzGjPMKY5VnVVz-X4g-1
Received: by mail-ed1-f72.google.com with SMTP id
 eq13-20020a056402298d00b00412cfa4bb0eso727428edb.7
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4Ar2h/8kbyBcTZzdA42id5FZONTwO0pc2nVol1EuV8=;
 b=QQJIVCCOjsncNSA5aWqE7hi4ZHOCorY8sYFP/hQXxz+l47jqinEqch/bLd4//FxKUL
 ZQYzZIb4w3BDzIy2rdwrgywZ7+/X2pK7NZvvILw1SjuzjoAiqx3Z+IzDguqyA+kSnl2k
 qJDPtqm++AC9+d5Y5dAMWDrg1uNtCxHhTRSRR8gc0+o7jK+E1hzBxFC3qXA9SMShlxUJ
 AES0IDR+KE6E2JjSQpRhdUP3mllfqSwVFzMF9q67H6y11WCAsIlxxIKoIOL7ZY8rd22i
 SlVQ+D0vGN+mA+fHGajXc0g3uVcC4WgeygCLFMLX91bWnFSDyU4B5euF+8bnt7XEo+4s
 Y+ZQ==
X-Gm-Message-State: AOAM531b5YxcTOB/M+7VgRtIK69w2Ilgw/qboE2Wn//0VR5l5/QVXNrw
 hprkTWNW2+xZACO5fN0C/fOx21K9FRTvOTuhUQ1sCakNFTO/oy4axDXfcW1/KVPKpeWqFuy63qh
 KHW5L994RtqLv4w0=
X-Received: by 2002:aa7:c90c:0:b0:410:a178:319f with SMTP id
 b12-20020aa7c90c000000b00410a178319fmr2251530edt.451.1645708896774; 
 Thu, 24 Feb 2022 05:21:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0era9+GAoLQ/hyCEeaw9DolsfxL6KFO7hx0ZLTCjfWIvrwJ9axl1Yptv+OzE7ALrqIPsL6Q==
X-Received: by 2002:aa7:c90c:0:b0:410:a178:319f with SMTP id
 b12-20020aa7c90c000000b00410a178319fmr2251503edt.451.1645708896535; 
 Thu, 24 Feb 2022 05:21:36 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z6sm1364584ejd.96.2022.02.24.05.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:21:36 -0800 (PST)
Date: Thu, 24 Feb 2022 14:21:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
Message-ID: <20220224142135.69fa8a0b@redhat.com>
In-Reply-To: <CAARzgwyTsbpxHAko9iLE1RSeuJCAEvRywdQ25e93oLkvSWP8GA@mail.gmail.com>
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <20220223100410.756ffe35@redhat.com>
 <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
 <20220224100345.2bdfc9d9@redhat.com>
 <CAARzgwyTsbpxHAko9iLE1RSeuJCAEvRywdQ25e93oLkvSWP8GA@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 18:14:35 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Thu, Feb 24, 2022 at 2:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 23 Feb 2022 17:30:34 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > On Wed, Feb 23, 2022 at 2:34 PM Igor Mammedov <imammedo@redhat.com> wrote:  
> > > >
> > > > On Thu, 10 Feb 2022 18:58:21 +0530
> > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > >  
> > > > > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > > > > entries. This is incorrect. We should simply return early with the count of
> > > > > the number of reserved entries added.  
> > > >
> > > > can you expand commit message to explain what's wrong and
> > > > how problem manifests ... etc.  
> > >
> > > The issue has been present for the last 8 years without apparent
> > > visible issues. I think the only issue is that the bug allocates more
> > > memory in the firmware than is actually needed.  
> >
> > let me repeat: Why do you think it's an issue or why it's wrong  
> 
> Allocating more memory than what we need unnecessarily bloats up the
> rom. We should not be allocating memory that we do not use.

see how firmware uses "etc/e820" fwcfg file first, to make up
mind on 'need' part.

> 
> >  
> > >  
> > > >  
> > > > >
> > > > > fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> > > > > cc: kraxel@redhat.com
> > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > ---
> > > > >  hw/i386/e820_memory_layout.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > > > > index bcf9eaf837..afb08253a4 100644
> > > > > --- a/hw/i386/e820_memory_layout.c
> > > > > +++ b/hw/i386/e820_memory_layout.c
> > > > > @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> > > > >          entry->type = cpu_to_le32(type);
> > > > >
> > > > >          e820_reserve.count = cpu_to_le32(index);
> > > > > +
> > > > > +        return index;
> > > > >      }  
> > > >
> > > > this changes e820_table size/content, which is added by fw_cfg_add_file() to fwcfg,
> > > > as result it breaks ABI in case of migration.  
> > >
> > > Ugh. So should we keep the bug? or do we add config setting to handle
> > > the ABI breakage.
> > >  
> >  
> 


