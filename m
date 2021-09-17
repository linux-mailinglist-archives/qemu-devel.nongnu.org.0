Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE940F4C1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:26:25 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRA8V-00014F-Ty
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRA78-00080z-AA
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRA75-0008TO-FO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631870694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCCryFqRMYI/G21nbklAoVM6qDB106t64bcJehRVe9o=;
 b=iQa5BzLKy8fOjaODCf9+piVDup3GscEtLwTO8QsFaoOU81G7fIjfLoLv5Mf/UyXgSnfgKH
 SzpOH0dD40biFZXnHbTfa+kaX1DoCJU+pRuVyJ2Mw/po29s75LIunIAnMC75X6KNxeJslq
 2fVBzkcsl3TqHru0mjWN1Xhek/uDiUE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-O1gHXuQoOlGY9ALlZ-8n6g-1; Fri, 17 Sep 2021 05:24:53 -0400
X-MC-Unique: O1gHXuQoOlGY9ALlZ-8n6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 17-20020a05600c029100b00305eac9f29aso1619264wmk.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 02:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HCCryFqRMYI/G21nbklAoVM6qDB106t64bcJehRVe9o=;
 b=vFo4WCrxpMUdJBIo+8zjTKHpy/n5la+Boe5yOELqyuJ0BIZSsGOFJy2OosDjXT4X4d
 dHIr9gfTjjclBw7BWrU/BerN9K3eLdeKi9CFTblGLyRjKEbu5Km1vU6W//1laVKLbkVR
 6zlmWeX770d6il35NZqr3rVlb2FOauCU532RGXFOYW4XAFQmUG3h7WOggQ8Uk6TM9JfG
 30y02CE4lVKfi0SA52+K67eTtqWrGOmE07cWkG8AbVFLZcVWGdYBU8JHAHCXI1OYLTLv
 dlP8Gwerb/oegyFxWB9cGYEUKp31BlwFRcI0T5z+Qp/rzJEI7Tvh3HVkNrUmwfxt6tqV
 DrKA==
X-Gm-Message-State: AOAM530S8VeJ/tjoHmG+tufpHaynVtvGa5450ApUlgWAIQUMIo30p9JD
 GvYkpRE49seOEYew1hTqzxnlK93bmVRfbqMlNLlfDE05yGHdGAo37Vuw06DiAHtKzl3CTYdsGtZ
 F1IbGDiorEGHZR0c=
X-Received: by 2002:a05:600c:4e93:: with SMTP id
 f19mr14149190wmq.185.1631870691911; 
 Fri, 17 Sep 2021 02:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQZ2Dx8AcRn2q5OgQgj8JGbt3FWIOzXXbks4WM/GXqKGcoA4MKEUVVFqRkZfJuACXnsJaKLA==
X-Received: by 2002:a05:600c:4e93:: with SMTP id
 f19mr14149166wmq.185.1631870691681; 
 Fri, 17 Sep 2021 02:24:51 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id u29sm3453824wru.34.2021.09.17.02.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 02:24:51 -0700 (PDT)
Subject: Re: [PATCH v3 06/16] iotests/297: Add get_files() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <bd62cd99-021a-35a0-6167-e3a4a9a24b12@redhat.com>
Date: Fri, 17 Sep 2021 11:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Split out file discovery into its own method to begin separating out the
> "environment setup" and "test execution" phases.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 3e86f788fc..b3a56a3a29 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -21,6 +21,7 @@ import re
>   import shutil
>   import subprocess
>   import sys
> +from typing import List
>   
>   import iotests
>   
> @@ -56,10 +57,15 @@ def is_python_file(filename: str, directory: str = '.') -> bool:
>               return False
>   
>   
> +def get_test_files(directory: str = '.') -> List[str]:
> +    named_test_dir = os.path.join(directory, 'tests')
> +    named_tests = [f"tests/{entry}" for entry in os.listdir(named_test_dir)]
> +    check_tests = set(os.listdir(directory) + named_tests) - set(SKIP_FILES)
> +    return list(filter(lambda f: is_python_file(f, directory), check_tests))

Seeing a filter() makes me immensely happy, but I thought that was 
unpythonic?

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


