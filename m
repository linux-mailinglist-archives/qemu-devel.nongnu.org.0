Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2825BE254
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 11:48:29 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaZrf-00073V-Hr
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 05:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oaZJi-0005cA-9e
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oaZJU-0007nI-MK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663665186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flhXrL++0LjPhYwvF5uTaOnNyC3rtQq57AEY3SCvkvo=;
 b=VSRpJze5s7aBbrp52E6zTjixmQEBNwWVfEDQT/gQFS5YTT6tE6JZhrHw5fwp4RoRc/+rtk
 FtnxHkVODAh03O5l/1UdCC66n2l+w+219PBsed226D8iVqWpni+UmZdWpJwyBVcjJK9o50
 sLjisZDOV91FRk84qnYJLYCOQADaVAg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-MQQPi1SiPsiQJGl4DJ83oA-1; Tue, 20 Sep 2022 05:13:05 -0400
X-MC-Unique: MQQPi1SiPsiQJGl4DJ83oA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so1421423edd.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 02:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=flhXrL++0LjPhYwvF5uTaOnNyC3rtQq57AEY3SCvkvo=;
 b=EcHA3hHT3Odtv15RFa/q8iGq8pxwqKRVGqW+4K3vFK5/FICNIX+9EzDuNWgvbeI7EH
 SoGBf+riudFvUynnyQwCFCGy5H0F1cKkSlvYopjNkx4V0NXFaWjllAzZvzNCJlqbJv7D
 lXpSmdbaGB7aqwO+nPMo2okcETLBv00z9F3fVn8bXqbdGvOxA+qnjRt7n7lB548lDsTg
 o3he91+AFJsTeYbkIN/+gMc9AFoWLoYSp44WE2gjxz7TF0mlMASbvUTBn22yDjMotKJF
 Ddzi3v9ZkZcD4i3XNZ45Kil4g5kJDxoWO/gJQNlt4URVsCv/uA/jEDLSDvXyT9hLvcww
 xvWw==
X-Gm-Message-State: ACrzQf2ErhwY5AdrRaxybjNlGCYfHgzRR4ToRBc0PXm9ekvSqztRCyyG
 a3kqF18kOsymClw5kSsTUeGw2+vND62pk1CDSWdgMu8AyOiKuvIK18R4v52a9A07XlNk5yPNOSz
 +i2Jsj9VGz5MBwnw=
X-Received: by 2002:a05:6402:1a4f:b0:44e:f731:f7d5 with SMTP id
 bf15-20020a0564021a4f00b0044ef731f7d5mr18957926edb.357.1663665184031; 
 Tue, 20 Sep 2022 02:13:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Uc4np1S5GiNeOThtBO0fJmHbYz4Su407Uevcn+IKw/jzNXR5aiQFGfaPAQYNIkyYomNd/fA==
X-Received: by 2002:a05:6402:1a4f:b0:44e:f731:f7d5 with SMTP id
 bf15-20020a0564021a4f00b0044ef731f7d5mr18957913edb.357.1663665183810; 
 Tue, 20 Sep 2022 02:13:03 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k20-20020aa7c394000000b00447e5983478sm905453edq.76.2022.09.20.02.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 02:13:03 -0700 (PDT)
Date: Tue, 20 Sep 2022 11:13:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220920111302.0c1716af@redhat.com>
In-Reply-To: <80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
 <20220916093757.689a939f@redhat.com>
 <80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Sep 2022 21:15:35 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Fri, 2022-09-16 at 09:37 +0200, Igor Mammedov wrote:
> 
> > > Fine, get your point now.
> > > In ASL it will look like this:
> > >                     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> > >                     Return (Local1)  
> > 
> >   
> > > 
> > > But as for 
> > >                     CreateDWordField (Local0, Zero, STTS)  //
> > > Status
> > >                     CreateDWordField (Local0, 0x04, SLSA)  //
> > > SizeofLSA
> > >                     CreateDWordField (Local0, 0x08, MAXT)  // Max
> > > Trans
> > > 
> > > I cannot figure out how to substitute with LocalX. Can you shed
> > > more
> > > light?  
> > 
> > Leave this as is, there is no way to make it anonymous/local with
> > FooField.
> > 
> > (well one might try to use Index and copy field's bytes into a buffer
> > and
> > then explicitly convert to Integer, but that's a rather convoluted
> > way
> > around limitation so I'd not go this route)
> >   
> OK, pls. take a look, how about this?
> 
> Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
> {   
>     Local0 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> 0x02, 0x04, Zero, One)    // Buffer
>     CreateDWordField (Local0, Zero, STTS)  // Status
>     CreateDWordField (Local0, 0x04, SLSA)  // Size of LSA
>     CreateDWordField (Local0, 0x08, MAXT)  // Max Transfer Size
>     Local1 = Package (0x3) {STTS, SLSA, MAXT}
>     Return (Local1)
> }
> 
> Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
> {
>     Name (INPT, Buffer(8) {})
>     CreateDWordField (INPT, Zero, OFST);
>     CreateDWordField (INPT, 4, LEN);
why do you have to create and use INPT, wouldn't local be enough to keep the buffer?

>     OFST = Arg0
>     LEN = Arg1
>     Local0 = Package (0x01) {INPT}
>     Local3 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> 0x02, 0x05, Local0, One)
>     CreateDWordField (Local3, Zero, STTS)
>     CreateField (Local3, 32, LEN << 3, LDAT)
>     Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
>     Return (Local1)
> }
> 
> Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
> {
>     Local2 = Arg2
>     Name (INPT, Buffer(8) {})
ditto

>     CreateDWordField (INPT, Zero, OFST);
>     CreateDWordField (INPT, 4, TLEN);
>     OFST = Arg0
>     TLEN = Arg1
>     Concatenate(INPT, Local2, INPT)
>     Local0 = Package (0x01)
>     {
>         INPT
>     }
>     Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"),
> 0x02, 0x06, Local0, One)
>     CreateDWordField (Local3, 0, STTS)
>     Return (STTS)
> }
> 
> 
> 


