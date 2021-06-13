Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED63A5AB3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:51:05 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsY0W-0003zn-HH
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXzJ-0002Ww-6e; Sun, 13 Jun 2021 17:49:49 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXzE-0006XQ-Jb; Sun, 13 Jun 2021 17:49:48 -0400
Received: by mail-qv1-xf44.google.com with SMTP id l3so12454843qvl.0;
 Sun, 13 Jun 2021 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMcQZWD/ET7TrHejFcfooDx0Q9uZ6FiZmRAE9USnbfk=;
 b=ntSPFtiQUasLACYE8TxuqV5JsfMxKggSLs3dsCgxxqzTJEUv/ltAIc2hnj1mylmx7e
 Klk4vkD416Zps5yKhQ8u6vLw3499HMBzHxvK9h5ps8QrSM/JsLkEILFbmlgj4IHkVPk/
 e9R7VU2oqUGM6J6W6VLFALxz6XJJR57ThH0KZRL9xrIPgTd5SrWXIDQFDukH+S8HJt96
 b062KxAOKJ0mcOQ0XFnwRFzpi3e9ZPnhGfMgU0BvnBWp1vVVOOOPRYBsBmnUYDvhsmFy
 xklD5DQBUkQBbOL1Xh95yY44d7HvNebB/Bn1PaHrnCZEAeJmQdrmN5QA38M44DZZ7XPB
 oY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMcQZWD/ET7TrHejFcfooDx0Q9uZ6FiZmRAE9USnbfk=;
 b=t60Id0rMM9f3TxYTBj6HW1hJrhYap2oUk3bTi4p3QojKowAJtmYI46TIvvnpfN/ixQ
 sUilH1y3G7MGkjP/07GpWh1ZH0QWhxA3F/ntQxhpArsQeTqeXM9mbwXIqMzHeNVN90i1
 qIFPTR+TR0Mo9TPUhOTMU61//f1Cuc3QPuW9GkOexB8VlQiJgUxuzfNcqCTmNMaBvHHB
 RXw86VAtrZQkSrOk7pjqVhUMmZ2tbVBCU7CBN1OE7dEJc+ujYVc+P8bhGaY9rsK+Rf3g
 M7U7DsrJQm9qQA/EdIrxcZaX2012lpHKeYbsMUp8d5gM1wKJEDZcfQYNHCJf9ezyQIQ7
 1HRg==
X-Gm-Message-State: AOAM532Myej0orA/OCOMw8rRx51EKV1vHPuYxJ2d02/e1lURZJIHrA4h
 QST7djWGJ2bnp2WGMrR/HpdDuTwjcxUwZIKIaB0=
X-Google-Smtp-Source: ABdhPJzukwNafZoFjil0y3wffwGKspHc2F7d/RtKJc1777ByO5tH1ZuZWI9cKd5h281vruB6z65+cxmKt1AztCQ2GnY=
X-Received: by 2002:a0c:eda5:: with SMTP id h5mr15466294qvr.26.1623620983250; 
 Sun, 13 Jun 2021 14:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-4-peter.maydell@linaro.org>
In-Reply-To: <20210603171259.27962-4-peter.maydell@linaro.org>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 14 Jun 2021 05:49:34 +0800
Message-ID: <CABSBigQm6HxkMvsJgKgWSxPuDvDnAR4W6ajkvHZf4AtdQ-5hsg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Use acpi_ghes_present() to see if we
 report ACPI memory errors
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qv1-xf44.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Swetha <swjoshi@microsoft.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 01:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The virt_is_acpi_enabled() function is specific to the virt board, as
> is the check for its 'ras' property.  Use the new acpi_ghes_present()
> function to check whether we should report memory errors via
> acpi_ghes_record_errors().
>
> This avoids a link error if QEMU was built without support for the
> virt board, and provides a mechanism that can be used by any future
> board models that want to add ACPI memory error reporting support
> (they only need to call acpi_ghes_add_fw_cfg()).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/kvm64.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 37ceadd9a9d..59982d470d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1410,14 +1410,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
>      hwaddr paddr;
> -    Object *obj = qdev_get_machine();
> -    VirtMachineState *vms = VIRT_MACHINE(obj);
> -    bool acpi_enabled = virt_is_acpi_enabled(vms);
>
>      assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>
> -    if (acpi_enabled && addr &&
> -            object_property_get_bool(obj, "ras", NULL)) {
> +    if (acpi_ghes_present() && addr) {
>          ram_addr = qemu_ram_addr_from_host(addr);
>          if (ram_addr != RAM_ADDR_INVALID &&
>              kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> --
> 2.20.1
>

Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>

