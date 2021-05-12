Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6437B755
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:01:27 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjo6-00023l-HK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjls-0000ep-Ti
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjlr-00026p-7D
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5v8iZsX0EMtDioGfOGShjPLNuy0JVM4tL9Xg81c3c2Q=;
 b=XJoiQ0LdQNbBdyzW8siDMRtTD/6AoAu9tBLhZ7owHtk/2Erdn/PZ2nGKflg+ZzbgmGYRMf
 OaHOnEg1nDjHx7rAkeR2mB0qbIBBPCsh7WJ9w8VWRZSQT2gxMBqAmpJQnqSyMG1lhmuiPS
 5JoeZRWjao0+Ilbh9dInDbrnpG6JrPo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-XP9j3QEhMPKJaqIpCaug_A-1; Wed, 12 May 2021 03:59:03 -0400
X-MC-Unique: XP9j3QEhMPKJaqIpCaug_A-1
Received: by mail-ej1-f69.google.com with SMTP id
 gy20-20020a170906f254b02903cc7a4500bfso1628699ejb.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5v8iZsX0EMtDioGfOGShjPLNuy0JVM4tL9Xg81c3c2Q=;
 b=G7Dl6ddJTc9Zq++aegP5BH5im6JQuVBSw/AW50crrEozIOh/iGguuW6+kCDfYtgNYp
 nClzvxxc7nC8G6UZF0o2q1lgvTrlpIx0TevER1L4Dx+4vhr3lIbrDM0YuqSjvaaowsbr
 OdayWh43doTy6Qeq7NqTO6XAGm23EdSHpFJzIZDAJn/1bL+JYrR2bBXbMOTvr/4nsNtc
 teqadl41Su7dogoVX0WbMwds26hSDO6i6d6UtMIxEoicK4JDcR3ba6oKWFjjgONCdGSA
 TQLT6vDc1E3W4bi6FQLxY7t/3gVR+QXxaznI31yn6Eybgeer1ktGhJikkmtfOuo/BPnf
 U9sQ==
X-Gm-Message-State: AOAM531LXRp6D1jUQYtq37RRzvrK5+Ko0sAQoMqTnW6dy+B1GlkeKhgc
 JlKactHMQ2UPKqf0N8nqJwM7vmZ5FXTHxDCqduKuvzdULvwbz9/poqWNcH+pPEH23yw5wbwpXQo
 ptg1GXc7mJ7OWbV4=
X-Received: by 2002:a05:6402:5201:: with SMTP id
 s1mr3458067edd.86.1620806342110; 
 Wed, 12 May 2021 00:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9hR7r3luzQ5D7j5UAM/gGy8un3HX7oDSAjxD1YIc22rf3Ex6f3ABB0ZzKAe1IbgkC9rWFQ==
X-Received: by 2002:a05:6402:5201:: with SMTP id
 s1mr3458047edd.86.1620806341946; 
 Wed, 12 May 2021 00:59:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hz15sm4929023ejc.57.2021.05.12.00.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:59:01 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com> <YJs938JVdO5SRYSs@yekko>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com>
Date: Wed, 12 May 2021 09:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJs938JVdO5SRYSs@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/21 04:30, David Gibson wrote:
> On Tue, May 11, 2021 at 05:53:53PM +0200, Philippe Mathieu-Daudé wrote:
>> hw/ppc/fdt.c defines the ppc_create_page_sizes_prop() function,
>> which is unrelated to the libfdt. Remove the incorrect library
>> dependency on the file.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> This is definitely wrong as it stands.  AFAICT this doesn't add a
> build of hw/ppc/fdt.c anywhere, but it is definitely needed by both
> pseries and powernv machine types, who select FDT_PPC for this exact
> reason.
> 
> I will grant you that it is badly named.  It is in fact related to
> libfdt, just rather indirectly.

The patch makes sense in general.  The file is only needed for pseries 
and powernv, not for e.g. e500 which does need fdt.

I would get rid of FDT_PPC completely.  First, before patch 3, you can 
move fdt.c to PSERIES and POWERNV (it's too small to need its own 
Kconfig symbol) and only leave

    ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: fdt)

Since you are at it, remove the silly #ifdef TARGET_PPC64 in the 
hw/ppc/fdt.c file.

Then in patch 3:

- add to Kconfig.host

     config FDT
        bool

     config LIBFDT
        bool
        depends on FDT

- for all the boards I listed in my review, add "select LIBFDT" in 
addition to "depends on FDT".

- add to meson.build

     softmmu_ss.add(when: 'CONFIG_LIBFDT', if_true: fdt)

Paolo

>> ---
>>   hw/ppc/meson.build | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
>> index e82a6b4105b..580e6e42c8a 100644
>> --- a/hw/ppc/meson.build
>> +++ b/hw/ppc/meson.build
>> @@ -3,9 +3,9 @@
>>     'ppc.c',
>>     'ppc_booke.c',
>>   ))
>> -ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
>> +ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: files(
>>     'fdt.c',
>> -), fdt])
>> +))
>>   ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
>>   
>>   # IBM pSeries (sPAPR)
> 


