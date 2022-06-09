Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4CE545173
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:59:45 +0200 (CEST)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKZU-0002zI-Ix
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nzJjG-00052C-ID
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nzJjE-0004tQ-1G
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654787142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7Z24AVMyIsfHC3tbcmEThb80iPRSRajG58JZesqixo=;
 b=bkJ5Nun/G/y7kU5vFAE+PMxjwlXraxoqPrDrJX5glYaecacMcgBN3rS/80kaRHBxejpyIy
 IM605AHnliTlDfZPrTMXg6d5PAcqzT9rqFMdBIiXnBP4ILmdoSo5K6AGjnLK5NkUEJh22F
 Kjqv9pEvhrUyJLZXpLpouG/Aa19WiyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-Id5A0Y0ZOR6YpgnWRbYvVA-1; Thu, 09 Jun 2022 11:05:29 -0400
X-MC-Unique: Id5A0Y0ZOR6YpgnWRbYvVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 az7-20020a05600c600700b0039c3ed7fa89so10311431wmb.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7Z24AVMyIsfHC3tbcmEThb80iPRSRajG58JZesqixo=;
 b=dlGZeIpTC4if7SMIKWl4bzX9ketN1rgWeAu3Pge90jV3P36g4MC6rp20YwrBzpa2di
 S3rj8ugXpXxnvcu1xABtX9eva7gRL56BJ8qAMx/0ta/pGtnMTqzcD9OrWn6/RNM3zLxa
 3zuI0a8uY9gmOVqWivrWdigB5qO1vMBjP8jcOg4Jph8VmkTHetD1NCiyngQkH/k//ZiS
 c+toyb5l0yt0B/UI5b1Ha7gIgfsYKg9/WiVbAthoVdQ3xlSAscOPw3DXg050b+nkzWIV
 Mq4XPesyy0L1wKOC4LgzPmMUTeJhFSAHOn/v8gXJAdTZbO8ou8CSkCeMQGoxiED7l+xh
 +gyA==
X-Gm-Message-State: AOAM530Xhn1DkyRhnnSX7s2+JXrUjthRvMrfwUJQW8wJO1PTfawg3ILg
 oyc7l+mWhzBEWH48mY3hTud+PqaVOaUI5Auadpdn8ZC5j6o04arEZsP4BOCvZpmiyeyiWStOwBx
 2Kq/aYagBKoj1UQo=
X-Received: by 2002:a5d:40c7:0:b0:210:3135:e662 with SMTP id
 b7-20020a5d40c7000000b002103135e662mr38237293wrq.280.1654787127794; 
 Thu, 09 Jun 2022 08:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn3MrFMH8I6FX1Mk0fe0Z9k9pdLTj/1xdg14QQBYOIG2c5qC9WGx19pZm7UmcblYeHUMRfVQ==
X-Received: by 2002:a5d:40c7:0:b0:210:3135:e662 with SMTP id
 b7-20020a5d40c7000000b002103135e662mr38237215wrq.280.1654787127031; 
 Thu, 09 Jun 2022 08:05:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 63-20020a1c1942000000b003974cb37a94sm31816282wmz.22.2022.06.09.08.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:05:26 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:05:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <lizhang@suse.de>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] Fix the coredump when memory backend id
 conflicts with default_ram_id
Message-ID: <20220609170525.22eb992d@redhat.com>
In-Reply-To: <20220520095602.17379-1-lizhang@suse.de>
References: <20220520095602.17379-1-lizhang@suse.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 20 May 2022 11:56:02 +0200
Li Zhang <lizhang@suse.de> wrote:

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

maybe something like this would be better:
 A memory backend with id '%s' already exists, cannot create default RAM backend with the same id.
 Either change id of the offending backend or provide system RAM backend explicitly using
 '-machine memory-backend' option.
 

> +        exit(EXIT_FAILURE);
> +    }
> +
>      obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
>      if (path) {
>          if (!object_property_set_str(obj, "mem-path", path, errp)) {


