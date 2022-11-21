Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4915632AB1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 18:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxAPy-0005sQ-UN; Mon, 21 Nov 2022 12:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxAPw-0005rD-TQ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:17:12 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxAPs-0002Qu-0P
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 12:17:12 -0500
Received: by mail-pl1-x635.google.com with SMTP id w23so11145268ply.12
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9trGTYQdEqf435WY8HaPZYeyH5W380OlK97rMJw3M1g=;
 b=QnXPKiRKx2zZJC3Z6QMm0eZrbsfQJz0fsKgZwCbw6xipWrjTUVOg1V2iwQs8UuA7XJ
 Gga24a4FiPl5iK1M5bO+QRq9rCfCZIjfZIDCknvqSxV/XCE9foK8szqRC91dYl6mglj6
 C/6MTDGW0sdwMgYgQxHFeAQ5WD57b8q6B0Ge7dWkpGUNOhEkVszKBgNgzysKF7SZWY/O
 0sEQPpdVwgInfToROt8Nwpa6YbqibupGieM1sGRxEGKnfBq4VHTL5HOzHjga11PpCSX2
 7AyU+V91mFyt/cDegK3JrOSHEJFDsYG//mZ6Y5QTjn1FkuUD2UvZLXlqt/Us4Klm5wZx
 pzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9trGTYQdEqf435WY8HaPZYeyH5W380OlK97rMJw3M1g=;
 b=OnNDyAQoN5/0qOIm1T6kIFlCRWre/iSn10WryIV99uYef3Xxf5vhCo4Hut8qPnPyYc
 3L35ky3Gn+Y/Va92b6cztird7J+HST0bX+BJbbDhv2EN7Jb8YVtEiRdYlMtZwd30b07P
 CQKhCr2jcm+dVuK7hCqpMgZUeVEbf7gluuUReGiMT3qud7YpFJWyx3GGYbk55fN/cFvf
 m7FqDiORS88jAAnNUpgmsasNh/ziNYnmoTL3QfhUr5S4wiSjbTmZHZVh7N673ZN7S6t3
 BbGZi37R4c6ApCUZz0SkIKq7Qqg2qBKrA/LTIUXTxX6v2XuYYdSdD7mIjIb2UuQzwrM+
 axpg==
X-Gm-Message-State: ANoB5pmFjYKVrHjnKl5jDa0fpuJ2RIslMiF7nCshTtG0xoq/JPHK6VWE
 LHD5eHRU0exPHluH5SMPeb58dpOCpkGuYdyP0aW6XA==
X-Google-Smtp-Source: AA0mqf60VvNQIj8UbQwA3aNgKkUHdIQWoSd4vcFTorVUux/h+vVwIxsP+Z+QJdMS3NHXaozZ8hhoYKSXZKI/l2c3q2Y=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr2698947plk.60.1669051017873; Mon, 21 Nov
 2022 09:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20221029224307.138822-1-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 17:16:46 +0000
Message-ID: <CAFEAcA9W35dF0L=r2qQppd1FVZ+Di6=3af4qb3T5h2vf8EMsfQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sat, 29 Oct 2022 at 23:43, Gavin Shan <gshan@redhat.com> wrote:
>
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> The series intends to improve the address assignment for these
> high memory regions and introduces new properties for user to
> selectively disable those 3 high memory regions.

I've applied this patchset to a target-arm-for-8.0 branch
that will end up being the target-arm queue once 7.2 is out.

thanks
-- PMM

