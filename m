Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C1219D42
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 12:14:16 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtTZH-0007to-BF
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 06:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtTYP-0007Av-3r
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 06:13:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26943
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jtTYM-0006Fj-Vh
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 06:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594289598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lvcisaynRGNr5AQMGm7L9LBQKyY4/DMGWtzTAgWfiII=;
 b=OjSKXPEFpcF7NN5+883NSJrPxqu0abCyxIOHGGWXrlEzH/DGr3PqjMsnJWOYXQobt117Qq
 ADjY1LjIYnLFSZ7mthv7hksrK4JStAzNi7mSglqupX4GlPK88dS4FfLHMSAwlRjpqKQjtq
 ackeMLGKR3M+UcRHSk8HdkOSDGxpURc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-32fLnYqINi-ycwflkdqx5w-1; Thu, 09 Jul 2020 06:13:14 -0400
X-MC-Unique: 32fLnYqINi-ycwflkdqx5w-1
Received: by mail-wm1-f70.google.com with SMTP id v11so1818646wmb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 03:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lvcisaynRGNr5AQMGm7L9LBQKyY4/DMGWtzTAgWfiII=;
 b=ItSrmvD3AmYg78MLFQUqOqQTYWdZXpovxfoSPQAM9/FtjtO6VAFnoFkDpVB2nGUONk
 kOs+0gfcNhLmWzNdZ71W9uPfsuOfLP2E5loUkpZaLoSn7+W0oxT9RjvqL71P14LrPSRT
 XLJG7wsyw7SgGyt0depBDxc+HDMsUOtpQzT1MOEvu3vNHwPv/cbPzhb2Xm383cH+yXaP
 SOTpXI/+DxFxUEw4E4J5CnqB+vsmWQQN9Gs/lkeq636IWf/XL2S1iVSTHIVDUFbjajhs
 W6SkOKoywDbfwWSlU3Z0/nFddsb2iN5GWQCEjcOofLE7AA1Esxj1GRQBiuhKyeZRQwJ5
 Baiw==
X-Gm-Message-State: AOAM533fp5AgqUhMHDaZ0vpxpkQqUly0w4FRcRt402LihtiDZJ2qbfA4
 9bW7068/ajl2PKDUwVQrenVOKGB0xTtBWNYt/M3FWKDba1E/QhkoWsRgY7gpE3W2Z6/Da6pvXNV
 uNDcARGVExNLKnf8=
X-Received: by 2002:a05:6000:1182:: with SMTP id
 g2mr58495444wrx.44.1594289593290; 
 Thu, 09 Jul 2020 03:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl4IoFw/6+Eb7cvHCR9uEOmAXxgbQdYvoaJuNLsHDj0cUK8JJAWNnANrAGEjvg8YpqXKgDxQ==
X-Received: by 2002:a05:6000:1182:: with SMTP id
 g2mr58495409wrx.44.1594289593010; 
 Thu, 09 Jul 2020 03:13:13 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id p4sm5279853wrx.63.2020.07.09.03.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:13:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] GitLab Gating CI: introduce pipeline-status
 contrib script
To: Erik Skultety <eskultet@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20200709024657.2500558-1-crosa@redhat.com>
 <20200709024657.2500558-2-crosa@redhat.com>
 <20200709085519.GB536480@nautilus.usersys.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <538bde71-5e96-e56d-cbcd-44cf0942590e@redhat.com>
