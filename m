Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202DD315170
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:22:41 +0100 (CET)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TuZ-0006ii-Ru
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9ToC-0000V2-15
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9To9-0006xQ-EF
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612880160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp3Wl9lSJ5WsVFFBaxBDakrqsSrGMeFnKtzi+ZQ0Psc=;
 b=d1Iumzu6HunCP18SuMqjpAI31tdis9S9Q5dAIj8bTWfQxASclXIcTta93YUO1GfrnZOhm9
 Rof9UtlPpqUFMWJ0thNzoADRktn9YnuLFmroRWIlydULotI0jcgKuAnSz1RDmi1uPvWwpe
 oALIp3RN7d4BgkTnS2W7OWc40M9urS0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4TkZJ1QaOrq_w2fLZPPpQw-1; Tue, 09 Feb 2021 09:15:57 -0500
X-MC-Unique: 4TkZJ1QaOrq_w2fLZPPpQw-1
Received: by mail-ed1-f72.google.com with SMTP id g6so18201235edy.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qp3Wl9lSJ5WsVFFBaxBDakrqsSrGMeFnKtzi+ZQ0Psc=;
 b=taa5z2QmT594pN5vKvG0wYGmUiMo1/PkGAsd4lrIeZ+p68VQP2Cblsl059zmLF0102
 A2TUBVskgqMFwDf5DIVENN8rX3byWasaEk4VbouEaT61PM55eC5IR79C271o62Y7Q/TN
 K694VgalowC6S5rBm4McvaB+eIvcz3V7rRbjZ7lvFQR2YV5iXo90jrPsOZ/cu/Ulh52l
 Lfvu0juR2dv2Kh7Daq8paK2Hg5rSR+8GQWqonDUIPdGCKMMEF8pD80nCy5GJGZ8JjOpJ
 GNozWQxh4BZ4oo8ZA+N6qkWzsuUosCwL1N3vMcpPNyk07D30xv1Z0aWTsE5DuxINLI/a
 Izzw==
X-Gm-Message-State: AOAM530o+7h2+dH3cUj/z0J1GpHoYw2AYXmOmm0Vutw6YjXIW4yzY/Lg
 cPfKIkfDmYRxFD929dIUJiSNypyiMwlMU8nIUTJz3DXmfr4gMcrE5PRMT29n0CRGlpelCMPeEDT
 ArrwZmCyzp7PLcGg=
X-Received: by 2002:a17:906:755:: with SMTP id
 z21mr23200806ejb.514.1612880155718; 
 Tue, 09 Feb 2021 06:15:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIKeEJM5+gsB5MQWLoVUSnsZuCaIumSLqq2pkoxl9PyKqXb+RbDms2RuVz2ulD9eotw34ERA==
X-Received: by 2002:a17:906:755:: with SMTP id
 z21mr23200765ejb.514.1612880155277; 
 Tue, 09 Feb 2021 06:15:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm10553738ejy.123.2021.02.09.06.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 06:15:54 -0800 (PST)
Subject: Re: [PATCH 2/2] travis: remove travis configuration and all
 references to Travis CI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210209135011.1224992-1-berrange@redhat.com>
 <20210209135011.1224992-3-berrange@redhat.com>
 <4e8492ab-9c10-d698-077a-9299b1a5b260@redhat.com>
 <20210209140305.GK1166421@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8f9a2aab-08e0-d45c-edbd-8a39d610ce66@redhat.com>
Date: Tue, 9 Feb 2021 15:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209140305.GK1166421@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 3:03 PM, Daniel P. Berrangé wrote:
> On Tue, Feb 09, 2021 at 02:58:46PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/9/21 2:50 PM, Daniel P. Berrangé wrote:
>>> The Travis CI system QEMU has been using has removed the unlimited free
>>> usage model, replacing it with a one-time only grant of CI minutes that
>>> is not renewed. The QEMU CI jobs quickly exhaust maintainer's free CI
>>> credits, leaving them unable to test with Travis. This is not a
>>> sustainable situation, so we have no choice by to discontinue use of
>>> Travis. GitLab CI is now the primary target, with Cirrus CI filling
>>> in some platform gaps where needed.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>  .travis.yml                        | 439 -----------------------------
>>>  MAINTAINERS                        |   3 -
>>>  configure                          |   1 -
>>>  contrib/gitdm/filetypes.txt        |   2 +-
>>>  scripts/travis/coverage-summary.sh |  27 --
>>>  tests/docker/docker.py             |   2 +-
>>>  tests/qemu-iotests/079             |   2 +-
>>>  tests/test-util-filemonitor.c      |  11 -
>>>  8 files changed, 3 insertions(+), 484 deletions(-)
>>>  delete mode 100644 .travis.yml
>>>  delete mode 100755 scripts/travis/coverage-summary.sh
>> ...
>>
>>> diff --git a/configure b/configure
>>> index 7c496d81fc..058a7c7967 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -4872,7 +4872,6 @@ fi
>>>  ########################################
>>>  # See if __attribute__((alias)) is supported.
>>>  # This false for Xcode 9, but has been remedied for Xcode 10.
>>
>> Not related to this patch, but I don't think Xcode 9 is supported
>> anymore.
>>
>>> -# Unfortunately, travis uses Xcode 9 by default.
>>>  
>>>  attralias=no
>>>  cat > $TMPC << EOF
>>
>>> diff --git a/scripts/travis/coverage-summary.sh b/scripts/travis/coverage-summary.sh
>>> deleted file mode 100755
>>> index d7086cf9ca..0000000000
>>> --- a/scripts/travis/coverage-summary.sh
>>> +++ /dev/null
>>> @@ -1,27 +0,0 @@
>>> -#!/bin/sh
>>> -#
>>> -# Author: Alex Bennée <alex.bennee@linaro.org>
>>> -#
>>> -# Summerise the state of code coverage with gcovr and tweak the output
>>> -# to be more sane on Travis hosts. As we expect to be executed on a
>>> -# throw away CI instance we do spam temp files all over the shop. You
>>> -# most likely don't want to execute this script but just call gcovr
>>> -# directly. See also "make coverage-report"
>>> -#
>>> -# This code is licensed under the GPL version 2 or later.  See
>>> -# the COPYING file in the top-level directory.
>>> -
>>> -# first generate the coverage report
>>> -gcovr -p -o raw-report.txt
>>> -
>>> -# strip the full-path and line markers
>>> -sed s@$PWD\/@@ raw-report.txt | sed s/[0-9]\*[,-]//g > simplified.txt
>>> -
>>> -# reflow lines that got split
>>> -awk '/.[ch]$/ { printf("%s", $0); next } 1' simplified.txt > rejoined.txt
>>> -
>>> -# columnify
>>> -column -t rejoined.txt > final.txt
>>> -
>>> -# and dump, stripping out 0% coverage
>>> -grep -v "0%" final.txt
>>
>> This script can be run on other CI.
>>
>> Keeping scripts/travis/coverage-summary.sh (moved to
>> scripts/ci/coverage-summary.sh):
> 
> I notice that the "gcovr" program used here should be able to output
> an XML document in a format that is supported by GitLab, which can
> then pretty-display the results.

Good idea.

> If we do that, perhaps we won't ned this coverage-summary script
> for post-processing the text output format ?

This indeed requires further testing. I'd worry about that later.

I'll let Alex see how he wants to deal with that, we can still
add the script back later.

> I guess we need to make sure  gcovr is actually installed in all
> our dockerfiles used by gitlab.
> 
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> Regards,
> Daniel
> 


