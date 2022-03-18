Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C334DD2D3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 03:10:58 +0100 (CET)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV24v-0007O9-Dx
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 22:10:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nV22l-0005no-I5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 22:08:43 -0400
Received: from [2607:f8b0:4864:20::42c] (port=39693
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nV22k-00007E-2D
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 22:08:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h2so8337673pfh.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hmqBxtk4KBce1d7JwMLgrUTHii5BY8s0u21fhI5bosc=;
 b=YzsYMHtSPTMzxXxn6dVBRzIwcoulVgqW6UWSaM4KWyuF4IYi/lvHeq/XIdHHkEfLgn
 oAko8LQ3k+A/QyIFNCB31kcRWFxjZZ7JokaNgpCcyp3yrGmfPk9w+6Q9PNDEWjbtlT9D
 0zqRxxXAm+VbCamyilC7+8FRuEc4yNg6Q4TEE/07hSpM6hZs6XknIOCVn5NmsxtURxgQ
 768cixR5RBXxzR08Y0YL61mfPYvMFjcO2hnRiDccHqhVXQwJky8YrQUeVvNRMc5i5wZq
 WHKoLc8amJ52jvZOiqFKEtj+75BS+MKd4RQ6V90y/GHJ7R2AnQ7y1yHL+xyb01LTtiuH
 QXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hmqBxtk4KBce1d7JwMLgrUTHii5BY8s0u21fhI5bosc=;
 b=Da1+1EoKL6aVPLKKFd4Jif36ma4YnqmYs05xfL7737HU+eMQtytOllCqIPCPGbam9O
 tJs6XyqD9bFQyyd+RORahESmiCVmKORvZumAnFNgodGfYpXS7bfEACigH9FhCvz7ooaR
 DxD2zvrRd6QErVxnDAenMHr0jLPngmYigT0cvoRnz/ZQK7X0rSCfiLOR2VDyWRllezQG
 Fjc+eOtvJuFjbEfUTulOKQfkaV4sVNmWEkBWMC9ew1JlbqhNJx+CG3qbEeuLHBwNGCbt
 4aswwKC/atM//ZJ9j/1QclkMfnveI60+IBbKmJMTMWelCEwp4B3vsXpR/vM9qHhqDeNa
 +zUA==
X-Gm-Message-State: AOAM533ulW5ge/gSrymh+gyd/3emGKvy1NX7KgpDlvuIg82m2PPsY7ev
 thlZrn1SLDIQkfy6f/hLziU=
X-Google-Smtp-Source: ABdhPJx1Haet6V1UVNRmxmsdmtI919fxY6r2iSFakm9GxnwkGZLUYcpHq3znCQBY2F31P9GoCvjYmw==
X-Received: by 2002:a63:110e:0:b0:375:89f4:b54e with SMTP id
 g14-20020a63110e000000b0037589f4b54emr6118104pgl.430.1647569320164; 
 Thu, 17 Mar 2022 19:08:40 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm6325122pgf.32.2022.03.17.19.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 19:08:39 -0700 (PDT)
Date: Thu, 17 Mar 2022 19:08:38 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 06/36] i386/tdx: Get tdx_capabilities via
 KVM_TDX_CAPABILITIES
Message-ID: <20220318020838.GB4006347@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-7-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-7-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 09:58:43PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index e3b94373b316..bed337e5ba18 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -14,10 +14,77 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qom/object_interfaces.h"
> +#include "sysemu/kvm.h"
>  
>  #include "hw/i386/x86.h"
>  #include "tdx.h"
>  
> +enum tdx_ioctl_level{
> +    TDX_VM_IOCTL,
> +    TDX_VCPU_IOCTL,
> +};
> +
> +static int __tdx_ioctl(void *state, enum tdx_ioctl_level level, int cmd_id,
> +                        __u32 metadata, void *data)
> +{
> +    struct kvm_tdx_cmd tdx_cmd;
> +    int r;
> +
> +    memset(&tdx_cmd, 0x0, sizeof(tdx_cmd));
> +
> +    tdx_cmd.id = cmd_id;
> +    tdx_cmd.metadata = metadata;
> +    tdx_cmd.data = (__u64)(unsigned long)data;
> +
> +    switch (level) {
> +    case TDX_VM_IOCTL:
> +        r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
> +        break;
> +    case TDX_VCPU_IOCTL:
> +        r = kvm_vcpu_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
> +        break;
> +    default:
> +        error_report("Invalid tdx_ioctl_level %d", level);
> +        exit(1);
> +    }
> +
> +    return r;
> +}
> +
> +#define tdx_vm_ioctl(cmd_id, metadata, data) \
> +        __tdx_ioctl(NULL, TDX_VM_IOCTL, cmd_id, metadata, data)
> +
> +#define tdx_vcpu_ioctl(cpu, cmd_id, metadata, data) \
> +        __tdx_ioctl(cpu, TDX_VCPU_IOCTL, cmd_id, metadata, data)

No point to use macro.  Normal (inline) function can works.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

