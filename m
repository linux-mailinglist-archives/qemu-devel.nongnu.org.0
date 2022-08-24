Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C177E59F838
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:54:56 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo2B-0002bd-Rs
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQmuZ-0004II-JN
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQmuV-0001cp-L4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661334174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMBsSKM5XsVlxdv6JXFu8FlMREZ3HmOSGvRaXkFvkm0=;
 b=Fv3GJkHmliBo6ixTiD7AOI+U1E4lIrzYHPZuOKCol2pgZmmvxBEHA5/6J+r7pAxbDWeNAT
 qwJs9w4DmVMUkKbmx6i3/UsQ8O/04N82XyCKhatonQG20uBmtM9+YsxRwIo0KvTgp+2r3g
 oV2v1A/sQVruDsbZgXLD+NX+bpsE7Es=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-F_VV6H3cNpaUEkPS-ufB-A-1; Wed, 24 Aug 2022 05:42:53 -0400
X-MC-Unique: F_VV6H3cNpaUEkPS-ufB-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so8950292wmb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UMBsSKM5XsVlxdv6JXFu8FlMREZ3HmOSGvRaXkFvkm0=;
 b=Tpk8PDu0lmfpOKepK2eCEFhN+D2Udf66B7Cry2+MO2/zXvchC5QISau2GwmBZ/faLM
 IVDmH4BEzUu5suYskRidRB75nE3qsWyfxxBWGbgYjbeMFsgJbUq9v40qDA5gCC3C32Hv
 40v5g1cotWLhbcciUzK7lGFB+Ln3VOXZM/f7VqdEjQ3VdN0PLJE3iTOwKlJqzGATbAiw
 DXB4TTSCVWqcB6mc2QoQIoGyWDseLAj/CURO1Dod/8lgK3sFWipZ5u584ApSEcRdOVTl
 V/bY/WVtGGP55dqped/3KO8aQm5SN1OFS8pV5RrI85Rd5Pa9MqtUWlogkXYGyoWj9Xtw
 Mouw==
X-Gm-Message-State: ACgBeo3wn+NzEQnxJPHyRYer0R/9lbDmWGZ8v9GbrlQlJmONNF/YEp6g
 lCr2fwDCFfapNDfd4ev7PPUOdGC0c++njZi/edWGlfXcQhw+EGPZvs807zMG0xqPhCTYliYVTzF
 Y231EhahB1xtvgAM=
X-Received: by 2002:a05:600c:3595:b0:3a5:c2a5:c92a with SMTP id
 p21-20020a05600c359500b003a5c2a5c92amr4672819wmq.170.1661334172045; 
 Wed, 24 Aug 2022 02:42:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7M0eYtePvqW4s62NQA60NUdyw7vj9CKsf/a72Hugs4vrauRzK8jUG9iY2dXriMe8fMhRjqug==
X-Received: by 2002:a05:600c:3595:b0:3a5:c2a5:c92a with SMTP id
 p21-20020a05600c359500b003a5c2a5c92amr4672799wmq.170.1661334171730; 
 Wed, 24 Aug 2022 02:42:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-177.web.vodafone.de.
 [109.43.176.177]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c4e9100b003a6091b3a96sm1489717wmq.23.2022.08.24.02.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 02:42:51 -0700 (PDT)
Message-ID: <9ec22f23-4c86-6162-e9ba-ba3d30cc46c7@redhat.com>
Date: Wed, 24 Aug 2022 11:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PULL 1/6] tests/avocado: push default timeout to QemuBaseTest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
 <20220823152558.301624-2-alex.bennee@linaro.org>
 <13926833-3ce7-dc1a-33a4-ac6691eda763@linaro.org> <87o7wahu9j.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87o7wahu9j.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 24/08/2022 11.19, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 8/23/22 08:25, Alex Bennée wrote:
>>> All of the QEMU tests eventually end up derrived from this class. Move
>>> the default timeout from LinuxTest to ensure we catch them all. As 15
>>> minutes is fairly excessive we drop the default down to 2 minutes
>>> which is a more reasonable target for tests to aim for.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Message-Id: <20220822165608.2980552-2-alex.bennee@linaro.org>
>>> diff --git a/tests/avocado/avocado_qemu/__init__.py
>>> b/tests/avocado/avocado_qemu/__init__.py
>>> index ed4853c805..0efd2bd212 100644
>>> --- a/tests/avocado/avocado_qemu/__init__.py
>>> +++ b/tests/avocado/avocado_qemu/__init__.py
>>> @@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
>>>        _console_interaction(test, success_message, failure_message, command + '\r')
>>>      class QemuBaseTest(avocado.Test):
>>> +
>>> +    # default timeout for all tests, can be overridden
>>> +    timeout = 120
>>> +
>>>        def _get_unique_tag_val(self, tag_name):
>>>            """
>>>            Gets a tag value, if unique for a key
>>> @@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>>>        to start with than the more vanilla `QemuSystemTest` class.
>>>        """
>>>    -    timeout = 900
>>>        distro = None
>>>        username = 'root'
>>>        password = 'password'
>>
>> Bah.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2923804714
> 
> 
> Hmm weird - the avocado CFI job doesn't even appear on my CI list (even
> with push-ci-now).

You likely have to set QEMU_CI_AVOCADO_TESTING in your gitlab settings, see 
docs/devel/ci-jobs.rst.inc.

I think we really have to rework the way we run (or rather not run) the 
avocado tests - since with the current default behavior, they'll be ignored 
by most people by default.

  Thomas