Date: Thu, 9 Jul 2020 12:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200709085519.GB536480@nautilus.usersys.redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 04:33:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/20 10:55 AM, Erik Skultety wrote:
> On Wed, Jul 08, 2020 at 10:46:56PM -0400, Cleber Rosa wrote:
>> This script is intended to be used right after a push to a branch.
>>
>> By default, it will look for the pipeline associated with the commit
>> that is the HEAD of the *local* staging branch.  It can be used as a
>> one time check, or with the `--wait` option to wait until the pipeline
>> completes.
>>
>> If the pipeline is successful, then a merge of the staging branch into
>> the master branch should be the next step.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  scripts/ci/gitlab-pipeline-status | 156 ++++++++++++++++++++++++++++++
>>  1 file changed, 156 insertions(+)
>>  create mode 100755 scripts/ci/gitlab-pipeline-status
>>
>> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
>> new file mode 100755
>> index 0000000000..4a9de39872
>> --- /dev/null
>> +++ b/scripts/ci/gitlab-pipeline-status
>> @@ -0,0 +1,156 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) 2019-2020 Red Hat, Inc.
>> +#
>> +# Author:
>> +#  Cleber Rosa <crosa@redhat.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +"""
>> +Checks the GitLab pipeline status for a given commit commit
> 
> s/commit$/(hash|sha|ID|)
> 
>> +"""
>> +
>> +# pylint: disable=C0103
>> +
>> +import argparse
>> +import http.client
>> +import json
>> +import os
>> +import subprocess
>> +import time
>> +import sys
>> +
>> +
>> +def get_local_staging_branch_commit():
>> +    """
>> +    Returns the commit sha1 for the *local* branch named "staging"
>> +    """
>> +    result = subprocess.run(['git', 'rev-parse', 'staging'],
> 
> If one day Peter decides that "staging" is not a cool name anymore and use a
> different name for the branch :) we should account for that and make it a
> variable, possibly even parametrize this function with it.

This script can be used by any fork, not only Peter.
So having a parameter (default to 'staging') is a requisite IMO.

>> +                            stdin=subprocess.DEVNULL,
>> +                            stdout=subprocess.PIPE,
>> +                            stderr=subprocess.DEVNULL,
>> +                            cwd=os.path.dirname(__file__),
>> +                            universal_newlines=True).stdout.strip()
>> +    if result == 'staging':
>> +        raise ValueError("There's no local staging branch")
> 
> "There's no local branch named 'staging'" would IMO be more descriptive, so as
> not to confuse it with staging in git.
> 
>> +    if len(result) != 40:
>> +        raise ValueError("Branch staging HEAD doesn't look like a sha1")
>> +    return result
>> +
>> +
>> +def get_pipeline_status(project_id, commit_sha1):
>> +    """
>> +    Returns the JSON content of the pipeline status API response
>> +    """
>> +    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
>> +                                                        commit_sha1)
>> +    connection = http.client.HTTPSConnection('gitlab.com')
>> +    connection.request('GET', url=url)
>> +    response = connection.getresponse()
>> +    if response.code != http.HTTPStatus.OK:
>> +        raise ValueError("Failed to receive a successful response")
>> +    json_response = json.loads(response.read())
> 
> a blank line separating the commentary block would slightly help readability
> 
>> +    # afaict, there should one one pipeline for the same project + commit
> 
> s/one one/be only one/

'afaict' is not a word.

> 
>> +    # if this assumption is false, we can add further filters to the
>> +    # url, such as username, and order_by.
>> +    if not json_response:
>> +        raise ValueError("No pipeline found")
>> +    return json_response[0]
>> +
>> +
>> +def wait_on_pipeline_success(timeout, interval,
>> +                             project_id, commit_sha):
>> +    """
>> +    Waits for the pipeline to end up to the timeout given
> 
> "Waits for the pipeline to finish within the given timeout"
> 
>> +    """
>> +    start = time.time()
>> +    while True:
>> +        if time.time() >= (start + timeout):
>> +            print("Waiting on the pipeline success timed out")
> 
> s/success//
> (the pipeline doesn't always have to finish with success)
> 
>> +            return False
>> +
>> +        status = get_pipeline_status(project_id, commit_sha)
>> +        if status['status'] == 'running':
>> +            time.sleep(interval)
>> +            print('running...')

If we want to automate the use of this script by a daemon, it would
be better to use the logging class. Then maybe 'running...' is for
the DEBUG level, Other print() calls can be updated to WARN/INFO
levels.

>> +            continue
>> +
>> +        if status['status'] == 'success':
>> +            return True
>> +
>> +        msg = "Pipeline ended unsuccessfully, check: %s" % status['web_url']
> 
> I think more common expression is "Pipeline failed"
> 
>> +        print(msg)
>> +        return False
>> +
> ...
> 
> Code-wise looks OK to me, but since I don't know what Peter's requirements
> on/expectations of this script are, I can't do a more thorough review.
> 
> Regards,
> Erik
> 


