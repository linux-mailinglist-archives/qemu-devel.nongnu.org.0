Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A715A6EA5C1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:23:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppm2M-0003G7-Q5; Fri, 21 Apr 2023 04:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppm2K-0003Fg-TP
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppm2J-0007NZ-4U
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682065350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=is3oJZaBdkNbzvZTIGULYW/H8IUQiiY6z77YqfTlROs=;
 b=LlUGCLjLT5N2XVYs0yBHGxYYnAeY146bO+00yBMjv5cqJ1NCQip/F/BdFnqvSHCL0fD2Gd
 kXzonnNdUOTwxAIn1CbEVRyQCyZB+4gShPKXN70ujEBYewovMb9z5qLcThfJM5jp7bokhi
 cu3l3GcrTHpdQSkYUsUEkrpNlvVdOQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-cL-GO-FGMuCTDYUZgswDjg-1; Fri, 21 Apr 2023 04:22:28 -0400
X-MC-Unique: cL-GO-FGMuCTDYUZgswDjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so4973765e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682065347; x=1684657347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=is3oJZaBdkNbzvZTIGULYW/H8IUQiiY6z77YqfTlROs=;
 b=Ys9Bz3t18zUmFJywwjU5LJ7/cliAnYRYAeeLXEtSuKLZ0X5OYcn+u5F5saThY6xvOd
 OOZsqmsLDuZAp7g1iRoF0uon3H7l5R2gTGc8XHdZvhr0ZThLriNRfmybKXK1UjdduleP
 gyAJ2GlkGN4+MvIPGMbnKHV4lU4Mj1vsL5WJCYzgaylQk8uCoS2rjiy3rziqEkvUDMrg
 j+kdG9+Az/eQB2kgAPQx3bzGuQ9SUDZOa7nhjQePtbERyIUVfuGF/mrSCdBPgrbqvYG1
 v6k+lq5CIggLyOqMNJpQ3u2TegoYe78v6WGCv/kE0bIBmgKUmJ8bSqiude27ViFML3tJ
 GkHA==
X-Gm-Message-State: AAQBX9fyUpThc8qznP9CUtKpYiwuorLBL7dwWuj5Dtm57EDAmKwSPbbH
 GKj/+PYPGkT4DBoLxao0jerAIJyirc4uNiOnx81F51gaAVOPRkegdVziJbm1Ui+oa4XG1+G4WR6
 e6VSzD3WA/yNr6Ls=
X-Received: by 2002:a7b:c008:0:b0:3f1:7aff:e13a with SMTP id
 c8-20020a7bc008000000b003f17affe13amr1327711wmb.3.1682065347136; 
 Fri, 21 Apr 2023 01:22:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZqUux6pM7yw5uASgNF/FGv3i4xLAYdqshbBR7HHRniVdJhMek520gYmVJW1la/K8gshuo53A==
X-Received: by 2002:a7b:c008:0:b0:3f1:7aff:e13a with SMTP id
 c8-20020a7bc008000000b003f17affe13amr1327694wmb.3.1682065346751; 
 Fri, 21 Apr 2023 01:22:26 -0700 (PDT)
Received: from redhat.com ([2.55.62.70]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f17848673fsm4121811wml.27.2023.04.21.01.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:22:26 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:22:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: robin@streamhpc.com
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/1] pcie: Allow atomic completion on PCIE root port
Message-ID: <20230421042013-mutt-send-email-mst@kernel.org>
References: <20230420153839.167418-1-robin@streamhpc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420153839.167418-1-robin@streamhpc.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 20, 2023 at 05:38:39PM +0200, robin@streamhpc.com wrote:
> From: Robin Voetter <robin@streamhpc.com>
> 
> The ROCm driver for Linux uses PCIe atomics to schedule work and
> generally communicate between the host and the device.  This does not
> currently work in QEMU with regular vfio-pci passthrough, because the
> pcie-root-port does not advertise the PCIe atomic completer
> capabilities.  When initializing the GPU from the Linux driver, it
> queries whether the PCIe connection from the CPU to GPU supports the
> required capabilities[1] in the pci_enable_atomic_ops_to_root
> function[2].  Currently the only part where this fails is checking the
> atomic completer capabilities (32 and 64 bits) on the root port[3].  In
> this case, the driver determines that PCIe atomics are not supported at
> all, and this causes ROCm programs to misbehave.  (While AMD advertises
> that there is some support for ROCm without PCIe atomics, I have never
> actually gotten that working...)
> 
> This patch allows ROCm to properly function by introducing an
> additional experimental property to the pcie-root-port,
> x-atomic-completion.

