Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99C3B7AB6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 01:32:18 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNDF-00061k-Al
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 19:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNBl-0004si-6o
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyNBh-0001iG-1h
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625009439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE7V+H2ZS2h4FZF7Kuw+GhDYyW9IgoPlkY2mz7pguVs=;
 b=PE21KLQw/UJyqzAR1tn1h9Ytzy1f7NwqOxfI4Yl36fgc/ZhJrCsP7QQuhhKo8QjnWrJpP+
 pzEME2WGiqQB76cISn5MIfHRt0KqAIGzRv/oMSf3ofkPLp652rNXLVGJ7KmYiGrS4Xxyi7
 0pt4SOwWI1HEviFCKeoFVcrnESblp0Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-B2z70sLSPlCgV6rWzIGIig-1; Tue, 29 Jun 2021 19:30:38 -0400
X-MC-Unique: B2z70sLSPlCgV6rWzIGIig-1
Received: by mail-qk1-f198.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso295567qkb.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 16:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YE7V+H2ZS2h4FZF7Kuw+GhDYyW9IgoPlkY2mz7pguVs=;
 b=D2fDmYMH+T+dwl0AMs0+SbMVdE0qOJHo1Fkkvvhp0zohEGHN5g6BdpFNvd5L10MW/I
 2Gf9P+RyS2S6tBGMiy7PW9LwNthrczz9sfmrVm8UK5MRuQSKu9SvijtYHQhQlc5rN75p
 hRBMCzZyaMF8EiTvjWiFwpHsNMCSDPg+cg+/WDsruQtDrWJ7/DRVzXr2IxOukBt9fNll
 cRTC7LqhZ3wRELH2GoYkHXaSiHZcb6avkaSfFXZ9gGAO5soHNGQ7CkG3f747j/zfhlnj
 Fz+8+hznm9fbjio4luvazIZTgHa9D2Zq3LRnVcujSkDvlL3NfYgLZ9y8096+G80Iy56K
 HJFQ==
X-Gm-Message-State: AOAM533y5FgThNAVoALLKa0wdG0iqN3tHbwUp84t6BiCHAe4UfrHvccN
 UZIa+LYUKa7LIfzkXy07hhoPwHHc2kJhnCJJPA1vye5IMwx0vD4k/fzXVgKAzT1Kw7FthqoeSr1
 HwF0c3NjnCxJF/SA=
X-Received: by 2002:a37:3c5:: with SMTP id 188mr14853517qkd.201.1625009437636; 
 Tue, 29 Jun 2021 16:30:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydyDpO4k69GeBIVoAmsjcirWtdtY8wDuwWazZpqpeGDrUah40I9fUHrOBt9nB1aOYj/vp4Qw==
X-Received: by 2002:a37:3c5:: with SMTP id 188mr14853423qkd.201.1625009436637; 
 Tue, 29 Jun 2021 16:30:36 -0700 (PDT)
Received: from ?IPv6:2601:18d:8a00:ab70:b677:d979:630:695c?
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id d21sm1245599qkl.42.2021.06.29.16.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 16:30:36 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <d325e4a5-3785-2a7f-6d3b-dcfbbb9e3faa@redhat.com>
Date: Tue, 29 Jun 2021 19:30:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDa2Xpjnvds2F5NeKAimHCFm0ceWKRGrhidObnpOr7pC7A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/9/21 1:16 PM, Willian Rampazzo wrote:
> On Tue, Jun 8, 2021 at 12:14 AM Cleber Rosa <crosa@redhat.com> wrote:
>> To run basic jobs on custom runners, the environment needs to be
>> properly set up.  The most common requirement is having the right
>> packages installed.
>>
>> The playbook introduced here covers the QEMU's project s390x and
>> aarch64 machines.  At the time this is being proposed, those machines
>> have already had this playbook applied to them.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   docs/devel/ci.rst                      | 30 ++++++++
>>   scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>>   scripts/ci/setup/inventory.template    |  1 +
>>   3 files changed, 129 insertions(+)
>>   create mode 100644 scripts/ci/setup/build-environment.yml
>>   create mode 100644 scripts/ci/setup/inventory.template
>>
>> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> index 585b7bf4b8..35c6b5e269 100644
>> --- a/docs/devel/ci.rst
>> +++ b/docs/devel/ci.rst
>> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>>   The GitLab CI jobs definition for the custom runners are located under::
>>
>>     .gitlab-ci.d/custom-runners.yml
>> +
>> +Machine Setup Howto
>> +-------------------
>> +
>> +For all Linux based systems, the setup can be mostly automated by the
>> +execution of two Ansible playbooks.  Create an ``inventory`` file
>> +under ``scripts/ci/setup``, such as this::
>> +
>> +  fully.qualified.domain
>> +  other.machine.hostname
>> +
>> +You may need to set some variables in the inventory file itself.  One
>> +very common need is to tell Ansible to use a Python 3 interpreter on
>> +those hosts.  This would look like::
>> +
>> +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
>> +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
>> +
> As I mentioned to Wainer, my suggestion is to include a comment about
> ansible_become=yes and
> ansible_become_password= variables as some systems may need it.


