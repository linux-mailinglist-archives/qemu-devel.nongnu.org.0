Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF93313CFB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:17:03 +0100 (CET)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B5q-0001A7-3F
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94pi-0004cV-H8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94pb-0004Qi-FP
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612784150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eixVpDe0fuguaGwK+nQy9Jgbpu1b2m4y1O75upKaMZ0=;
 b=a/GsAKFjJHV0lZyUWm7KuiE/70EfZj7rpPAKlnkJQ7N6ZSDcouA2Qxx2s9YWq+EFlz53Q1
 sjmkErgNyU7/ppTOALC1IggVcsrpenpylnkieyeqib9GD6U+tUlPylS6jFL3Jz/yWnryI6
 1+gHclf4SVuRckT9u3x6Guxubw9qCMw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-UfBovN-ZOsO0qCyhF63VaA-1; Mon, 08 Feb 2021 06:35:49 -0500
X-MC-Unique: UfBovN-ZOsO0qCyhF63VaA-1
Received: by mail-wr1-f71.google.com with SMTP id c1so12927423wrx.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eixVpDe0fuguaGwK+nQy9Jgbpu1b2m4y1O75upKaMZ0=;
 b=QXN5fZ+7kDDMbxf3qgMddzMCQgraPmFl9VD7mSaK9IydGlHzlgDnTrQALQE7MJE2Er
 rXRufL4D3uwjahN3rWLTGXcoA4WHE3JlmJyFw8u42LDrvyycWiLEfjtx67YejINxIDhX
 vZ69cQn27gQxFZgt808tsE8K6J78cH3y5xiRzHPRLtKOIFTFUMyx+msrAzS+x9nrGPKg
 OEppkwvPT8v6+8+rsHf/9G8E2xjpV/3eka8YAUj8k9eRifdQCjAhHKTQ3Zk6XXs87MvG
 vCcQY5scwarxzAf5ipobUTjoqwWWoYVNkYlMVYyY/5zmN5ZR5yQ/JA/cyukisGddR8X+
 gQeQ==
X-Gm-Message-State: AOAM531PrNTlpla8E8dpT6zlzQmF/41CAS2rQJuSt9WOusd2XWCKVrJC
 TJEHamGE4gI6OShpfdOZyEoIjX2NgeuIqCG/189oLo+2OdFeeajpDckf/XREhTcQBYHuN7lifOQ
 ri/2nYp81Ir3qYjw=
X-Received: by 2002:adf:fd87:: with SMTP id d7mr11929563wrr.361.1612784147983; 
 Mon, 08 Feb 2021 03:35:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzib5LyIa4xb2wAcFmQ+mmshMDV8pkWRPNTbmwCfo2igw1mYzI5NJ69PQxZxaC3aTIwDQiPKA==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr11929534wrr.361.1612784147800; 
 Mon, 08 Feb 2021 03:35:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r13sm22277381wmh.9.2021.02.08.03.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:35:47 -0800 (PST)
Subject: Re: [PATCH 00/22] Acceptance Test: introduce base class for Linux
 based tests
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <02bcee13-64fa-e14a-98ad-e8426a26d7d2@redhat.com>
Date: Mon, 8 Feb 2021 12:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> This introduces a base class for tests that need to interact with a
> Linux guest.  It generalizes the "boot_linux.py" code, already been
> used by the "virtiofs_submounts.py" and also SSH related code being
> used by that and "linux_ssh_mips_malta.py".
> 
> While at it, a number of fixes on hopeful improvements to those tests
> were added.
> 
> Cleber Rosa (22):
>   tests/acceptance/boot_linux.py: fix typo on cloudinit error message
>   tests/acceptance/boot_linux.py: rename misleading cloudinit method
>   Acceptance Tests: remove unnecessary tag from documentation example
>   tests/acceptance/virtiofs_submounts.py: use workdir property
>   tests/acceptance/virtiofs_submounts.py: do not ask for ssh key
>     password
>   tests/acceptance/virtiofs_submounts.py: use a virtio-net device
>     instead
>   tests/acceptance/virtiofs_submounts.py: evaluate string not length
>   tests/acceptance/virtiofs_submounts.py: standardize port as integer
>   tests/acceptance/virtiofs_submounts.py: required space between IP and
>     port
>   Python: add utility function for retrieving port redirection
>   tests/acceptance/linux_ssh_mips_malta.py: standardize port as integer
>   Acceptance tests: clarify ssh connection failure reason
>   tests/acceptance/virtiofs_submounts.py: add missing accel tag
>   Acceptance Tests: introduce LinuxTest base class
>   Acceptance Tests: move useful ssh methods to base class
>   Acceptance Tests: introduce method for requiring an accelerator
>   Acceptance Tests: fix population of public key in cloudinit image
>   Acceptance Tests: set up existing ssh keys by default
>   Acceptance Tests: add port redirection for ssh by default
>   Acceptance Tests: add basic documentation on LinuxTest base class
>   Acceptance Tests: introduce CPU hotplug test
>   [NOTFORMERGE] Bump Avocado version to latest master
> 
>  docs/devel/testing.rst                    |  29 +++-
>  python/qemu/utils.py                      |  35 +++++
>  tests/acceptance/avocado_qemu/__init__.py | 176 ++++++++++++++++++++++
>  tests/acceptance/boot_linux.py            | 128 ++--------------
>  tests/acceptance/hotplug_cpu.py           |  38 +++++
>  tests/acceptance/info_usernet.py          |  29 ++++
>  tests/acceptance/linux_ssh_mips_malta.py  |  44 +-----
>  tests/acceptance/virtiofs_submounts.py    |  73 +--------
>  tests/requirements.txt                    |   2 +-
>  tests/vm/basevm.py                        |   7 +-
>  10 files changed, 334 insertions(+), 227 deletions(-)
>  create mode 100644 python/qemu/utils.py
>  create mode 100644 tests/acceptance/hotplug_cpu.py
>  create mode 100644 tests/acceptance/info_usernet.py

Patches 1-6, 8-9 & 12 queued.


