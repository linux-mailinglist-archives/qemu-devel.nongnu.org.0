Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48469F7DB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUr6V-0004Xz-Ex; Wed, 22 Feb 2023 10:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUr6R-0004Wd-G2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:32:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUr6O-00070R-Ns
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:32:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so6655524wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVzFrKCuFSK7eT70pkY+VcYnT3HdH9nLSo3lTsO9lgM=;
 b=hweR71vYtdH908z56CW4tkhIY5ddlEtn0eOT0q9AcpOaCD/K5g8thOD8p1nnCzK1pz
 9bgYuWa+tf6cTL+VjgMytRs1RM5XcEWBYj4d7EKsYd306p+79ShKL0lZ9DEysfYZ6HQk
 1NRtLrPwxm8zNAYMedJEBb1yP2H0wOr9KMwI14Cb2+3/ts5HkGwQOvzM2ACXGm/i7GUu
 YsZ9QwIoWA3nHgyeJU7k8uVWxoFw9h6ejbb5+CeBs2g4/4AmQ4gOVEPspNlCZjlArPc4
 An9FufjXOwErja0N3tDVtv5XAwiaTB3A0J90gMxBgKDG88FTZ2f2FgFt2ox/wOS4wmVx
 pMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVzFrKCuFSK7eT70pkY+VcYnT3HdH9nLSo3lTsO9lgM=;
 b=P2AH0zjWwH53CqaipwjWaCDtLF3iWfDKmQImK4t6l0QALqfL6GSQ7AuDson+s36lrk
 XzJU43UZrwS8BrCkiMEIqWDHobmx1+2N7n1mm9Ro25k/C6+4T4CUiPhgDEJhH1sVUkyz
 YADknX3Ga0vcl5qGOYYe88yg3St6V+QXMQE0YlVn/eYCqqeAKiGJ+Gjta82fMcsKR1OU
 H+yW5vuMXLKCEkGX53Fwbh6adj4Mlw+tHlVEhyXXPVfPz+gGgTFuaH2WngKMBI4Ff23k
 Cn7RrAqaqeN55fBKwg70oWC3fxHCsZoHJeCj87y9oojooDIjAQ+7P9gxByTO6ylgu4o8
 +ARQ==
X-Gm-Message-State: AO0yUKUmTzoYAHcPusJZVPe74oqgCtYmyDYgvWOc9CoRsviE5YzYA7E0
 SfTnDiJ6hrPN38rLIaFlMypJOg==
X-Google-Smtp-Source: AK7set954uotp1PNFtGH1MlAHvPfpbqbWNJG9eh9Yz8TH9O274OfW2b8bfsH5eTdBBXg9P+iFgHG+A==
X-Received: by 2002:a05:600c:a695:b0:3e2:2f9:b8e2 with SMTP id
 ip21-20020a05600ca69500b003e202f9b8e2mr7047560wmb.35.1677079934198; 
 Wed, 22 Feb 2023 07:32:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b002c54c8e70b1sm7841061wrm.9.2023.02.22.07.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:32:13 -0800 (PST)
Message-ID: <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
Date: Wed, 22 Feb 2023 16:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222145330.000021ef@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/2/23 15:53, Jonathan Cameron wrote:
> On Tue, 21 Feb 2023 23:15:49 +0100
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> Hi Jonathan,
>>
>> On 21/2/23 16:21, Jonathan Cameron wrote:
>>> CXL uses PCI AER Internal errors to signal to the host that an error has
>>> occurred. The host can then read more detailed status from the CXL RAS
>>> capability.
>>>
>>> For uncorrectable errors: support multiple injection in one operation
>>> as this is needed to reliably test multiple header logging support in an
>>> OS. The equivalent feature doesn't exist for correctable errors, so only
>>> one error need be injected at a time.
>>>
>>> Note:
>>>    - Header content needs to be manually specified in a fashion that
>>>      matches the specification for what can be in the header for each
>>>      error type.
>>>
>>> Injection via QMP:
>>> { "execute": "qmp_capabilities" }
>>> ...
>>> { "execute": "cxl-inject-uncorrectable-errors",
>>>     "arguments": {
>>>       "path": "/machine/peripheral/cxl-pmem0",
>>>       "errors": [
>>>           {
>>>               "type": "cache-address-parity",
>>>               "header": [ 3, 4]
>>>           },
>>>           {
>>>               "type": "cache-data-parity",
>>>               "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
>>>           },
>>>           {
>>>               "type": "internal",
>>>               "header": [ 1, 2, 4]
>>>           }
>>>           ]
>>>     }}
>>> ...
>>> { "execute": "cxl-inject-correctable-error",
>>>       "arguments": {
>>>           "path": "/machine/peripheral/cxl-pmem0",
>>>           "type": "physical"
>>>       } }
>>>
>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Hi Philippe,
> 
> Thanks for your review.  One question inline.
> 
>>> +#
>>> +# Type of uncorrectable CXL error to inject. These errors are reported via
>>> +# an AER uncorrectable internal error with additional information logged at
>>> +# the CXL device.
>>> +#
>>> +# @cache-data-parity: Data error such as data parity or data ECC error CXL.cache
>>> +# @cache-address-parity: Address parity or other errors associated with the
>>> +#                        address field on CXL.cache
>>> +# @cache-be-parity: Byte enable parity or other byte enable errors on CXL.cache
>>> +# @cache-data-ecc: ECC error on CXL.cache
>>> +# @mem-data-parity: Data error such as data parity or data ECC error on CXL.mem
>>> +# @mem-address-parity: Address parity or other errors associated with the
>>> +#                      address field on CXL.mem
>>> +# @mem-be-parity: Byte enable parity or other byte enable errors on CXL.mem.
>>> +# @mem-data-ecc: Data ECC error on CXL.mem.
>>> +# @reinit-threshold: REINIT threshold hit.
>>> +# @rsvd-encoding: Received unrecognized encoding.
>>> +# @poison-received: Received poison from the peer.
>>> +# @receiver-overflow: Buffer overflows (first 3 bits of header log indicate which)
>>> +# @internal: Component specific error
>>> +# @cxl-ide-tx: Integrity and data encryption tx error.
>>> +# @cxl-ide-rx: Integrity and data encryption rx error.
>>> +##
>>> +
>>> +{ 'enum': 'CxlUncorErrorType',
>>
>> Doesn't these need
>>
>>        'if': 'CONFIG_CXL_MEM_DEVICE',
>>
>> ?
> 
> If I make this change I get a bunch of
> 
> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG_CXL_MEM_DEVICE"
>     18 | #if defined(CONFIG_CXL_MEM_DEVICE)

Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.

> It's a target specific define (I think) as built alongside PCI_EXPRESS
> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
> 
> To be honest though I don't fully understand the QEMU build system so the reason
> for the error might be wrong.

You need to restrict to system emulation (the 'have_system' check):

-- >8 --
diff --git a/qapi/meson.build b/qapi/meson.build
index fbdb442fdf..643c76d61c 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -31,6 +31,7 @@ qapi_all_modules = [
    'compat',
    'control',
    'crypto',
-  'cxl',
    'dump',
    'error',
    'introspect',
@@ -58,6 +59,7 @@ if have_system
      'audio',
      'qdev',
      'pci',
+    'cxl',
      'rdma',
      'rocker',
      'tpm',
---


