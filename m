Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986A64EB85
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:39:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69yZ-0002i3-Qv; Fri, 16 Dec 2022 07:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p69yX-0002hn-Bh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p69yU-0004nt-TQ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671194281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8/8IFNGMj3BLXz7L7z78+H/fMnGX8br74TGUQrjH9cE=;
 b=foQhhx32tdf6uGRjSjiX6h5NcRScm1a6g2jinq99dOID+upmRwqZbaUFuNIHvsu7LVpaVG
 D139ZBcVsW1Y/5FoPy1wxdsQF0l4D1I9ICPOltYil0Mx815vU/oAp8bDkqvpk/M9OQp2yv
 f/rw0wLYOkaS6OAsGYStK/qI/+qzSRg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-ZzliphRZNPaFQbJFwMcgwg-1; Fri, 16 Dec 2022 07:37:59 -0500
X-MC-Unique: ZzliphRZNPaFQbJFwMcgwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso574453wmk.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/8IFNGMj3BLXz7L7z78+H/fMnGX8br74TGUQrjH9cE=;
 b=UtMeusFJrNGPVCH3myawz3V80fQ1pagcE1fwFNbwlLOF+vgfn6/j7u+yGJaGHjZ5gW
 WvUI1J0F4SzDLLafzrO6o3QTThxReZxjXQMN8ngOHxnob6ez/I2J5KzWSXglO4v76VZZ
 ul5QWmglQ+M4EiTTgO2dLH1trBlxD2HQec5ujQmvdZp11RwaI3grlo6HPZuPmII603gD
 fuBK1OZkkz4QlpsVStgFH+doPTq9HRbyfDShY0zdYsQZ/jvt9nwbdF7hV2aDOzbILter
 Pi54XgT/imzA8IMM5RhC3Jla9HGjDIjWo/gybyJIwSpyl1juLWgrD3QBm6H8W8HhYw47
 LfBQ==
X-Gm-Message-State: ANoB5pm++G+9yqjP/Ouk08ktj0iE45w1pUAciZQFkHbyfRGlrUUs24qE
 r23+BelB2HSvGrYe4M4oOZVcf8hUXxmu8xuYXuI+oF7OPzyMaBInQDTH9NpBml1KFB8X0qny/lB
 OFQYCt7zgipPaZuY=
X-Received: by 2002:a5d:4f92:0:b0:242:18c5:7899 with SMTP id
 d18-20020a5d4f92000000b0024218c57899mr23120580wru.61.1671194278772; 
 Fri, 16 Dec 2022 04:37:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6N2TB50yq4Pny3kVGom8DyMAZQ2JgBRQPb3gPKImtkBffVNllXEQbIyCdFQnnHBqbyUEv6QA==
X-Received: by 2002:a5d:4f92:0:b0:242:18c5:7899 with SMTP id
 d18-20020a5d4f92000000b0024218c57899mr23120567wru.61.1671194278493; 
 Fri, 16 Dec 2022 04:37:58 -0800 (PST)
Received: from redhat.com ([2a06:c701:73f5:5d00:3e42:cb5a:ab89:96ba])
 by smtp.gmail.com with ESMTPSA id
 bq1-20020a5d5a01000000b00236545edc91sm2201549wrb.76.2022.12.16.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:37:57 -0800 (PST)
Date: Fri, 16 Dec 2022 07:37:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ben Widawsky <bwidawsk@kernel.org>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: Re: [PATCH v2] hw/cxl/device: Add Flex Bus Port DVSEC
Message-ID: <20221216072445-mutt-send-email-mst@kernel.org>
References: <20221213-ira-flexbus-port-v2-1-eaa48d0e0700@intel.com>
 <20221215171633.00000ac8@Huawei.com>
 <Y5tZPiiJQm4el40t@iweiny-desk3>
 <20221216093136.000026c3@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216093136.000026c3@Huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022 at 09:31:36AM +0000, Jonathan Cameron wrote:
