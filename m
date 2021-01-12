Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A262F362C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:51:52 +0100 (CET)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMtb-0003nQ-0l
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkx-0006jB-L8
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:55 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkv-0001lo-VH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:42:55 -0500
Received: by mail-ej1-x62a.google.com with SMTP id n26so4433796eju.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=se55N7CQ83XHL6ASJifdDPQei8CVJYwzFO6U63658XM=;
 b=Q5b8a2hj0vAV0J0T76MwRCmOPzq982ImJPlHkX08ZGhwld6ky16tBBlnNxVt19UJ8W
 SQo8MO9jEHMEN0mHcMyIHau8GvNJTDAigShoSU1AKy7inwD6rd9sbQrCDDrew2y/UjqZ
 khlFnlXt7T69WyAy/+DtETbx7z+IM4MNQ7Wy129BdpROm/AzwXXCWkn42ssM33sLVMHc
 2UvmJVyTn48d+j6ixuwBbqgfE5nBMzr44UNStLx8VA9vMJAmONVbkwOw4sFYagQlKgbe
 Zw76JiX/pUJEQkek546RjttTY5EG8jlfsFilnvPkjp+m1AoY0d0gnKiEYEDb9u64QP2M
 +oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=se55N7CQ83XHL6ASJifdDPQei8CVJYwzFO6U63658XM=;
 b=EF1wscdtPoTeQzVONh2DENPoNEWasL+Cjib8IMpDxj5/U8sRM2T6902XaBU/TifMDy
 0ScZZ2EYbonrm5zRJn7O+20RLmPHJuF/O0xg77LGZqNuXyCJsfZdyb1UWIgC/V5ID3ac
 rGekhtHPaYnh62KOdjsN10G8205L9bKB5mUDlSCcBZMS9Rr2a4YKt/Vsg3K3UfwBUzPM
 dlr5YjuBOJhUZRxvrME6t1klFR7Tc+xl5eHoYsf1bBYY8RLmaN4ykcPb7MdShDm6/bw4
 VNm7UhqRKv8cTf/a3HjC+owBq+LDc18T8EDPkuzDcDFL/vYMcrxK5FPknRmXDOprEx0b
 D9kw==
X-Gm-Message-State: AOAM532CtkBDExuBkFvoUsePuGBbf9acu7HmeO4GSMwECjkkDguu6bFH
 cgpty/QRUAVXVN6bevKWII4DH5YJmKMYlq4oAWU+Jw==
X-Google-Smtp-Source: ABdhPJx2pAIarunNcZGwBowmeNdJRIGaQy8thJqWqlGAduF6Z4UM9TczOUzQnqPCz8JzHTFQd1WvPwhbmSzFKBp9NtU=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr3756826eje.4.1610469772291; 
 Tue, 12 Jan 2021 08:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-3-ganqixin@huawei.com>
In-Reply-To: <20210112112705.380534-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:42:41 +0000
Message-ID: <CAFEAcA-Wh97xhmyjjJoD9HKiAhHq7SzuPjUoLWg=j4BPtHmWUw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] misc/mos6522: Use timer_free() in the finalize
 function to avoid memleak
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 11:29, Gan Qixin <ganqixin@huawei.com> wrote:
>
> When running device-introspect-test, a memory leak occurred in the mos6522_init
> function, this patch use timer_free() in the finalize function to fix it.
>
> ASAN shows memory leak stack:
>
> Direct leak of 96 byte(s) in 2 object(s) allocated from:
>     #0 0xfffd5fe9e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xfffd5f7b6800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaae50303d0c in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaae50303d0c in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaae50303d0c in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaae50303d0c in mos6522_init qemu/hw/misc/mos6522.c:490
>     #6 0xaaae50b77d70 in object_init_with_type qemu/qom/object.c:371
>     #7 0xaaae50b7ae84 in object_initialize_with_type qemu/qom/object.c:515
>     #8 0xaaae50b7b0f8 in object_new_with_type qemu/qom/object.c:729
>     #9 0xaaae50bb6d58 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #10 0xaaae50d7e1dc in qmp_marshal_device_list_properties qemu/qapi/qapi-commands-qdev.c:59
>     #11 0xaaae50dc87a0 in do_qmp_dispatch_bh qemu/qapi/qmp-dispatch.c:110
>     #12 0xaaae50d931a0 in aio_bh_call qemu/util/async.c:136
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

