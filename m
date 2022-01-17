Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5CD49047A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:57:55 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Npq-0007sY-Nr
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n9NlL-0004Nw-R8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n9NlK-0007SS-6m
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642409593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YG/gED+48Vpds5BrEeSnlrbwJaqA3vUw2a2GB2N+a1g=;
 b=gHbnPX60XM3YmUDDkLOy/ntohZc2v3Jmsy2XuB/qLh+d3IwSjkGu7M83NfCe7qtULLKaAL
 HQoFCXr2Amfi4bUvyUUsRA0Z/MBk/OFb76qpVQVzwhDL3S/zhPbZUZF9c2xhsLJ51eU1iR
 1TqvxsTbrKwP4cPOL+fJ3udwOiXPqzM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-FRRjIvX-OISGZdt8jpom-g-1; Mon, 17 Jan 2022 03:53:11 -0500
X-MC-Unique: FRRjIvX-OISGZdt8jpom-g-1
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a1c544e000000b003490705086bso4687687wmi.7
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YG/gED+48Vpds5BrEeSnlrbwJaqA3vUw2a2GB2N+a1g=;
 b=xVeRARiUKIyWP7fQcFtqe++EIjHgXlJ4o5ahebhoaEQo3y/HiWdoAQrBMa6CgNjOdd
 PmLzpAopwdkoBVg7txUcOlwQSUEkSrtHl83Sz3tlErSXM9u2BhWZXmHIfHBAsKe0QW6b
 JeLFjUxcmBAgy3Nxwrb/fHke/dLMJINriD8WGIGMfzFLdMZ45LML7P9iqr3GW7DE0vcN
 Z+ndUKErVPmGaX928gn8ZBcaWt79APj21XBjWqGP2a5tccELDw4D5byju5hac9KYaKTj
 MRdEgZxE6UQV/p0X4H2KcyDJhJO1nwX9GullJOS3ev1VtFoVOUBybrbll+xAaMQNTrq8
 t5ZQ==
X-Gm-Message-State: AOAM532CXaatE6punXVaJtL+/Lt8+zh1u39U6EIkCG5trIMuktMvu3HK
 EgL4xfXnNS9JSyj1K5AqLxppNQNFrB3bxAswqDfUAWbx5vl2eYxnLf0fpw+eydxsx5AKrOPxZP7
 qxHmVymxiRSQkTLA=
X-Received: by 2002:adf:d849:: with SMTP id k9mr6158133wrl.513.1642409590315; 
 Mon, 17 Jan 2022 00:53:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDvkkIFYHDGuxL26VL6pOweunOrVcAIpqo5/5r/dHhkz/+LMdy09k1wRQL4BnhdzlSk7MFDw==
X-Received: by 2002:adf:d849:: with SMTP id k9mr6158103wrl.513.1642409590026; 
 Mon, 17 Jan 2022 00:53:10 -0800 (PST)
Received: from redhat.com ([2.55.154.241])
 by smtp.gmail.com with ESMTPSA id o1sm2137081wri.12.2022.01.17.00.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:53:09 -0800 (PST)
Date: Mon, 17 Jan 2022 03:53:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] hw/i386: support loading OVMF using -bios too
Message-ID: <20220117035119-mutt-send-email-mst@kernel.org>
References: <20220113165511.46098-1-berrange@redhat.com>
 <20220113165511.46098-3-berrange@redhat.com>
 <20220114125946-mutt-send-email-mst@kernel.org>
 <66f3f633-3a61-163a-a0f4-622ef988611f@amsat.org>
MIME-Version: 1.0
In-Reply-To: <66f3f633-3a61-163a-a0f4-622ef988611f@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 16, 2022 at 10:05:58PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/1/22 19:07, Michael S. Tsirkin wrote:
> > On Thu, Jan 13, 2022 at 04:55:11PM +0000, Daniel P. Berrangé wrote:
> > > Traditionally the OVMF firmware has been loaded using the pflash
> > > mechanism. This is because it is usually provided as a pair of
> > > files, one read-only containing the code and one writable to
> > > provided persistence of non-volatile firmware variables.
> > > 
> > > The AMD SEV build of EDK2, however, is provided as a single
> > > file that contains only the code. This is intended to be used
> > > read-only and explicitly does not provide any ability for
> > > persistance of non-volatile firmware variables. While it is
> > > possible to configure this with the pflash mechanism, by only
> > > providing one of the 2 pflash blobs, conceptually it is a
> > > little strange to use pflash if there won't be any persistent
> > > data.
> 
> It certainly would be simpler to have a ROM for the CODE part.
> IIUC using CFI pflash allows the firmware to poll the underlying
> device size.
> 
> > > A stateless OVMF build can be loaded with -bios, however, QEMU
> > > does not currently initialize SEV in that scenario. This patch
> > > introduces the call needed for SEV initialization of the
> > > firmware.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >   hw/i386/x86.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > > index b84840a1bb..c79d84936f 100644
> > > --- a/hw/i386/x86.c
> > > +++ b/hw/i386/x86.c
> > > @@ -45,6 +45,7 @@
> > >   #include "target/i386/cpu.h"
> > >   #include "hw/i386/topology.h"
> > >   #include "hw/i386/fw_cfg.h"
> > > +#include "hw/i386/pc.h"
> > >   #include "hw/intc/i8259.h"
> > >   #include "hw/rtc/mc146818rtc.h"
> > >   #include "target/i386/sev.h"
> > 
> > This builds fine because there's a stub in pc_sysfw_ovmf-stubs.c
> > 
> > The unfortunate thing about this however is that it's too easy to pull
> > in a PC dependency, and people building with CONFIG_PC will not notice
> > until it breaks for others.
> > 
> > Is it time we split pc.h further and had pc_sysfw_ovmf.h ?
> 
> While "pc*" is specific to the PC machines, "x86*" is shared between
> PC and microvm. "pc.h" must not be included in "x86.c". The shared
> method introduced in the previous patch becomes
> x86_system_ovmf_initialize_sev(). The dual pflash mechanism is proper
> to OVMF, so having this method in "x86.h" seems correct.
> 
> Phil.

Well.  E.g. pc_system_parse_ovmf_flash is defined in hw/i386/pc_sysfw_ovmf.c
and declared in pc.h. If you want to move all pc_sysfw_ovmf.c
declarations to x86.h that might be fine, but please do not
split declarations between multiple headers, that's messy.
And really, when in doubt do a separate header is a good rule.

-- 
MST


