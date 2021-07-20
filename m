Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314C3CFA81
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:27:35 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pmY-0004hR-I3
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pjJ-0000xh-QP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pjI-0007En-5U
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626787450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ngu5BRha23v0ldCGMrnE/gt7ypKr2/1OHc4ql5Yd2I=;
 b=MC47PoACJt8MtMoyCpIozUGd4PAiLQqNSlArb2Q+J7dBAFf8/UEN6pcQTaAlWcB4C+zsJX
 Envx+498xwqglspJZJ9OgHXlw++EnyxNaX2ycOgJ6BWm9Y3I9tnu8NYHKKuQLdJdvD3AGH
 dcF5UK6dHC4moTnf0R65ghX4NDI//3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-PosbmyTOOpSTTgnZBJTUCw-1; Tue, 20 Jul 2021 09:24:09 -0400
X-MC-Unique: PosbmyTOOpSTTgnZBJTUCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c14-20020a05600c0aceb0290248831d46e4so840611wmr.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ngu5BRha23v0ldCGMrnE/gt7ypKr2/1OHc4ql5Yd2I=;
 b=DGr+bLzOSWyrKpEdlFK6UqtdhUBzPZT7TWjh+gSHxnSwAaMIvXzIiN1Z0M7NIQCuY2
 lEvs9HX6sL8fmndBNgFgmuPrX1m11tdazOgOcFWmkL6VFl9xSiAMxAs5KJI3h5Fd+0C1
 T97Bn+Escfnd/5nsVOQ6ByYFwhC7fa7tXpr0Ljmz6ZBk16QYUdFFWlIWXMTVxZCH8vSg
 uz1n9XR46jOFNffClwgMNJD65xYjCMJIeMqD2EqKTi3hd5p69y8soetyKUd2WTta1XkU
 IOsfgftPLTrgakxzhO+e/b1iDIE4+t6TNApy/J3BqCVTOIemaFW25i//m3liRucdbd0r
 ryvA==
X-Gm-Message-State: AOAM531YLyRen54R9Cn/qsE4sTlTWyxP3/jbLMcxhgo4fOIdVDedX4Z7
 ieCgT9Z79s9fqttTXStIPRgfXJVhwyYuKe/oY77KAeWRqvKPyTryxHylKbGKQs4dQ2VlnFzeB/G
 7TrCkJ2TWmDjWqrM=
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr38445564wmk.79.1626787448507; 
 Tue, 20 Jul 2021 06:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy3njqx+rMiieGCyB6fOVcyegO6mpmLrFXGNUqAD3EUS+5adH/P5FaI9MkS7wpmoosvP9wAA==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr38445533wmk.79.1626787448312; 
 Tue, 20 Jul 2021 06:24:08 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w9sm20085843wmc.19.2021.07.20.06.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:24:07 -0700 (PDT)
Subject: Re: [PATCH v2 20/23] hw/acpi: Do not restrict ACPI core routines to
 x86 architecture
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-21-philmd@redhat.com>
 <20210617164026-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac8ce5f8-cce1-3fa9-f7bb-a97526549e49@redhat.com>
Date: Tue, 20 Jul 2021 15:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617164026-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:40 PM, Michael S. Tsirkin wrote:
> On Wed, Jun 16, 2021 at 10:43:25PM +0200, Philippe Mathieu-Daudé wrote:
>> ACPI core routines (in core.c) are not really x86-specific.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/acpi/meson.build | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index dd69577212a..c23c67f4283 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -3,6 +3,7 @@
>>    'acpi_interface.c',
>>    'aml-build.c',
>>    'bios-linker-loader.c',
>> +  'core.c',
>>    'utils.c',
>>  ))
>>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>> @@ -14,7 +15,7 @@
>>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
>>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
>> -acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
>> +acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> 
> 
> So is acpi-stub.c still useful then?

Certainly:

softmmu/vl.c:3256:                acpi_table_add(opts, &error_fatal);

Could be eventually merged with aml-build-stub.c...


