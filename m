Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061F3A0137
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:07:42 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqh4f-0002nu-A8
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqh1b-0008Jy-Vi
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqh1X-0006WE-NO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623179067;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7T/tfb3WB7Cz31gF14tnGz2KA+6gqitQxqCgcS6bX4=;
 b=WQu3OlXFlAteKdUJG4cG4eVENCekRRx19YQ9CMR/W2XBKPCWE+fvjLwi6nyd2ZeJKXuRYb
 +pzoljFCBVPETOBQRaeFuarRCUd+VmDM3JF8slT+XhDOtmGOBzRjFhDsKC+o+9UUYOvqn7
 OWjHkZEBx4VTCqMKyZZO0lkDfnGUY6I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-s1L7ntuBM_Kl-QKAPk1e0A-1; Tue, 08 Jun 2021 15:04:24 -0400
X-MC-Unique: s1L7ntuBM_Kl-QKAPk1e0A-1
Received: by mail-qk1-f199.google.com with SMTP id
 n3-20020a378b030000b02903a624ca95adso15652007qkd.17
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=l7T/tfb3WB7Cz31gF14tnGz2KA+6gqitQxqCgcS6bX4=;
 b=D0gn9xGkl47oPXJ2jQbsXOwF3czla9Gb7GanL1Jiv+UGzmkj0ca1N+gOH1jOq4nBb2
 xdYWPjcx53hyoekjQl82vU9dEwskU3tXpbbPyhdvzbAw0LqGUT8tg/IF7dIpN7e5eHp3
 v1sOn6XunAWbHMZJsqMRXMV7ut7Cpxcm6kSd1AWFDV8wY8XgzGSuC36x85+oEWUZEsHh
 nkgYS2dg0J/E+oeBiAtbyAtPvcMJt08CjV8nYQDl078/GYnOPX5a2jECYKRt/NgLbAxB
 4giJSEgFeFkm4CJAxR5Sr7gWF5kwVFNvrQrLH26MzieKlI7LV23YPRJjL3O4IrhkZV0Y
 /F/g==
X-Gm-Message-State: AOAM533ELvQZoxCNSlv3xUpmCvXEWwnGAL/NKhMHa0uoKidYk5X9qIWg
 igpxW+JjcCWFIi9EaLx1pAd8NVTZUFmmpzJ9YVjAA5BOO+xDLYIj08pfb0XeVeMMds9e6CDANMq
 OXBmr0jXpQfLzvH4=
X-Received: by 2002:a05:6214:e4d:: with SMTP id
 o13mr1823080qvc.19.1623179064240; 
 Tue, 08 Jun 2021 12:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDEfDzLgmsggx4flhwz2XhCnsD6btN2itmNCVYQ7BEOfr4eav9KVxnqcu5hioBxOnFhGCYyA==
X-Received: by 2002:a05:6214:e4d:: with SMTP id
 o13mr1823043qvc.19.1623179063917; 
 Tue, 08 Jun 2021 12:04:23 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id m126sm9477520qke.16.2021.06.08.12.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:04:23 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4a79972b-9fe3-cb1b-6bd0-0b73f3797dbc@redhat.com>
Date: Tue, 8 Jun 2021 16:04:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/8/21 12:14 AM, Cleber Rosa wrote:
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
>
> The playbook introduced here covers the Linux distributions and
> has been primarily tested on OS/machines that the QEMU project
> has available to act as runners, namely:
>
>   * Ubuntu 20.04 on aarch64
>   * Ubuntu 18.04 on s390x
>
> But, it should work on all other Linux distributions.  Earlier
> versions were tested on FreeBSD too, so chances of success are
> high.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
>   scripts/ci/setup/.gitignore        |  1 +
>   scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
>   scripts/ci/setup/vars.yml.template | 12 ++++++
>   4 files changed, 131 insertions(+)
>   create mode 100644 scripts/ci/setup/.gitignore
>   create mode 100644 scripts/ci/setup/gitlab-runner.yml
>   create mode 100644 scripts/ci/setup/vars.yml.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 35c6b5e269..bbd89e54d7 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -56,3 +56,60 @@ To run the playbook, execute::
>   
>     cd scripts/ci/setup
>     ansible-playbook -i inventory build-environment.yml
> +
> +gitlab-runner setup and registration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The gitlab-runner agent needs to be installed on each machine that
> +will run jobs.  The association between a machine and a GitLab project
> +happens with a registration token.  To find the registration token for
> +your repository/project, navigate on GitLab's web UI to:
> +
> + * Settings (the gears like icon), then
> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * Under "Set up a specific Runner manually", look for the value under
> +   "Use the following registration token during setup"
> +
> +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> +``scripts/ci/setup/vars.yml``.  Then, set the
> +``gitlab_runner_registration_token`` variable to the value obtained
> +earlier.
> +
> +.. note:: gitlab-runner is not available from the standard location
> +          for all OS and architectures combinations.  For some systems,
> +          a custom build may be necessary.  Some builds are avaiable
> +          at https://cleber.fedorapeople.org/gitlab-runner/ and this
> +          URI may be used as a value on ``vars.yml``
I think you can remove the information about the gitlab-running being 
not available for some systems.
> +
> +To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory gitlab-runner.yml
> +
> +Following the registration, it's necessary to configure the runner tags,
> +and optionally other configurations on the GitLab UI.  Navigate to:
> +
> + * Settings (the gears like icon), then
> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * "Runners activated for this project", then
> + * Click on the "Edit" icon (next to the "Lock" Icon)
> +
> +Under tags, add values matching the jobs a runner should run.  For a
> +Ubuntu 20.04 aarch64 system, the tags should be set as::
> +
> +  ubuntu_20.04,aarch64

