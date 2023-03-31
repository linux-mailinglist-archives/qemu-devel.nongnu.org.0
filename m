Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B16D18FF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 09:51:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi9X7-0006wW-23; Fri, 31 Mar 2023 03:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pi9X1-0006vi-8a
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 03:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pi9Wz-0000Zk-IH
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 03:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680249040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaul/LgDKY8qeQMIfrQcT/xqF6e1Yvc3uuXg8WRWAYg=;
 b=ZMsf3BqT4xgZknCnkUnuX7+NI1DyoziIeR0sPK1p8y8YlhtL9+MFnXXEaQB9Wrdz+Ucx2D
 dvk2AAQPSLHGXIaTuTGgTjpmU+YhwEJIbG1UDO1RufpY7Z88QN9XV5OJQEqhY0Gkbovivc
 3FPzs8pQyXF95fsxh3lyisUJVE7PJSM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-DupfQ_aLNLC-T2MtKY-VYw-1; Fri, 31 Mar 2023 03:50:39 -0400
X-MC-Unique: DupfQ_aLNLC-T2MtKY-VYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so11614476wms.4
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 00:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680249038;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uaul/LgDKY8qeQMIfrQcT/xqF6e1Yvc3uuXg8WRWAYg=;
 b=UpzWJ7ckg0C09EHzpBX+tRsGiRzdKl+DfZMw4hwLW454EqicTWL/QUFDC9KXGNxgmg
 cXVhsTuwSRII1EB2+RSWZhe1Nvsn8r5XUOYWIFYlBGXCSFfW5gmD39CgxyevQNDwdRz/
 IuJV6BK00Qiu9UXJbL8axjm8GQS3t91wP5nn0dhasYLo/Uab7GExwdvK53Dvmeiqf655
 PjuerrcFLOiiOMsxer5D3IZFA347e7gaRGSlMaXV+C6YD1Q+otojrALZkzKsQt06Qjf4
 xE45hY4BYW+z25gbhMps087V5R7ZCQKPrrVAeHRtSAHHZn8Qki9YH5dFD+iXao0QxxO9
 XSCA==
X-Gm-Message-State: AAQBX9djUgYXRBynBtqBQLILYZukGhOANEFw1r06FxJG41gnFF5VzkV4
 iRO1mgsDvdCiS4timTnKl26MC68KKrbR1enLzhqQgTU0RSpq0gHboov8slX8QA5y7g73HA0hBm0
 PWOutrLeL3JXs+TI=
X-Received: by 2002:a1c:f704:0:b0:3f0:44d1:3ba7 with SMTP id
 v4-20020a1cf704000000b003f044d13ba7mr656437wmh.17.1680249038272; 
 Fri, 31 Mar 2023 00:50:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bU7TXyYItFW058VUnYcU6fNB6vTfUY5BGwUIj48soBPLisSrvXkzRSf4Wkglq4MIqGvpQI4A==
X-Received: by 2002:a1c:f704:0:b0:3f0:44d1:3ba7 with SMTP id
 v4-20020a1cf704000000b003f044d13ba7mr656411wmh.17.1680249037956; 
 Fri, 31 Mar 2023 00:50:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-12.web.vodafone.de.
 [109.43.177.12]) by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003edcc2223c6sm1775916wmi.28.2023.03.31.00.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 00:50:37 -0700 (PDT)
Message-ID: <83a38091-aa46-c92d-b078-ad8738f03cdf@redhat.com>
Date: Fri, 31 Mar 2023 09:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/11] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-10-alex.bennee@linaro.org>
 <b23ab886-e9f5-bb94-c98d-ccdd45cdeff1@redhat.com> <87zg7uo2pi.fsf@linaro.org>
 <92ed3dc1-32c2-cce2-57be-28f5aa702d60@redhat.com>
In-Reply-To: <92ed3dc1-32c2-cce2-57be-28f5aa702d60@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/03/2023 14.21, Thomas Huth wrote:
> On 30/03/2023 14.12, Alex Bennée wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 30/03/2023 12.11, Alex Bennée wrote:
>>>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>> Avocado version 101.0 has a fix to re-compute the checksum
>>>> of an asset file if the algorithm used in the *-CHECKSUM
>>>> file isn't the same as the one being passed to it by the
>>>> avocado user (i.e. the avocado_qemu python module).
>>>> In the earlier avocado versions this fix wasn't there due
>>>> to which if the checksum wouldn't match the earlier
>>>> checksum (calculated by a different algorithm), the avocado
>>>> code would start downloading a fresh image from the internet
>>>> URL thus making the test-cases take longer to execute.
>>>> Bump up the avocado-framework version to 101.0.
>>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>>>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>>>> ---
>>>>    tests/requirements.txt | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>>> index 0ba561b6bd..a6f73da681 100644
>>>> --- a/tests/requirements.txt
>>>> +++ b/tests/requirements.txt
>>>> @@ -2,5 +2,5 @@
>>>>    # in the tests/venv Python virtual environment. For more info,
>>>>    # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>>>    # Note that qemu.git/python/ is always implicitly installed.
>>>> -avocado-framework==88.1
>>>> +avocado-framework==101.0
>>>>    pycdlib==1.11.0
>>>
>>> Did you check whether the same amount of avocado tests still works as
>>> before? ... last time I tried to bump the version, a lot of things
>>> were failing, and I think Cleber was recently working  on fixing
>>> things, but I haven't heart anything back from him yet that it would
>>> be OK to bump to a newer version now ...
>>
>> I ran it on my default build and the only failure was:
>>
>>   (008/222) 
>> tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg: 
>> INTERRUPTED: timeout (240.01 s)
>>
>> which passed on a retry. But now I realise with failfast it skipped a bunch:
> 
> That one is also failing for me here when I apply the patch. Without the 
> patch, the test is working fine. I think this needs more careful testing 
> first - e.g. the tests are run in parallel now by default, which breaks a 
> lot of our timeout settings.

FWIW, I think we likely want something like this added to this patch,
so we avoid to run those tests in parallel (unless requested with -jX):

diff a/tests/Makefile.include b/tests/Makefile.include
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -138,12 +138,15 @@ get-vm-image-fedora-31-%: check-venv
  # download all vm images, according to defined targets
  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
  
+JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%, $(MAKEFLAGS))))
+
  check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
         $(call quiet-command, \
              $(TESTS_PYTHON) -m avocado \
              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
              $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
                         --filter-by-tags-include-empty-key) \
+            --max-parallel-tasks $(JOBS_OPTION:-j%=%) \
              $(AVOCADO_CMDLINE_TAGS) \
              $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
              "AVOCADO", "tests/avocado")

That way we can avoid the timeout problems unless we found a
proper solution for those.

  Thomas


