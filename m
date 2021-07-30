Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1E3DB095
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 03:22:37 +0200 (CEST)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9HER-00052Q-Vr
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 21:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m9HDK-00049K-3j
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:21:26 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m9HDI-0007r4-Gx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:21:25 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id d73so13182951ybc.10
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 18:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MjFCNw3ZWIUq/Mm1BOe3TbOyZLPtVZi6FwOLJG9BWuw=;
 b=DWWazVvIcPW37xUxZeS+iUx4aKwzDRwZ6CxNGSlsS0XXIWqsnBkeQ2cyxpnkWpgwNT
 yEPVd3yp55rYLwkPTQhdYCAn3QnESG86DHaC4AxjHivtPan+RE96XHF2wA2ZKZ9ep51i
 BTKtiLJc0oHen1TiyJIXbYcJaoEehSqI662tFwZAzc3d19V0sGMFyn9EAqJCOrPMQs2H
 +t2LYbb4v+UAsynrEcIWZgPv8XqZJeUhmh+aynpQCEfZjorkY6dX71P2cfKk4wWKTBL5
 OhgTGEntbUbc0M/AX9x7B3oDbwNKk5EI+WcoWawqT75VIzcdiz465npGB8D3JFJtDMDb
 8L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MjFCNw3ZWIUq/Mm1BOe3TbOyZLPtVZi6FwOLJG9BWuw=;
 b=Qt9dYIV7/QICkyUl0ZFQgM/ZL1N+xJc3/X6Fxv5lJ92395pxlKaylM7Lyx7233IOKW
 gJJqDCRd9W47Y0Knl7ly2zLcZX36RJjhMGl3UQlk8eQFb8tnRyXoUS7pVnKI7/A0eLnb
 GIIz2n13bQiKIFjeLT6n9EtEIIDQYY+wbMEfhbn5IDVO4W/vB3W3rGhLU/KWkmb9MdgM
 P4mI+9buP0w+mAWXgmCzaDVdZSDOhc8a8dvBtQ97gV72+7TZoqZT5R2r0SrSncvT4b66
 tItynO4YG7Ovn3StsI/ucXKcnFAmISBX5eknTrUU8wxFC4GD+ytPZ0okqziki8vGwlyn
 0BkQ==
X-Gm-Message-State: AOAM532MUlPXEsgbT/Izx1z9tssEjp/FnM/ovfXsII92FrGsND3mZBa+
 r9lpfvPkUDs1WtqalDXufp9cMExG4ZyeOs8CAEc=
X-Google-Smtp-Source: ABdhPJztMLqjI+VATgXawJOUVvgDpM73R3AhhTXWZ6YFWuIPVWm9cm23Cwn9vbG/YQZY+cGGQqRHCd+PpQUi9LWDSmE=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr10966978ybg.306.1627608083274; 
 Thu, 29 Jul 2021 18:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075512.84897-1-bmeng.cn@gmail.com>
 <20210723075512.84897-2-bmeng.cn@gmail.com>
In-Reply-To: <20210723075512.84897-2-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Jul 2021 09:21:12 +0800
Message-ID: <CAEUhbmVcAj+Je=ynuPCaOLwsgq6a-XhTEk3KTH=AJFEnXCcPhg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/net: e1000e: Correct the initial value of VET
 register
To: Jason Wang <jasowang@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Fri, Jul 23, 2021 at 3:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Christina Wang <christina.wang@windriver.com>
>
> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> the manual and real hardware.
>
> While Linux e1000e driver always writes VET register to 0x8100, it is
> not always the case for everyone. Drivers relying on the reset value
> of VET won't be able to transmit and receive VLAN frames in QEMU.
>
> Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
> to cache the value of VET register, but the cache only gets updated
> when VET register is written. To always get a consistent VET value
> no matter VET is written or remains its reset value, drop the 'vet'
> field and use 'core->mac[VET]' directly.
>
> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v4:
> - Only keep hw_compat_6_0[] changes
>
> Changes in v3:
> - add a "init-vet" property for versioned machines
>
> Changes in v2:
> - keep the 'vet' field in "struct E1000Core" for migration compatibility
>
>  hw/core/machine.c    | 1 +
>  hw/net/e1000e.c      | 8 +++++++-
>  hw/net/e1000e_core.c | 9 ++++-----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>

Will this series be in 6.1?

Regards,
Bin

