Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BF665BEE7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfSJ-0007PR-OG; Tue, 03 Jan 2023 06:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCfSI-0007PI-2n
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCfSF-00008l-Us
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672745259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzJ8fUOFUqz9mwBHGQkwx9cmMq83vgEpFiyfLqo6sDg=;
 b=UozD7yww4vx5NQRxEtoq1hsl0prZRN8wdsDX53jFUBtW4wniAPL6iiD38B8YwGeLJpiqZB
 OSouCO3YJtuEl+IV4UgYl1t6mPRUp9BjKAlwgm/VcujGK+sGT8Q777cMuzwPFTlGU5pN2O
 4ikZy7jyd9N4xLlm2X98BCpAH+EJGzs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-Mw_Z7PWVPdabCVOCbJo8-g-1; Tue, 03 Jan 2023 06:27:37 -0500
X-MC-Unique: Mw_Z7PWVPdabCVOCbJo8-g-1
Received: by mail-wm1-f71.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso11151605wms.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 03:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lzJ8fUOFUqz9mwBHGQkwx9cmMq83vgEpFiyfLqo6sDg=;
 b=QY4twjbmlWsCrmcnX3BDGCUv+R+/GXZJI71rlB+5WLoTMBTZt6Olrl8gyJ54NEi4sw
 iECHg8yW2E5ppXbB9kWPqEq47tJ+NEkro1HA99K5bVPYCi3xIDAhv0DGLNemFJV2jD4U
 fbFGYchHJQUVsdgiQ3A7tofEIOyXdp4zrHE5yWkS0X6xEf/DTDw+JS29I7af7S+pnjQY
 +DPlXw8Jqcd6DcV9uQzbIV1JbzzXp+5AGxbB2gqI/fnVzCYJl8tLO3kmiojIzv9k9RA4
 WqCR9xfhX/wd5GXiWDyeon4sQacqSilNycK6SAQUxhIcAXnW3VkvdOgHgq9ES3K6QV1G
 MH/g==
X-Gm-Message-State: AFqh2kq5LIJg7JnjoY/UMP/lkPOkmknJQhLVk170DXeGzNh9pRAWDbiB
 Z2AfJp38aRl1z2hInpuDPVzquQtcKk9n0Zy+R2qHYyv7Jb/5B1nu5Kib+WSB4/fLdmSV6NS72Tt
 HVZlfAIwv36M0EhA=
X-Received: by 2002:a5d:430f:0:b0:244:48b3:d12b with SMTP id
 h15-20020a5d430f000000b0024448b3d12bmr25890002wrq.45.1672745256759; 
 Tue, 03 Jan 2023 03:27:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtomcaMmDjNDbeeJbGJ7EvB2e3YUykvi+tNohQ+SYwLLawBe7UhPwF7gs3llV9TmsudgqKjLA==
X-Received: by 2002:a5d:430f:0:b0:244:48b3:d12b with SMTP id
 h15-20020a5d430f000000b0024448b3d12bmr25889986wrq.45.1672745256541; 
 Tue, 03 Jan 2023 03:27:36 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0023c8026841csm30962370wrx.23.2023.01.03.03.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:27:35 -0800 (PST)
Message-ID: <e28ce124-6ae8-2ae3-5d66-f7cf1a02a1cd@redhat.com>
Date: Tue, 3 Jan 2023 12:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: david@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 pasic@linux.ibm.com, nrb@linux.ibm.com, nsg@linux.ibm.com,
 seiden@linux.ibm.com
References: <20221222150421.35839-1-imbrenda@linux.ibm.com>
 <20221222150421.35839-3-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221222150421.35839-3-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/12/2022 16.04, Claudio Imbrenda wrote:
> This patch adds support for the asynchronous teardown for reboot for
> protected VMs.
[...]
> +bool s390_pv_vm_try_disable_async(void)
> +{
> +    char tname[VCPU_THREAD_NAME_SIZE];
> +    QemuThread *t;
> +
> +    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> +        return false;
> +    }
> +    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
> +        return false;
> +    }
> +
> +    t = g_malloc0(sizeof(QemuThread));
> +    snprintf(tname, VCPU_THREAD_NAME_SIZE, "async_unpr/KVM");
> +
> +    qemu_thread_create(t, tname, s390_pv_do_unprot_async_fn, NULL,
> +                       QEMU_THREAD_DETACHED);

I think you could get along without the tname[] array here by simply passing 
the string directly to qemu_thread_create() ?

Apart from that, patch looks fine to me.

  Thomas