OK.  I mentioned in a previous reply that I'll plan to do this slightly 
different, that is, to mention the ansible-playbook command line 
options.  Let me know if that works for you.


>> +Build environment
>> +~~~~~~~~~~~~~~~~~
>> +
>> +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>> +set up machines with the environment needed to perform builds and run
>> +QEMU tests.  It covers a number of different Linux distributions and
>> +FreeBSD.
>> +
>> +To run the playbook, execute::
>> +
>> +  cd scripts/ci/setup
>> +  ansible-playbook -i inventory build-environment.yml
>> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
>> new file mode 100644
>> index 0000000000..664f2f0519
>> --- /dev/null
>> +++ b/scripts/ci/setup/build-environment.yml
>> @@ -0,0 +1,98 @@
>> +---
>> +- name: Installation of basic packages to build QEMU
>> +  hosts: all
>> +  tasks:
>> +    - name: Update apt cache
>> +      apt:
>> +        update_cache: yes
> On a freshly installed Ubuntu 20.04, the script failed for me with
> dependency messages on the apt side. After I updated the packages on
> the system, the playbook worked without problems.


I know it's too late now, but it would have been helpful to document the 
exact error, at the very least here in this thread. I tried to replicate 
with an also fresh install, but resulted in:


PLAY RECAP 
**************************************************************************************************************************************
192.168.122.19             : ok=6    changed=4    unreachable=0 
failed=0    skipped=1    rescued=0    ignored=0


A second run resulted in:

PLAY [Installation of basic packages to build QEMU] 
*********************************************************************************************

TASK [Gathering Facts] 
**************************************************************************************************************************
ok: [192.168.122.19]

TASK [Check for suitable ansible version] 
*******************************************************************************************************
ok: [192.168.122.19] => {
     "changed": false,
     "msg": "All assertions passed"
}

TASK [Update apt cache] 
*************************************************************************************************************************
ok: [192.168.122.19]

TASK [Install basic packages to build QEMU on Ubuntu 18.04/20.04] 
*******************************************************************************
ok: [192.168.122.19]

TASK [Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x] 
************************************************************************
ok: [192.168.122.19]

TASK [Install basic packages to build QEMU on Ubuntu 18.04] 
*************************************************************************************
skipping: [192.168.122.19]

TASK [Install basic packages to build QEMU on Ubuntu 20.04] 
*************************************************************************************
ok: [192.168.122.19]

PLAY RECAP 
**************************************************************************************************************************************
192.168.122.19             : ok=6    changed=0    unreachable=0 
failed=0    skipped=1    rescued=0    ignored=0


> So, my suggestion is to add the "update = yes" here, or add a note in
> the documentation asking the user to update the system before running
> the playbook.


IIUC, you mean an "upgrade: yes" on the "Update apt cache" task, right?  
Something like:


-    - name: Update apt cache
+    - name: Update apt cache / upgrade packages via apt
        apt:
          update_cache: yes
+        upgrade: yes

I have mixed feelings about going beyond installing/updating the 
packages we care about.  On one hand, it's a good sysadmin practice, but 
on the other hand, development/test machines are sometimes peculiar.  
Since you and Erik are in favor of the updates, I'll change that and 
wait for feedback on v7.


So, besides the change to the playbook, I'm adding to the docs:


The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
set up machines with the environment needed to perform builds and run
QEMU tests.  This playbook consists on the installation of various
required packages (and a general package update while at it).  It
currently covers a number of different Linux distributions, but it can
be expanded to cover other systems.


> Except for the above comment and Wainer's comments, it looks good to
> me. With these changes:
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>
>

Thanks for the review and test!  Given the amount of changes, I'll hold 
a bit to take you Rb/Tb until you see/test v7.

Thanks again!

- Cleber



