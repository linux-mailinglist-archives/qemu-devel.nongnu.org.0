Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC0574944
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:43:03 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvN8-00062h-E8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBvAm-00049Y-UD
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBvAh-0003ir-FQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657791008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czhyjg0TKV8RN5oDm2XOMLw88Gv3IsDHBE+jwB3v/0E=;
 b=JWOqRMyi+wyhLLn5//fofe3s9yqUIM56YwA75DMK8mxVHdA9Ewfa9q4I1shlxDhoEXFa5k
 O46IqlCE3WoWjXQB2quagRrYwjRmqm/SD2PocIt92BYH6iKdoaH8bZobLSltoOzyjfsWZ3
 CPSCrcjaiozvJG2BcCmB5ZrbgaptDR4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-vn-LoMCwOp62EKW7hRkIhw-1; Thu, 14 Jul 2022 05:30:06 -0400
X-MC-Unique: vn-LoMCwOp62EKW7hRkIhw-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0043a82d9d65fso1171539edb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czhyjg0TKV8RN5oDm2XOMLw88Gv3IsDHBE+jwB3v/0E=;
 b=NgAcnNMs8CZLNdZgs+q4uM3roz4ISIoKHCjn9YQlYi3NwifYeSkr+wleDKcSfSW1uC
 9+NdRDeMKHimovhYvUTlb1fyYcJZAN2gKytK6mPpcSOJjIcFIUmqhSiWe2fRBSZLfHCl
 PmbEbqAtSdfMO6XXEz+gjqFGoY4rYgrkK9SrZ4l9AQpKTDd3gMFSwD7mfhK1aKlLsOmO
 +oUjqCBpNz5IKgK5pgPPmnGF6929kcb0Q33yVcqTNnGVF9U8rITMxMMRq+mjtQTiaD3S
 ai2nvt58ftjskZc92H5uUg5et8r/CiCKey7SyQ1oQyahHfg5bl5Ltx30E4Ka8OhmPdGm
 CCIg==
X-Gm-Message-State: AJIora+RluUgiYASn3i8LauuJN54/DVYmtI0sxkJt9v+TNv2rUP/0wpH
 Rm9bxTAAXUolgezpU9/TDieHHoEtpGAxnPSDJSLSL2Wd3TGhrhH+bgyXBodC/2zUne6TDpYMSPN
 QrUtp3oaT0xQpEIk=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr7843938ejs.190.1657791005064; 
 Thu, 14 Jul 2022 02:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tlxs9ncmS8U7m1nnDdGRRVJor1KiymAdAMzMEFSiWRP91W2goMmY2gumLAyysnm0KJSO3AUQ==
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr7843920ejs.190.1657791004824; 
 Thu, 14 Jul 2022 02:30:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090636c800b0072a815f569bsm460087ejc.185.2022.07.14.02.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:30:04 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:30:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220714113003.3a4dad47@redhat.com>
In-Reply-To: <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
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

On Tue, 12 Jul 2022 11:01:18 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 7/12/22 10:06, Igor Mammedov wrote:
> > On Mon, 11 Jul 2022 21:03:28 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> On 7/11/22 16:31, Joao Martins wrote:  
> >>> On 7/11/22 15:52, Joao Martins wrote:    
> >>>> On 7/11/22 13:56, Igor Mammedov wrote:    
> >>>>> On Fri,  1 Jul 2022 17:10:13 +0100
> >>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
[...]
> I would really love to have v7.1.0 with this issue fixed but I am not very
> confident it is going to make it :(

it still can make into current release

> 
> Meanwhile, let me know if you have thoughts on this one:
> 
> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
> 
> I am going to assume that if no comments on the above that I'll keep things as is.
> 
> And also, whether I can retain your ack with Bernhard's suggestion here:
> 
> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
> 
> >> +        hwaddr maxusedaddr = pc_pci_hole64_start() + pci_hole64_size;
> >> +
> >> +        /* Bail out if max possible address does not cross HT range */
> >> +        if (maxusedaddr >= AMD_HT_START) {
> >> +            pc_set_amd_above_4g_mem_start(pcms, maxusedaddr);
> >> +        }
> >> +
> >> +        /*
> >> +         * Advertise the HT region if address space covers the reserved
> >> +         * region or if we relocate.
> >> +         */
> >> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
> >> +            cpu->phys_bits >= 40) {
> >> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> >> +        }
> >> +    }
> >> +
> >> +    /*
> >>       * Split single memory region and use aliases to address portions of it,
> >>       * done for backwards compatibility with older qemus.
> >>       */
> >>  
> >   
> 


