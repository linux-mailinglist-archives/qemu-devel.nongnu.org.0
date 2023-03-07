Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DE6AE671
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:27:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa9Z-0006II-MR; Tue, 07 Mar 2023 11:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZa9X-0006H3-8v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:27:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZa9P-0008VM-Jd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:27:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so12727723wrm.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206406;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I80iEwAu4TMYHhdsbHIgvh7/mafwHEpwDMpOmPu3VGM=;
 b=L6S4fwA2oOwi/xBrfz6Nnp/KUez6VuoT6LaHwoLXXotSsmAX/KnN+sBsSELQumASdc
 8NcEG0lbHHtfIGO8eSYJmP6PwOLVvOY4jw3gYiGIl+pVoqEj76sncbhv88zjF9h2PI7l
 QR3+4dGeiR8aYULXgy06Ht/Ar2a7sAkkw9nUUN/mA50xzDl3sM85WQN0vWEDOZGX2ZEh
 YHb9MS55LNm38n+fBWSINnRtsflY0OiBdfzKFUhMv3RhUt7TIxcP6su7mV2q818pyElz
 AGhjYgjYtYMT7uxhWylriZ6NKdDzbwbq1c7rB8gGX7q1QWUpUCV8CGtORNJEzjSK5ljA
 sjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206406;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I80iEwAu4TMYHhdsbHIgvh7/mafwHEpwDMpOmPu3VGM=;
 b=7FeAlPHzM+8yp1yhzJ05zp3GxzHGqB5pDjU6rB98R1023FBJ1B/8LU+45tD7YTq7O9
 qZ86D1HFhC8/amMUBiB4Ns3YN6XsszKKMDBUUiaM2EKWYF0Vukso4ggH7dcZiV57I7w4
 cX4EaO2WnfLnXPpNR4b37JYrj3M/g6wRtAV3+GN3o1BWpmcRLsdqC28kpS4Rgwd2842+
 TySq11xoozqbatRMY90JCNtmi80S+wp0ZCXR0AGYHQHePAW3TKjwEQBAqiBCd2lTaleH
 iO2E3Sa/0C/NDq6JQBpXCiUwjLtSStw5t5nLWsbqpL5HRTTmsrxrsIYfExkDshNm6Ata
 3v7g==
X-Gm-Message-State: AO0yUKWgrNMzHhO34isYDz6r8IWuH7+ca9pXW2KaaXgdhQ2o+4rQ/RA+
 carJzTWxhsi3ZuTPrHQLbs0=
X-Google-Smtp-Source: AK7set8zbGsS6LCfp75z+EmFwqCqnXKYjSlzne8m1S5SgKTGCyISo+WRaXxS5E7mGw8oY8cOpmWBzQ==
X-Received: by 2002:adf:ce91:0:b0:2c3:fb3e:ae85 with SMTP id
 r17-20020adfce91000000b002c3fb3eae85mr10585326wrn.44.1678206406129; 
 Tue, 07 Mar 2023 08:26:46 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b002c58ca558b6sm12858433wrr.88.2023.03.07.08.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:26:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <827fce11-372f-db65-b15d-6db8373dcf97@xen.org>
Date: Tue, 7 Mar 2023 16:26:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 23/25] hw/xen: Map guest XENSTORE_PFN grant in
 emulated Xenstore
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-24-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-24-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
> index 028f80499e..f9b7387024 100644
> --- a/hw/i386/kvm/xen_xenstore.c
> +++ b/hw/i386/kvm/xen_xenstore.c
> @@ -21,6 +21,7 @@
>   
>   #include "hw/sysbus.h"
>   #include "hw/xen/xen.h"
> +#include "hw/xen/xen_backend_ops.h"
>   #include "xen_overlay.h"
>   #include "xen_evtchn.h"
>   #include "xen_xenstore.h"
> @@ -34,6 +35,7 @@
>   
>   #include "hw/xen/interface/io/xs_wire.h"
>   #include "hw/xen/interface/event_channel.h"
> +#include "hw/xen/interface/grant_table.h"
>   
>   #define TYPE_XEN_XENSTORE "xen-xenstore"
>   OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
> @@ -66,6 +68,9 @@ struct XenXenstoreState {
>   
>       uint8_t *impl_state;
>       uint32_t impl_state_size;
> +
> +    struct xengntdev_handle *gt;
> +    void *granted_xs;
>   };
>   
>   struct XenXenstoreState *xen_xenstore_singleton;
> @@ -1452,6 +1457,17 @@ int xen_xenstore_reset(void)
>       }
>       s->be_port = err;
>   
> +    /*
> +     * We don't actually access the guest's page through the grant, because
> +     * this isn't real Xen, and we can just use the page we gave it in the
> +     * first place. Map the grant anyway, mostly for cosmetic purposes so
> +     * it *looks* like it's in use in the guest-visible grant table.

Might be useful to stick this text in the commit comment too.

Reviewed-by: Paul Durrant <paul@xen.org>

> +     */
> +    s->gt = qemu_xen_gnttab_open();
> +    uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
> +    s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
> +                                             PROT_READ | PROT_WRITE);
> +
>       return 0;
>   }
>   


