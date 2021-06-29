Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35563B7934
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:16:17 +0200 (CEST)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyK9Y-0006Sp-Hh
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyK8F-0004oa-LN
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:14:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyK8C-0003Gk-Gd
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624997691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8E/xc9Z7CcNc/2meQ7zlLMcyngrEF8fHXRJO2Oago60=;
 b=dO6RiGoqvTv28DtWR0l6M+jjI1p8OcnrHYwGH2nedp3ruhCWBO4DxrH79dHVi8vmF99wox
 VMEtvKD2kuSA4N2vC9nEnIwzJTPawcGLdcWX5TNiPdWXcey1tPdIuzxK5tz6aIcBxJuhOj
 pZeX4w3OtuRY+zxw2euZ9JkiYnLBM1g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-QuaWkizeOn2y9H_lmuvTWA-1; Tue, 29 Jun 2021 16:14:50 -0400
X-MC-Unique: QuaWkizeOn2y9H_lmuvTWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a05600c3547b02901eaa4d778adso106695wmq.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 13:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8E/xc9Z7CcNc/2meQ7zlLMcyngrEF8fHXRJO2Oago60=;
 b=g93vc3CThGeIPqbfxm4X3JBiR2J2HbBzH4h5dhyLnaHFv9+Loz25cGcbZ6l9dh40vO
 ddeX6WIcCxN00f2p53hh5NKslQa0/5u6HLcxjB1gMjM+z90G2o12ZslKIDFcjiybEogp
 xsS95apaliN2fYtBYVfG2v1JA119EEXxaHfJKe0V1d3I2MEzYdFejjIhKXuP2b5ZiFy2
 Sa/zxtK5LwRXCOax7i3CKaEB55gwuYLZjfHNEm5w3rUesd0nXoDGlwcWggJYVU2JW7Sw
 ZXB5JJLnqR4vCEp/vQXizVt7dEnZHgMjrL6lMDJEapQfg54jioYuytGQC/xbfLtAaB0C
 D2kg==
X-Gm-Message-State: AOAM530D0iPTPED1+N+1klShEA5U5ocj7gqbOtXr5N7nDGVcM6sgh6UZ
 T46eIX7qtH6p7gQkL0Dv06WP+WGom0A1IS38DXQsa38O+YethwpaFtj9LKWr9QyxDfhrfiIIToD
 2sEbCmh+6YFLeCBw=
X-Received: by 2002:adf:fd42:: with SMTP id h2mr2107026wrs.262.1624997687445; 
 Tue, 29 Jun 2021 13:14:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBKcUHLBE6SyDch6lcRKLhLuPqcaE8EapAko3S79b6a4C4FzQFfGDEtaHJY4xaymYXIfn+fQ==
X-Received: by 2002:adf:fd42:: with SMTP id h2mr2107008wrs.262.1624997687256; 
 Tue, 29 Jun 2021 13:14:47 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t11sm19507888wrz.7.2021.06.29.13.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 13:14:46 -0700 (PDT)
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
Date: Tue, 29 Jun 2021 22:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 6/29/21 11:33 AM, Kunkun Jiang wrote:
> Hi all,
>
> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
> our original intention is to flush the ITS tables into guest RAM at
> the point
> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
> migration launch so let's simply flush the tables each time the VM gets
> stopped.
>
> But I encountered an error when I shut down the virtual machine.
>
>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>> 0x0000000000000001: Permission denied
>
> Shall we need to flush ITS tables into guest RAM when 'shutdown' the VM?
> Or do you think this error is normal?
yes we determined in the past this was the right moment do save the tables

"with a live migration the guest is still running after
the RAM has been first saved, and so the tables may still change
during the iterative RAM save. You would actually need to do this
at just the point we stop the VM before the final RAM save; that *might*
be possible by using a notifier hook a vm run state change to RUN_STATE_FINISH_MIGRATE
- if you can do the changes just as the migration flips into that mode
it *should* work. " said David. 

But sometimes as the commit msg says, the VM is stopped before the migration launch - I do not remember the exact scenario tbh -.
So each time the VM is stopped we flush the caches into guest RAM.



>
> This error occurs in the following scenario:
> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to
> the VM.
>
> The flow is as follows:
>
> QEMU:
> vm_shutdown
>     do_vm_stop(RUN_STATE_SHUTDOWN)
>         vm_state_notify
>             ...
>             vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>                 kvm_device_access
>
> Kernel:
>     vgic_its_save_tables_v0
>         vgic_its_save_device_tables
>             vgic_its_save_itt
>
> There is such a code in vgic_its_save_itt():
>> /*
>>  * If an LPI carries the HW bit, this means that this
>>  * interrupt is controlled by GICv4, and we do not
>>  * have direct access to that state without GICv4.1.
>>  * Let's simply fail the save operation...
>>  */
>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>           return -EACCES;
As far as I understand you need a v4.1 to migrate,
following Shenming's series
[PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
Maybe sync with him?

Thanks

Eric


>
> Looking forward to your reply.
>
> Thanks,
> Kunkun Jiang
>
>
>
>
>
>
>


