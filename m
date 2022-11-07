Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6161F094
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzJe-0003NR-Ul; Mon, 07 Nov 2022 05:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orzJV-0003MO-8l
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orzJT-0005vn-L1
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667816706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Iko1ii2ebczSgOsvA5noKLo6reij0uypJyH1/hTBVM=;
 b=g0LeHDjvNg/RknvytyHF6KAbMAtZhtgzbxbXt100ek9+JKJ5KZOYn5fw2a9FU21u38isVi
 pIm9UqjvM7PMSE8/rXADGlYPjbKk4n0zDl7xiW/v3WBwT1W4cIusUF41VyE5P7nNsu1aoL
 xT9xapctdNJZTMmfWipVWBzeYIibffw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-Nx2SaUgVPRufhw5nUj92fw-1; Mon, 07 Nov 2022 05:25:05 -0500
X-MC-Unique: Nx2SaUgVPRufhw5nUj92fw-1
Received: by mail-qk1-f198.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso9890131qkb.23
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 02:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Iko1ii2ebczSgOsvA5noKLo6reij0uypJyH1/hTBVM=;
 b=BY/WtwC/QvA6VC94NrZ1QZWtRj7MTrmFHUxE6BjgCU37b6IGIaVCUU2mCB2jkTJ4+g
 ofHzQPmKuvWlPlIzt0sqeClgeIDXIkz1o8QDE6Jqqckqnr0HghAnwCrNQzA8PTK/v/kY
 nkX2fJZ91VBqXqJAPoakVrgC8/mtGJyPontuctR0URuVNUst0c5pAaTFf00dcD8J1kTH
 ZGPyzF1cNLU/E3qxFlFDCl0HswDMu5hy/J0nkSN00tP5Ct0zNQJMcAk+kxsS5hYLRj54
 FcwGfVqgidrsmquY6X/2JqUdoLI53CnimL7EACYvZBIvAm6oruZ03wX3kcnp0dL/3QRM
 9jXA==
X-Gm-Message-State: ACrzQf3p/ndF0SdSNLNCyjms4vm0MmZA7c+TfpoCpHT9TwyHwhZy3uYy
 TR5Gp7puGIzCvwrHtl3HUYpn/xQFGxe3dbdmhGd7DOD1oDPjsGf4qpi4DUIuvdFlW+30knN8rO8
 8w2BDBhcwuVb/KKE=
X-Received: by 2002:a05:620a:6c9:b0:6fa:9d10:1784 with SMTP id
 9-20020a05620a06c900b006fa9d101784mr462126qky.627.1667816704662; 
 Mon, 07 Nov 2022 02:25:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5AHzhcN/bP2uDy1t/E4fR3gNWYsyNh3upaZj8QrXavIj1o0uuLrLWWd4BaP8chDV20h7mTBA==
X-Received: by 2002:a05:620a:6c9:b0:6fa:9d10:1784 with SMTP id
 9-20020a05620a06c900b006fa9d101784mr462111qky.627.1667816704408; 
 Mon, 07 Nov 2022 02:25:04 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 bt12-20020ac8690c000000b003999d25e772sm5769536qtb.71.2022.11.07.02.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:25:03 -0800 (PST)
Message-ID: <5238980d-1b5f-43a7-57f4-2f98b23c4226@redhat.com>
Date: Mon, 7 Nov 2022 11:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-9-mjrosato@linux.ibm.com>
 <1ffbe6ea-e42a-f84f-c499-0444ffca24ac@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v8 8/8] s390x/s390-virtio-ccw: add zpcii-disable machine
 property
In-Reply-To: <1ffbe6ea-e42a-f84f-c499-0444ffca24ac@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/11/2022 10.53, Cédric Le Goater wrote:
> Hello,
> 
> On 9/2/22 19:27, Matthew Rosato wrote:
>> The zpcii-disable machine property can be used to force-disable the use
>> of zPCI interpretation facilities for a VM.  By default, this setting
>> will be off for machine 7.2 and newer.
> 
> KVM will tell if the zPCI interpretation feature is available for
> the VM depending on the host capabilities and activation can be
> handled with the "interpret" property at the device level.
> 
> For migration compatibility, zPCI interpretation can be globally
> deactivated with a compat property. So, I don't understand how the
> "zpcii-disable" machine option is useful.
> 
> The patch could possibly be reverted for 7.2 and replaced with :
> 
>    @@ -921,9 +921,13 @@ static void ccw_machine_7_1_instance_opt
>     static void ccw_machine_7_1_class_options(MachineClass *mc)
>     {
>         S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
>    +    static GlobalProperty compat[] = {
>    +        { TYPE_S390_PCI_DEVICE, "interpret", "off", },
>    +    };
>         ccw_machine_7_2_class_options(mc);
>         compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>    +    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>         s390mc->max_threads = S390_MAX_CPUS;
>         s390mc->topology_capable = false;
> 
>     }

Thinking about this twice, I'm not sure whether we would need it at all 
since zpci cannot be migrated at all (see the "unmigratable = 1" in 
hw/s390x/s390-pci-bus.c) ... OTOH, doing it via the compat_props also does 
not really hurt.

Anyway, the zpcii-disable switch really does not seem to be necessary... 
Matthew, do you think it's ok if we revert "zpcii-disable" patch?

  Thomas


