Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BB50B2BB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:19:29 +0200 (CEST)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhoVk-0005WU-2Y
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhoTV-0004GM-PC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nhoTR-0002xe-A9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650615424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IPSBV3Q3sLOVwNp88/jjA3zX1YK9CUoBSqr8xgHxyno=;
 b=ZignYgG4bgHRHtJYzDVqlOrjdZdICyj/vwdmjwpcM0yGWqY5ymAOeQzdjlZAOfyHDtuOsM
 Zn8548WBSCKWgllEDqtsaYysN9itsKAp7FJ9wXy7TVt33yn5NBny8inTNM5EzyFG8M+ZeO
 V1fFPuY7j/cJKGzVVXmYXA8Jos/n1MI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-qFFDZOpAPjWO56nPNDyqjw-1; Fri, 22 Apr 2022 04:17:00 -0400
X-MC-Unique: qFFDZOpAPjWO56nPNDyqjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020adf9bcd000000b0020aa78ef365so1624537wrc.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 01:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IPSBV3Q3sLOVwNp88/jjA3zX1YK9CUoBSqr8xgHxyno=;
 b=HQ6bCGtZMN4yW74q76xc+X1cILomlrWonCmq9Vmzam9/JoHIlwH+sZxU/JS4c+eImW
 OMvc+ALezpNOWthfy6swP5lvN+ERQATlvmql5kvc3p3Z4kxyL9uS/pvJTtPrOpRTYLY8
 PlfYgViNYmwf5UjGDIbc1//vzEuGm69cnkDke80/8V/xHH4x1hrDO8MEP8+Rf0U0aFtr
 0PN53Nz60VZyMu0cgGuUk4r/ab1lUDxyXw+4k6PKkrUxznXTD3qr0JKJFbfEE6FnW1IR
 fHUzOG8V5mysSN/k6uWEa+YpCsT20419LIzgdreejSiD4SEeVBi+exN5+9GhPlur0MDM
 ZD+g==
X-Gm-Message-State: AOAM533La6hy2ev5VO7pzAx54nNxHJKtetynvl8q54QDDmLuwTWryxuG
 e0+4BH2kYSR46i1x9AtDpVwcTZ4PLO3tiXUEN28KKEydeg1lvOfQC82sFey3XRCdNmMyZCQENTP
 CZPiLmynrcZ0C6iM=
X-Received: by 2002:a05:600c:3507:b0:392:8dea:ef21 with SMTP id
 h7-20020a05600c350700b003928deaef21mr3040073wmq.74.1650615419306; 
 Fri, 22 Apr 2022 01:16:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLKvOD9W64FbKfzAPy6XfPHEgnKANI2GaOgvn+rjDbldcz3cDq3H76KGxcQ1yAVdF/iAsZLg==
X-Received: by 2002:a05:600c:3507:b0:392:8dea:ef21 with SMTP id
 h7-20020a05600c350700b003928deaef21mr3040054wmq.74.1650615419063; 
 Fri, 22 Apr 2022 01:16:59 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:107d:f9b5:bcf:cc21:25f8:ae83])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm3958448wmi.17.2022.04.22.01.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 01:16:58 -0700 (PDT)
Date: Fri, 22 Apr 2022 04:16:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of
 common x86 base machine type
Message-ID: <20220422041637-mutt-send-email-mst@kernel.org>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
 <20220310080630-mutt-send-email-mst@kernel.org>
 <37534451-b4b6-4547-a43b-ca0965b384d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37534451-b4b6-4547-a43b-ca0965b384d4@intel.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 08:50:45AM +0800, Xiaoyao Li wrote:
> On 3/10/2022 9:07 PM, Michael S. Tsirkin wrote:
> > On Thu, Mar 10, 2022 at 08:28:09PM +0800, Xiaoyao Li wrote:
> > > For PIT, it's straightforward to merge microvm::pit and
> > > pc_machine::pit_enabled into x86ms::pit
> > > 
> > > For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
> > > ability to dis-/en-able PIC and it's the preparation for future TDX
> > > support.
> > 
> > 
> > Looks ok but we are in freeze. I will tag this but pls do ping me
> > after the release to make sure it's not lost. Thanks!
> 
> Michael,
> 
> Hope they won't get lost :)

Will be in the next pull.
Thanks for the reminder!

> > > ---
> > > Resend:
> > >   - collect Reviewed-by;
> > >   - rebase to 2048c4eba2b4 ("Merge remote-tracking branch 'remotes/philmd/tags/pmbus-20220308' into staging")
> > > 
> > > Xiaoyao Li (2):
> > >    hw/i386: Make pit a property of common x86 base machine type
> > >    hw/i386: Make pic a property of common x86 base machine type
> > > 
> > >   hw/i386/microvm.c         | 54 ++-------------------------------------
> > >   hw/i386/pc.c              | 24 +++--------------
> > >   hw/i386/pc_piix.c         |  4 ++-
> > >   hw/i386/pc_q35.c          |  4 ++-
> > >   hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
> > >   include/hw/i386/microvm.h |  4 ---
> > >   include/hw/i386/pc.h      |  2 --
> > >   include/hw/i386/x86.h     |  4 +++
> > >   8 files changed, 65 insertions(+), 81 deletions(-)
> > > 
> > > -- 
> > > 2.27.0
> > 


