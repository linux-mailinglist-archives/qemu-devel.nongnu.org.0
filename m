Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79682415B1B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:39:04 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLC3-0003JC-Ih
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTL7c-0005M1-FU
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTL7Y-0007y8-O7
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632389664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSQjN0CgXFeIYy+O9ZqhKgvtF0JDD+Wnv6FDKvVle58=;
 b=WzexiNNl/yREWKEkxTv+hNAkCCMnTTnQiGNv8p0y2R/6nZcjDfyh5zKZJbTkw1okOGwWh1
 2334l8FxchRfNE/bL8jYC/Xd3DESn99RTdAJKDX0RZByNOA3DsyIaOGUUzvkNW+c9gCf2T
 tC9BE62wM8t3g6POtDSA0pI4pEybafI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-s_M_-l4iM0Gh5UH5rpHFhA-1; Thu, 23 Sep 2021 05:34:22 -0400
X-MC-Unique: s_M_-l4iM0Gh5UH5rpHFhA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so4636496wrv.6
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NSQjN0CgXFeIYy+O9ZqhKgvtF0JDD+Wnv6FDKvVle58=;
 b=fov0QGRjYDAUzVGJ9CiuvMox3k4/+VQogT4tJFgDsZEofkUn8LcmBGQ+Fw4aP4jiu1
 elfiWh+lBcc79US//MkaXhCZFujIYrZw4f0ILRBu3IlY5yzQQkqwRb0Q7F5YbHpODr2Y
 kKY1KYedXeB4imR0A7a4FyPAS6+fUdfujZiPfArcu+eEZbf4/WoApfN6oyYJMFNgQMLh
 kkAeB6rTfq60w92shIxwpOK11w8+X+94l0fgvpKF0Bw4UrFEl8gCgZWq+mQHl81jR3ok
 ced8O1sLSEtBdXZFtxfIXG23X8KrCR0MBad8B8IhggdwxSC5izQpiSHIOtd0Y8piDpKl
 Arsg==
X-Gm-Message-State: AOAM532CkL9aQo2UlYGGZ5dkSrwc0bLAJw7fo3lwrZvgrmP0KUjE7PrB
 f79im93QiQgsWeNqCvGpnsPNHC2/kj2EzulUEGYoQ4lp8Rr1E8SjGg1k6lLiX106XfddIk57u4V
 KoTPfWuRxlxM7PRk=
X-Received: by 2002:adf:d08d:: with SMTP id y13mr4093499wrh.156.1632389661506; 
 Thu, 23 Sep 2021 02:34:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv3JSNh7lOWhb1RFyFbHn6JbOKMLzrK9BEMhY1gepiWSvjtZiSYBJPgZjr7JF8g6rgwN5J8A==
X-Received: by 2002:adf:d08d:: with SMTP id y13mr4093469wrh.156.1632389661259; 
 Thu, 23 Sep 2021 02:34:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f19sm4558154wmf.11.2021.09.23.02.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:34:20 -0700 (PDT)
Message-ID: <2235e846-cfd6-6c67-1e03-dd1ecc38d198@redhat.com>
Date: Thu, 23 Sep 2021 11:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
 <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
 <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 21:46, Willian Rampazzo wrote:
> On Wed, Sep 22, 2021 at 4:08 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> On 9/22/21 21:03, Willian Rampazzo wrote:
>>> Add the possibility of running all the tests from a single file, or
>>> multiple files, running a single test within a file or multiple tests
>>> within multiple files using `make check-acceptance` and the TESTFILES
>>> environment variable.
>>>
>>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>>> ---
>>>    docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
>>>    tests/Makefile.include |  5 ++++-
>>>    2 files changed, 31 insertions(+), 1 deletion(-)
>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 6e16c05f10..82d7ef7a20 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>>>    TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>>>    TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
>>>    TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>>> +ifndef TESTFILES
>>> +     TESTFILES=tests/acceptance
>>> +endif
>>>    # Controls the output generated by Avocado when running tests.
>>>    # Any number of command separated loggers are accepted.  For more
>>>    # information please refer to "avocado --help".
>>> @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>>                --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>>>                --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
>>>                $(AVOCADO_TAGS) \
>>> -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>>> +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
>>
>> Since this is Avocado specific, maybe call the variable
>> AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?
> 
> I don't see a problem with changing that to AVOCADO_TESTFILES. I was
> trying to make things shorter and easy to remember. If the too-long
> variable name is not a problem, I can change that.

This is the generic tests/Makefile, so $TESTFILES might be confusing,
which is why I prefer the explicit AVOCADO_ prefix (AVOCADO_SHOW,
AVOCADO_TAGS).

Thomas, do you have a preference?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