so what exactly makes it experimental? from this description
it looks like it actually has to be enabled for things to work?
Also pls CC alex on whether this is a correct way to do it.

>  Setting this option makes the port report
> support for the PCI_EXP_DEVCAP2_ATOMIC_COMP32 and COMP64
> capabilities.  This then makes the check from [3] pass, and
> everything seems to work appropriately after that.
> 
> To verify that the capabilities are reported correctly, one can use
> lspci to check the capabilities of the root port: lspci -vvv -s <root
> port id> should show 32bit+ and 64bit+ capabilities in DevCap2 when
> x-atomic-completion is enabled.  For example:
> 
>     -device pcie-root-port,x-atomic-completion=true,id.pcie.1
> 
> The output of lspci should include the following for the pcie root port:
> 
>     AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
> 
> To verify that ROCm works, the following HIP program should be
> sufficient.  The work is scheduled to the GPU by signaling a semaphore
> using atomic operations from the CPU side, which is completed on the
> GPU, and the GPU-side printf works by signaling a semaphore from the GPU
> that is completed on the CPU.  It can be compiled using hipcc with
> 'hipcc -otest test.hip':
> 
>     #include <hip/hip_runtime.h>
>     __global__ void test() {
>         printf("hello, world\n");
>     }
>     int main() {
>         test<<<dim3(1), dim3(1)>>>();
>         hipDeviceSynchronize();
>     }
> 
> Previously, or when x-atomic-completion is set to false, this program
> would simply hang.  Additionally, a message along the lines of the
> following is printed to dmesg during boot if the GPU driver determines
> that atomics are not supported:
> 
>     amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
> 
> When atomics are properly supported, the above program works as
> intended, and the previous dmesg message is of course not printed. For
> this I am using a simple machine setup using the following device
> options, with the GPU that im testing with of course on 03:00.0.
> 
>      -device pcie-root-port,x-atomic-completion=true,id=pcie.1
>      -device vfio-pci,host=03:00.0,bus=pcie.1
> 
> This patch does not include any automatic detection whether the root
> port of the host supports the atomic completer capabilities, nor if any
> of the physical PCIe bridges between the CPU and GPU support atomic
> routing.  The intention here is that the user should make sure that the
> host does support atomic completion on the root complex. See also some
> prior discussion[4].  I have run the full test suite of some ROCm
> libraries: rocPRIM, rocRAND, hipRAND, hipCUB and rocThrust.  All of the
> tests pass now, with some minor unrelated changes.
> 
> Kind regards,
> 
> Robin Voetter, Stream HPC
> 
> [1] https://github.com/torvalds/linux/blob/v6.2/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L3716
> [2] https://github.com/torvalds/linux/blob/v6.2/drivers/pci/pci.c#L3781
> [3] https://github.com/torvalds/linux/blob/v6.2/drivers/pci/pci.c#L3829
> [4] https://lists.nongnu.org/archive/html/qemu-devel/2023-04/msg01815.html
> ---
> 
> Robin Voetter (1):
>   pcie: Allow generic PCIE root port to enable atomic completion
> 
>  hw/pci-bridge/gen_pcie_root_port.c | 2 ++
>  hw/pci/pcie.c                      | 6 ++++++
>  include/hw/pci/pcie_port.h         | 3 +++
>  3 files changed, 11 insertions(+)
> 
> --
> 2.39.2