Also users no longer need manually create the tags.

Remaining of the file looks good to me.

> +
> +Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
> +would contain::
> +
> +  ubuntu-20.04-aarch64-all:
> +   tags:
> +   - ubuntu_20.04
> +   - aarch64
> +
> +It's also recommended to:
> +
> + * increase the "Maximum job timeout" to something like ``2h``
> + * give it a better Description
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..f112d05dd0
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1 @@
> +vars.yml
> \ No newline at end of file
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> new file mode 100644
> index 0000000000..98dab92bb5
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,61 @@
> +---
> +- name: Installation of gitlab-runner
> +  hosts: all
> +  vars_files:
> +    - vars.yml
> +  tasks:
> +    - debug:
> +        msg: 'Checking for a valid GitLab registration token'
> +      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
> +
> +    - name: Create a group for the gitlab-runner service
> +      group:
> +        name: gitlab-runner
> +
> +    - name: Create a user for the gitlab-runner service
> +      user:
> +        user: gitlab-runner
> +        group: gitlab-runner
> +        comment: GitLab Runner
> +        home: /home/gitlab-runner
> +        shell: /bin/bash
> +
> +    - name: Remove the .bash_logout file when on Ubuntu systems
> +      file:
> +        path: /home/gitlab-runner/.bash_logout
> +        state: absent
> +      when: "ansible_facts['distribution'] == 'Ubuntu'"
> +
> +    - name: Set the Operating System for gitlab-runner
> +      set_fact:
> +        gitlab_runner_os: "{{ ansible_facts[\"system\"]|lower }}"
> +    - debug:
> +        msg: gitlab-runner OS is {{ gitlab_runner_os }}
> +
> +    - name: Set the architecture for gitlab-runner
> +      set_fact:
> +        gitlab_runner_arch: "{{ ansible_to_gitlab_arch[ansible_facts[\"architecture\"]] }}"
> +    - debug:
> +        msg: gitlab-runner arch is {{ gitlab_runner_arch }}
> +
> +    - name: Download the matching gitlab-runner
> +      get_url:
> +        dest: /usr/local/bin/gitlab-runner
> +        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
> +        owner: gitlab-runner
> +        group: gitlab-runner
> +        mode: u=rwx,g=rwx,o=rx
> +
> +    - name: Register the gitlab-runner
> +      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
> +
> +    - name: Install the gitlab-runner service using its own functionality
> +      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
> +      register: gitlab_runner_install_service_result
> +      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
> +
> +    - name: Enable the gitlab-runner service
> +      service:
> +        name: gitlab-runner
> +        state: started
> +        enabled: yes
> diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
> new file mode 100644
> index 0000000000..e48089761f
> --- /dev/null
> +++ b/scripts/ci/setup/vars.yml.template
> @@ -0,0 +1,12 @@
> +# The version of the gitlab-runner to use
> +gitlab_runner_version: 13.12.0
> +# The URL of the gitlab server to use, usually https://gitlab.com unless you're
> +# using a private GitLab instance
> +gitlab_runner_server_url: https://gitlab.com
> +# A mapping of the ansible to gitlab architecture nomenclature
> +ansible_to_gitlab_arch:
> +  x86_64: amd64
> +  aarch64: arm64
> +  s390x: s390x
> +# A unique token made available by GitLab to your project for registering runners
> +gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN


