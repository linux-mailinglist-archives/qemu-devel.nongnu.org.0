Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DC4D8F55
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 23:11:40 +0100 (CET)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTsug-00059j-Pi
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 18:11:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nTst7-0003oy-4a
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nTst4-0004Tq-0P
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647295796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIaI4swwnrLQxgEzgNOOjQdW6ldsec82u9CKcVRDQzs=;
 b=eDFLnsn6QssKrQgPK6p88mVVmhB3Y87/VRPOguvtq0wEe0RvYongVX9hSBN1Eu78GkDgcK
 aP74YdIEzFj0TNrW3m21/hBhMT9vuTf10mGStnyzN0zsl/rcAs2S+PvAN/QbPOhf2TqPPY
 v73x7/HvtLyTYyugxSt2tJph02oInG8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-S0JTV61RMZu7VRLoDp3tiw-1; Mon, 14 Mar 2022 18:09:55 -0400
X-MC-Unique: S0JTV61RMZu7VRLoDp3tiw-1
Received: by mail-io1-f69.google.com with SMTP id
 e23-20020a6b6917000000b006406b9433d6so13201880ioc.14
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 15:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tIaI4swwnrLQxgEzgNOOjQdW6ldsec82u9CKcVRDQzs=;
 b=s9Al4u9g+SElyf6B6YBpFBq0Rz6r9D4HLoJ3TIwKTopESdYV2vIcpdCj7NSofhXlFz
 XPnCftSyYd4zxeVd0IzI7RCOvKrMUiM4MLizQW9ee2Nffwv8DRC7eOgsF2MRJ9KW/NYT
 UtrPxeFBHqMSNWsxbzDm9JF9ke9Mz/JVfVSrHw+h2u/BRL11HgigvEZVGF188ElJTtwz
 imCP4Nxrrs1jJ61RpPOTBI/67osgJ/mUSnVnrJ9/y3Si7ilb5uzqc83LUqJ1QHWcudAg
 V9GEIR9JpTiqtuPtCpHlJXfOzK/nmcG8s1YWmY+cNQdBTj2/kG916rbm6ysjRJ475Z3X
 wa/g==
X-Gm-Message-State: AOAM5328Qrq4rxnkR0Uv2zgUCHRDwMcLznpKyclJS9lJsiMqZI/duJ9r
 6YN5UFy0hk7MfkfXROxHfN7Cw3fYHRjE7JNir4W1bNcbMeroZVaxs8Rqnaxqqn+KBnUeHjYSgux
 REtze818DlmIIwUQ=
X-Received: by 2002:a05:6e02:1b8a:b0:2c7:6aeb:c5f7 with SMTP id
 h10-20020a056e021b8a00b002c76aebc5f7mr17839512ili.135.1647295794039; 
 Mon, 14 Mar 2022 15:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5HzCEP8yrpPpxdvq1kt/x0dpAxZ8qKXAIE0ecmU+n0UwB1htNx+S5EfwRWIg49HArDGUdEA==
X-Received: by 2002:a05:6e02:1b8a:b0:2c7:6aeb:c5f7 with SMTP id
 h10-20020a056e021b8a00b002c76aebc5f7mr17839503ili.135.1647295793682; 
 Mon, 14 Mar 2022 15:09:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a6-20020a92d346000000b002c1a6040691sm9459914ilh.70.2022.03.14.15.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:09:53 -0700 (PDT)
Date: Mon, 14 Mar 2022 16:09:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Message-ID: <20220314160952.46d5313a.alex.williamson@redhat.com>
In-Reply-To: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Cc +Alexey]

On Fri, 11 Mar 2022 12:35:45 -0600 (CST)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> All,
> 
> I've been struggling for some time with what is looking like a
> potential bug in QEMU/KVM on the POWER9 platform.  It appears that in
> XIVE mode, when the in-kernel IRQ chip is enabled, an external device
> that rapidly asserts IRQs via the legacy INTx level mechanism will
> only receive one interrupt in the KVM guest.
> 
> Changing any one of those items appears to avoid the glitch, e.g.
> XICS mode with the in-kernel IRQ chip works (all interrupts are
> passed through), and XIVE mode with the in-kernel IRQ chip disabled
> also works.  We are also not seeing any problems in XIVE mode with
> the in-kernel chip from MSI/MSI-X devices.
> 
> The device in question is a real time card that needs to raise an
> interrupt every 1ms.  It works perfectly on the host, but fails in
> the guest -- with the in-kernel IRQ chip and XIVE enabled, it
> receives exactly one interrupt, at which point the host continues to
> see INTx+ but the guest sees INTX-, and the IRQ handler in the guest
> kernel is never reentered.
> 
> We have also seen some very rare glitches where, over a long period
> of time, we can enter a similar deadlock in XICS mode.  Disabling the
> in-kernel IRQ chip in XIVE mode will also lead to the lockup with
> this device, since the userspace IRQ emulation cannot keep up with
> the rapid interrupt firing (measurements show around 100ms required
> for processing each interrupt in the user mode).
> 
> My understanding is the resample mechanism does some clever tricks
> with level IRQs, but that QEMU needs to check if the IRQ is still
> asserted by the device on guest EOI.  Since a failure here would
> explain these symptoms I'm wondering if there is a bug in either QEMU
> or KVM for POWER / pSeries (SPAPr) where the IRQ is not resampled and
> therefore not re-fired in the guest?
> 
> Unfortunately I lack the resources at the moment to dig through the
> QEMU codebase and try to find the bug.  Any IBMers here that might be
> able to help out?  I can provide access to a test setup if desired.

Your experiments with in-kernel vs QEMU irqchip would suggest to me
that both the device and the generic INTx handling code are working
correctly, though it's hard to say that definitively given the massive
timing differences.

As an experiment, does anything change with the "nointxmask=1" vfio-pci
module option?

Adding Alexey, I have zero XIVE knowledge myself. Thanks,

Alex


