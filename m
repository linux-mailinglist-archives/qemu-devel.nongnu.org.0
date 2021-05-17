Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE07382454
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:29:35 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liWkw-0004uK-9E
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWjJ-0003LB-OS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWjD-00083V-VN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621232867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8EKD7X3zvaPvO13cBxnEbFADe9puGdX/izmsdjlu30=;
 b=bB19vFy7DL19sVixp/+T1KRqQh9redrqAOze925G1y/qSLaM0qcMlz0p5Px2QLvhD1oFq6
 qtWgr76WwPqA0wHItF5cpXTK9frl7COMMYPrRvUEWF0rV70FduK+kryopMrKZQtaJ8aEfM
 obzW3HrYvngSgwvJDnmxNxdqDzkQAn0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-YOPLQkPbM12cApDhmsF-Yg-1; Mon, 17 May 2021 02:27:45 -0400
X-MC-Unique: YOPLQkPbM12cApDhmsF-Yg-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso3312703edd.19
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 23:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F8EKD7X3zvaPvO13cBxnEbFADe9puGdX/izmsdjlu30=;
 b=cww58wRRlg6znPzeIJ+kfcgiHHdxFW2aJ/jvTvXt0XtcO+ONj45dtWcR7rBw4+gbil
 Xz1jBgGlTjMIJM4xBXebeOvL/JKW/4Kvn1AAikwwPq1o93i94IPPEsEb9iIN4bGNkJCc
 Tqd6pws6u5iDt2/pnH/FjfR7zb2hSrrNn5mq8ub67UyRaRY0ZWCOATs4uj9rh55DlHnA
 D2w8G1vsx0W6fJVna+jJDA25BU3mfUcQbZKohAi8IXeXbqBFL5EZxxnoFhDXUaDrIIDC
 2I9etgwIDOsnrcCM8dLc5qdTq4i2oQ0iPC4r8dqyJWAOjueeos0pVDR1gPye3w9cforM
 qCwQ==
X-Gm-Message-State: AOAM532wdXtfbqlc8MzeEUGQCWyZRz00SDd9jITrrQvRJYq7ubyt13ny
 YiQ+KJOLBq/pEe2fkoE2mcEBet5va0WFYQDo8y00rhGDzNVGksibJU3s6JQtD85OEM8SNra3y+C
 uud5WN79NccYxU00=
X-Received: by 2002:a50:d68a:: with SMTP id r10mr71143340edi.90.1621232864056; 
 Sun, 16 May 2021 23:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaBoJp5gcS1myj8FxOzmTIpOtU+yX0xSVOoP0pEqJpZELuLRxhkFj4m0tM3a+8iIRh9gsIOA==
X-Received: by 2002:a50:d68a:: with SMTP id r10mr71143296edi.90.1621232863758; 
 Sun, 16 May 2021 23:27:43 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b16sm8127565edu.53.2021.05.16.23.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:27:43 -0700 (PDT)
Date: Mon, 17 May 2021 08:27:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 2/9] device_tree: Add qemu_fdt_add_path
Message-ID: <20210517062741.t44x3gnlukczmjit@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 06:28:53PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>

Hi Yanan,

This looks good, but the authorship is no longer correct. You've
completely rewritten it, so I think the most I deserve is a
Co-developed-by and maybe even just a Suggested-by. When changing
the authorship and tags, you can also add a

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


> 
> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
> also adds all missing subnodes from the given path. We'll use it
> in a coming patch where we will add cpu-map to the device tree.
> 
> And we also tweak an error message of qemu_fdt_add_subnode().
> 
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 8a2fe55622..ef060a9759 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>  int qemu_fdt_add_subnode(void *fdt, const char *name);
> +int qemu_fdt_add_path(void *fdt, const char *path);
>  
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>      do {                                                                      \
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b621f63fba..3965c834ca 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>  
>      retval = fdt_add_subnode(fdt, parent, basename);
>      if (retval < 0) {
> -        error_report("FDT: Failed to create subnode %s: %s", name,
> -                     fdt_strerror(retval));
> +        error_report("%s: Failed to create subnode %s: %s",
> +                     __func__, name, fdt_strerror(retval));
>          exit(1);
>      }
>  
> @@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
>  
> +/*
> + * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
> + * all missing subnodes from the given path.
> + */
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    const char *name;
> +    const char *p = path;
> +    int namelen, retval;
> +    int parent = 0;
> +
> +    if (path[0] != '/') {
> +        return -1;
> +    }
> +
> +    while (p) {
> +        name = p + 1;
> +        p = strchr(name, '/');
> +        namelen = p != NULL ? p - name : strlen(name);
> +
> +        retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> +            error_report("%s: Unexpected error in finding subnode %.*s: %s",
> +                         __func__, namelen, name, fdt_strerror(retval));
> +            exit(1);
> +        } else if (retval == -FDT_ERR_NOTFOUND) {
> +            retval = fdt_add_subnode_namelen(fdt, parent, name, namelen);
> +            if (retval < 0) {
> +                error_report("%s: Failed to create subnode %.*s: %s",
> +                             __func__, namelen, name, fdt_strerror(retval));
> +                exit(1);
> +            }
> +        }
> +
> +        parent = retval;
> +    }
> +
> +    return retval;
> +}
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb = current_machine->dumpdtb;
> -- 
> 2.19.1
> 


