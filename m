Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B355132E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:48:40 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3D5K-0006j9-VH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3D3R-0005o1-EK
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3D3N-0006x5-RQ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655714796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UukSdNcK8+tPX4A2eM3gPgqBJBMCI/U1tNGU7Q47lE=;
 b=Oay6jbbyACWgw5eKK9zvEY8IZcB3RBtummXnkUffFyJyE7FHGmMEw1AqsV7k4bbJ+xTrlf
 YlJCkQz+8X5MwEiBLU2r+7IbRnKMSTsNJ4UrtMEgaYWIQNCCn69jSgS3oVcpnxJltsyJT0
 REYdgsewSQ/eXV2Yj2plMPQPGwvjfZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-D-jYZ5igMaKUh81DZOHm0A-1; Mon, 20 Jun 2022 04:46:35 -0400
X-MC-Unique: D-jYZ5igMaKUh81DZOHm0A-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a1c0202000000b0039c94528746so6604771wmc.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2UukSdNcK8+tPX4A2eM3gPgqBJBMCI/U1tNGU7Q47lE=;
 b=Kr9fMdxy69d4G9ndAZFeNC0WfjYAMRUOzPwWrlCR4x/fEK/ETrdjYXotMNtqyLvAET
 hhJRgc3h7dILPHSvMsrqpKMSMxyrOLriRAGCZp6FZsElLYlETj5b0FK+uO397glSDFe6
 N9osLuQj63ggJxMFT8/M1QamVaWhlgHkCLyxDiV+QwoARsDEqVoOplmrmdgA+/t7g2f/
 wDulZT+onMqL6vn409H3ie9LYBVQeD81KzhwYcKOUK8eaTHNABcJKkAWVAMdsS6cGgDs
 YwVdXGGoRxa2mU+ytdxLgwZ2n9LEdYzqxUmCRLWAFMUrDZUSmosriNV+orYa/uetDS8F
 5/Vg==
X-Gm-Message-State: AJIora/4q1LqiPYeAdDW5mtMKmZlfz7P+b1SeAHmAUOA2OVs8KRXti0c
 hwsD9QqWYRys6X1idXDATraZMIAYOFBqb+pRfEFq9RZ/Ndy/svgvmmGWTl/MvRFag60uz6IiaQ6
 fIdfcgkIVsdWTRA0=
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr22620016wrq.96.1655714793853; 
 Mon, 20 Jun 2022 01:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXhw+lmCLsdd9AiDeGRZaug4n7wIwrllJKUUOEw4YiVOGCP/B9ayyzLgCkrWaR+tFwJ10mIQ==
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr22619987wrq.96.1655714793629; 
 Mon, 20 Jun 2022 01:46:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-241.web.vodafone.de.
 [109.43.178.241]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0021b8d1b0568sm3541260wro.52.2022.06.20.01.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:46:33 -0700 (PDT)
Message-ID: <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
Date: Mon, 20 Jun 2022 10:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Zhang, Chen" <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YrArvxwzVWQK4Hu8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/06/2022 10.11, Daniel P. Berrangé wrote:
> On Mon, Jun 20, 2022 at 05:59:06AM +0000, Zhang, Chen wrote:
>>
>>
>>> -----Original Message-----
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>> Sent: Friday, June 17, 2022 4:05 PM
>>> To: Zhang, Chen <chen.zhang@intel.com>
>>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
>>> devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Eduardo
>>> Habkost <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>; Markus
>>> Armbruster <armbru@redhat.com>; Peter Maydell
>>> <peter.maydell@linaro.org>; Thomas Huth <thuth@redhat.com>; Laurent
>>> Vivier <lvivier@redhat.com>; Yuri Benditovich
>>> <yuri.benditovich@daynix.com>; Andrew Melnychenko
>>> <andrew@daynix.com>
>>> Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
>>> submodule for QEMU
>>>
>>> On Fri, Jun 17, 2022 at 03:36:19PM +0800, Zhang Chen wrote:
>>>> Make iovisor/ubpf project be a git submodule for QEMU.
>>>> It will auto clone ubpf project when configure QEMU.
>>>
>>> I don't think we need todo this. As it is brand new functionality we don't have
>>> any back compat issues. We should just expect the distros to ship ubpf if
>>> they want their QEMU builds to take advantage of it.
>>>
>>
>> Yes, agree. It's the best way to use the uBPF project.
>> But current status is distros(ubuntu, RHEL...) does not ship
>> the iovisor/ubpf like the iovisor/bcc. So I have to do it.
>> Or do you have any better suggestions?
> 
> If distros want to support the functionality, they can add packages for
> it IMHO.

Yes, let's please avoid new submodules. Submodules can sometimes be a real 
PITA (e.g. if you forget to update before rsync'ing your code to a machine 
that has limited internet access), and if users install QEMU from sources, 
they can also install ubpf from sources, too.
And if distros want to support this feature, they can package ubpf on their 
own, as Daniel said.

  Thomas


