Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6413B751D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:25:16 +0200 (CEST)
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFbv-0000Uc-3F
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyFaU-0008DD-D9
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyFaS-0002QZ-4j
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624980223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3RLD1AsBzPKIl1CDnxg2LoLJTxHgT3eIPApR1ljLyk=;
 b=MAuF6dz0oXVGPMktxSeJ3AQ1oFSoazI4DleLi7fA29GJtIpr7jM7Rut/gt2BpyL3livv0z
 +Zd4M0v3FwVgTiBFoyAgleb3/jD+/m0Winam6sEqRxyBr/dueVrC3bZfyRNRGWIfRJD0+a
 cZtPMfTS1vK9iADskpZEsjsi6RTcrdE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-qIm_BHARP9adi54FYIHSSg-1; Tue, 29 Jun 2021 11:23:28 -0400
X-MC-Unique: qIm_BHARP9adi54FYIHSSg-1
Received: by mail-qk1-f198.google.com with SMTP id
 b125-20020a3799830000b02903ad1e638ccaso21024983qke.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=N3RLD1AsBzPKIl1CDnxg2LoLJTxHgT3eIPApR1ljLyk=;
 b=G2AVosxShy+ehFXrX1feaEwGyId6G9J8hLehIwq3xbbziGzvQ5QmHGb0PLi9DC368k
 tGHcFR383Rt8oEvc7rSfL8rhiAetOvJl26WCLsDcZ+VwQEJ0sHozrKD/H0gw9I2Wj26H
 OH/UJfbqoBr3xJ43xHbxisZ3ESdmkFpTazuU5oEF0wjgxmMEQuPswNxYfN+eTLJKyPLP
 Oo8GZ43dzXyva4YFqL5LamOLCn6SWmoj8WvS06hwo2scEvVKTYcZ12AGZxBaoP7V8B0N
 wo6RHsvuU/b9aVQVn9miu6mdNMHqv3U77CaOhfalmoI86LHGflN6OX4FllS+P8enTzeV
 9N9w==
X-Gm-Message-State: AOAM531gjLlzY3JLQLaAOWnE+udP5SZDmiFVnmL+AKWLoLcNeTnzHfK9
 U7prpyLLOPdzavdpLib3sMbnP23kLnz8aN9XecIlaFRLbjjLXKRshvN2O6iQXfQzq/vb5+sUMKT
 hy2bJTSvBX5JZGrg=
X-Received: by 2002:ad4:580c:: with SMTP id dd12mr31404750qvb.2.1624980208611; 
 Tue, 29 Jun 2021 08:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw98MGXiXf7ixgzMmWOePb1V8E138A+jU6sN45g3JBLgyBWXvzpAzkUdzS6ca89sdIqX5ziQA==
X-Received: by 2002:ad4:580c:: with SMTP id dd12mr31404727qvb.2.1624980208434; 
 Tue, 29 Jun 2021 08:23:28 -0700 (PDT)
Received: from ?IPv6:2601:18d:8a00:ab70:b677:d979:630:695c?
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id n12sm9669440qtl.14.2021.06.29.08.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 08:23:27 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Willian Rampazzo <wrampazz@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
 <CAKJDGDZaHshf_1VhKNg4Su94Au+sQznTpvpskHChtN+HzEYkqg@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <3acdbdb0-a787-d0b7-6403-ca8acca19111@redhat.com>
Date: Tue, 29 Jun 2021 11:23:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZaHshf_1VhKNg4Su94Au+sQznTpvpskHChtN+HzEYkqg@mail.gmail.com>
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
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/9/21 12:13 PM, Willian Rampazzo wrote:
> On Tue, Jun 8, 2021 at 3:48 PM Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
>> Hi,
>>
>> On 6/8/21 12:14 AM, Cleber Rosa wrote:
>>> To run basic jobs on custom runners, the environment needs to be
>>> properly set up.  The most common requirement is having the right
>>> packages installed.
>>>
>>> The playbook introduced here covers the QEMU's project s390x and
>>> aarch64 machines.  At the time this is being proposed, those machines
>>> have already had this playbook applied to them.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    docs/devel/ci.rst                      | 30 ++++++++
>>>    scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>>>    scripts/ci/setup/inventory.template    |  1 +
>>>    3 files changed, 129 insertions(+)
>>>    create mode 100644 scripts/ci/setup/build-environment.yml
>>>    create mode 100644 scripts/ci/setup/inventory.template
>>>
>>> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>>> index 585b7bf4b8..35c6b5e269 100644
>>> --- a/docs/devel/ci.rst
>>> +++ b/docs/devel/ci.rst
>>> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>>>    The GitLab CI jobs definition for the custom runners are located under::
>>>
>>>      .gitlab-ci.d/custom-runners.yml
>>> +
>>> +Machine Setup Howto
>>> +-------------------
>>> +
>>> +For all Linux based systems, the setup can be mostly automated by the
>>> +execution of two Ansible playbooks.  Create an ``inventory`` file
>>> +under ``scripts/ci/setup``, such as this::
>> Missing to mention the template file.
>>> +
>>> +  fully.qualified.domain
>>> +  other.machine.hostname
>>> +
>>> +You may need to set some variables in the inventory file itself.  One
>>> +very common need is to tell Ansible to use a Python 3 interpreter on
>>> +those hosts.  This would look like::
>>> +
>>> +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
>>> +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
>>> +
>>> +Build environment
>>> +~~~~~~~~~~~~~~~~~
>>> +
>>> +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>>> +set up machines with the environment needed to perform builds and run
>>> +QEMU tests.  It covers a number of different Linux distributions and
>>> +FreeBSD.
>>> +
>>> +To run the playbook, execute::
>>> +
>>> +  cd scripts/ci/setup
>>> +  ansible-playbook -i inventory build-environment.yml
>>> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
>>> new file mode 100644
>>> index 0000000000..664f2f0519
>>> --- /dev/null
>>> +++ b/scripts/ci/setup/build-environment.yml
>>> @@ -0,0 +1,98 @@
>>> +---
>>> +- name: Installation of basic packages to build QEMU
>>> +  hosts: all
>> You will need to "become: yes" if the login user is not privileged, right?
>>
>> Or mention on the documentation how the user should configure the
>> connection for privileged login.
> As this will vary from system to system, I think it is worth
> mentioning in the documentation it can be configured in the inventory
> file, adding the variable ansible_become=yes and
> ansible_become_password= if password is needed to sudo.
>
Agreed.  But I'll put a mention to the ansible-playbook command line 
options instead. I believe our savvy users will be able to decide 
whether to use the command line options, the inventory options, or even 
temporary changes to the playbook.


Thanks!

- Cleber.


