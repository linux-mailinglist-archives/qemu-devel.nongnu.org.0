Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12B68DBBE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP4z-0004mA-PM; Tue, 07 Feb 2023 09:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP4n-0004kv-7N
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPP4l-0000Em-Eh
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDLoeqIsechbUgz6PoS2sUn6Go9VWrLZL909u/pxufs=;
 b=Vb0rTOp7PbmgOz1gGz0L62ajAx3rTS5rK4iV7yGvr1fBVyXCLNb3l0MEjnJbbfenCLdkwX
 ra1q7yk1+uIITuArBkhNh1Dm/0e7+k0Nx99pDejtDiZNg8wGWCGivqgzCqlJKswclzFSQ6
 qryaGkSZQoe2pMHrMEZPTGH07SWwSH0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-FyzHrwZ1NOeuh19MVky85g-1; Tue, 07 Feb 2023 09:36:01 -0500
X-MC-Unique: FyzHrwZ1NOeuh19MVky85g-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay10-20020a05620a178a00b0072db6346c39so8601058qkb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDLoeqIsechbUgz6PoS2sUn6Go9VWrLZL909u/pxufs=;
 b=V3Q6ilJj+Blk5vjvJfKSlrjBQn9GRU6oU1WFUZfdoohF/3z/eCST0mJAknhFSrwuHX
 GAmaZB1zl2C5DabWkDL+/a72GOB9D6ffQf3w5Ghgnr0xJr/kqnCOV155gqLjBAyLi9/v
 IyL+s184Ce2HKhqW9lJ+7MoMYeK1HubIu19f2B7+LzfC8u1IqocE8tQ9ZooQ3GCWIPK7
 bdbVSEe6drF4pSJaqwn0QizmcEH9XjfPbyM4dJsb5u86sug+0RHVTne2nS2Rth+BlYqR
 nHADhVtoO3NvUm+dkZNJBUx31CUdCP5/thsW+YGhs9TY84TjCwbak7z3PFqCLLahdnPV
 XKDg==
X-Gm-Message-State: AO0yUKWzzzrH689ninf1WzmEXKnlQRgu3/W3PBUUrP/ah/dqUbXm+fgv
 M7fDFDeZP9iLMH3okRwdzbgNW0QWgn9fzKTjEDgTvLggdfp/IxmET8qLNGiHt2Br84Aq8i6It4Q
 DhDurTU6Rt3u9IoI=
X-Received: by 2002:a05:622a:1ce:b0:3b8:2dd5:3c1d with SMTP id
 t14-20020a05622a01ce00b003b82dd53c1dmr5043768qtw.48.1675780560486; 
 Tue, 07 Feb 2023 06:36:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+xFok5NRzXHPmVRoJaA9wq9FdHslvdf669+e1H6QnoxSQCqFl00SCZn02++6wG+vyHXEXzXQ==
X-Received: by 2002:a05:622a:1ce:b0:3b8:2dd5:3c1d with SMTP id
 t14-20020a05622a01ce00b003b82dd53c1dmr5043745qtw.48.1675780560221; 
 Tue, 07 Feb 2023 06:36:00 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 fd10-20020a05622a4d0a00b003bb50a9f9bbsm3030qtb.7.2023.02.07.06.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:35:59 -0800 (PST)
Message-ID: <218e02c0-efed-1461-e9d5-6bee0a5ecbbc@redhat.com>
Date: Tue, 7 Feb 2023 15:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 11/12] tests/qtest: bios-tables-test: Skip if missing
 configs
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-12-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-12-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> If we build with --without-default-devices, CONFIG_HPET and
> CONFIG_PARALLEL are set to N, which makes the respective devices go
> missing from acpi tables.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> I currently don't see a way of allowing the tests to pass in the
> absence of these two configs. As far as I understand, we would need to
> have one set of expected table files (tests/data/acpi) for each
> combination of machine vs. possible CONFIG that can be toggled.

I think you're right ... maintaining tables for each combination does not 
scale. Disabling the test in that case is likely the best we can do here 
right now.

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index a930706a43..2829eda2c9 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -78,7 +78,9 @@ qtests_i386 = \
>      config_all_devices.has_key('CONFIG_Q35') and                                             \
>      config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
>      slirp.found() ? ['virtio-net-failover'] : []) +                                          \
> -  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
> +  (unpack_edk2_blobs and                                                                    \
> +   config_all_devices.has_key('CONFIG_HPET') and                                            \
> +   config_all_devices.has_key('CONFIG_PARALLEL') ? ['bios-tables-test'] : []) +             \
>     qtests_pci +                                                                              \
>     qtests_cxl +                                                                              \
>     ['fdc-test',

Reviewed-by: Thomas Huth <thuth@redhat.com>


