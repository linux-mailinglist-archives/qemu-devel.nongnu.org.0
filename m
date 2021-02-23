Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9B322D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:19:00 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZSj-0005is-Hc
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZQa-0005AD-0F
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:16:44 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEZQV-0006a8-Th
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:16:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id x16so2766727wmk.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YcZkZVEs+osikOGdLUa9q4S8+Q/cG/KsvrzVZfSIN4Y=;
 b=gxeSJAWa6GJe38uYRcp7oECdwejpYSbPJIJaOhznDnnU8yIwqbIy96cTl6h++96UVL
 BZz4flWjPjd2U03m5iZQSB7PUwKOJxGds0sTxbRlYm5c3uaBHK1ysnl88sVZDV+I5f9S
 VBl3JlT45dJBPzgPxPNjQNlyYpf3jVKdqEZjDqzhn6H106UXiSx18UQ5FohTPm6WGlTp
 YYnchuUlf1vhBK5LUchNsQaJhKFN5/zqd/FfOcIN5J6CGScZPUbEr9oaA+65qAxgPako
 fDVAJS+gLaktE//vYUHwolTlU6wUIDFf4gF0a2V7cc9tw/9Oa051D59GdaGwsNXs+q8O
 V3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YcZkZVEs+osikOGdLUa9q4S8+Q/cG/KsvrzVZfSIN4Y=;
 b=WGUjjoNga4itcOjTqTNFen+kcrqLgaIAsDFfrCwuB7Mk6bkUT6o4yb1A4/HHxCZNhz
 In61RQ1Tu2Sl/BD7d+jSPbxDqS/XeFHXeSFnLnP0P3cy+lv0CQfTG88a2lV7tyT/bOda
 YJ62UeDRcWFo5YiPMgS5oj5nSwqx+2I0W0qqXQ/AWfsLPbiADOCFHkTD3IFqeDNVhQog
 IGQa7ZUkH++gDzxenGW7/VEe1L8fFxWluRNLbgcJPGPx3LGWf7ODWjRd5w6c13TbtvY7
 qzqamKPuUPGku4l0XTCZad8EdUxaVYrwyA/23NKf+1ZVMMXKiWK2kjesJDkdAji2+bEB
 uu/w==
X-Gm-Message-State: AOAM53191LDGqOZz4IArxeBti+r78H68C2quhvR8xa9w3vkaxr/If8JA
 6PB+2sVZwdVPr8DTyQJzBdOhBw==
X-Google-Smtp-Source: ABdhPJxWeofDLhH9Xk2bZjG1g0zqP9DjKIhb/waQlQmvf68j0zlmtfxdDZyb2SLIPr2u6U1TMUTLng==
X-Received: by 2002:a1c:a795:: with SMTP id
 q143mr25720868wme.113.1614093397878; 
 Tue, 23 Feb 2021 07:16:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u137sm2851090wmu.20.2021.02.23.07.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 07:16:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BF691FF7E;
 Tue, 23 Feb 2021 15:16:35 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-4-crosa@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
Date: Tue, 23 Feb 2021 15:15:13 +0000
In-reply-to: <20210219215838.752547-4-crosa@redhat.com>
Message-ID: <87czwq4xws.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
>
> The playbook introduced here covers a number of different Linux
> distributions and FreeBSD, and are intended to provide a reproducible
> environment.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/ci.rst                  | 58 ++++++++++++++++++++++++++
>  scripts/ci/setup/.gitignore        |  1 +
>  scripts/ci/setup/gitlab-runner.yml | 65 ++++++++++++++++++++++++++++++
>  scripts/ci/setup/vars.yml.template | 13 ++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/gitlab-runner.yml
>  create mode 100644 scripts/ci/setup/vars.yml.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index a556558435..9f9c4bd3f9 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -56,3 +56,61 @@ To run the playbook, execute::
>=20=20
>    cd scripts/ci/setup
>    ansible-playbook -i inventory build-environment.yml
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
> + * uncheck the "Run untagged jobs" check box
> + * give it a better Description
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..f112d05dd0
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1 @@
> +vars.yml
> \ No newline at end of file
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab=
-runner.yml
> new file mode 100644
> index 0000000000..ab1944965f
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,65 @@
> +---
> +- name: Installation of gitlab-runner
> +  hosts: all
> +  vars_files:
> +    - vars.yml
> +  tasks:
> +    - debug:
> +        msg: 'Checking for a valid GitLab registration token'
> +      failed_when: "gitlab_runner_registration_token =3D=3D 'PLEASE_PROV=
IDE_A_VALID_TOKEN'"
> +
> +    - name: Checks the availability of official gitlab-runner builds in =
the archive
> +      uri:
> +        url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab=
_runner_version  }}/binaries/gitlab-runner-linux-386
> +        method: HEAD
> +        status_code:
> +          - 200
> +          - 403
> +      register: gitlab_runner_available_archive
> +
> +    - name: Update base url
> +      set_fact:
> +        gitlab_runner_base_url: https://s3.amazonaws.com/gitlab-runner-d=
ownloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-
> +      when: gitlab_runner_available_archive.status =3D=3D 200
> +    - debug:
> +        msg: Base gitlab-runner url is {{ gitlab_runner_base_url  }}
> +
> +    - name: Create a group for the gitlab-runner service
> +      group:
> +        name: gitlab-runner

