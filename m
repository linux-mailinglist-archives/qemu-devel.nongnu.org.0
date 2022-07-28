Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671358415D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:33:53 +0200 (CEST)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4aF-0006Ny-7K
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH403-0004ce-RH
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH400-0002Ud-71
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659016582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzeK8l/uhh2RfJXF9pYM//ZAFUY+QQVx2w6hysVQfyA=;
 b=XqLqCannSyPdVeNLsD3h2kEDaprXBikiKUZh0R1S0JiVOivj8FKsFz7gOL7KXuoQu8lHh6
 pg+Aq1r9j4dCpt8rnPnwf1uxt6j6hgzwG1L8q5pRldGpaW1+suCbZj/LnsNVI3FC7Qzw5e
 hxOa9ZxU6pQ2HLtofLVTqxxsP2rnUFA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-lQsUJLwYMYyG9a3GkXCcfA-1; Thu, 28 Jul 2022 09:56:21 -0400
X-MC-Unique: lQsUJLwYMYyG9a3GkXCcfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 e6-20020a056402190600b0043bde36ab23so1162341edz.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzeK8l/uhh2RfJXF9pYM//ZAFUY+QQVx2w6hysVQfyA=;
 b=vleP+WF5gdAnbgdwIiqLLFd0P8XFEUeNW87k+y+F8g/Py9lUqgx/CCFLMaeM1j2olk
 hgM1yp2M10bBBHcn+ot+ogpl5ARMfnTDJXJjs6LF1/t3gQKWqX9eGwZtjjz47Yz+/vda
 MijGjrX15cMMUBkACVhcPbDk7ZFC7SbS0HfWY3CINH9flllvK+RBOWd5MDTU3Zj+FBYW
 ds61ti8I/sQTGp6tzGLAgPd6oq2kHv4xY3TKt4mrKFG5R6QhIGrioW1i/5bKlSJawW+q
 VgYNxUkbB4HBGCHXfjWwQBoKGAU7yNBhjFM82uR/Pi7o1SEB2cUCNV0WQMdKv8M75sZ9
 ibMg==
X-Gm-Message-State: AJIora/SQkqx9aCTJzryObpvJCppmoNy19Fqg+LgySW6g9Zf/M6YFa84
 i7IFJpFSfup+MpVanZ6r+/bJEFqA3akH9rAlLMOvxk88iZ188cYJ2Jn16sgy5qm77I3RD8irbur
 NEuUCTj1qtLSN12c=
X-Received: by 2002:a17:907:2cd3:b0:72b:5cc2:bc1f with SMTP id
 hg19-20020a1709072cd300b0072b5cc2bc1fmr20747961ejc.574.1659016580022; 
 Thu, 28 Jul 2022 06:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v/Wp9CFeFCCLrSsPscRefsCFJJMjFEMt0m//2qi2v8fgpX1ZbFUyoGPrJhRbdCCU7dofFG0w==
X-Received: by 2002:a17:907:2cd3:b0:72b:5cc2:bc1f with SMTP id
 hg19-20020a1709072cd300b0072b5cc2bc1fmr20747937ejc.574.1659016579561; 
 Thu, 28 Jul 2022 06:56:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709067c4a00b0072ab06bf296sm452703ejp.23.2022.07.28.06.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:56:19 -0700 (PDT)
Date: Thu, 28 Jul 2022 15:56:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Huang Rui <ray.huang@amd.com>
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>, kraxel@redhat.com, mst@redhat.com
Subject: Re: Question to mem-path support at QEMU for Xen
Message-ID: <20220728155618.2c390be3@redhat.com>
In-Reply-To: <YuI4HXKaRnnS9foV@amd.com>
References: <Yt+XS81vmsWoJA5y@amd.com> <20220727101930.66ed56e1@redhat.com>
 <YuI4HXKaRnnS9foV@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Thu, 28 Jul 2022 15:17:49 +0800
Huang Rui <ray.huang@amd.com> wrote:

> Hi Igor,
> 
> Appreciate you for the reply!
> 
> On Wed, Jul 27, 2022 at 04:19:30PM +0800, Igor Mammedov wrote:
> > On Tue, 26 Jul 2022 15:27:07 +0800
> > Huang Rui <ray.huang@amd.com> wrote:
> >   
> > > Hi Anthony and other Qemu/Xen guys,
> > > 
> > > We are trying to enable venus on Xen virtualization platform. And we would
> > > like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> > > options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> > > supported with Xen. I verified the same function on KVM.
> > > 
> > > qemu-system-i386: -mem-path not supported with Xen
> > > 
> > > So may I know whether Xen has any limitation that support
> > > memory-backend-memfd in QEMU or just implementation is not done yet?  
> > 
> > Currently Xen doesn't use guest RAM allocation the way the rest of
> > accelerators do. (it has hacks in memory_region/ramblock API,
> > that divert RAM allocation calls to Xen specific API)  
> 
> I am new for Xen and QEMU, we are working on GPU. We would like to have a
> piece of backend memroy like video memory for VirtIO GPU to support guest
> VM Mesa Vulkan (Venus). Do you mean we can the memory_region/ramblock APIs
> to work around it?
> 
> > 
> > The sane way would extend Xen to accept RAM regions (whatever they are
> > ram or fd based) QEMU allocates instead of going its own way. This way
> > it could reuse all memory backends that QEMU provides for the rest of
> > the non-Xen world. (not to mention that we could drop non trivial
> > Xen hacks so that guest RAM handling would be consistent with other
> > accelerators)
> >   
> 
> May I know what do you mean by "going its own way"? This sounds good, could
> you please elaborate on how can we implement this? We would like to give a
> try to address the problem on Xen. Would you mind to point somewhere that I
> can learn and understand the RAM region. Very happy to see your
> suggestions!

see for example see ram_block_add(), if Xen could be persuaded to use memory
allocated by '!xen_enabled()' branch then it's likely file base backends
would also become usable.

Whether it is possible for Xen or not I don't know,
I guess CCed Xen folks will suggest something useful.
 
> Thanks & Best Regards,
> Ray
> 


