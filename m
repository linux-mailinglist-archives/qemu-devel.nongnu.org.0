Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A76A85B9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlLS-0000zG-0j; Thu, 02 Mar 2023 10:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlLO-0000ym-Nt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlLM-0000VN-T7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677772783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwKGKm3x6NUbGSo6Slsb5Q+n4bjrKvL71NBIOubum6A=;
 b=S/ay0xC0tv7lR9G5M/tlRPUsFUZwl6ODpOR4DASkBnmRzMczFzRMcE6n/ugBODegFBmprZ
 imhrktCT5nTUMk+4zu/lJ9EkYGhuF9s0/2ghm+2lfCN0Mero0Y8DYMXGlW4NBfkhRwSSlX
 oQ0/wALEosiZEuQpwRYyBc4k50DVA5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-3pIY9UV7MvSsdr4EcJLIAA-1; Thu, 02 Mar 2023 10:59:42 -0500
X-MC-Unique: 3pIY9UV7MvSsdr4EcJLIAA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m15-20020adfa3cf000000b002be0eb97f4fso3290822wrb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 07:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677772781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwKGKm3x6NUbGSo6Slsb5Q+n4bjrKvL71NBIOubum6A=;
 b=XuVwop6AYFc88sT2NfD9khP5uw9o6hLPVQ9ITz568YNNIKUNcQamKDHRYTynhmmpzT
 pFZffX/kc/lVrkzO21TqmtYFnso55ApFJL7rHgsZqEtLFqE26dNhqzvUSEhFHtTpAL2B
 YGjHH01a5r1EBveXHnasK20WQ45LQJeZh8JrVb3tt2e/OoEWXY5kFgbKvMZhHJSPOX2d
 TgMp2ytNXteAYPRfgVi6mZRGMuHlAP1fcgDfFo7ZX9liwrQFuO9OoU/E7nc/3Dm/Gzh/
 ZVlFJlmyUVpd1ImdV1T5ioBVbc2NR6qjHpnHJL4CIrO/oRErYDXtK1xgUgyHE5IKLztP
 l3XA==
X-Gm-Message-State: AO0yUKVZxfyuFE76sDNWJTiFoGuEwhoq8AHaGX8HO3bJqtyHFa5+z1TQ
 jP7fkcfpXQ9vsHfTXLklzvVj4QcKXFVpxexbDYrWVjhghR60hbRAdPipr8m7N1uOkVZvwAXGf7g
 GKs/xodBE1Od3C+Q=
X-Received: by 2002:adf:f44b:0:b0:2c8:5f9d:9f6f with SMTP id
 f11-20020adff44b000000b002c85f9d9f6fmr9030534wrp.10.1677772781467; 
 Thu, 02 Mar 2023 07:59:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+/9r8nFmsxr3e4XcUzsKSSRJCwoAM2urXL9ltOpx5j12KgCbuV5WefKVvWgxewl0ZZsXw7Eg==
X-Received: by 2002:adf:f44b:0:b0:2c8:5f9d:9f6f with SMTP id
 f11-20020adff44b000000b002c85f9d9f6fmr9030521wrp.10.1677772781162; 
 Thu, 02 Mar 2023 07:59:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d458a000000b002c559def236sm15279259wrq.57.2023.03.02.07.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 07:59:40 -0800 (PST)
Date: Thu, 2 Mar 2023 16:59:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, berrange@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 14/33] tests: acpi: update expected blobs
Message-ID: <20230302165939.015af710@imammedo.users.ipa.redhat.com>
In-Reply-To: <87ilfj2m7k.fsf@suse.de>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230224153812.4176226-15-imammedo@redhat.com>
 <20230301192428-mutt-send-email-mst@kernel.org>
 <20230302130251.4ef53268@imammedo.users.ipa.redhat.com>
 <87a60vwbwj.fsf@suse.de>
 <20230302155719.357c92fa@imammedo.users.ipa.redhat.com>
 <87ilfj2m7k.fsf@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 02 Mar 2023 12:43:11 -0300
Fabiano Rosas <farosas@suse.de> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Thu, 02 Mar 2023 09:55:24 -0300
> > Fabiano Rosas <farosas@suse.de> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:
> >>   
> >> > On Wed, 1 Mar 2023 19:27:33 -0500
> >> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> >    
> >> >> On Fri, Feb 24, 2023 at 04:37:53PM +0100, Igor Mammedov wrote:    
> >> >> > only following context change:
> >> >> >  -  Local1 = Zero
> >> >> >     If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> >> >> >     {
> >> >> >         Return (Local0)
> >> >> >  ...
> >> >> >         Return (Local0)
> >> >> >     }
> >> >> > 
> >> >> >  +  Local1 = Zero
> >> >> >     Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
> >> >> > 
> >> >> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>      
> >> >> 
> >> >> Nope:
> >> >> 
> >> >> diff -ru -N -IDisassembly -IChecksum '-I*     Length           ' old/asl/tests/data/acpi/q35/DSDT.viot.dsl new/asl/tests/data/acpi/q35/DSDT.viot.dsl
> >> >> :--- old/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:57.636454958 -0500
> >> >> :+++ new/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:58.451460462 -0500
> >> >> :@@ -148,7 +148,6 @@
> >> >>                      {
> >> >>                           0x00                                             // .
> >> >>                      }
> >> >> -                Local1 = Zero
> >> >>                  If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> >> >>                  {
> >> >>                      Return (Local0)
> >> >> :@@ -159,12 +158,14 @@
> >> >>                      Return (Local0)
> >> >>                  }
> >> >>  
> >> >> +                Local1 = Zero
> >> >>                  Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
> >> >>                      ))
> >> >>                  If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
> >> >>                  {
> >> >>                      Local1 |= One
> >> >>                      Local1 |= (One << 0x07)
> >> >> +                    Local1 |= (One << 0x05)
> >> >>                  }
> >> >>  
> >> >>                  Local0 [Zero] = Local1
> >> >> 
> >> >> 
> >> >> and the funny thing is, the second change is in the expected
> >> >> file but not in the code so this patch causes the test to fail.    
> >> >
> >> > above diff is remnants of some old version of the patch before
> >> > patches were reshuffled.
> >> >
> >> > for some reason q35/viot test gets skipped => no table rebuild => stale DSDT.viot table
> >> >
> >> > reverting recently merged commit c471eb4f40, I can get q35/viot test back:
> >> >
> >> > commit c471eb4f40445908c1be7bb11a37ac676a0edae7
> >> > Author: Fabiano Rosas <farosas@suse.de>
> >> > Date:   Wed Feb 8 16:46:57 2023 -0300
> >> >
> >> >     tests/qtest: Check for devices in bios-tables-test
> >> >
> >> > so checks aren't working as expected on my host for some reason
> >> >    
> >> 
> >> Was this a legitimate skip or do we have a bug in the way we check for
> >> devices? I.e. did you have CONFIG_VIRTIO_IOMMU in the build?  
> >
> > config should be there since with your patch reverted viot test runs and passes just fine
> > so I'd assume it is a bug somewhere in check code
> >  
> 
> Probably easier to just revert the patch then. We have stopped building
> bios-tables-test.c when CONFIG_PARALLEL is not present, so the build
> --without-default-devices is already covered.
> 
> We would only need those checks if PCI_DEVICES=n or one of the
> individual CONFIGs, which we have discussed previously that is not worth
> the effort to keep track of.
> 

ok, then I'll include revert in on respin


