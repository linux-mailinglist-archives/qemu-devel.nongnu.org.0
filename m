Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A094019BE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:27:23 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBqU-00048l-6U
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNBnY-0002oN-WB
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNBnQ-0005v0-NJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630923849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1xrzncFJwpbWCGoPzWMhYqhbMPxc0v7nzEEczedC5w=;
 b=C+sjr3IhOjEFBoU/sKpYUeCHYtknODKcfs+gFB/NVH0det+Zf7DrtTczWlb+d95a/qJhkI
 nrvq+ev2gpl5SLPwxdGvEqMbLV2aa3zXu8gcLFlXzfbxFNKJxonWCDiyehOR+5bCOU7z41
 8U+M4iui0jmUcbyLulA1yEao9BlPD/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-GmXoA6GePM2yDBFvqgWK1g-1; Mon, 06 Sep 2021 06:24:08 -0400
X-MC-Unique: GmXoA6GePM2yDBFvqgWK1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso3075905wmr.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x1xrzncFJwpbWCGoPzWMhYqhbMPxc0v7nzEEczedC5w=;
 b=p+g3CdH/3bILWhYsNSa+cnF+wch8/04nwGnWjEnHJlITWRAwnKkJ+eb2j52DmVTO+n
 D+nEElYl2Emzzvs55uVzLb28OBwwlM94tP4qcWIpF7ipXEol0ZqbkJj+zX7iENei6thl
 l0sqL1Wf+b7dW7dDzUaGQMrfvRCnhUEJcwv7apkMbgmQbhhFt3ce9U6V3quuFUA90uOp
 scWX75duc7XoZklUqWf/ndhBNzAxIWjIEnKEWKEJmuq/tSjVV8z92lw1/DWy2zUYC82m
 yDnEtV6LegHYwdLgNATdiWHzCNvHYTKum81NsX04VfN8Q8iR2rWgpfW6aHOUOFP6GlPT
 QcKg==
X-Gm-Message-State: AOAM5314VQOzJsPM9AVvb2IO4Nbr54GjlGtgH7V0MfU+Xp05LXiu/SL2
 to3FLdxsYoeHT/MbCFDXqCDeMkokFwHgvkJyrKMJEGh6WLViiExiYBrMBV06VLavGcZX7Zt4jdK
 Nr62MzWSOTqfEzZw=
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr12336500wrg.143.1630923847412; 
 Mon, 06 Sep 2021 03:24:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylY9Hv6l+SHC9NwQuqLlwYx1/rEHfcv75sZJPlNSrMrPss6E8mlkIgPDcUA2f3NiU3PQnfJQ==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr12336466wrg.143.1630923847162; 
 Mon, 06 Sep 2021 03:24:07 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o10sm7809657wrc.16.2021.09.06.03.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 03:24:06 -0700 (PDT)
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: Ani Sinha <ani@anisinha.ca>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
Date: Mon, 6 Sep 2021 12:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 12:03 PM, Ani Sinha wrote:
> On Mon, 6 Sep 2021, Philippe Mathieu-Daudé wrote:
>> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
>>> From: Ani Sinha <ani@anisinha.ca>
>>>
>>> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
>>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
>>> This brings in support for whole lot of subsystems that some targets like
>>> mips does not need. They are added just to satisfy symbol dependencies. This
>>> is ugly and should be avoided. Targets should be able to pull in just what they
>>> need and no more. For example, mips only needs support for PIIX4 and does not
>>> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
>>> etc. This change is an effort to clean this up.
>>> In this change, new config variables are added for various acpi hotplug
>>> subsystems. Targets like mips can only enable PIIX4 support and not the rest
>>> of all the other modules which were being previously pulled in as a part of
>>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
>>> are not required by mips (for example, symbols specific to pci hotplug etc)
>>> are available to satisfy the dependencies.
>>>
>>> Currently, this change only addresses issues with mips malta targets. In future
>>> we might be able to clean up other targets which are similarly pulling in lot
>>> of unnecessary hotplug modules by enabling ACPI_X86.
>>>
>>> This change should also address issues such as the following:
>>> https://gitlab.com/qemu-project/qemu/-/issues/221
>>> https://gitlab.com/qemu-project/qemu/-/issues/193
>>
>> FYI per https://docs.gitlab.com/ee/administration/issue_closing_pattern.html
>> this should have been:
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
>>
> 
> Ah my apologies. Will do this next time.
> 
>> Can we close these issues manually?
> 
> Since both you and I have verified that those issues gets fixed with my
> change, yes we can close them. I do not have a gitlab account. Should I
> have one? Is there special permissions needed to handle these tickets?

Since you are listed in the MAINTAINERS file, long-term you'll
eventually use it anyway (i.e. to run the CI pipelines before sending
patches, to subscribe to the 'ACPI' label to get notifications or
comment ACPI-related issues).

The process is quite straight-forward, once having an account you
simply request to be member of the project via the WebUI then you
can help triaging the issues (and closing these two).

Regards,

Phil.


