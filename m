Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D570A643D03
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 07:10:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2R8X-0005fC-L8; Tue, 06 Dec 2022 01:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1p2R8U-0005ei-RW
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 01:08:58 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1p2R8T-0004wi-AC
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 01:08:58 -0500
Received: by mail-ed1-x530.google.com with SMTP id f7so18859486edc.6
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 22:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/kRxiM0y+JXo87+7ZeugmiITWgTgyolajs60qKmx6m4=;
 b=NBNQC8XvUnCjjElMWLBb8fYrIWqgHAriiRVyD9iR9OGngRkCxOfbBytr1H43vxty5E
 LMr0d3L7InojCNfryNqqd41ZeLw3bit7kIjoWY++2WsxrlFSB06/YF9EsOlQ/FC27eVE
 qyoND7GpzrrxTRMac3ecK1VYjp2nwOMz406MgP8bPIximGUu/7C0Aoge08j5geo8lmSd
 z/qA4tOvnGl0GPFDVA/4ziMD86YL0QhgGaHFugM996DW2J1BJtOEVDYyD88OhAZm2bjF
 xSgQwd0Fs4belHq7KIPeYI3utKs35o9ShaoXm2jdd9tpkwSq9VMNIceTGf3YGxxYCC6e
 ZoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kRxiM0y+JXo87+7ZeugmiITWgTgyolajs60qKmx6m4=;
 b=NV3051ePyyNMi9sX1X8O7oRWVNZzO5JBbJyJVaqXkDrYx/9LZLBF0o9XCrHrfP9ku9
 2k7Hi3jZzHTH1cKrkXvnQ7anHL1xEqF8+H4/iwejtLMJcpdUIbeYSffmMS06mhpcPxWy
 zsgny1c8kaQb1/H+I+livYZtoXBf5IxHPQtXNQXeFRyd0DuGjzqMoIEqO7Two3P6tkFe
 Q38n6n8g8Pdgupc1RNXA8HKOloA7+dCn053u6n/7jpsHo+KMhICxCrqgakur0xFOQAob
 uRyU7zY2TsCHv+J3/6Rr1apB3HBSXiDAX3Qy7wx+jiboc1n8JRGOWb0yQ0yFIfultQe4
 i7rQ==
X-Gm-Message-State: ANoB5pmyuwKeQ5rRE4NXTc7ZYs7X6iIrrscdYlwWBm5PXMZOkDP5pLlP
 Ehf/0JWRnPhkjd4srrjweBVBxA==
X-Google-Smtp-Source: AA0mqf7FQbcYVHYH7NDs2kLbORRVTGw+VgF2bQ1FK6wdSTDZ7ME/BNhsbayGVKewV8ONBpwLbQ/OnA==
X-Received: by 2002:aa7:d613:0:b0:46a:ed3c:a31d with SMTP id
 c19-20020aa7d613000000b0046aed3ca31dmr39697918edr.368.1670306935240; 
 Mon, 05 Dec 2022 22:08:55 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a50fb98000000b004615e1bbaf4sm578187edq.87.2022.12.05.22.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 22:08:54 -0800 (PST)
Date: Tue, 6 Dec 2022 07:08:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v3] riscv: Allow user to set the satp mode
Message-ID: <20221206060853.yztiqdthlmvn6cfp@kamzik>
References: <20221201093623.1394747-1-alexghiti@rivosinc.com>
 <20221201144722.aq4pfmdehrghaoy2@kamzik>
 <CAHVXubgp5G6HO4v8GwGx4KaDegPqc2mZH2BQzYqM+T1Hxx6bxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubgp5G6HO4v8GwGx4KaDegPqc2mZH2BQzYqM+T1Hxx6bxQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Dec 06, 2022 at 06:57:39AM +0100, Alexandre Ghiti wrote:
> 
> I can't find the sve* properties you're talking about, can you point them
> to me?
>

target/arm/cpu64.c: cpu_arm_get/set_vq() and arm_cpu_sve_finalize() and
aarch64_add_sve_properties().

Thanks,
drew

