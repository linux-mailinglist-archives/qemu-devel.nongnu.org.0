Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B472C6AB21D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 21:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYv8a-0001Vn-Qf; Sun, 05 Mar 2023 15:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8Q-0001PG-6H
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:39:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYv8M-0004fr-Or
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 15:39:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso11252511pjb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 12:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678048744;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=1yOeOb3OgQfoFWMOvX2ozSQrG1Fv9IUQw/5CYws80dI=;
 b=cox3woIwMJRyJZoHOWfiSY5swb5Oco22h39YkyxS06PN8upNtpWfIZkK0ExyHdFFYM
 4aF/t3XesWOHZ6X8cxn4Np3PgWgUgHbMzWC5le7mWnO+OZ/vJzzbitzv/i+ql+WMxzHO
 DUvuyC2yGoPvWszzRSNagaxC37bTjO8CJ0bZPzWHny/Punn//2I1lXZXvI73DOOE+PKe
 6q/2NLCl+edPVZqxK+CAcDFz9fb8PHt67eOxQMfdZC2ZiyjQfUFSy/3SF4Z9XJ0U03La
 aUd9lVJaCQrro3fM8rL9YtGN87slB+hQc6BwSSvtEgHogvi4CrYBlAUbmK6JHZrKMllo
 tFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678048744;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yOeOb3OgQfoFWMOvX2ozSQrG1Fv9IUQw/5CYws80dI=;
 b=E17MTpp7hMnubgakOctXr1/iWqLZ6hAHjcrXj9S0chlwED2pV2GJMCf3D50PY2epFG
 somT7xnKxxIgl1exnisUrZp4/i2QLHk45KA8b8Vk5uipbTYuLxK7CaEVDWTVK8OBKYMk
 L9yyPV55CnQRHI6sCrbLUtRMMARiGtC29X8u1wouY0QJGZatyRNdzTKcUoLp3vnxQILb
 tD7+EtTzyuRW2w7lcwpxXZbw6dASBGuypnwjm5caC5u6nPGtFKrXhS6FkChVuSPm5H6d
 geK0pByDu5Lxa7aqNvIK/y/btgDFcnLeG29Vop9NOm6ZSUvxEove+ItY9AjmWP0FNLX/
 n+dA==
X-Gm-Message-State: AO0yUKWs8cfmcPcBIkiFWBxDuam1ppC9dBCADWdTQ3aCDPSSNH8otWsU
 +Ts7+mRvBeZId9G+yFRpHedtew==
X-Google-Smtp-Source: AK7set8A+m5OCGkAWmTui85/5WBXxWg4lsnjCR4Z0xkCgb/LgRaCiHphlXgW3ZPAD7UoRVHau7hZ5g==
X-Received: by 2002:a17:90b:4c06:b0:22b:f0d4:9e1e with SMTP id
 na6-20020a17090b4c0600b0022bf0d49e1emr9474546pjb.8.1678048744536; 
 Sun, 05 Mar 2023 12:39:04 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 z6-20020a17090abd8600b00233b18e6fb3sm4613481pjr.1.2023.03.05.12.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 12:39:04 -0800 (PST)
Date: Sun, 05 Mar 2023 12:39:04 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 12:30:12 PST (-0800)
Subject: Re: [PATCH 1/1] hw/riscv/virt.c: add cbom-block-size fdt property
In-Reply-To: <cc29c762-16e7-8a72-7ad9-b9fd6535c1c1@codethink.co.uk>
CC: dbarboza@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-822a81e9-cdbe-465e-bc14-b24e7f3cade4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 02 Mar 2023 00:37:10 PST (-0800), ben.dooks@codethink.co.uk wrote:
> On 01/03/2023 21:59, Daniel Henrique Barboza wrote:
>> From: Anup Patel <apatel@ventanamicro.com>
>>
>> The cbom-block-size fdt property property is used to inform the OS about
>> the blocksize in bytes for the Zicbom cache operations.
>>
>> Linux documents it in Documentation/devicetree/bindings/riscv/cpus.yaml
>> as:
>>
>>    riscv,cbom-block-size:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      description:
>>        The blocksize in bytes for the Zicbom cache operations.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>   hw/riscv/virt.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 49acb57da4..31b55cc62f 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -244,6 +244,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>           name = riscv_isa_string(cpu_ptr);
>>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
>>           g_free(name);
>> +
>> +        if (cpu_ptr->cfg.ext_icbom) {
>> +            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
>> +                                  cpu_ptr->cfg.cbom_blocksize);
>> +        }
>> +
>>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
>>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
>>           qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
>
> You'll need the same for riscv,cboz-block-size as well.

Thanks.  There's a v2 over here 
<https://lore.kernel.org/qemu-devel/20230302091406.407824-1-dbarboza@ventanamicro.com/> 
that adds both.  The subject changed for the v2.