> On Thu, 15 Dec 2022 09:28:30 -0800
> Ira Weiny <ira.weiny@intel.com> wrote:
> 
> > On Thu, Dec 15, 2022 at 05:16:33PM +0000, Jonathan Cameron wrote:
> > > On Wed, 14 Dec 2022 12:54:11 -0800
> > > Ira Weiny <ira.weiny@intel.com> wrote:
> > >   
> > > > The Flex Bus Port DVSEC was missing on type 3 devices which was blocking
> > > > RAS checks.[1]
> > > > 
> > > > Add the Flex Bus Port DVSEC to type 3 devices as per CXL 3.0 8.2.1.3.
> > > > 
> > > > [1] https://lore.kernel.org/linux-cxl/167096738875.2861540.11815053323626849940.stgit@djiang5-desk3.ch.intel.com/
> > > > 
> > > > Cc: Dave Jiang <dave.jiang@intel.com>
> > > > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > Cc: Ben Widawsky <bwidawsk@kernel.org>
> > > > Cc: qemu-devel@nongnu.org
> > > > Cc: linux-cxl@vger.kernel.org
> > > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>  
> > > Looks good to me.
> > > 
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > 
> > > As Michael wasn't cc'd on patch posting, so might not get this directly I'll add
> > > it to the front of the series adding the RAS event emulation on basis that's the
> > > first time we'll see a failure in Linux (I think?)  
> > 
> > Ah thanks!
> > 
> > Sorry, I thought you were the 'maintainer' of the CXL stuff for qemu.
> 
> Ah I am, but so far the CXL stuff has routed through Michael as PCI maintainer
> because of the high level of overlap. So far I've done that by grouping up
> patches and send them in sets to Michael. This one is more of a fix, so maybe
> wants to move quicker than I will.
> 
> This gives me a good opportunity to ask Michael:
> 
> How do you want us to handle this in future? I'd expect the overlap with the PCI
> core stuff to reduce going forwards, as most of the infrastructure is now in
> place and obviously would want you to look at anything that does touch core PCI
> code, but for the rest of it, would you prefer that I send pull requests going
> forwards?  I'm more than happy to keep dumping this stuff on you, but seems
> rather mean!
> 
> If we do move to pull requests, what scope of stuff do you want us to seek your
> review on?  If things go according to plan there will be a bunch of stuff related
> to the switch ports in the near future, some of which is going to add complex
> PCI topologies and new forms of hotplug so I'll definitely want your input on
> that, but we also have a bunch of stuff around memory error reporting etc which
> I'm thinking may be of less interest to you. Obviously I'd love it if you have
> time to review everything but don't want to impose unnecessarily.
> 
> Jonathan

It's not been too bad so far :) I'm not used to reviewing pull requests
- patches are easier if you want my review. If you are happy too then
all is well. Yes I assume if I'm CC'd directly people want my input
if not then not. And learning a bit about how error reporting works
is interesting to me.

But if you want to send some pulls directly that's fine too, at this point
I trust you to do the right thing.


> 
> > 
> > > 
> > > Michael, if you want to pick this up directly that's great too!  
> > 
> > Should I send directly to Michael in future?
> > 
> > > 
> > > As a side note the WTF? is because we made up a hardware related time delay
> > > number having no idea whatsoever on what a realistic value was. Cut and paste
> > > from the instances of this structure in the root port and the switch ports.
> > >   
> > 
> > Yep I just followed that based off the other code.
> > 
> > Ira
> > 
> > > Jonathan
> > > 
> > > 
> > >   
> > > > ---
> > > > Changes in v2:
> > > >         Jonathan                                                            
> > > >                 type 3 device does not support CACHE                        
> > > >                 Comment the 68B bit                                         
> > > > 
> > > > - Link to v1: https://lore.kernel.org/r/20221213-ira-flexbus-port-v1-1-86afd4f30be6@intel.com
> > > > ---
> > > >  hw/mem/cxl_type3.c | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > > > index 0317bd96a6fb..e6beac143fc1 100644
> > > > --- a/hw/mem/cxl_type3.c
> > > > +++ b/hw/mem/cxl_type3.c
> > > > @@ -416,6 +416,17 @@ static void build_dvsecs(CXLType3Dev *ct3d)
> > > >      cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
> > > >                                 GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
> > > >                                 GPF_DEVICE_DVSEC_REVID, dvsec);
> > > > +
> > > > +    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
> > > > +        .cap                     = 0x26, /* 68B, IO, Mem, non-MLD */
> > > > +        .ctrl                    = 0x02, /* IO always enabled */
> > > > +        .status                  = 0x26, /* same as capabilities */
> > > > +        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
> > > > +    };
> > > > +    cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
> > > > +                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
> > > > +                               PCIE_FLEXBUS_PORT_DVSEC,
> > > > +                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
> > > >  }
> > > >  
> > > >  static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
> > > > 
> > > > ---
> > > > base-commit: e11b57108b0cb746bb9f3887054f34a2f818ed79
> > > > change-id: 20221213-ira-flexbus-port-ce526de8111d
> > > > 
> > > > Best regards,  
> > >   


