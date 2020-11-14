Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F72B2DBD
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 16:00:12 +0100 (CET)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdx20-0003PG-SM
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 10:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdx0k-0002hf-Sf; Sat, 14 Nov 2020 09:58:42 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1kdx0j-0000WW-8v; Sat, 14 Nov 2020 09:58:42 -0500
Received: by mail-pf1-x442.google.com with SMTP id v12so9802282pfm.13;
 Sat, 14 Nov 2020 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lPcIX1lYhLIvq/PZYqFJK4E/iNzBuLohAXxJIRu5Dt0=;
 b=ffTQ/T/LIzgAI62bJJpSEVXMYQUblIfvoW+Chp3F/io+W/7cUtnQ/Jd8L1ELrQ7UGQ
 bHgheyCkmyXiezVpXj/KrbCq7t+V1duBbP9Mdmdqz2yuy3TCUuIV9SMGXsNQ15B+3KOf
 swwJ7t2l3wzvqRzO52n8SvHJ2kTQRQNyB+dlMCR9Yttd3GRieHmnE6vWMhppre5PHKR/
 6Gv2h1/ZduQMIRZpktRTWUkb8VHM+88ekkkbUkBdW+T8ShO4FDezG9tUYv864n2zw1J2
 Z470EWTiQFWhl2AS6rJXRPq5vO2gC18cxUYaKtmfj59eaBO626sRFA3I4a3OQL+1dHQ8
 9WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lPcIX1lYhLIvq/PZYqFJK4E/iNzBuLohAXxJIRu5Dt0=;
 b=jaBd7rIXH1yr4L8EguYOeb0NTNeU2Skcl7VrYHYbJ63qllUgACa8dixonj6fofUX1G
 ItCTCEPV9PXiaFjShVWqqff8fuf2MhTcIcCA5JMQcwY9mgZWbSaMlT3InaMi9IWVmWYG
 JJZVumET+4PxSJALWMJhlGTsAeE8svK0qt1YDYpZFcyzC9kO/AlMAlwknltu6L1pnxNG
 tQyApdK089ewKH6/KVioV1JQOT0C6RNojgQgZ19ItZMAqCSLiZ1f9e3c+manfijk5wzC
 VMOEcsfn880NgiX1pPg9J9cndidaIXZKqIR4UrB3MU+bbKltfNgV1TVf96cTZjyqHU5w
 89HA==
X-Gm-Message-State: AOAM533P26S9hvx0K4QbOeqkkwty6jjnBhCXVjCue4EeC4qMrRcxEuv8
 RM4RCPOYDgwUeDcJxTz5TRE=
X-Google-Smtp-Source: ABdhPJxZyc7vYIC3zx5Gq419neXKRAUAkj4rus7F/83y0nXHpbbGYffdW6z4yI+KjX9F725WcmECBA==
X-Received: by 2002:a63:1d16:: with SMTP id d22mr6202295pgd.335.1605365919012; 
 Sat, 14 Nov 2020 06:58:39 -0800 (PST)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id y124sm12763760pfy.28.2020.11.14.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 06:58:38 -0800 (PST)
Date: Sat, 14 Nov 2020 22:58:33 +0800
From: Changbin Du <changbin.du@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] arm/monitor: Add support for 'info tlb' command
Message-ID: <20201114145833.w3xtaivf6hvarqbc@mail.google.com>
References: <20201113095854.67668-1-changbin.du@gmail.com>
 <CAFEAcA-3A2s3b5+kVPmDfPxG=gypOhD8agrqx0mUYt3gZKbMNg@mail.gmail.com>
 <20201113131342.GM3251@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113131342.GM3251@work-vm>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=changbin.du@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 01:13:42PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Fri, 13 Nov 2020 at 09:59, Changbin Du <changbin.du@gmail.com> wrote:
> > >
> > > This adds hmp 'info tlb' command support for the arm platform.
> > > The limitation is that this only implements a page walker for
> > > ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> > > not supported yet.
> > 
> > "info tlb" needs its own entirely independent implementation
> > of a page-table walk? I see this is how x86 has done it ,but
> > it seems like a recipe for the info command being perpetually
> > behind what we actually implement...
> 
> I think the challenge is you want 'info tlb' to be quite easy
> to read from a debuggers point of view and robust at pointing out
> things that are odd; I'd hope at least you can use most of the macros
> to extract fields etc
>
Actually I refered to function get_phys_addr_lpae() and try to use
definitions what I found. But most of the bit definitions are
hardcode.

I have fixed the code style issues in V2. Thanks for your kind review!
 
> Dave
> 
> > thanks
> > -- PMM
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

-- 
Cheers,
Changbin Du

