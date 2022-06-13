Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B145485AD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:22:56 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kxz-0007wC-2E
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o0kuw-0005v3-IP
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o0kut-0005Nq-7o
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 10:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655129981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdpUNZqsF8h/Ca7t3UQA2mWRjx/qwaa4ejW/cBUviGQ=;
 b=BM2W6gYYQ6Q5Ek/nxw2B1adI/rtJVyYPdyojNRccTOQ7xs72WwPUDNpNL/USxAceb2aL2j
 96AlbuD5zmO2XfvIp4oSLuxWBSyRPnyJsCT5jTOAASLxio2ntpOUfo63Z+XiSf0my//P6K
 dMKp1y434JT661cS3DiYQGdCg+wb634=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-9yNk39JCPOyw1slFRtrTcA-1; Mon, 13 Jun 2022 10:19:40 -0400
X-MC-Unique: 9yNk39JCPOyw1slFRtrTcA-1
Received: by mail-ej1-f72.google.com with SMTP id
 mh24-20020a170906eb9800b0070947edf692so1858538ejb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tdpUNZqsF8h/Ca7t3UQA2mWRjx/qwaa4ejW/cBUviGQ=;
 b=jkvBkDnrMvLQKC6VHpYHQqKeiegj8cbgyWuxk9r5HHzWyoax+5bOpUqsva1ElM9u3z
 esohrXjgRRmiJlTJPu8k2CdqBcS7psGgP0zcBPZv6kkJIs1zZ2hQspWruU9tt7BX9SEg
 6YaGKl4W2yGiRH4/pfXDpQ4Gj0Kik7Egfw1J1bhdECptTVAsEA/TWRlVS4fpQXrzDBNk
 v4o5f9+GUJLEWCwwJ+29Cyh8vco8CmZS/05VubJ5mkrW+umlGc3dhtFUoyPNU9XsB/xg
 MNxiW5xBHKiO/fjvVXh1bNL0msWyZZ3eYQ8qpX9Ku8eJpbD3/BFoDbniqYkkbrR7LqgA
 AJXA==
X-Gm-Message-State: AJIora8FucpXAtDe1HQPhxIQ6Qqcr86/hv7VfuNweZi4SuHsDlxAMbiU
 Rczh5iucP1nGirn7/Hu0uTY55FTJQtT7KMMr1yBsFACNjrkENpua39Me1Aajsa3Zq/Fpp+Di+B0
 J3VarZPerv4Awi+I=
X-Received: by 2002:a17:907:8c0c:b0:718:d033:dec5 with SMTP id
 ta12-20020a1709078c0c00b00718d033dec5mr96850ejc.744.1655129978918; 
 Mon, 13 Jun 2022 07:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrOk2Vc8Ds58Uqac2UMrBjcaZzy+iB/p81CusN8aa2fXwJfbYh3HtKtDX5/ck6BoziUyNrVw==
X-Received: by 2002:a17:907:8c0c:b0:718:d033:dec5 with SMTP id
 ta12-20020a1709078c0c00b00718d033dec5mr96829ejc.744.1655129978707; 
 Mon, 13 Jun 2022 07:19:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 me26-20020a170906aeda00b006ff045d7c9bsm3919943ejb.173.2022.06.13.07.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 07:19:38 -0700 (PDT)
Date: Mon, 13 Jun 2022 16:19:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <lizhang@suse.de>
Cc: marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 qemu-devel@nongnu.org, zhlcindy@gmail.com, David Hildenbrand
 <david@redhat.com>
Subject: Re: [PATCH v3 1/1] Fix the coredump when memory backend id
 conflicts with default_ram_id
Message-ID: <20220613161937.333a6b82@redhat.com>
In-Reply-To: <20220613104402.10279-1-lizhang@suse.de>
References: <20220613104402.10279-1-lizhang@suse.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 13 Jun 2022 12:44:02 +0200
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

Acked-by: Igor Mammedov <imammedo@redhat.com>


CCing David as he probably would be the one to merge it

> ---
>  hw/core/machine.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..9ede63b01c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1265,9 +1265,21 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
>  static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
>  {
>      Object *obj;
> +    ObjectProperty *prop;
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>      bool r = false;
>  
> +    prop = object_property_find(object_get_objects_root(), mc->default_ram_id);
> +    if (prop) {
> +        error_report("A memory backend with id '%s' already exists, "
> +                     "cannot create default RAM backend with the same id. "
> +                     "Either change id of the offending backend or "
> +                     "provide system RAM backend explicitly using "
> +                     "'-machine memory-backend' option. " ,
> +                     mc->default_ram_id);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
>      if (path) {
>          if (!object_property_set_str(obj, "mem-path", path, errp)) {


