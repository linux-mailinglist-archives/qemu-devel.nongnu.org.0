Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D292E61FB79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:33:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5zx-0003x6-1i; Mon, 07 Nov 2022 12:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1os5yr-0003m0-Hf
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:32:20 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1os5yg-0003Uo-30
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:32:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id g12so17269924wrs.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qNv3MLrhOuehbV0KfMJPuXTOFXlXOml5knQjI4GLOXk=;
 b=gqj+3GyqKr80i0YufZzTgBFTKpIZEdQhByndpmh6uP1RSw1hf89vKn2BWfHgBS3KP/
 M8NPgYKW0CKFu0mhuda7WXgeWaxGH/UnsTZgX8ptFDJSeYCrRcXRDAykEf/MU7Ae2w7p
 UjqOZah7C1Q9h2E2t/sWXf5hRbDvIYUAE1nI1HjoODsdfAJovjClYca6nleFPxBMLaRi
 ufnvM62qH8iRWe69J8q/qmTApEdP2DUC2MhwOhxJP8CMHeHyM1MsBG+Z+JlYJk7W4vu3
 2hDNbtuV/lzEK5csgjTnFaAsn79MwbrY+y1HSP3VrRVT0N6LjlHaOSgw3mDiUbuATEgr
 8d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNv3MLrhOuehbV0KfMJPuXTOFXlXOml5knQjI4GLOXk=;
 b=6hdQNruvJ3w66C97OzZJ/O5lTAXkri1i3RQlf7wOvaPk2RUdemfTqqS1cnxe8DtIYU
 Bymqa9Pr0Cs6MJAjZhAsT4nR8zcqGAwwaaBWJMUf9/heiAbXKebp0Gr13l/ioc09pe1v
 F4nvG3zn9wlWJ+6eKfcxiVv+v9Jqqzp2mLQ9R5sGNeLzJAMbr8SI3srjI5p4GQvVoFLV
 PQoV9NjVPzZpmcuPzovJNUd1tNAs+Nt+3xZ+x81wx6LrAdoTVyN+/nEtXf4skGrSRhVV
 ///VmwO/B+bati3sfSE+LShIyRD8hKNRG092a6KVSo6hUMDrAreqL+snipjjiOdaYKve
 9Axg==
X-Gm-Message-State: ACrzQf30aVmO/vCo99CQmxkhz6ZF3LmycACR1FbBLnsaiTlrs/thBYfT
 DpWWDsXpGVGIy8Z+oEPiRMhR7g==
X-Google-Smtp-Source: AMsMyM6NjVPXxZ/SAud4RaoLpUVHSRzudmWE2jTWldc8wr9dvBrqHekCf1CW61WSuMNYip1GzGcLzg==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id
 a6-20020adfeec6000000b00236aabb8c90mr25155404wrp.199.1667842323077; 
 Mon, 07 Nov 2022 09:32:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00236e834f050sm7739752wro.35.2022.11.07.09.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:32:02 -0800 (PST)
Date: Mon, 7 Nov 2022 18:32:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <20221107173201.343hkqqugkzdzqcf@kamzik>
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop> <871qqehib4.fsf@linaro.org>
 <Y2kv/k5oKGOd+90w@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2kv/k5oKGOd+90w@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Nov 07, 2022 at 04:19:10PM +0000, Daniel P. Berrangé wrote:
> On Mon, Nov 07, 2022 at 03:50:44PM +0000, Alex Bennée wrote:
> > 
> > Sunil V L <sunilvl@ventanamicro.com> writes:
> > 
> > > On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> > >> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >> >
> > >> > The pflash implementation currently assumes fixed size of the
> > >> > backend storage. Due to this, the backend storage file needs to be
> > >> > exactly of size 32M. Otherwise, there will be an error like below.
> > >> >
> > >> > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> > >> >
> > >> > Fix this issue by using the actual size of the backing store.
> > >> >
> > >> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > >> > ---
> > >> 
> > >> Do you really want the flash device size presented to the guest
> > >> to be variable depending on what the user passed as a block backend?
> > >> I don't think this is how we handle flash devices on other boards...
> > >> 
> > >
> > > Hi Peter,
> > >
> > > x86 appears to support variable flash but arm doesn't. What is
> > > the reason for not supporting variable size flash in arm?
> > 
> > If I recall from the last time we went around this is was the question
> > of what you should pad it with.
> 
> Padding is a very good thing from the POV of upgrades. Firmware has shown
> a tendancy to change (grow) over time, and the size has an impact of the
> guest ABI/live migration state.
> 
> To be able to live migrate, or save/restore to/from files, then the machine
> firmware size needs to be sufficient to cope with future size changes of
> the firmware. The best way to deal with this is to not use the firmware
> binaries' minimum compiled size, but instead to pad it upto a higher
> boundary.
> 
> Enforcing such padding is a decent way to prevent users from inadvertantly
> painting themselves into a corner with a very specific firmware binary
> size at initial boot.

Padding is a good idea, but too much causes other problems. When building
lightweight VMs which may pull the firmware image from a network,
AArch64 VMs require 64MB of mostly zeros to be transferred first, which
can become a substantial amount of the overall boot time[*]. Being able to
create images smaller than the total flash device size, but still add some
pad for later growth, seems like the happy-medium to shoot for.

[*] My web searching skills are failing me at the moment, but I recall
seeing a BZ or gitlab/github issue specifically pointing out the AArch64
64MB firmware size as a pain point.

Thanks,
drew

