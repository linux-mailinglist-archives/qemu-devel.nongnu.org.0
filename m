Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E35F9C29
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:43:56 +0200 (CEST)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpKF-0001qR-OS
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohoyI-00045l-PD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohoyD-0002hO-Ls
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665393667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2R5+fE/e5whmR5rXYqTa+QFeW33sFJPRgB+BETuFbHg=;
 b=eyNpsp/g/qx5fZSjOBhZgxLLcSk02EoGKVbDWR3WPHJtP7NhInw0uCbpdnK4f4ctubij8e
 ItBPIkoV2AtalPKfxNvHXhgOhP27RqPwXc11PvINBda/v5rT/B3Rl7T1+1Xmeh7LeA394J
 qMXA2CPZqPNhdI52IHaQDa/dAoCippc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-kNQmvenJOP6yQE8cMBXe1Q-1; Mon, 10 Oct 2022 05:21:06 -0400
X-MC-Unique: kNQmvenJOP6yQE8cMBXe1Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 q28-20020adfab1c000000b0022e0399964dso2490764wrc.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2R5+fE/e5whmR5rXYqTa+QFeW33sFJPRgB+BETuFbHg=;
 b=Tu0gV0eMulNwi68gMT9CxLRJEllImQWWBPGrvju0QwjOmkEE+64R87Wth+ony8U6LR
 0WdjDC9jW72TheJtvFFLS+C55awGdG2fr3O+gQBxQ0dt9gJgd/CenOHlXJLRYimfmoe5
 vsuUTpL9pPrasNWiBQtDOYlu4dLpJMrEalaCdG/1sM8Qt/KWpwhddDW1juJVghN9yJrU
 1IX3ka4ZFQyXggM7X/bpNm1DWERwfsMpyNFrnLz95XWZvHVXP+4R2FTFM7TC/mmvWQQP
 DcBxeQTkoTQS1BJ5qf9sSFt7VY+NT5SlhwceaWBUb63de/hwA1RLGu1h0w7hBokyyZjT
 6osA==
X-Gm-Message-State: ACrzQf3jwQaSqdzAXDcJ7Me6EcnH3UNXYp0L7uss48wkwvprwEi2mCIm
 YkqrkPUVtAvr2txeRdZXlvfFAiw3uADD09U5A+8/W5gCTcdZqmebP3xa97zYqFopxg0PunWqfVF
 vyH2sJ6tGBHj67OA=
X-Received: by 2002:a05:600c:793:b0:3bf:816b:144e with SMTP id
 z19-20020a05600c079300b003bf816b144emr16789108wmo.148.1665393665678; 
 Mon, 10 Oct 2022 02:21:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62a43eCYTr1PJ+K+DSOOXDGLwW+f5dZZg7eGAKEurLD9NfkVbwxHvz8fKPFYnYXnqmZzWScA==
X-Received: by 2002:a05:600c:793:b0:3bf:816b:144e with SMTP id
 z19-20020a05600c079300b003bf816b144emr16789081wmo.148.1665393665367; 
 Mon, 10 Oct 2022 02:21:05 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-99.web.vodafone.de.
 [109.43.178.99]) by smtp.gmail.com with ESMTPSA id
 c1-20020a05600c0ac100b003b5054c6f87sm9481886wmr.21.2022.10.10.02.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 02:21:04 -0700 (PDT)
Message-ID: <6d16a8e0-8c3b-dde5-8ba7-311c30b0a544@redhat.com>
Date: Mon, 10 Oct 2022 11:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Igor M <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
References: <20221010075439.4146972-1-ani@anisinha.ca>
 <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
 <07a72a1c-6dd1-a776-56d5-95880c295f48@redhat.com>
 <CAARzgwzzQpKnd+gk_Tcw0cAzRs2s-sOe5HCUga1cF7oZ=kwS7w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwzzQpKnd+gk_Tcw0cAzRs2s-sOe5HCUga1cF7oZ=kwS7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.934, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/2022 11.13, Ani Sinha wrote:
> On Mon, Oct 10, 2022 at 2:26 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 10/10/2022 10.13, Ani Sinha wrote:
>>> On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
>>>>
>>>> Please see the README file added in patch 10 for more details.
>>>> Sample runs are as follows:
>>>>
>>>> $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
>>>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
>>>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
>>>> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
>>>
>>> None of the above files are avocado tests or avocado related python
>>> scripts. They are run from within bits in a python 2.7 environment. I
>>> could not find a mechanism to exclude a directory from avocado tests.
>>> I also do not think making those scripts python 3 compliant is a good
>>> use of my time since upgrading bits to use python 3 would be a major
>>> task unrelated to QEMU testing.
>>
>> Maybe you could at least switch those three lines to use the new print()
>> syntax
> 
> There are lots of print statements in those three files using old
> syntax. It's only complaining about the first one.
> 
> to silence at least these ugly errors? ... Python 2.7 should cope

Yeah, but everybody who wants to run the QEMU avocado tests will wonder 
about those ERROR messages! So I don't think that this is acceptable in the 
current shape. Either fix the print lines, or move it to another directory.

  Thomas



