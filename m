Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A516AE69A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaDo-0002WG-9Y; Tue, 07 Mar 2023 11:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaDl-0002V3-Pb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:31:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaDk-0001Fd-01
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:31:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7595953wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206682;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8PPHIiqZxa3L0uXzrMAf95TuF6VyLOpGaQVqR/kzng=;
 b=ShQTB23gTN45msD948o2BBk8KBe9YJifn3GhToqW84Qu3D3E4HeaiuXZHrLlw6SUe3
 H/02Y9dOtBR4N5EQVyG2n9ipP1U/PdYU70K+Id9NNOSczAKuob3DJ9edC0o+IxhnupfS
 8DUJKJ/lhOBY0h+bRKeab7TzwljNwXDLNb5RyK6F3ECP4JzTG8/ZEaJazUJ9F59iB0Tx
 VmyEJCsfLK0AfWhbm/B0zdboBomQDvpfqiZNQYTEmBm9hDcGBLeS5r/GBB6G7gp7510M
 ZDN9NdLVjtbK9R9h9xlv+wjz2KmmZ/fq4MMDNvEjy41LwLd75ag0aPuvA70k/xB3uUqo
 yzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206682;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8PPHIiqZxa3L0uXzrMAf95TuF6VyLOpGaQVqR/kzng=;
 b=aEnXAoDEbZteLgU22M2IruAAiRHxzKbg77l9X34r/8FXVwZjxUhhdPzBwM1J9CZ4hi
 oG8RHkPfrXH148BCPpPMy9osfgYXHc8Kyl8kBvb+zXq8qEZEVW/u6U0iSs651uzXPd1q
 UdNHcNUutyVMwITntVbQ0zZjY+Jqi5l0CFzGq3XWH4Gd0Yh8nE2uucc71UYbzE0rLzNX
 aPpcyQDEm1fX+X38ytdwWRdYTkn1CRikfG+QLIl3c36Y0CAc7diAZa2wPcLgKbMGUUaQ
 bKq2o5dHtPyWcSKuAYazuXP0dt9uu61o1XLaCDoXQiv0P0YAzn75MOeoaBAW0u2iLshV
 uDdQ==
X-Gm-Message-State: AO0yUKWIUbmvGc1YK7v6PIsSSQiWUPhysZWuwZV+Jpb17ehTtL8dUGC7
 UHOym9pQvVPFHFMRx85Pd5A=
X-Google-Smtp-Source: AK7set9YFZieeppgaH6M5VkSwbWJwsbmNo2aCJV0mrnxq2RJI0LIPvzDXyCZPWYdggIvhWNebxOjaw==
X-Received: by 2002:a05:600c:4fc2:b0:3eb:37ce:4c3e with SMTP id
 o2-20020a05600c4fc200b003eb37ce4c3emr13739027wmq.16.1678206682265; 
 Tue, 07 Mar 2023 08:31:22 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c075500b003e0238d9101sm13175109wmn.31.2023.03.07.08.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:31:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3a32f2e4-b45f-ed78-3f0b-acc7050488d5@xen.org>
Date: Tue, 7 Mar 2023 16:31:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 25/25] i386/xen: Initialize Xen backends from
 pc_basic_device_init() for emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-26-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that all the work is done to enable the PV backends to work without
> actual Xen, instantiate the bus from pc_basic_device_init() for emulated
> mode.
> 
> This allows us finally to launch an emulated Xen guest with PV disk.
> 
>     qemu-system-x86_64 -serial mon:stdio -M q35 -cpu host -display none \
>       -m 1G -smp 2 -accel kvm,xen-version=0x4000a,kernel-irqchip=split \
>       -kernel bzImage -append "console=ttyS0 root=/dev/xvda1" \
>       -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=none,id=disk \
>       -device xen-disk,drive=disk,vdev=xvda
> 
> If we use -M pc instead of q35, we can even add an IDE disk and boot a
> guest image normally through grub. But q35 gives us AHCI and that isn't
> unplugged by the Xen magic, so the guests ends up seeing "both" disks.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


