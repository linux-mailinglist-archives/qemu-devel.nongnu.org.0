Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC6B317345
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:23:50 +0100 (CET)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xtl-0000pq-DY
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1l9xbx-0000p4-U2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:27 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1l9xbT-0000m2-GT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id u143so2200753pfc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jPPJSe/cp6/I3D7oPnLQlsmczhRsq2YGfbHlPhPO0c8=;
 b=TWrykaz6oBCnlcjbbkk2FyR+Otp2Zt50OU+o5goP/4dLLNg9UTxid5Wq4x2wOZYWCa
 JF2BPKFIVAqc/Q0Xho9jvROQW1wpbH20bWL4ZwlocaHBmC3w5JfeL6E+SluiGgtKEAsn
 sphXFER/+G6jAxfl9KUyxfvaQcisJTUWaf2gsyaVt85pH/ddDmcEd6iiSJB0XDYDo2/u
 JaBhr6jlX9RToij8bN9Fg+oR3WqrGGQ38GxgON+e33BM+QZheiD+rVX4UOrWfITPHXck
 Tf5WWR/jqTtw+ZPPD7BTJdFl8BkjVw4LRU0+5Pba1ZSnLn0YKPOD2TWvZLRYQBOwkr2A
 ScUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jPPJSe/cp6/I3D7oPnLQlsmczhRsq2YGfbHlPhPO0c8=;
 b=pcMUZvtwuuOKfrfL9sm0IGBXFi0UTK22el8SCFK3A+OEdRS7sFH+NxNkcX05b1OmSG
 3MkzqgwZoDR3QpvbyS/KUQUB39BPSFvgwPUfkIJIcxFHJ/nxSHX5xTrl63gWZMZgmlkC
 b+gRCtYeccZL6deL7dQ4gDZTwtUYBp2zcFP4Sc4I+YD2fvHWxTZXux1807vba1nnUjAm
 nTUmarXGR+V+Vra2PYopT6Ln/a2yIieOn30qG5/TFd3Y42ycLpv6XFN/nVM0XHf/Bybk
 6qw24Tju9UB2p56IPsHqBUtZrCg/iUCl94HDrfVld68rH+JZNUN5v/crY638TmtGgOyd
 x0bQ==
X-Gm-Message-State: AOAM5320TCJ51HfDE5TyQp2cpruZ6yw1Lbo17xqhVeSxyTfIXvhdDrSl
 gQUTYp8+TUo429EBd2y9cos=
X-Google-Smtp-Source: ABdhPJwX3uKujmO7X0yheANIicvnHyk4iee+rUQVW07FCsfUocFJSt+y8VLT4dfbg60XDTekLDdRgA==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr5092630pgl.143.1612994693806; 
 Wed, 10 Feb 2021 14:04:53 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id e3sm2929689pgs.60.2021.02.10.14.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:04:53 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:44 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210210220444.GC8034@private.email.ne.jp>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
 <20210209165241.5ba1a953@redhat.com>
 <20210209200258.GB28049@private.email.ne.jp>
 <20210210032931-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210032931-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x42f.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 Isaku Yamahata <yamahata.qemudev@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 03:31:57AM -0500,
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 09, 2021 at 12:02:58PM -0800, Isaku Yamahata wrote:
> > > > +     * When the method of _CRS is called to determine MMCONFIG region,
> > > > +     * only port io is allowed to access PCI configuration space.
> > > > +     * It means qword access isn't allowed.
> > > > +     *
> > > > +     * Device(DRAC)
> > > > +     * {
> > > > +     *     Name(_HID, EisaId("PNP0C01"))
> > > > +     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
> > > > +     *     Field(DRR0, DWordAcc, Lock, Preserve)
> > > > +     *     {
> > > > +     *         PEBL, 4,
> > > > +     *         PEBH, 4
> > > > +     *     }
> > > 
> > > why are you trying to fetch it dynamically?
> > > what prevents you from getting MMCONFIG address in QEMU when building
> > > ACPI tables and encode _CRS statically at that time?
> > 
> > My motivation is to prepare for TDX where ACPI tables will be part of
> > measurement. I wanted ACPI tables to remain same irrelevant of chipset
> > configuration which guest can change.
> 
> I mean we are encoding lots of things like PCI description which is
> guest controllable. Is there reason to think mmconfig specifically will
> change after measurement?

No in fact.
I'll switch to use MMCONFIG address in qemu.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

