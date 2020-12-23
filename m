Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4C2E2292
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:49:46 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCwz-00045A-6Y
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksCv1-0003SB-HM
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:47:43 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ksCuz-0005iS-3l
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:47:42 -0500
Received: by mail-oi1-x22e.google.com with SMTP id l200so680104oig.9
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 14:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3ymv/KKD2i9VAg3mkyhlEHnhKHAyB+WmL9zRyE//E6U=;
 b=PiX9ew1s7CaQgACtutkDlzxkNNzXJLRPz5ShwMSuvf06NNNhUlyDEEH+EEULSmSs66
 HPe977yHIGBnsj4gG992CUBSD22oZwzDLSITNraZwM7ZAxDMx4GBnvvAAdzss1weNYb5
 LECrplt1HMSMG5m8xSNLNaVNUI8eY7Eaj0hA1HsBQXvHkyH+s/Ulm+RF4REg43eIkfyn
 sTIm9b4XctAODt4l4l38teFYHzcjfTPo/lBVrXT4kSMMor1y712J3LuLaN1iC8uNC4yZ
 +had3X9fn4jWZeXCGSnobnRgTfX6j5/cvZT98NAvdFKEluGGG82q/i9yD6h6AKmLidSy
 sICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=3ymv/KKD2i9VAg3mkyhlEHnhKHAyB+WmL9zRyE//E6U=;
 b=l9CF+FsPnli669vDDM/KY/HaxZhAscys/7ptXsPQDIA7m8JzJZOqvfp9SsBDT9RFjL
 RFSWcWvRuE7hP4bnMboWvW5IWxXjRw2tIt/sMbcDrsy01WqbXG8eldm0FrdLFrwW8oEe
 8l4ymIOBwSA6uWwr2fXXmERp1wopKmIk5wveFDyVdAJdDBN+ceDUHc09FHSpWZRqPSXm
 r0iFHTvq4NcCvGcFceZ936qDMPe1A+xXw3PZQRDZQ1eGfLMdODnAEXjgeBm091FY55QR
 Xm2E50z2T6Pl/Tql03IZCyNNBgjU3CpMHn79ARVp2NQ36+CjTzLhRpwYOCD/FK9z6Qi5
 Q7dQ==
X-Gm-Message-State: AOAM533sagOWXHQPFWujuUPutzYf5GrkVTK669QGzrPl6qIArGpOy0Ht
 HnTPuYumI7H5YlRCC3/m+hQ=
X-Google-Smtp-Source: ABdhPJxsKt65rPzWW2hs5x0J7YdJNuG2nbHHbNNGL0kgNJshQB5bDo5SYkscDITOIhzbG8grmMoYwA==
X-Received: by 2002:aca:c1d6:: with SMTP id r205mr1284838oif.37.1608763659903; 
 Wed, 23 Dec 2020 14:47:39 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z3sm6106693otq.22.2020.12.23.14.47.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Dec 2020 14:47:38 -0800 (PST)
Date: Wed, 23 Dec 2020 14:47:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Problems with irq mapping in qemu v5.2
Message-ID: <20201223224737.GA184012@roeck-us.net>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <536fedf3-d61a-39cf-b806-c282a124e202@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536fedf3-d61a-39cf-b806-c282a124e202@ilande.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 23, 2020 at 10:05:12PM +0000, Mark Cave-Ayland wrote:
> On 23/12/2020 21:01, Guenter Roeck wrote:
> 
> > I don't have a real machine, and therefore did not test it on one.
> > 
> > I tried with Linux mainline (v5.10-12913-g614cb5894306), v3.16.85, v4.4.248,
> > and v4.14.212. I can't test older version because my cross compiler is too
> > new. Each of those kernel versions shows exactly the same behavior.
> 
> Is it possible for you to provide links to your drive image and kernel so
> that we can reproduce the same environment to investigate?
> 

The root file system is available from
https://github.com/groeck/linux-build-test/blob/master/rootfs/mipsel64/rootfs.mipsel.ext3.gz

The script used to build the kernel is in available in
the same directory, though building fuloong2e_defconfig
should do it, possibly with CONFIG_DEVTMPFS=y added.

Guenter

