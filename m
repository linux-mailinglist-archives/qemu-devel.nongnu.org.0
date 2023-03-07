Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E169C6AECC6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:58:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbYE-0003Sj-Lf; Tue, 07 Mar 2023 12:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZbYC-0003SH-C5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:56:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZbYA-0008Ce-Nm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:56:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so7765132wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678211793;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gQSkQKXVqCcGQhbgWI2VTbT227cYGUJyB9WO8S2uqmU=;
 b=GHgrklShTonRXBkjDkbzTfw2hfrq8ZCqc7Ne5PdUD9OdYtMyn3jpERxviqNAXRA2hr
 pgf1Sfvubx7F+s2nP6jwCCj0hEa9C/SaBSCzO6EWncetroCmh/h85Av5I6LGaYVRT38t
 IedjlRVy664vFo8n0W1ysf0AqlTPsKaG+ZPDuh8UwtkMBTPjDOl7ICund4Db4hme47n1
 +fi3XPkWF2S9TlIgXe7QbMf9HBPymMfUIkGYlEBqRoGqJa/HTNJ8YMETIL6q2VA9glJX
 9zJfe0sa1Lx+zK/LxBEKra2AUp2z2pzrPjb+ODhqcQHW4ypOQQ3aKwbG26zw2E5TBrst
 +QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211793;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQSkQKXVqCcGQhbgWI2VTbT227cYGUJyB9WO8S2uqmU=;
 b=Y/OF+w3sH/U9ZTZFXKsbh8r/U+1VksHZhHdWRaVmsLmTwjbLSae8XQMCTjeUgtw0kw
 X+FF3Rs+bonw0XTUwM8Z6tLt8oBtQmI5VyNkM2mOCtQc/NKxRQmjqRhITRLVcHtqWECa
 ykVXKqAjo9aJRe09n2XTi6uJTx8iJTxUd30amBalw9n1/MVLEZ13bSirvjv+EzBU2P+r
 xQAumqbWwy6d25jY+SN1zt8ZefaOEeNEGSeLMOTq3w4Lt14bi5G0I/gsDoD9A3QHL73n
 dmD7wZHLTs8AGpjefOhoBVMW3TOQAmZEylALHWlhCbFzhIEh8yN6KKte6DhZreDrrHTJ
 hXjw==
X-Gm-Message-State: AO0yUKXpoQh5WcWPhK2j0F9YdkOqln9PuolEXf1h2v74GOjqIfBJnb5B
 3dgEQJEN2r7921f+tu/oxX8=
X-Google-Smtp-Source: AK7set8wB+t7FiQ93ofPjATTc2z5iVBSASwMKrkgOs4VWWEY+CZ2vNEPWitNrR1Z0toY8rg2O7Rsnw==
X-Received: by 2002:a05:600c:468e:b0:3eb:29fe:f922 with SMTP id
 p14-20020a05600c468e00b003eb29fef922mr13585282wmo.29.1678211792618; 
 Tue, 07 Mar 2023 09:56:32 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b002ce3b31753fsm12186758wrw.26.2023.03.07.09.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:56:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cc9471d5-c2ce-31fb-14bb-6262abbfbd83@xen.org>
Date: Tue, 7 Mar 2023 17:56:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 25/27] i386/xen: Initialize Xen backends from
 pc_basic_device_init() for emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-26-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230307171750.2293175-26-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
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

On 07/03/2023 17:17, David Woodhouse wrote:
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
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

Also...

Tested-by: Paul Durrant <paul@xen.org>

... on real Xen (master branch, 4.18) with a Debian guest.


