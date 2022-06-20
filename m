Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CC551505
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:58:36 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EB1-0007MO-9H
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3E4U-0000cI-7f
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3E4O-000315-3F
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655718703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8fRan+okJ0gJMVy1woCe44vqxuOks4bzhWIEdZc/FE=;
 b=A3orNhDBMgfjHfZvAEQrFUtxLrbGzPf0f6LgGPT+edTO1/YEknlc3eG5lvvAkb2yCSQIWC
 Mqe3kRrK2W3G1wGXW4pAisi2VVJE9n6K/pIo/bHuxoZlA76S/ZFSVwE/NOfCb7zAlx4wuj
 pPaA6hVzj6VaYEtlWqbzSSBDsdHI/E0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-B4WwCQxVPze3jvIdIT_zXw-1; Mon, 20 Jun 2022 05:51:41 -0400
X-MC-Unique: B4WwCQxVPze3jvIdIT_zXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so5701859wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 02:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a8fRan+okJ0gJMVy1woCe44vqxuOks4bzhWIEdZc/FE=;
 b=RJqr8go7f9rr7bzgmrmkHT2U/3E27/COEWTr1PDhwilGsYgnKmWPFfC5TWsrxe7212
 CdmPecG9S9T3qPoSW/iAdyllXybLUeMJNJjGV1xwdIJn2ygd6OxOWrOFXEPV8b9opmnN
 eFFT6BhNUiiLU9PhlAya97/nHjaJPHTt4WaLmv8rbV49So/7fU6bUiRTyvtyugp9nrkW
 0t6er9N5tb1+anE3712ivxSpZLyMB74ORhCwKKZQDf1xqiLzTbSbnJxhnlyhNUojkc4X
 Z7uYUMY3dyXDqf07I2ToWszMqmdJOnZ3cJPWzyG0OA+E5+jOBsDa+iSvUxFQaFjsSndZ
 1NXw==
X-Gm-Message-State: AJIora9DWRgwUBQy7t9OX6Eu1t8EPmd0RskP58iB4OR5KfbriBRLIFk7
 z5YhxLxCMZXAyCFRFCgtDDA3yL1SP2fWPw1z+E8PmWKM8rm5zRK+24dJ+gnN2jHP7PtpKyj6DWO
 4ZDWPwzLEkrMa4Zc=
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr23046627wri.39.1655718700721; 
 Mon, 20 Jun 2022 02:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vxVenLt1xsTf1Y2poJQ5BBUklDh6ThiX6ChnUi9rgsXeXNqiaxJEC3OEJ0RiTXbu3tJtQYzw==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr23046597wri.39.1655718700494; 
 Mon, 20 Jun 2022 02:51:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-241.web.vodafone.de.
 [109.43.178.241]) by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b0020d106c0386sm4344530wrx.89.2022.06.20.02.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 02:51:40 -0700 (PDT)
Message-ID: <00cfc890-dee5-dc9d-7e0c-7cddd5485341@redhat.com>
Date: Mon, 20 Jun 2022 11:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-13-chen.zhang@intel.com>
 <841d2152-d843-0bff-d877-6944e486a3d3@redhat.com>
 <MWHPR11MB00315B5F8F5DAA87129A5E3E9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <MWHPR11MB00315B5F8F5DAA87129A5E3E9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 20/06/2022 11.31, Zhang, Chen wrote:
> 
>> -----Original Message-----
>> From: Thomas Huth <thuth@redhat.com>
>> Sent: Friday, June 17, 2022 5:34 PM
>> To: Zhang, Chen <chen.zhang@intel.com>; Jason Wang
>> <jasowang@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; Paolo
>> Bonzini <pbonzini@redhat.com>; Daniel P. Berrangé
>> <berrange@redhat.com>; Eduardo Habkost <eduardo@habkost.net>; Eric
>> Blake <eblake@redhat.com>; Markus Armbruster <armbru@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>; Laurent Vivier
>> <lvivier@redhat.com>; Yuri Benditovich <yuri.benditovich@daynix.com>;
>> Andrew Melnychenko <andrew@daynix.com>
>> Subject: Re: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
>>
>> On 17/06/2022 09.36, Zhang Chen wrote:
>>> TODO: This test case does not work. Need add ubpf.h header in qtest
>>> compile "-I ../ubpf/vm -I ../ubpf/vm/inc".
>>> I'm not sure if we need it in qtest. Because normal tests/qtest not
>>> including external module test case like fdt. Or we just need a qtest
>>> case for filter-ubpf module.
>>> This test will load pre-compiled ebpf binary and run it in QEMU.
>>>
>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>> ---
[...]
>> Apart from the #include "libqtest.h" there is nothing related to qtest in
>> here ... should this maybe rather go into test/unit/ instead?
> 
> Rethink about it, I think you are right.
> The only issue is can we involve submodule's header file in tests/unit?
> I can't find meson/fdt/SLIRP test cases in the tests.

Well, the test should only be enabled in meson.build if the CONFIG_UBPF 
switch is also enabled, then you can be sure that the header files of ubpf 
are also available when it gets compiled.

  Thomas


