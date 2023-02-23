Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE216A0300
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 07:59:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5Yq-0006kU-Kr; Thu, 23 Feb 2023 01:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pV5Yk-0006kF-St
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:58:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pV5Yh-0007c5-Ay
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ecfB09k8caShkH69E2kbw6K5lvSIdFRmEdtcuFcS5M=;
 b=e40Nh9+cBGDjV6MUWlvP2t03ifPLj4GfH0qAWVp7rlTm18ICzOLIuzhHo7rYnuPN/8z7CZ
 9Im8gPJVMyBnDjak9+tzNX5jk1lTAg82hhC4WfBhqC6RNd0dgQdPlzCrYBIBIr7iB+YHk6
 3P4sa+0o6gkw1FcYX+AMwheyrSCoJNs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-AZOcMRvnNqCA0H8B-yedRQ-1; Thu, 23 Feb 2023 01:58:24 -0500
X-MC-Unique: AZOcMRvnNqCA0H8B-yedRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo1109995wms.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 22:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ecfB09k8caShkH69E2kbw6K5lvSIdFRmEdtcuFcS5M=;
 b=FLemAYRfqbVD3HR3y1JkAooU+HLuOC6D7GS4PgnBpHfFpV51+/NIb8UmTccnyE3/Y7
 HBr910JhGTmHKd7lrrLxyuG3z+mlJpt2Zi7n2mI7RB2fQettyG0xoseTqF/PbcaIhxtG
 46GyzcRjj7p26ka2XWpWKLZvo8TlQrK6LRh6KJABDbDqcda8Q3gknSZ5LPNZxELz+4/8
 flUkKCrXzqmYSQgJGuSoSAEa0c4C91pEttOvS7/gAX/iW6OSwrmKsQ2SgjUrYd7FRWvM
 YsXM6U9vQ2+oC1PnVWSVgP4jkyUsc+VOP7r2FydztFcDXHdCCzDBocP/9FWbdrhhyVSn
 KJXg==
X-Gm-Message-State: AO0yUKWiH0QrZ+MIvLy1Dx2cEc9UMt7G/YjuhVwTNkHPtsgZt7bDW6GP
 BwF9phhDv/KwtD1/HhMD8gPN6XoXgtglQBNNAiKgscrew8TbrWNQiv3XOsO29uIVpcA78g8XDUE
 8RhB4POO4Y8U8eOI=
X-Received: by 2002:a05:600c:4386:b0:3de:e447:8025 with SMTP id
 e6-20020a05600c438600b003dee4478025mr1752201wmn.21.1677135503221; 
 Wed, 22 Feb 2023 22:58:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8hftLISKlZmhPZy8Dw2g1kg+ALTvI5hH3AerEYASYiMZGtM+AXfmL6jhRPPsK/zHSqmS5RzA==
X-Received: by 2002:a05:600c:4386:b0:3de:e447:8025 with SMTP id
 e6-20020a05600c438600b003dee4478025mr1752186wmn.21.1677135502922; 
 Wed, 22 Feb 2023 22:58:22 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 15-20020a05600c22cf00b003e11f280b8bsm10910924wmg.44.2023.02.22.22.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 22:58:22 -0800 (PST)
Message-ID: <586d040f-d712-905e-fd68-bcde3713478b@redhat.com>
Date: Thu, 23 Feb 2023 07:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
 <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
 <20230222164947.0000554f@Huawei.com>
 <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
In-Reply-To: <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/02/2023 19.16, Philippe Mathieu-Daudé wrote:
> +Thomas (meson) & Marc-André (conditional QAPI)

+ Markus

> On 22/2/23 17:49, Jonathan Cameron wrote:
>>>>>> +# Type of uncorrectable CXL error to inject. These errors are 
>>>>>> reported via
>>>>>> +# an AER uncorrectable internal error with additional information 
>>>>>> logged at
>>>>>> +# the CXL device.
>>>>>> +#
>>>>>> +# @cache-data-parity: Data error such as data parity or data ECC 
>>>>>> error CXL.cache
>>>>>> +# @cache-address-parity: Address parity or other errors associated 
>>>>>> with the
>>>>>> +#                        address field on CXL.cache
>>>>>> +# @cache-be-parity: Byte enable parity or other byte enable errors on 
>>>>>> CXL.cache
>>>>>> +# @cache-data-ecc: ECC error on CXL.cache
>>>>>> +# @mem-data-parity: Data error such as data parity or data ECC error 
>>>>>> on CXL.mem
>>>>>> +# @mem-address-parity: Address parity or other errors associated with 
>>>>>> the
>>>>>> +#                      address field on CXL.mem
>>>>>> +# @mem-be-parity: Byte enable parity or other byte enable errors on 
>>>>>> CXL.mem.
>>>>>> +# @mem-data-ecc: Data ECC error on CXL.mem.
>>>>>> +# @reinit-threshold: REINIT threshold hit.
>>>>>> +# @rsvd-encoding: Received unrecognized encoding.
>>>>>> +# @poison-received: Received poison from the peer.
>>>>>> +# @receiver-overflow: Buffer overflows (first 3 bits of header log 
>>>>>> indicate which)
>>>>>> +# @internal: Component specific error
>>>>>> +# @cxl-ide-tx: Integrity and data encryption tx error.
>>>>>> +# @cxl-ide-rx: Integrity and data encryption rx error.
>>>>>> +##
>>>>>> +
>>>>>> +{ 'enum': 'CxlUncorErrorType',
>>>>>
>>>>> Doesn't these need
>>>>>
>>>>>         'if': 'CONFIG_CXL_MEM_DEVICE',
>>>>>
>>>>> ?
>>>>
>>>> If I make this change I get a bunch of
>>>>
>>>> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned 
>>>> "CONFIG_CXL_MEM_DEVICE"
>>>>      18 | #if defined(CONFIG_CXL_MEM_DEVICE)
>>>
>>> Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.
>>>
>>>> It's a target specific define (I think) as built alongside PCI_EXPRESS
>>>> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
>>>>
>>>> To be honest though I don't fully understand the QEMU build system so 
>>>> the reason
>>>> for the error might be wrong.
>>>
>>> You need to restrict to system emulation (the 'have_system' check):
>>
>> This doesn't help - still have
>> attempt to used poisoned "CONFIG_CXL"

Not sure how the QAPI generator works, but target specific config switches 
can only be used in target specific json files there, so that's 
machine-target.json and misc-target.json currently, as far as I know. Not 
sure how the QAPI generator distinguishes between common and target specific 
code, though ... just by the "-target" suffix? Maybe Markus or Marc-André 
can comment on that.

See also:

  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg01885.html
  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02001.html

  Thomas


