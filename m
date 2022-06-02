Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507EE53BF3A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 22:02:27 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwr1V-0001gw-VT
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 16:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nwqya-0007ih-Ra
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 15:59:26 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nwqyZ-0007kK-2D
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 15:59:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso10391295pjl.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7yKMgUuv2zhj5/B8/Lj3TxnmVoVqtuLrhQVs7Z1bwLw=;
 b=AOoVxojcO1u0si+ygxmly+LdcTM0LMB/1hyJeBsgZXYurH/E1oNQIyfSaVaE2z4Tb8
 06HGaYd/qoomeYfNm0/guHsJ0EcORLAUR5qQHBEUjqtc4Fcl1Uf9ziF/hXyKdqv+rGO1
 XqjBAyv7MqIlH80PMiXnUUEusnEeJmkY4tTcxGlmbWevY5skcHt90LXFQRWAJ2iOdu+o
 b0qPs9ZnGb2++PQ8WXN6356AKWfqbDcnxua7miONnYmAgd4UXc8+feQmKHs0Xh7asGRr
 hPhz5hORFqk7a+P/q1D9LeFFeUiI+7V4CVW6uD/yCyqP9k/XNthH0fH2R1npKIEtcEMu
 rtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7yKMgUuv2zhj5/B8/Lj3TxnmVoVqtuLrhQVs7Z1bwLw=;
 b=1eSx5MnFjvZPW+i0Zbs45YchY90DCaEPhYmv5fXSrhJTitDDrK5lASCSh47ulpJBYV
 fY08mw2qs6tzdWeAsmw6TW8RQlTSs5w8Ks1ZqVS6LbbGFdXzVtLVmkAZmfgINLdInhv8
 gMk4TXSbFbYiu5ZObkIiCtlTr6OCdFMwoGi0ki11rzy6Jb7H4cGh4aoi7DuA3mRShJsS
 uL72PUuP64OoOoxx9x4Sl5fN2nq0dKnatw2RHTu+0WlhDAAMAly23dD7KEW44wWo7dep
 wW7dRCWx7i0KiOplUn8v5ldZxJmYZ2Ky39+i/RdMizpBSv0crx6W5DfAYRV5nDUJE7wf
 CGeg==
X-Gm-Message-State: AOAM533wcpgPBt1/uRJz5EPOii8yARhRhqjjhkT1myGoHBuCj11QcZXL
 NXC1FghOG4sADYrEUs8kk7Q=
X-Google-Smtp-Source: ABdhPJxryUHNx1hDhQijF9zn4kh6BNXKLWLJeX69qD/Er41RpoW3FAfZZrOTE1GHy1qTuJejVvRQaA==
X-Received: by 2002:a17:90b:1646:b0:1e3:15ef:2871 with SMTP id
 il6-20020a17090b164600b001e315ef2871mr21755373pjb.105.1654199961346; 
 Thu, 02 Jun 2022 12:59:21 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a17090a840c00b001dfffd861cbsm6225905pjn.21.2022.06.02.12.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 12:59:20 -0700 (PDT)
Date: Fri, 3 Jun 2022 04:59:18 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <YpkWllpTFzb2HHY5@antec>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 02, 2022 at 09:08:52PM +0200, Geert Uytterhoeven wrote:
> Hi Joel,
> 
> On Thu, Jun 2, 2022 at 1:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> > > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > > platform allows for a convenient CI platform for toolchain, software
> > > ports and the OpenRISC linux kernel port.
> > >
> > > Much of this has been sourced from the m68k and riscv virt platforms.
> 
> > I enabled the options:
> >
> > CONFIG_RTC_CLASS=y
> > # CONFIG_RTC_SYSTOHC is not set
> > # CONFIG_RTC_NVMEM is not set
> > CONFIG_RTC_DRV_GOLDFISH=y
> >
> > But it didn't work. It seems the goldfish rtc model doesn't handle a
> > big endian guest running on my little endian host.
> >
> > Doing this fixes it:
> >
> > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .endianness = DEVICE_HOST_ENDIAN,
> >
> > [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> > [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> > 2022-06-02T11:16:04 UTC (1654168564)
> >
> > But literally no other model in the tree does this, so I suspect it's
> > not the right fix.
> 
> Goldfish devices are supposed to be little endian.
> Unfortunately m68k got this wrong, cfr.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e2ac4a3327479f7e2744cdd88a5c823f2057bad
> Please don't duplicate this bad behavior for new architectures

Thanks for the pointer, I just wired in the goldfish RTC because I wanted to
play with it.  I was not attached to it. I can either remove it our find another
RTC.

-Stafford

