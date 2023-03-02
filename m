Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F286A84B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkNB-0006if-46; Thu, 02 Mar 2023 09:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXkN9-0006iT-DC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:57:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXkN7-0002PY-TB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677769049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxK9TA6BZCQQcUfa4nzixKJSQIYUcIKOeerqhH/fhNs=;
 b=GmWyufNtp9Y1HVdCe9GV7iYcHF/0XrL8WQZUKVyE+r7Fnww3dfi46kDRJhEAAT/wow/uYB
 MWnKIsZz19ZxuH8E2+R9CuUO9rHJJ+RRUFFUsegebhK/iP4rMNCsuJc5AW5V5AMm96m89m
 zDXbGX6qFaNmN9yvOKG+Rf2vgShtwT4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-SPH0xmhYP2WgZpL9rKjIRg-1; Thu, 02 Mar 2023 09:57:25 -0500
X-MC-Unique: SPH0xmhYP2WgZpL9rKjIRg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so3235862wrb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677769044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxK9TA6BZCQQcUfa4nzixKJSQIYUcIKOeerqhH/fhNs=;
 b=bvZalVr4AAW/sEPy4PWiTFh+6dcpl4KlmYsMl0ekqsl2J6W99QdDCMYS0Q19QoYvNH
 +qfMCzr31Q9iVIIS0amEwl2I7edotW6Fx5XkupPfG6X8tbtokJTluumeU3+HoiBkIoeX
 Lv3yxjnf2QOjjiggxOPldXapie1wQgCorymhsh8ZX9hEtQG5ZMsSxcHmfnX7vYL7toPa
 bWXcj8a/j0rzNsDFntnvK4Zs6NPxS3YIliEDWj0oZQsv9O5dZkE4wESSHuS8HfiJbw20
 P7F21UTnlJvFMT0eeHL32yLJ0bRChaRXQUmEdlKzj2qV/zTBN7BfBVniJgfx7otGR4I5
 8UgQ==
X-Gm-Message-State: AO0yUKX093jmx7ZtcqrwQ1UDAcUciBt2OQZX3MhmvWOhIazL+6XYp5PY
 iZws2wjOp/AFl+uq6FCd7FmQeVuMstFQyh/hrEOQNhZ6Ms0y2RA3PyE/apYFm4yAuZhuYsMKYmU
 +YtnO0/oTJ+XJvcE=
X-Received: by 2002:a05:600c:45d2:b0:3e2:1f63:4beb with SMTP id
 s18-20020a05600c45d200b003e21f634bebmr8495453wmo.19.1677769044335; 
 Thu, 02 Mar 2023 06:57:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8VncSQBrBbrtbuzZdybK+3fHd1s9C1XllFKcSjBsnwVQ91hcvbRmWig/qvNJWSSWEOeTYOww==
X-Received: by 2002:a05:600c:45d2:b0:3e2:1f63:4beb with SMTP id
 s18-20020a05600c45d200b003e21f634bebmr8495430wmo.19.1677769043982; 
 Thu, 02 Mar 2023 06:57:23 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adfeb02000000b002cda9aa1dc1sm5227989wrn.111.2023.03.02.06.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:57:20 -0800 (PST)
Date: Thu, 2 Mar 2023 15:57:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, berrange@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 14/33] tests: acpi: update expected blobs
Message-ID: <20230302155719.357c92fa@imammedo.users.ipa.redhat.com>
In-Reply-To: <87a60vwbwj.fsf@suse.de>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230224153812.4176226-15-imammedo@redhat.com>
 <20230301192428-mutt-send-email-mst@kernel.org>
 <20230302130251.4ef53268@imammedo.users.ipa.redhat.com>
 <87a60vwbwj.fsf@suse.de>
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

On Thu, 02 Mar 2023 09:55:24 -0300
Fabiano Rosas <farosas@suse.de> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Wed, 1 Mar 2023 19:27:33 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >  
> >> On Fri, Feb 24, 2023 at 04:37:53PM +0100, Igor Mammedov wrote:  
> >> > only following context change:
> >> >  -  Local1 = Zero
> >> >     If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> >> >     {
> >> >         Return (Local0)
> >> >  ...
> >> >         Return (Local0)
> >> >     }
> >> > 
> >> >  +  Local1 = Zero
> >> >     Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
> >> > 
> >> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>    
> >> 
> >> Nope:
> >> 
> >> diff -ru -N -IDisassembly -IChecksum '-I*     Length           ' old/asl/tests/data/acpi/q35/DSDT.viot.dsl new/asl/tests/data/acpi/q35/DSDT.viot.dsl
> >> :--- old/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:57.636454958 -0500
> >> :+++ new/asl/tests/data/acpi/q35/DSDT.viot.dsl  2023-03-01 19:22:58.451460462 -0500
> >> :@@ -148,7 +148,6 @@
> >>                      {
> >>                           0x00                                             // .
> >>                      }
> >> -                Local1 = Zero
> >>                  If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> >>                  {
> >>                      Return (Local0)
> >> :@@ -159,12 +158,14 @@
> >>                      Return (Local0)
> >>                  }
> >>  
> >> +                Local1 = Zero
> >>                  Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
> >>                      ))
> >>                  If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
> >>                  {
> >>                      Local1 |= One
> >>                      Local1 |= (One << 0x07)
> >> +                    Local1 |= (One << 0x05)
> >>                  }
> >>  
> >>                  Local0 [Zero] = Local1
> >> 
> >> 
> >> and the funny thing is, the second change is in the expected
> >> file but not in the code so this patch causes the test to fail.  
> >
> > above diff is remnants of some old version of the patch before
> > patches were reshuffled.
> >
> > for some reason q35/viot test gets skipped => no table rebuild => stale DSDT.viot table
> >
> > reverting recently merged commit c471eb4f40, I can get q35/viot test back:
> >
> > commit c471eb4f40445908c1be7bb11a37ac676a0edae7
> > Author: Fabiano Rosas <farosas@suse.de>
> > Date:   Wed Feb 8 16:46:57 2023 -0300
> >
> >     tests/qtest: Check for devices in bios-tables-test
> >
> > so checks aren't working as expected on my host for some reason
> >  
> 
> Was this a legitimate skip or do we have a bug in the way we check for
> devices? I.e. did you have CONFIG_VIRTIO_IOMMU in the build?

config should be there since with your patch reverted viot test runs and passes just fine
so I'd assume it is a bug somewhere in check code

> If we avoid the checks during rebuild and a device is not present in the
> build anyway, then that QEMU invocation would crash.
I'd take crash anytime vs watching over for successful SKIP,
so we wouldn't end up with stale tables when they should be actually updated
like it happened in this case.


