Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77A6AE382
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYla-0001hI-Aq; Tue, 07 Mar 2023 09:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYlU-0001ge-Up
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:58:08 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYlT-0004kD-8M
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:58:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so12428195wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678201086;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0EK/FfNQ9hSqSrJdeG4O9BtBV3bH00pWSvIH5yTiLYo=;
 b=kDk0p3cXqIXD89W5Q2xV+/3i5fgaoiGpWWPOK6yfG5eJlY1TVLDvYcET5PBxeZ3Izk
 YYnrisgj98WxhkjKCeD3qH9AnyqQx5wBS1gPR5SKhEbXIAqYGHCgp8uN/KaYEL2y5PFN
 DYxKJO7S/+d/fEoeVgItedNhgF2H/4Eq0PU3s6dEy8D5Ac1KHdBtlQG3zlwoUf/aU0xr
 5AF+KId1SREYXmzvhkmxmL3Yn/KRC5oCt4EL+83rIMg3drtVwn6vIYA1Rs74PYnVMl3w
 ZTb5lHjSYY81wY52o3KsjP11aED9isw2xPcDujXpxGvDOzW9D2/z7Dp9rcY/V6aV8I0m
 8uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678201086;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EK/FfNQ9hSqSrJdeG4O9BtBV3bH00pWSvIH5yTiLYo=;
 b=tlctC0IBZuQQJA2URPrPP80oEJ4FLdXRm6RwrD4h+7zatavwbTlmuUHvYc1AlcD7oQ
 cXFACITjwm4XrxYIzqi7nWAprc0V27ZvsEdryrgceSQUyWgeCBu2ofpE4Nks/+IdXjrZ
 Iqb9WFmrpMIgGlQc8rfPhjpuIMtwcKZXvBmjliPrP9pIp1GkUaC5QZggjgoeUdtMGdyt
 mSHUWckNCrlQ5H9HssEw9lFmxqxXDoxxEXoJ9BTqi5RgfFm1S3xrkR4pkGxmuX1eOZOf
 oTxQGGkD0GAHAtpEBEi8epWzowAbK0iMr2Fs3EUobEQrrZsbAR2p01VG6daAwCzs6KL4
 47Aw==
X-Gm-Message-State: AO0yUKV49xvdhf0N9FX5Qay/OiyjULxuQT1ttAIxEQspYtFyGOi1uH09
 fEy1gLT8tUMq96UgtskX5IU=
X-Google-Smtp-Source: AK7set8qc5MLxUC2qp0SHGgbx9XNWBuLmuOg/Y1NGgjFB32DXHGaB+6VhuUilKhRhyJRAH7lxnStYg==
X-Received: by 2002:a5d:6e42:0:b0:2c5:4c9d:2dab with SMTP id
 j2-20020a5d6e42000000b002c54c9d2dabmr11004782wrz.10.1678201085713; 
 Tue, 07 Mar 2023 06:58:05 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002c758fe9689sm12716892wrw.52.2023.03.07.06.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:58:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2d59aa7e-16f6-bd47-ef6f-dfd227518406@xen.org>
Date: Tue, 7 Mar 2023 14:58:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 16/25] hw/xen: Rename xen_common.h to xen_native.h
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
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
> This header is now only for native Xen code, not PV backends that may be
> used in Xen emulation. Since the toolstack libraries may depend on the
> specific version of Xen headers that they pull in (and will set the
> __XEN_TOOLS__ macro to enable internal definitions that they depend on),
> the rule is that xen_native.h (and thus the toolstack library headers)
> must be included *before* any of the headers in include/hw/xen/interface.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c                           |  1 +
>   hw/9pfs/xen-9p-backend.c                      |  1 +
>   hw/block/dataplane/xen-block.c                |  3 ++-
>   hw/block/xen-block.c                          |  1 -
>   hw/i386/pc_piix.c                             |  4 ++--
>   hw/i386/xen/xen-hvm.c                         | 11 +++++-----
>   hw/i386/xen/xen-mapcache.c                    |  2 +-
>   hw/i386/xen/xen_platform.c                    |  7 +++---
>   hw/xen/trace-events                           |  2 +-
>   hw/xen/xen-operations.c                       |  2 +-
>   hw/xen/xen_pt.c                               |  2 +-
>   hw/xen/xen_pt.h                               |  2 +-
>   hw/xen/xen_pt_config_init.c                   |  2 +-
>   hw/xen/xen_pt_msi.c                           |  4 ++--
>   include/hw/xen/xen.h                          | 22 ++++++++++++-------
>   include/hw/xen/{xen_common.h => xen_native.h} | 10 ++++++---
>   include/hw/xen/xen_pvdev.h                    |  3 ++-
>   17 files changed, 47 insertions(+), 32 deletions(-)
>   rename include/hw/xen/{xen_common.h => xen_native.h} (98%)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


