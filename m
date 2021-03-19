Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4579341F2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:16:01 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFuy-00087O-5X
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNFte-0007cY-Si
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:14:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNFtc-0006Nz-PT
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:14:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id j7so9288351wrd.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ktBVkmahJUFDI0GdAgFTyQf46g4Zkpjce+j5UNqb9MI=;
 b=mXeNGK5WNKsC4AlXKSVBUE7g5Ooew4zsHai0DCcOAHdzR4MrVzC3dpkYk2+IQp17lY
 IT02NZqjxRGlw/e4PijXI/1ElM74IDj5WUmO/0/NRxCto87HI5mhCYuT+ihnXRVd5RxP
 A4lRRFTyActe3qsZB3s7hV9UXODAQXg7+hBK0p6WgSz21zhusaid/jswNKsJOyBjZCIJ
 nxgXD8SIEi8dJpHEGSKo71RvF0AaxEYu4sTCIwWIUXDxjmF146ZwdyFB8OWw7fa4hdfK
 q8f9p91WutQvfgjzeWRsZhWGmcLc2SZFBouAdHiDQoQddNfBJV3KLqTl+6r/nk3oVxl8
 uU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ktBVkmahJUFDI0GdAgFTyQf46g4Zkpjce+j5UNqb9MI=;
 b=EA5HlLoGlNcpWxtHlbeG/SR8SSFc6gaTOLtH9tmI3GBd5okDGy9eLTyjgPbfjg1D1o
 g9GA8H73kd6/PWwaLvdBJwmzOzRmEdc0zUwAS/44Jt6N1LTpYW/9TPamhTmk0AYdnn6H
 zv/kVvXz9t6B6YC5PTqopvqteMjh0sfHZWViFIeWPiNMqILlacAfh4HF3lXPSbYKqiFH
 ocTf2SDulYwcTiGDfh5Zp/qh/YM7Gqjet+vBCCykc7mMQfsli/0mWgxeSDP6xVTZlFlh
 1vqjGD8uqg6i4ehSNPBaGe1G3keybebP50f/Q7m/N9/RHARtFQk29jI82+HyFfRDl1Xg
 +IWQ==
X-Gm-Message-State: AOAM530XkmbYxj3cmRjxZgbmj5IVPQocEmVbOdNCht8TMNEt4gn0Bz1C
 bfQ6S84npEuw5es/HXlVs/w=
X-Google-Smtp-Source: ABdhPJythqfYlYVgcNFeKyDt+h22hUKOE2E8SD+Xj9Ehv4d2y38JnX23uG8AWdrUT5NXQXOSqCk2iA==
X-Received: by 2002:adf:f843:: with SMTP id d3mr4726244wrq.55.1616163275313;
 Fri, 19 Mar 2021 07:14:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c131sm6683288wma.37.2021.03.19.07.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 07:14:34 -0700 (PDT)
Subject: Re: QEMU PCI subsystem: what code is responsible for making accesses
 to non-mapped addresses read as -1?
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75fa2ebd-7a7b-a4af-54f2-290b7ffe5d13@amsat.org>
Date: Fri, 19 Mar 2021 15:14:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 1:35 PM, Peter Maydell wrote:
> I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
> PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
> where an attempt to write to an address within the PCI IO window
> where the guest hasn't mapped a BAR causes a CPU exception rather than
> (what I believe is) the PCI-required behaviour of writes-ignored, reads
> return -1.
> 
> What in the QEMU PCI code is responsible for giving the PCI-spec
> behaviour for accesses to the PCI IO and memory windows where there
> is no BAR? I was expecting the generic PCI code to map a background
> memory region over the whole window to do this, but it looks like it
> doesn't...

Indeed, this is something I noticed in my generic AddressSpace
cleanup series.

Currently it is (incorrectly?) done locally by each pci-host
implementation, some register the regions behaving as RAZ/WI,
some don't.

