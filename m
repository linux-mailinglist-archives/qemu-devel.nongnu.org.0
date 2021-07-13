Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FC3C6F16
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:03:07 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GBu-0000H6-Mb
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3GAx-0007ru-08
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:02:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3GAv-0007nY-EC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:02:06 -0400
Received: by mail-ed1-x52c.google.com with SMTP id k27so8990161edk.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVj0MWFabo2OK2H+IZeN4YuYEiEKtrzvSUNu25VelHk=;
 b=mFFlzlb3Oi2ITjOg0M6beINRZmr2wPG/fHn9IvFPU1Wx5mBW2i4KOHlDnA0iBTdYJe
 +GvwF75YZ3qDs48U/qWQ5uvO5YOsUi/fhzLRQfzSEBrl56DNbhEGpSFckWThAisiDS4o
 IPCHFF2oTtvQT6TgDCgLyzRMcODRnpMbpXngbRySgzjO+uGzzUbsQmhFn4hXRpP4X7dx
 aeIjVDWg9XRNqFG8kIJZwDMCgp9UPwWlgYHXGUD0GZiS1Ew6+2JFSdrkaPm1Kj0XABgm
 8pPIbAeDYd+a2PmBuh4opyLIZca3QPpKumwEcfGt/k2wOFQ3pkVaapX/aiGiyECuFLN7
 3u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVj0MWFabo2OK2H+IZeN4YuYEiEKtrzvSUNu25VelHk=;
 b=kmXT4Bra5wlOP93+/zplhOC87lG7mvvP6/Cd/U9hbOeh3WKhOqlQv95QTdreylH7Rd
 gRaTqqpYuaBPrXUsYfju6cKsvxzXNI2EgY9VP+Mz5uKLSZIj2kEyZ6/vvUipB9iBshAJ
 I1YUS7lH88LNmxPhrwS4vM6dHNy0G6i0hZYnfFJHaic86RPRh0r/QF0gPMjSDt2xDTUS
 rzjElA12M7op0BDjaFPnIsX3Rf4ZE9z6R1w/zkMUSMF/bMeMwWP4KQzd3RYLlGT7uqe1
 vRKfudAwapRmhqLqoYBqSWuZ9zu8U806QEvvemgaJjJzV8Uf37QDBkPTB7dHdPhTIa0H
 zEeQ==
X-Gm-Message-State: AOAM531loQJmySmj638mOewKfkL7XWJbrHX1GSK5u5L9sVZZ4Mdr6rzB
 hUZQ+LtgwRcQNmtL/GvXXeifyDp3IPOn6kpuxutMcQ==
X-Google-Smtp-Source: ABdhPJx9IflwjqknjwJ7iD54T/21SpsDk43km+i6k4MH+LVu0MUEw39+cXdp2QvivnzeSKrwT7cyZytaPZ4fzOrBUUw=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr4986255edb.52.1626174123536; 
 Tue, 13 Jul 2021 04:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
 <20210709051728.170203-23-david@gibson.dropbear.id.au>
In-Reply-To: <20210709051728.170203-23-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 12:01:23 +0100
Message-ID: <CAFEAcA8TTYyBf2mvQWWS29JupFo6D-wLjOZ1YSMgtksw_QE3fQ@mail.gmail.com>
Subject: Re: [PULL 22/33] spapr: Implement Open Firmware client interface
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 06:17, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> The PAPR platform describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.

Hi; Coverity reports issues in this code:


> +static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
> +                                    uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret = -1;

Here we declare 'ret' as an unsigned type...

> +    char tmp[VOF_MAX_PATH] = "";
> +
> +    ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +    if (ret > 0) {

...so this is doing an unsigned comparison, which means that
the negative values returned from phandle_to_path() (whose return
type is 'int') will not be detected (viewed as unsigned values
they will all be positive and >2GB).

> +        if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {

This then means that we will attempt to write >2GB of data here...

> +            ret = -1;
> +        }
> +    }
> +
> +    trace_vof_package_to_path(phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
> +                                     uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret = -1;
> +    uint32_t phandle = vof_instance_to_package(vof, ihandle);
> +    char tmp[VOF_MAX_PATH] = "";
> +
> +    if (phandle != -1) {
> +        ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +        if (ret > 0) {

This function has the same problem.

> +            if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
> +                ret = -1;
> +            }
> +        }
> +    }
> +    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}

thanks
-- PMM

