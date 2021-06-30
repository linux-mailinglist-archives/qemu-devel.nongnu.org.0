Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D623B8A4B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 00:03:48 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyiJ8-00047t-6U
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 18:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyiIF-0003SK-LF
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyiIB-0004oh-Uc
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625090565;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ugp2aaaxdnrf73FNoZpwFLyNUIqBP4ltZ9dIx9rZyjo=;
 b=DxFTQGewi2KZctNWaTuPVXg7yYU094ANhboS3qe7gjo7AREM307K63JknTAAVIIdJDt2Fl
 gQVtEXS45IkaYb6rExhunUj9CCruIpn29EbSKugnmM45C/W/ePNIqrrCNx8NYGav5Xamw9
 5h34aUNZmconhzRhaYb8iNBGGUjeK4c=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-0l3XdQN9OAWpXMo66npfkw-1; Wed, 30 Jun 2021 18:02:43 -0400
X-MC-Unique: 0l3XdQN9OAWpXMo66npfkw-1
Received: by mail-pg1-f200.google.com with SMTP id
 b125-20020a6367830000b0290227fc6e43a5so2595031pgc.18
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 15:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Ugp2aaaxdnrf73FNoZpwFLyNUIqBP4ltZ9dIx9rZyjo=;
 b=WI8I9O5rx0+q+AL3fo801cDNQ37lpKRfHW5kc0DfkUVR7yq61tLqacFSxOBTbCSrLC
 67SYDmXCJMdlYpdT365+p4/NYWB38oi3duAU/XPKAcG+VfolHH7c09Dg2gLkNqw6G94o
 BvDy8LzF5hKq8NcYIMB1fRxFLT7Xj4Jnk9jWd4r+3vsNVshMxBk90934nZAnKJEGiHgR
 FQigJYimH3SMxrNkT+KRL9e74w9b/S1ZgMWOJ3gMpOf0ovQxW4wLMXpQd2Lbf8wQ+v19
 Tj0JVfZyGAc0J0jpILxwZ7vz0O1zdxMtae7Brv8E/+13vJQsqQZrFcDxEe+no0SC4cd6
 pqnw==
X-Gm-Message-State: AOAM5319JB1X3msdr1GtoQNXHhNxdtgGhJt0x7CK7mEW8kcQNndHxZSE
 H+QMbXEai6UamnAkdoQ+1mfXtdQQx0pstNhSDkkWdMSqwbC93KMSPqEH24eEuypcK1mRZ3jUf6w
 aIUReLH4tX5LJo6Y=
X-Received: by 2002:a05:6a00:21c7:b029:2ec:2bfa:d0d1 with SMTP id
 t7-20020a056a0021c7b02902ec2bfad0d1mr37899584pfj.14.1625090562103; 
 Wed, 30 Jun 2021 15:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8P+SM3xrnNahRyRjV9q4FZZUZPkZNrhWtxFUm99CuTcZF756a32iiksbXT86rHn/PtJG/BQ==
X-Received: by 2002:a05:6a00:21c7:b029:2ec:2bfa:d0d1 with SMTP id
 t7-20020a056a0021c7b02902ec2bfad0d1mr37899553pfj.14.1625090561721; 
 Wed, 30 Jun 2021 15:02:41 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id m1sm7984578pjk.35.2021.06.30.15.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 15:02:41 -0700 (PDT)
Subject: Re: [PATCH v7 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-4-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <1a3234fc-31c8-a22d-4c73-ba551b5bdd4c@redhat.com>
Date: Wed, 30 Jun 2021 19:02:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630012619.115262-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 10:26 PM, Cleber Rosa wrote:
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
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   docs/devel/ci.rst                  | 55 +++++++++++++++++++++++
>   scripts/ci/setup/.gitignore        |  2 +-
>   scripts/ci/setup/gitlab-runner.yml | 71 ++++++++++++++++++++++++++++++
>   scripts/ci/setup/vars.yml.template | 12 +++++
>   4 files changed, 139 insertions(+), 1 deletion(-)
>   create mode 100644 scripts/ci/setup/gitlab-runner.yml
>   create mode 100644 scripts/ci/setup/vars.yml.template
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index bfedbb1025..b3bf3ef615 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -70,3 +70,58 @@ privileges, such as those from the ``root`` account or those obtained
>   by ``sudo``.  If necessary, please refer to ``ansible-playbook``
>   options such as ``--become``, ``--become-method``, ``--become-user``
>   and ``--ask-become-pass``.
> +
> +gitlab-runner setup and registration
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The gitlab-runner agent needs to be installed on each machine that
> +will run jobs.  The association between a machine and a GitLab project
> +happens with a registration token.  To find the registration token for
> +your repository/project, navigate on GitLab's web UI to:
> +
> + * Settings (the gears-like icon at the bottom of the left hand side
> +   vertical toolbar), then
> + * CI/CD, then
> + * Runners, and click on the "Expand" button, then
> + * Under "Set up a specific Runner manually", look for the value under
> +   "And this registration token:"
> +
> +Copy the ``scripts/ci/setup/vars.yml.template`` file to
> +``scripts/ci/setup/vars.yml``.  Then, set the
> +``gitlab_runner_registration_token`` variable to the value obtained
> +earlier.
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
> +Tags are very important as they are used to route specific jobs to
> +specific types of runners, so it's a good idea to double check that
> +the automatically created tags are consistent with the OS and
> +architecture.  For instance, an Ubuntu 20.04 aarch64 system should
> +have tags set as::
> +
> +  ubuntu_20.04,aarch64
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
> index ee088604d1..f4a6183f1f 100644
> --- a/scripts/ci/setup/.gitignore
> +++ b/scripts/ci/setup/.gitignore
> @@ -1,2 +1,2 @@
>   inventory
> -
> +vars.yml
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> new file mode 100644
> index 0000000000..1127db516f
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,71 @@
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +#
> +# This is an ansible playbook file.  Run it to set up systems with the
> +# gitlab-runner agent.
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


