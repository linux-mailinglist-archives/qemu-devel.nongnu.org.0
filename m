Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D46D980F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:22:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPZ6-0000dT-Df; Thu, 06 Apr 2023 09:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pkLw6-0001Cz-Jm
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:29:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pkLw4-0004Bh-CZ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:29:42 -0400
Received: by mail-ed1-x536.google.com with SMTP id cn12so147792550edb.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamhpc-com.20210112.gappssmtp.com; s=20210112; t=1680773376;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/MDnH4ld+IMQbZg62h/8OKXUOoWcpWthApmSKgzSaw=;
 b=Yo7xP4S0ZQQ9E8yY42CnjjC7obDmY/Xv6czhTWiYH3aBk0/5KZh27W+eQSQm3rgmtR
 ZZ/FnQZ4QJ9uTtf/XVHfUbMNVnfLhVngtEetYOHLY6fzE5j4FfwMK8vp4ELh74bpHV4+
 LNatKAq1eK2omD3PtBhLe+zhk/eEeMes5e2eKvmoH7xiygjq1PK0DMmR9QAMsFZqT+vp
 gEyXOhWNlFNlegCN/fJDbFwILlBfF4YxH5LE1TaNYgPgJkoocl8MgxKyhR4PZayJxpgz
 vpIKRr5ASUgOzYkU39oGIjiC1mxnSH8aVg9HRToYTpVnw1lcAYNrh2+9q/+/MtyF2N47
 mY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773376;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M/MDnH4ld+IMQbZg62h/8OKXUOoWcpWthApmSKgzSaw=;
 b=RjYKCfDIvOkMxkjM2QwSBxHB9mna7Wk7qAUkXGRoeBODdBzjP3Ix3i4KdpLuamsmR7
 wew1BCS7E5H6dHyEfFlMRpn1fxXtfav1i4PNcjb40RKdHC1NQ53TY9HOhbB9Q3kxN1/1
 t8nULje9PRbDrXlzupEZL2RuvJHqV1yFQJWOIAlxAWGh821XmtO904qGpXfOtRI9lnyc
 q54nB1G7MEmpU11BmGCYHUhiLlKjPHdxDPYVS2PXGghb2pyEB6v6CnJLFRXP6io36GsO
 RxMMTtUk3eDuHsFHClqmV4qzQfceQvu5I6zAtImFqoGZzDHY0FPt4XOIzM4n1Xi3XH8p
 jsDg==
X-Gm-Message-State: AAQBX9d7lqzOHJKWZH0Cq07HVvwQjVnaHj6qQujlUwWT4KeHN5NjA3TM
 vvBenVQ/meLCsz705Yeg5efU0VTgZfDndS0yBU8=
X-Google-Smtp-Source: AKy350YoXYCCcc8O9tNSdJIryXYRv5izoAQSxE2v5ODn0t+s4SFStK1n0ynZMUa+YZgsOtF3dp5BkQ==
X-Received: by 2002:a17:906:144d:b0:93f:2256:fc05 with SMTP id
 q13-20020a170906144d00b0093f2256fc05mr5661752ejc.55.1680773376247; 
 Thu, 06 Apr 2023 02:29:36 -0700 (PDT)
Received: from [192.168.8.135] (095-097-139-014.static.chello.nl.
 [95.97.139.14]) by smtp.gmail.com with ESMTPSA id
 c17-20020a50f611000000b004c19f1891fasm364261edn.59.2023.04.06.02.29.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 02:29:35 -0700 (PDT)
Message-ID: <b30370f5-0b52-d2de-6e47-8f288a219a43@streamhpc.com>
Date: Thu, 6 Apr 2023 11:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Robin Voetter <robin@streamhpc.com>
Subject: PCIe atomics in pcie-root-port
Content-Language: en-US
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=robin@streamhpc.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Apr 2023 09:22:01 -0400
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

Hello,

I am trying to use qemu to run ROCm in a virtual machine via GPU 
passthrough with vfio-pci. While this mostly works out of the box, ROCm 
requires PCIe atomics to function properly, and it seems like that this 
is a feature that is missing in qemu. The setup is using a simple PCie 
topology, where the GPU is connected to a pcie-root-port as follows:
    -device pcie-root-port,id=pcie.1
    -device vfio-pci,host=<host_pci_address>,bus=pcie.1

When the amdgpu kernel module is loaded in the guest, enabling PCIe 
atomics fails because it requires that PCIe root ports support 32- and 
64-bit atomic completion, see commits 430a2368 and 8e6d0b69 in Linux.

I patched the required flags into the DevCap2 register in qemu and 
everything seems to work fine. I'm interested in getting this change 
into qemu proper, but I have some questions about how to do that:

1. In order for PCIe atomics to be supported, every bridge in the path 
between the root complex and the device in question needs to support the 
routing capability, as well as the device being required to support the 
atomic requester/completer capabilities of course. When a certain device 
from the host is connected to a root port in qemu, that path will be 
abstracted away into the virtual PCIe topology. Should this property 
from the host be reflected into the virtual path in qemu, or is it 
better to gate this behind a property of the pcie-root-port? For 
example, the user could then simply pass -device 
pcie-root-port,id=pcie.1,atomics=on to make the pcie-root-port report 
that it supports these operations. If this should be reflected from the 
host automatically, how should this be tested for? I checked around the 
source for how for example the link speed is set, but it seems like that 
is not reflected from the host system automatically either.

2. Is anything else required to support PCIe atomics, or did I just get 
lucky that my programs work?

Thanks,

Robin Voetter, Stream HPC


