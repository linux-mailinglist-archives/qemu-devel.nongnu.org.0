Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1363752D2A2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:37:50 +0200 (CEST)
Received: from localhost ([::1]:37140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfPY-0003vp-K3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfNG-0002XX-1f
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrfNC-0004P8-7d
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652963720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbgkYy4m4VFHVC37D6c6zUapc2kx6vrU9/NZ/u5fI28=;
 b=E1p4z+n5qDQW3zWkPsnJWYRFp3pymuSCcNC0MbHXmxAf541SMJbQFXLefqOr86ZIZdvEkp
 MwV3ykIcjpMuT5M/mkkUTZQWRT31s/j1u5kXNCp4Bj5sqFCLDs0Kz+BKpPjwB2QhC++A4e
 ioRaGY6SitWRGvKqbnq/uiPR+GptA4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-hQ8vx_EsOVeDBBYeImGEyQ-1; Thu, 19 May 2022 08:35:19 -0400
X-MC-Unique: hQ8vx_EsOVeDBBYeImGEyQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso1506738wro.23
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CbgkYy4m4VFHVC37D6c6zUapc2kx6vrU9/NZ/u5fI28=;
 b=fb/VdUd7LXcETmj3diwZ3ggtYk9NjiU6D9yEKURaNpcifZMmVw4u3DO6b+oo0uXcSv
 XX2mxzn85LYljV5KeIpKzB8MgxzI09f9YpK3TrrdVaV/0Y2Wlpv9GE+Q1dW7Af5n93Z4
 4rtTc948Yr8Xkbag4iLEUXagfeeWuzXBCWhnEo7w6gZ88q4zRAVf0d8Km/UPQ7fZy2Xg
 rJhIpILJfokFmmENBr1ZWXzsJayt6HswMD2uMrcnVrGtzjegcQs4+6Temz7cl5TTSrG/
 Ff/0I5JmpNw2VWfh1zXOeo3vPZ66u88ikgtljpZtrIAUbENoxyrTaB7vM7FTVzsNGy5d
 SWFQ==
X-Gm-Message-State: AOAM533fOHL6dsJlLReK6GWgxIn7ov/ScuTkCkhwIQMGBkXyYinl5tbZ
 C0bM1MRX6vzAAHEpFcAiDL9yRbPyXXresKGYsh2GEFXiZhmBijnMjLhxDkpxKrdzVmurGuVYDRL
 TQNK6vhxgXfK9FcY=
X-Received: by 2002:a5d:588d:0:b0:20c:86d5:5840 with SMTP id
 n13-20020a5d588d000000b0020c86d55840mr3897166wrf.5.1652963718460; 
 Thu, 19 May 2022 05:35:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3sD2YU3uFc19RcgC+wqcChPlNbA0ZORxmsnqYzULf9yy6lF22YzcXlCnz73VwOR56vpuvdw==
X-Received: by 2002:a5d:588d:0:b0:20c:86d5:5840 with SMTP id
 n13-20020a5d588d000000b0020c86d55840mr3897146wrf.5.1652963718239; 
 Thu, 19 May 2022 05:35:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 q21-20020adfb195000000b0020c5253d8basm5397757wra.6.2022.05.19.05.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 05:35:17 -0700 (PDT)
Date: Thu, 19 May 2022 14:35:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, ani@anisinha.ca,
 qemu-devel@nongnu.org, dan.j.williams@intel.com, jingqi.liu@intel.com,
 robert.hu@intel.com
Subject: Re: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM
 device
Message-ID: <20220519143515.16732953@redhat.com>
In-Reply-To: <0be96ded3470de79150112d8c23cad94b1ea8b46.camel@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
 <20220412065753.3216538-2-robert.hu@linux.intel.com>
 <20220427163401.20c69375@redhat.com>
 <5ceada8ba94790b07a2d651153001eead0f35705.camel@linux.intel.com>
 <20220503102742.0d5bab41@redhat.com>
 <dc177dd8eb6051ab9ab2752d657188fba83f0773.camel@linux.intel.com>
 <20220505105006.7c1e78cc@redhat.com>
 <e0f2a0ff9c2a35beb5c2ad06b522d8f6c1aaee31.camel@linux.intel.com>
 <20220506112319.175028c6@redhat.com>
 <0be96ded3470de79150112d8c23cad94b1ea8b46.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 May 2022 08:20:56 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Fri, 2022-05-06 at 11:23 +0200, Igor Mammedov wrote:
> >   
> > > 
> > > No, sorry, I didn't explain it clear.
> > > No extra interface/ABI but these 3 must _LS{I,R,W} nvdimm-sub-
> > > device
> > > methods. Of course, I'm going to extract 'SystemIO' and
> > > 'SystemMemory'
> > > operation regions out of NACL to be globally available.
> > > 
> > > The buffer (BUFF in above patch) will be gone. It is added by my
> > > this
> > > patch, its mere use is to covert param of _LS{I,R,W} into those of
> > > NACL. If I implemented each _LS{I,R,W} on their own, rather than
> > > wrap
> > > the multi-purpose NACL, no buffer needed, at least I now assume so.
> > > And, why declare the 4K buffer global to sub-nvdimm? I now recall
> > > that
> > > it is because if not each sub-nvdimm device would contain a 4K
> > > buff,
> > > which will make this SSDT enormously large.  
> > 
> > ok, lets see how it will look like when you are done.  
> 
> In ASL, can we define package with Arg in? e.g.
> 
> Name (PKG1, Package ()
>             {
>                 Arg0,
>                 Arg1,
>                 Arg2
>             })

Looking at the spec it doesn't seem to be a valid construct.
see "DefPackage :=" and "PackageElement :=" definitions.

However you can try to play with RefOf to turn ArgX into
reference (mind 'read' rules fro ArgTerm).

> But it cannot pass compilation. Any approach to achieve this? if so, we
> can still use simpler wrap scheme like v1 and save the 4K buffer.



> >   
> > > > 
> > > > So unless we have to add new host/guest ABI, I'd prefer reusing
> > > > existing one and complicate only new _LS{I,R,W} AML without
> > > > touching NACL or host side.    
> > > 
> > > As mentioned above, I assume no new host/guest ABI, just extract
> > > 'SystemIO' and 'SystemMemory' operation regions to a higher level
> > > scope.  
> > > >    
> 


