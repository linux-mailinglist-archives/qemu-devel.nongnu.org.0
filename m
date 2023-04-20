Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0B6E988A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:40:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWOA-0001dd-IQ; Thu, 20 Apr 2023 11:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1ppWO6-0001dK-Na
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:39:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1ppWO4-0002cu-8n
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:39:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c9so7464892ejz.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamhpc-com.20221208.gappssmtp.com; s=20221208; t=1682005192; x=1684597192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U2r4Ii2IA/xpyMXe65bCVKM9TkC4qnrPXUCN7cHDgAg=;
 b=IIgFFicmzUzEHP5QTeUZ10EC5LkXdr+tw8kzJsZ8QQ2KFhDnkfIhqO0tytca4jri4b
 P0UAXbollwcj7btsOg4KsYTUXc9FfgRVrkifpEv6liI6xbGsN94/HZtRRulPfjboH4J3
 8xJGuDg2kWnqZEgYeU2NYjzTzwfJWdJNohOex7Ef9Vc1+NUeho+bNajuqjPD7Tf3RK6j
 /ZHlk5OYZ/GNSmkHVenH/YIV1HwRKDsRLBMYn97M13eKuo7g/h6lqQn95yhTqy8ymWyb
 g5UhBo7/WQRvQtt2j6/fD2UPnT8juvM8xCKQMw6c+Xyelj9/5zcyrEBJDm9gpmDf/mud
 iCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682005192; x=1684597192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2r4Ii2IA/xpyMXe65bCVKM9TkC4qnrPXUCN7cHDgAg=;
 b=Gf0HCVzfmip6+BQ8gZ5TwmV7KOfB18HauOL8TWkAbNr39P9eXXPlLaFrKZCWUI5dnk
 OQtGjNgIiO2fu+XONZrrFlDwxFeXoZNAM48rzHeNWJQxnAD9bswE2lZvE3LUfIUmDFYf
 M1AcUMy6iUZ9vY7m8tZbHem0BtzEu97QDp5J3c5Sz5GLFqYcsjqagsz4CEEFG/4Clv6c
 ttqnH2dcm9Xz071PDcV7j+GnjR8u8+ohG30eFNmF2LrbK4462JOd/ujjrWS2HXKaUIjO
 eprO9CYRAtYG8/Q4lmgwnhlcaUAS255yslih1ItzfzLfSo3LxIjVlfjLFFkF2CPySnYX
 /5sw==
X-Gm-Message-State: AAQBX9fYdYND/K3TqXlmVLRy8ugzvO2LGfKTmcb2ucYCVRXxpWvIYg6W
 k9XV5ZQd+a+79qMQqP0uK/iZe+6ih8MHnhyjH8Y=
X-Google-Smtp-Source: AKy350apik6g6peCokuY55epMQRUdFcbrRg9th/uwhLdsPfNkxRefw/d1ZUKerUgEAj7mcwKygH9AA==
X-Received: by 2002:a17:906:bb11:b0:92b:6b6d:2daf with SMTP id
 jz17-20020a170906bb1100b0092b6b6d2dafmr1860844ejb.77.1682005192103; 
 Thu, 20 Apr 2023 08:39:52 -0700 (PDT)
Received: from localhost.localdomain (095-097-139-014.static.chello.nl.
 [95.97.139.14]) by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm859463ejf.36.2023.04.20.08.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:39:51 -0700 (PDT)
From: robin@streamhpc.com
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robin Voetter <robin@streamhpc.com>
Subject: [PATCH 0/1] pcie: Allow atomic completion on PCIE root port
Date: Thu, 20 Apr 2023 17:38:39 +0200
Message-Id: <20230420153839.167418-1-robin@streamhpc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=robin@streamhpc.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Robin Voetter <robin@streamhpc.com>

The ROCm driver for Linux uses PCIe atomics to schedule work and
generally communicate between the host and the device.  This does not
currently work in QEMU with regular vfio-pci passthrough, because the
pcie-root-port does not advertise the PCIe atomic completer
capabilities.  When initializing the GPU from the Linux driver, it
queries whether the PCIe connection from the CPU to GPU supports the
required capabilities[1] in the pci_enable_atomic_ops_to_root
function[2].  Currently the only part where this fails is checking the
atomic completer capabilities (32 and 64 bits) on the root port[3].  In
this case, the driver determines that PCIe atomics are not supported at
all, and this causes ROCm programs to misbehave.  (While AMD advertises
that there is some support for ROCm without PCIe atomics, I have never
actually gotten that working...)

This patch allows ROCm to properly function by introducing an
additional experimental property to the pcie-root-port,
x-atomic-completion.  Setting this option makes the port report
support for the PCI_EXP_DEVCAP2_ATOMIC_COMP32 and COMP64
capabilities.  This then makes the check from [3] pass, and
everything seems to work appropriately after that.

To verify that the capabilities are reported correctly, one can use
lspci to check the capabilities of the root port: lspci -vvv -s <root
port id> should show 32bit+ and 64bit+ capabilities in DevCap2 when
x-atomic-completion is enabled.  For example:

    -device pcie-root-port,x-atomic-completion=true,id.pcie.1

The output of lspci should include the following for the pcie root port:

    AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-

To verify that ROCm works, the following HIP program should be
sufficient.  The work is scheduled to the GPU by signaling a semaphore
using atomic operations from the CPU side, which is completed on the
GPU, and the GPU-side printf works by signaling a semaphore from the GPU
that is completed on the CPU.  It can be compiled using hipcc with
'hipcc -otest test.hip':

    #include <hip/hip_runtime.h>
    __global__ void test() {
        printf("hello, world\n");
    }
    int main() {
        test<<<dim3(1), dim3(1)>>>();
        hipDeviceSynchronize();
    }

Previously, or when x-atomic-completion is set to false, this program
would simply hang.  Additionally, a message along the lines of the
following is printed to dmesg during boot if the GPU driver determines
that atomics are not supported:

    amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported

When atomics are properly supported, the above program works as
intended, and the previous dmesg message is of course not printed. For
this I am using a simple machine setup using the following device
options, with the GPU that im testing with of course on 03:00.0.

     -device pcie-root-port,x-atomic-completion=true,id=pcie.1
     -device vfio-pci,host=03:00.0,bus=pcie.1

This patch does not include any automatic detection whether the root
port of the host supports the atomic completer capabilities, nor if any
of the physical PCIe bridges between the CPU and GPU support atomic
routing.  The intention here is that the user should make sure that the
host does support atomic completion on the root complex. See also some
prior discussion[4].  I have run the full test suite of some ROCm
libraries: rocPRIM, rocRAND, hipRAND, hipCUB and rocThrust.  All of the
tests pass now, with some minor unrelated changes.

Kind regards,

Robin Voetter, Stream HPC

[1] https://github.com/torvalds/linux/blob/v6.2/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c#L3716
[2] https://github.com/torvalds/linux/blob/v6.2/drivers/pci/pci.c#L3781
[3] https://github.com/torvalds/linux/blob/v6.2/drivers/pci/pci.c#L3829
[4] https://lists.nongnu.org/archive/html/qemu-devel/2023-04/msg01815.html
---

Robin Voetter (1):
  pcie: Allow generic PCIE root port to enable atomic completion

 hw/pci-bridge/gen_pcie_root_port.c | 2 ++
 hw/pci/pcie.c                      | 6 ++++++
 include/hw/pci/pcie_port.h         | 3 +++
 3 files changed, 11 insertions(+)

--
2.39.2