I got this not particularly helpful error:

  TASK [Create a group for the gitlab-runner service] *********************=
***************************************************************************=
*************************
  fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"changed": false, "module_std=
err": "Shared connection to 192.168.122.170 closed.\r\n", "module_stdout": =
"/root/.ansible/tmp/ansible
  -tmp-1614092629.906646-258936160555386/AnsiballZ_group.py:17: Deprecation=
Warning: the imp module is deprecated in favour of importlib; see the modul=
e's documentation for alt
  ernative uses\r\n  import imp\r\nTraceback (most recent call last):\r\n  =
File \"/tmp/ansible_group_payload_2xv1or12/ansible_group_payload.zip/ansibl=
e/module_utils/basic.py\"
  , line 279, in get_distribution\r\nAttributeError: module 'platform' has =
no attribute '_supported_dists'\r\n\r\nDuring handling of the above excepti=
on, another exception occ
  urred:\r\n\r\nTraceback (most recent call last):\r\n  File \"/root/.ansib=
le/tmp/ansible-tmp-1614092629.906646-258936160555386/AnsiballZ_group.py\", =
line 113, in <module>\r\n
      _ansiballz_main()\r\n  File \"/root/.ansible/tmp/ansible-tmp-16140926=
29.906646-258936160555386/AnsiballZ_group.py\", line 105, in _ansiballz_mai=
n\r\n    invoke_module(zi
  pped_mod, temp_path, ANSIBALLZ_PARAMS)\r\n  File \"/root/.ansible/tmp/ans=
ible-tmp-1614092629.906646-258936160555386/AnsiballZ_group.py\", line 48, i=
n invoke_module\r\n    im
  p.load_module('__main__', mod, module, MOD_DESC)\r\n  File \"/usr/lib/pyt=
hon3.8/imp.py\", line 234, in load_module\r\n    return load_source(name, f=
ilename, file)\r\n  File
  \"/usr/lib/python3.8/imp.py\", line 169, in load_source\r\n    module =3D=
 _exec(spec, sys.modules[name])\r\n  File \"<frozen importlib._bootstrap>\"=
, line 604, in _exec\r\n  F
  ile \"<frozen importlib._bootstrap_external>\", line 783, in exec_module\=
r\n  File \"<frozen importlib._bootstrap>\", line 219, in _call_with_frames=
_removed\r\n  File \"/tmp
  /ansible_group_payload_2xv1or12/__main__.py\", line 501, in <module>\r\n =
 File \"/tmp/ansible_group_payload_2xv1or12/__main__.py\", line 449, in mai=
n\r\n  File \"/tmp/ansibl
  e_group_payload_2xv1or12/__main__.py\", line 89, in __new__\r\n  File \"/=
tmp/ansible_group_payload_2xv1or12/ansible_group_payload.zip/ansible/module=
_utils/basic.py\", line 3
  37, in load_platform_subclass\r\n  File \"/tmp/ansible_group_payload_2xv1=
or12/ansible_group_payload.zip/ansible/module_utils/basic.py\", line 289, i=
n get_distribution\r\nAtt
  ributeError: module 'platform' has no attribute 'dist'\r\n", "msg": "MODU=
LE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}
          to retry, use: --limit @/home/alex/lsrc/qemu.git/scripts/ci/setup=
/gitlab-runner.retry


--=20
Alex Benn=C3=A9e

