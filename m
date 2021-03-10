Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDB3348EC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:34:01 +0100 (CET)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5Wp-0005SN-LF
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5SS-0001m8-5c
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5SP-0006x0-Ox
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUkCmkeF/L+GW58P+xjwaYZf7QVPbJvMVVLjhgnuEXM=;
 b=ObZI793eRhD7dIRfzJtjha4XwKImTED7iF5nNFfGiQn4OPcyhGoEQBrLIxDUOf/TVqzKML
 2aVixe2ISxFv+lPGK8PEvm2Fm1e/LxS0QJbjkeVPLS8VYNeDmVhsH4fbh3HJm2ZALnYRR6
 r+x8Cwv0594xcMHyke62XlYp/91iSlw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-c2J1_Mu9PpuvsuYFggQzKQ-1; Wed, 10 Mar 2021 15:29:22 -0500
X-MC-Unique: c2J1_Mu9PpuvsuYFggQzKQ-1
Received: by mail-qk1-f200.google.com with SMTP id x11so10517241qki.22
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WUkCmkeF/L+GW58P+xjwaYZf7QVPbJvMVVLjhgnuEXM=;
 b=o9z7leUYu+mZEi0fNoDmaNW+w7+FyBmMvAE/+GCn60M+ZthAg6hVfLrK+sRspQmiEf
 HDCpMRKVGHBfavOIxBsSJkNA5TkKqiQ+Mf0Agb+C4+G1sxQ1ic34ZuP10FrbDklB1V2i
 1H+urKGGLsGNwVh0VNreaN4q2mra+wdA8p2win5cBWzFlN6fcHR/WUhM7UVo+O2kxEcj
 mRkzATJUk56euZtOFSS2c0LYUqlSaD2BL0mIUaeV8HV8EKkSLsOL4IJ9TNWj1/cVhjPn
 cx/4LRChL3+5cOE6BJRflbWnO7JWy8fgKgwkxxxVpAdNy6nKIrrI9K0zgPldRAxtNek3
 PuIQ==
X-Gm-Message-State: AOAM530G4DHLBxPRtX3kwVIEEtZT0RjhSGZykHJiQdSMUKNyXqpGmGo0
 6F4T5mO65Iw/TTRceaOsoeVOeQ9iVTUJk/hAZtv8WOMth5O50oU/zSwmGlrfefG4tnS118GjMMv
 JpYrMdz3Ro4O3XCg=
X-Received: by 2002:ad4:4745:: with SMTP id c5mr4863092qvx.39.1615408161221;
 Wed, 10 Mar 2021 12:29:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYkrnScCcVIGfCoBPFwBztSXlcf3SG1hSZg5UY64B3O1/GjuwG7isqX6fejV6IL6y/Sh/QFw==
X-Received: by 2002:ad4:4745:: with SMTP id c5mr4863077qvx.39.1615408160951;
 Wed, 10 Mar 2021 12:29:20 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id o76sm312289qke.79.2021.03.10.12.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:29:20 -0800 (PST)
Date: Wed, 10 Mar 2021 15:29:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Message-ID: <20210310202919.GH6530@xz-x1>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org>
 <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
MIME-Version: 1.0
In-Reply-To: <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 09:11:40PM +0100, Philippe Mathieu-Daudé wrote:
> >>      /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
> >> -    memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
> >>      memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
> >> -    memory_region_add_subregion(address_space, 0x90000000, isa_io);
> >> +    memory_region_add_subregion(address_space, 0x90000000, get_system_io());
> > 
> > The old code has an alias created just for adding subregion into address_space:
> > 
> > -    /* ISA IO space at 0x90000000 */
> > -    memory_region_init_alias(isa, NULL, "isa_mmio",
> > -                             get_system_io(), 0, 0x01000000);
> > -    memory_region_add_subregion(address_space, 0x90000000, isa);
> > -    isa_mem_base = 0x11000000;
> > 
> > While you didn't revert that part.  Maybe that's the issue?
> 
> Hmm I'll have a look. This is not the series I'm working on, which
> is much bigger and not ready for posting yet. I simply looked for
> something similar (a bus mapped into sysbus) and remembered the
> ISA bus from Jazz machines. I'll see if I can find a better PoC.

Yeah no worry - it's just that I feel one memory_region_init_alias() call is
probably missing in your huge series somewhere, so that you'll take that alias
MR as subregion rather than the real MR (which is the root of one AS).

-- 
Peter Xu


