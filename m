Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24615432364
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:56:20 +0200 (CEST)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUzq-0003Ih-OT
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUvO-0007RP-C1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUvH-0005I5-E7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634572294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3lGxh86SIo5Sxoni9msUYyZM2QdjHhWJuKMLXf2ILA=;
 b=ifvlm39VKsYjM2RQhdmXzbpeQMb9Rb0mdeVMjXvWkNjI0GwYJcU8Hd2Nht9ES1I37QL+6A
 pDx6rygbtyOgJyKHVqEGWCBRoDEAlt0GNUPW77UZTlQEX36CxWkCuvRc/rmsblRx4zv1xZ
 0ZJ4CPAdD2Y5MnypL3raJGwArcWAK+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-P0BJW7hoPTyYcRf6ojMECA-1; Mon, 18 Oct 2021 11:51:33 -0400
X-MC-Unique: P0BJW7hoPTyYcRf6ojMECA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2203404wmj.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n3lGxh86SIo5Sxoni9msUYyZM2QdjHhWJuKMLXf2ILA=;
 b=CEC05zLTWh1TfYnhvdfLypYqJsZdxGb5jCbVuR4H/hW2ABWW3cyuiUm6cdCAo4NyqU
 Q5wU85WHwacXN1LsF9DXtKfNPzp1HEZjzA14po9WP+c7PxrUGQ1d23UyCyKBPeSC+tiT
 I1/GF3jOL8K3p4POs3rJ81Niuy2Mgp2GdcDd1HuAclJMfmuC0LZn+cQ2btK5fhTUCrYB
 Bp7f5w3AxUKiEjhw5nbTmAL5hfD4JfgAtPKbkT59xmChSKJBLLxl2UcZR7UlYrQw65y3
 A+hPlL1sU2JrKjwmX/tXkG/KcpqK2YRg5vlIGohIBTm4p0EFXICazYuvypU5H/1CH1HJ
 FYkA==
X-Gm-Message-State: AOAM5335SakR+J3tppyhkwM1eyK44xgUEAc+gavsIl9o55EBMhdKJ5kN
 NebVLJm4lFqL7xf0Kyg+I2CmUw7JiibOgSOB1EGfAutcM0pLYhsVXv6p1+V/4u3E4yyoYQPJfAn
 lKrK+CFN0Yxo3aQ0=
X-Received: by 2002:adf:f10c:: with SMTP id r12mr25158352wro.298.1634572292272; 
 Mon, 18 Oct 2021 08:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCwqdMneGEZvE9BZB8XIQOqua0Zf5TsWN7Z/OgY6ay8qip2wgvL2Wtq7+QlTjqXEqTuBb5eQ==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr25158335wro.298.1634572292107; 
 Mon, 18 Oct 2021 08:51:32 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id v18sm14176501wrm.63.2021.10.18.08.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 08:51:31 -0700 (PDT)
Message-ID: <b51c604b-8f5c-c5e3-7deb-6d6830b30299@redhat.com>
Date: Mon, 18 Oct 2021 17:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Bin, is there a cover letter?

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

On 10/18/21 17:38, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/riscv/microchip_pfsoc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)


