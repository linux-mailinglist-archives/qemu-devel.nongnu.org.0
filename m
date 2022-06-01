Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92E53A4ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 14:28:27 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwNSb-00062j-Da
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwNPg-000487-V7
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 08:25:24 -0400
Received: from mail-yb1-f176.google.com ([209.85.219.176]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nwNPf-00059v-Ac
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 08:25:24 -0400
Received: by mail-yb1-f176.google.com with SMTP id e184so2582787ybf.8
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 05:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HueGhI3Xr89WVcqnO0lfBSen5FCjrc1gFoWtIXg5LK8=;
 b=Qp8TTCufDHd487x24R2GOggdDptw6XPCeEMvgMFPCR50FZdxZL+2N6K7ByMvzxHKQB
 d9EbYrCaIPVUkpj+170ci0DRARHjsCcZP5lxzE3FtdydJ9AEmu52HK7lnhzFnW1aEiqY
 tTAEzSD3+blRUL86KhQbCi3KBaq5HHWKjMI3aDY3pFY0banNgLELtNqwZaiJieY5XHx2
 qTL2ClcdvEVN2bRYjTuZop33DpEyua5DyMN8PWnYIBzlJICOlKV6nuYzoveCcv6Hc+Rh
 F76/oZv2ZS1ClhUxorapm9oNMHS+iGkjR/pRB/qs5MlfiDq5/hhw2/VjIbgtCOWvkUtq
 kXYQ==
X-Gm-Message-State: AOAM533emD7Ijl+tXDuAwhVO4RaPt43AMf/n69CVZWgGsxNmXbtGt8J9
 Lazjuk2hWHPNeOZ/uN7ux2Gw8Tx1KMvHgBEgcqM=
X-Google-Smtp-Source: ABdhPJzw73jJC0NkKJX2Rteh6kr3CjWXyevXsIAXvTeY08Mp7RW/JhufYb1CuxKYbu31HnrtFEdTlFNQrpGyi+QzIPc=
X-Received: by 2002:a25:c3c1:0:b0:64f:6f81:ca5a with SMTP id
 t184-20020a25c3c1000000b0064f6f81ca5amr43525967ybf.473.1654086322321; Wed, 01
 Jun 2022 05:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220520095602.17379-1-lizhang@suse.de>
In-Reply-To: <20220520095602.17379-1-lizhang@suse.de>
Date: Wed, 1 Jun 2022 14:25:11 +0200
Message-ID: <CAAdtpL6Dx2k7v2LY0cte9Uq2yx5NPLVk=JEk4OEwP42itb5Dyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
To: Li Zhang <lizhang@suse.de>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Cc'ing Igor

On Fri, May 20, 2022 at 11:56 AM Li Zhang <lizhang@suse.de> wrote:
>
> When no memory backend is specified in machine options,
> a default memory device will be added with default_ram_id.
> However, if a memory backend object is added in QEMU options
> and id is the same as default_ram_id, a coredump happens.
>
> Command line:
> qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
> -machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
> -smp 16,sockets=16,cores=1,threads=1 \
> -m 4G \
> -object memory-backend-ram,id=pc.ram,size=4G \
> -no-user-config -nodefaults -nographic
>
> Stack trace of thread 16903:
>     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
>     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
>     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
>     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
>     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
>     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
>     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
>     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
>     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
>     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
>     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
>     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
>     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
>     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
>     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
>
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>  hw/core/machine.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b03d9192ba..3867af7a8a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1290,9 +1290,17 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
>  static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
>  {
>      Object *obj;
> +    ObjectProperty *prop;
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>      bool r = false;
>
> +    prop = object_property_find(object_get_objects_root(), mc->default_ram_id);
> +    if (prop) {
> +        error_report("Memory backend id conflicts with default_ram_id %s",
> +                     mc->default_ram_id);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
>      if (path) {
>          if (!object_property_set_str(obj, "mem-path", path, errp)) {
> --
> 2.34.1
>

