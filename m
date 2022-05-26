Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BCA535092
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:27:37 +0200 (CEST)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuESd-0002aF-Uv
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nuEPc-0000Fw-6W
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:24:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nuEPa-0002Na-EG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:24:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so1185617wmz.2
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0GDCux2pgDdMnL/OIuWHiMZT/bJADSDX7OCGdce2UdM=;
 b=wfICdFB4AuLKZY5061AbPlHHO9PvqvfApbMIeLgV6SNKzSJKIoLZAk5Z00P2WrxG+S
 rU2IwEhgUVOtfJyOBODGhjXuXFZb6TSvPmxkDew2E3imD+aOpL4bozU+szFvd0o6IXTr
 7dBilsU2Cv+t/rhIHfT9JH8GsEpu0fvK7VbhPmMsyO/czBHLczkN7usCX+hu18LjyJqd
 R51Y9RsjhMsSF2WSAKGqUzqT089RsLkpChTKiKspZal17vrNFlehjWACvWezCR1XhivF
 tqbnFe0SIOV4l78xbAi3dxCpP2Ua7tWE0GAxvVe0DkxWbc45J77i0Ir9V7NrTExzH7Jg
 NblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0GDCux2pgDdMnL/OIuWHiMZT/bJADSDX7OCGdce2UdM=;
 b=Jv9/ia63dxyANvBxAX4VectYzEl6PiEzsoiJRLenR95gP6s5WCBfQgBy1oEcV9w4yv
 PCCnjnKV5eSktT4xKa3UnDGWh82F0bh+fdrjwWjkscvxyuEeHp8m6FZzN3d9dE54U88A
 kVCJFSWFXWHegGuV+CN9j8mcPhvEDM8ZeaibCpUsZFP22mtJSDjUMfw1Kt1mrOp3qHLr
 Sq9HNtCYTuFbzcC1fSBPZrbAfy5jUmkZqH1Z7qX5nuxALlKurwLJAlZi176gIeeyM4c6
 lY3bMXQAU65Br/r37qtb1q4b52RXbejL3OflO9FHPdx/8LIAZJAp5HLxjOOtaNIjhXa0
 KqEA==
X-Gm-Message-State: AOAM533aG889q6qtOcCpZVJ6EXe6/VF5OsnQewT0RAqB9dh+gTX+y4O1
 xdau4VMAJTFw13qAxNVd4po5sA==
X-Google-Smtp-Source: ABdhPJzEVf87yI/kIQYmUERuraxxaM6e6Ts0sHctUhZNEsYotHbdlxjd6bc8bd6v+PLDggb17QtexA==
X-Received: by 2002:a05:600c:4313:b0:397:26c9:dda1 with SMTP id
 p19-20020a05600c431300b0039726c9dda1mr2538577wme.184.1653575064592; 
 Thu, 26 May 2022 07:24:24 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b0020c5253d8desm1821048wrv.42.2022.05.26.07.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 07:24:24 -0700 (PDT)
Date: Thu, 26 May 2022 15:23:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] hw/acpi/viot: generate stable VIOT ACPI tables
Message-ID: <Yo+NfwxoJkeW3XVZ@myrica>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 25, 2022 at 06:32:26PM +0100, Mark Cave-Ayland wrote:
> I was working away at some improvements for PS2 devices when I noticed that one
> small change to the instantiation of a PS2 mouse device caused a regression in
> tests/qtest/bios-tables-test, specifically the /x86_64/acpi/q35/viot subtest.
> 
> Closer examination of the failed test output showed the problem was that the
> order of the PCI host bridge entries had changed within the table causing the
> generated binary to fail to match the version in tests/data/acpi/q35/VIOT.viot.
> 
> The error occurs because there is no guarantee in the order of PCI host bridges
> being returned from object_child_foreach_recursive() used within
> hw/acpi/viot.c's build_viot() function, so any change to the QOM tree can
> potentially change the generated ACPI VIOT table ordering and cause the
> regression tests to fail.
> 
> Fortunately the solution is fairly easy: change build_viot() to build an array
> of PCI host bridges and then sort them first before generating the final ACPI
> VIOT table. I've chosen to sort the PCI host bridges based upon the min_bus
> number which seems to work okay here.
> 
> The changes in this patchset were heavily inspired by the build_iort() function
> in hw/arm/virt-acpi-build.c which already does the right thing here. Patches 1-5
> make the required changes before patch 6 updates the VIOT binary to match the
> updated ACPI VIOT table ordering.

Thanks for the fix, looks good to me and I did some light testing

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v3:
> - Rebase onto master
> - Add Reviewed-by tag from Ani in patch 1
> - Declare struct viot_pci_host_range as const in enumerate_pci_host_bridges() in patch 3
> - Add Reviewed-by tags for the series from Phil
> 
> v2:
> - Rebase onto master
> - Rename pci_host_bridges() to enumerate_pci_host_bridges() in patch 1
> - Change return type of pci_host_range_compare() from int to gint in patch 5
> - Tweak subject line in patch 5: s/PCI host bus/PCI host bridge/
> - Add Acked-by and Reviewed-by tags from Ani
> 
> 
> Mark Cave-Ayland (6):
>   hw/acpi/viot: rename build_pci_range_node() to
>     enumerate_pci_host_bridges()
>   hw/acpi/viot: move the individual PCI host bridge entry generation to
>     a new function
>   hw/acpi/viot: build array of PCI host bridges before generating VIOT
>     ACPI table
>   tests/acpi: virt: allow VIOT acpi table changes
>   hw/acpi/viot: sort VIOT ACPI table entries by PCI host bridge min_bus
>   tests/acpi: virt: update golden masters for VIOT
> 
>  hw/acpi/viot.c                | 107 +++++++++++++++++++++-------------
>  tests/data/acpi/q35/VIOT.viot | Bin 112 -> 112 bytes
>  2 files changed, 68 insertions(+), 39 deletions(-)
> 
> -- 
> 2.20.1
> 

