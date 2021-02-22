Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB7322046
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:38:35 +0100 (CET)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEH2Q-0008Bs-Va
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEH0F-0006R5-GP
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEH0D-0008JO-Ky
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614022577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uePLuhhDK5L8/pRqnmPYFDv0mGAJDrTwA+SENGFhwT8=;
 b=SH4+d4tOV7qBh7zuVIzAZ2AkJ6MLDT8D856sgJ6cGRR61fU1C470lAdRTNPnku3if2Wa7u
 QOF5ZP5ZPcPnQLQr21MlarcIpoUeE/pXZZSkIeyJaVlbYIRE7JrGSaSLtccwDBe16bUPtr
 8F0gKZwzgairua0j2X82gC0CeHp+83M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-h7vPtUp7PpuWC1hkuboG_A-1; Mon, 22 Feb 2021 14:36:13 -0500
X-MC-Unique: h7vPtUp7PpuWC1hkuboG_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97F0E192AB7C;
 Mon, 22 Feb 2021 19:36:12 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD7135D9D3;
 Mon, 22 Feb 2021 19:36:04 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <10a9ca14-aeb2-545f-7e9e-c41daa4729a2@redhat.com>
Date: Mon, 22 Feb 2021 16:36:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/19/21 6:58 PM, Cleber Rosa wrote:
> To run basic jobs on custom runners, the environment needs to be
> properly set up.  The most common requirement is having the right
> packages installed.
>
> The playbook introduced here covers the QEMU's project s390x and
> aarch64 machines.  At the time this is being proposed, those machines
> have already had this playbook applied to them.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/ci.rst                      | 30 ++++++++++
>   scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
>   scripts/ci/setup/inventory             |  1 +
>   3 files changed, 107 insertions(+)
>   create mode 100644 scripts/ci/setup/build-environment.yml
>   create mode 100644 scripts/ci/setup/inventory


I tested the playbook in a Fedora 32 (aarch64) machine using containers, as:

dnf install -y podman podman-docker ansible
echo "" > inventory
for ver in 18.04 20.04; do
     name="ubuntu_$(echo $ver | sed 's/\./_/')_runner"
     podman run --rm -d --name "$name" docker.io/library/ubuntu:$ver 
tail -f /dev/null
     podman exec "$name" sh -c 'apt-get update && apt-get install -y 
python3'
     echo "$name ansible_connection=docker 
ansible_python_interpreter=/usr/bin/python3" >> inventory
done
ansible-playbook -i inventory build-environment.yml

So, Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 585b7bf4b8..a556558435 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>   The GitLab CI jobs definition for the custom runners are located under::
>   
>     .gitlab-ci.d/custom-runners.yml
> +
> +Machine Setup Howto
> +-------------------
> +
> +For all Linux based systems, the setup can be mostly automated by the
> +execution of two Ansible playbooks.  Start by adding your machines to
> +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> +
> +  fully.qualified.domain
> +  other.machine.hostname
> +
> +You may need to set some variables in the inventory file itself.  One
> +very common need is to tell Ansible to use a Python 3 interpreter on
> +those hosts.  This would look like::
> +
> +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
> +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
> +
> +Build environment
> +~~~~~~~~~~~~~~~~~
> +
> +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> +set up machines with the environment needed to perform builds and run
> +QEMU tests.  It covers a number of different Linux distributions and
> +FreeBSD.
> +
> +To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory build-environment.yml
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> new file mode 100644
> index 0000000000..0197e0a48b
> --- /dev/null
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -0,0 +1,76 @@
> +---
> +- name: Installation of basic packages to build QEMU
> +  hosts: all
> +  tasks:
> +    - name: Update apt cache
> +      apt:
> +        update_cache: yes
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +
> +    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> +          - ccache
> +          - clang
> +          - gcc
> +          - gettext
> +          - git
> +          - glusterfs-common
> +          - libaio-dev
> +          - libattr1-dev
> +          - libbrlapi-dev
> +          - libbz2-dev
> +          - libcacard-dev
> +          - libcap-ng-dev
> +          - libcurl4-gnutls-dev
> +          - libdrm-dev
> +          - libepoxy-dev
> +          - libfdt-dev
> +          - libgbm-dev
> +          - libgtk-3-dev
> +          - libibverbs-dev
> +          - libiscsi-dev
> +          - libjemalloc-dev
> +          - libjpeg-turbo8-dev
> +          - liblzo2-dev
> +          - libncurses5-dev
> +          - libncursesw5-dev
> +          - libnfs-dev
> +          - libnss3-dev
> +          - libnuma-dev
> +          - libpixman-1-dev
> +          - librados-dev
> +          - librbd-dev
> +          - librdmacm-dev
> +          - libsasl2-dev
> +          - libsdl2-dev
> +          - libseccomp-dev
> +          - libsnappy-dev
> +          - libspice-protocol-dev
> +          - libssh-dev
> +          - libusb-1.0-0-dev
> +          - libusbredirhost-dev
> +          - libvdeplug-dev
> +          - libvte-2.91-dev
> +          - libzstd-dev
> +          - make
> +          - ninja-build
> +          - python3-yaml
> +          - python3-sphinx
> +          - sparse
> +          - xfslibs-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +
> +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
> +      package:
> +        name:
> +          - libspice-server-dev
> +          - libxen-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +        - ansible_facts['architecture'] != 's390x'
> diff --git a/scripts/ci/setup/inventory b/scripts/ci/setup/inventory
> new file mode 100644
> index 0000000000..2fbb50c4a8
> --- /dev/null
> +++ b/scripts/ci/setup/inventory
> @@ -0,0 +1 @@
> +localhost


