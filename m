Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8909419997
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:47:22 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtmj-0005Op-Tu
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtiH-0001BQ-1Y
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:42:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtiF-00036b-7a
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632760962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2//PmnwKUH7fJhJNHKFGsLIYiCcfX8LDAffJ5nfPLYI=;
 b=QqPxOWUDBRGQBOvPO9i29OhkqsR0mTKGXeVup5e9boBC2iTfgtNMMOXeX42S4y1o9c2qAK
 utUAyzcawKaXsYv6NvJsTQPivKypY9GbeCWdl/HSoFufCUOy1t4RQiEKqK0Rjo6tZ3a8Wu
 WWe5Xmk+yqEEQ6j/X1lFHlnaMy4GJ7A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-05cexMkRPNK7Gypb4g7h9w-1; Mon, 27 Sep 2021 12:42:40 -0400
X-MC-Unique: 05cexMkRPNK7Gypb4g7h9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so14263575wrt.21
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2//PmnwKUH7fJhJNHKFGsLIYiCcfX8LDAffJ5nfPLYI=;
 b=HOfiETP4ES+8CEoF2SroFFILYIucFqrVpXdw4iLOmxErdoGg4EVs9Q6CkfJGQ6up1o
 UAEpNlFn3bc9UuQvF0iFlokkqIFjmPK7SZh9XjxqHQjuC3HMqdmqc+QqyeZwl9wQ0p03
 ZAZfFxnng2XMJH9Wj4tKCVwCiykbgsuU5TXtOfxjK8ldC/mRnaABEL++Gqh7QnR52jpO
 J4IrRAquzgPA+N3ApF6EOAA0ksX5REY9ZYyQ+27TBVGxYkOGko7x9a98BVa1GFXRPxf6
 sbIISbGSZZeGK0LYSKFedKN2eEJe4zjFJKgKHGiOac+oKDRIrCf4Jy9t8U42NmLXcU/O
 42qw==
X-Gm-Message-State: AOAM5317fRb7J4dHNs6le+aXsspeTeMgSFfZJdcEd8ys/LBuKCoCVoWs
 4QEmTNuzljUTRnC3oNQSjqdspnOrfSFIgI1SRSpJbwNILW47nCrl+6gXoJO58OWBeTDzu+Xe72F
 NOI4BekT+7klwd+s=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr64831wme.32.1632760959373;
 Mon, 27 Sep 2021 09:42:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2DCBzn38rK8fCSL59OWsKTrSSVCszPzh8UFelOd3a3geP5amwsHrNf7k7f5NwNtsoCPhwrw==
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr64805wme.32.1632760959205;
 Mon, 27 Sep 2021 09:42:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s3sm8654324wrt.54.2021.09.27.09.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:42:38 -0700 (PDT)
Message-ID: <68256059-f7ff-e4f5-e924-2c894e0257a6@redhat.com>
Date: Mon, 27 Sep 2021 18:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/3] tests/Makefile: improvements on make
 check-acceptance
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210923161141.232208-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210923161141.232208-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 18:11, Willian Rampazzo wrote:
> Improve the documentation about how to run a single test within a file
> or all the tests from a file using the standalone avocado command.
> 
> Add a way to run tests based on tags using the `make check-acceptance`
> command.
> 
> Add a way to run specific tests using the `make check-acceptance` command.
> 
> GitLab pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/376122402
> 
> Changes from V2:
>   - Rename the environment variable to AVOCADO_TESTS
>   - Adjust the documentation to mention `make check-venv`
>   - Adjust the documentation to mention `avocado list` command
>   - Add the AVOCADO_TAGS implementation patch to the series.
> 
> Changes from V1:
>   - Rename TESTFILES to AVOCADO_TEST_FILES on patch 2
>   - Add Suggested-by tag on patch 2
> 
> Willian Rampazzo (3):
>   tests/Makefile: allow control over tags during check-acceptance
>   docs/devel/testing: add instruction to run a single acceptance test
>   tests/Makefile: add AVOCADO_TESTS option to make check-acceptance

Thanks, applied to my integration-testing tree.


