Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5E322BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:53:51 +0100 (CET)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEY8M-0001CA-Gi
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEY7I-0000lw-UG
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEY7G-0002Kn-MY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614088361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELFZ2r1AJ2dWHyIDWP5aBrBBdFJwr9iMqYEPTiHv1/s=;
 b=axZrvSK/2uBZPoMDoWNCf3mMBjXtkB0z10fqlR485GSBsgwacwtQKuDIfwOg+J43l0HH+m
 BEOQzd8+vjq1kTocG+3DgEvakk0ZylBGmefiKCJC/Zl8AVmu3u2HUghdtvxtsYlILtAFZd
 xZplv0F9flynHlDC0t3VJlVgb7XqoaQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-7KsHN4lDMeCRPbqNOWnSNQ-1; Tue, 23 Feb 2021 08:52:29 -0500
X-MC-Unique: 7KsHN4lDMeCRPbqNOWnSNQ-1
Received: by mail-ed1-f72.google.com with SMTP id c7so1598213ede.17
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 05:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELFZ2r1AJ2dWHyIDWP5aBrBBdFJwr9iMqYEPTiHv1/s=;
 b=F48FVI2U+53a8WxM2bpyLRuIFWISkz4Lhfga0RsDAlFWTZkdlfsniYw7LVdmPHe6IX
 xMY6HnyElwXw6xZpgFTE7Gw0PYapf10/hnCda2vM1ju3Lebnnxkhnv8PH5xRFIBB20Jo
 9OYxy3Dt9WFuraVwYjNBtXQjatfgPX4nbmJWuoKahjrdl44My7DYcPwl8QRo6HuT9RM9
 x7HvOUP8/g2SB9dHd63VWuDzu8xQrQBFJ4dTLknKPiHrG/JFOlicIfx7gm3wfHGI3IGJ
 SaYBboWpJe304/V64zSdHnM27tgUfjnVNz2up1HkKdSSTqJzXG9LpJ7a2Yq9Y+huqoYi
 Mi1g==
X-Gm-Message-State: AOAM53246bgfdc/UvqYx0xbOMZsW1b1cfJeqRLm0sy/F3QqCN+ZsGeLg
 adL6ikR+YrONgOI6oiLGIyat43gXEurDi2bYkdBZEOTXx4l5QX2VVba80s5EtzhbMml6prr/HFL
 pUbXB5eLbKdIj5Q4=
X-Received: by 2002:aa7:cd75:: with SMTP id ca21mr7130881edb.199.1614088348650; 
 Tue, 23 Feb 2021 05:52:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGpgtsIHgILlO4lHPKA7C4PInoSFIo0D69YqJGTSne0aELN/Kzt9MhZWEiTL2fqrriXKREKg==
X-Received: by 2002:aa7:cd75:: with SMTP id ca21mr7130856edb.199.1614088348487; 
 Tue, 23 Feb 2021 05:52:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f1sm12973390ejt.21.2021.02.23.05.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 05:52:28 -0800 (PST)
Subject: Re: [PATCH v5 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76ac1ff1-4580-d603-a163-83164c044776@redhat.com>
Date: Tue, 23 Feb 2021 14:52:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 10:58 PM, Cleber Rosa wrote:
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
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/ci.rst                  | 58 ++++++++++++++++++++++++++
>  scripts/ci/setup/.gitignore        |  1 +
>  scripts/ci/setup/gitlab-runner.yml | 65 ++++++++++++++++++++++++++++++
>  scripts/ci/setup/vars.yml.template | 13 ++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/gitlab-runner.yml
>  create mode 100644 scripts/ci/setup/vars.yml.template
...

> +    - name: Remove the .bash_logout file when on Ubuntu systems
> +      file:
> +        path: /home/gitlab-runner/.bash_logout
> +        state: absent
> +      when: "ansible_facts['distribution'] == 'Ubuntu'"

Is this only a problem with Ubuntu and not Debian?

> +    - name: Downloads the matching gitlab-runner
> +      get_url:
> +        dest: /usr/local/bin/gitlab-runner
> +        url: "{{ gitlab_runner_base_url }}{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"

Can we move the dash at the end of gitlab_runner_base_url here before
gitlab_runner_os?

...
> diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
> new file mode 100644
> index 0000000000..621435d030
> --- /dev/null
> +++ b/scripts/ci/setup/vars.yml.template
> @@ -0,0 +1,13 @@
> +# The version of the gitlab-runner to use
> +gitlab_runner_version: 13.1.1
> +# The base location of gitlab-runner binaries, this will be suffixed by $OS-$ARCH
> +gitlab_runner_base_url: https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-

Are we using a specific feature from the official builds,
or can we use any runner?


