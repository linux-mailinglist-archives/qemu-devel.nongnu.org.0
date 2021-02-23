Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934BA322C05
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:16:20 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYU7-0007Cf-C1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEYSI-0006MK-1m
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:14:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEYSG-0003x7-7Z
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614089663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpkI0NWGEfByk5o6jQ0pLl9b3x63Oqqo6MqDyen3zOA=;
 b=O4gWN5nvn8a2eRDDbRso5kw9Jd5cTPLPUccQSZGdxOmCcyD833+X5J+ZtylvJs64tMc1tV
 5oP0RhuJEkbppUBnRqQrvlL2hubN/rw7PTs/Ggpw90vTryKEP48Fx+jji5XvJaHSLmF4e1
 NBWjIaXTOcg8E/TKYSfP2+f/f45ofCc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-A94XCyzfNBiao--aooRs_Q-1; Tue, 23 Feb 2021 09:14:19 -0500
X-MC-Unique: A94XCyzfNBiao--aooRs_Q-1
Received: by mail-ej1-f71.google.com with SMTP id ia14so5404539ejc.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LpkI0NWGEfByk5o6jQ0pLl9b3x63Oqqo6MqDyen3zOA=;
 b=p2zdxodnUHJwndnnLFy3ZRjyZ5mIG8H1EIwj46KGkoT+gQVCy1fXgG5ErBwmWM3sIx
 mw9LaeLFm51nbdgLxhDH4OvrnoBZhg0mtzvR1TcZjjPjSANrWb+oPC1m2xYU4rFGkfoo
 xl8L/NNsENXTegUyW8I3l5QXFkmd1aLHxfPq0QLQUtOiZuNnn/Getmtd+ChR+D/azWIa
 jFMUDb7ov1yIjGVo/fXfXo7pfVgunDyeFxPfcaMHNFN3uBbj7TJbqKLhNkY8st7ZnFtu
 SnZipZH3pZ6Cbh5fo0mZrhz3rA8/TEyl6SMUCXWxIklrW0B7a5rgb1QaU6y6jyc/do6h
 NuQQ==
X-Gm-Message-State: AOAM533kJ8D1sx1T0otKFE0Sfl/IGU6RFB4m7wgwr0Uh15ryXdOt4Y8I
 73IF2d/NwrAWUqv6pqxE+LgTWAYgSHJGa1Ko8MavvpeoiBCP+JB8i7JDp9hZWmGDBsGdQ0in7h7
 /6blAuQHTwF2hzRM=
X-Received: by 2002:aa7:c3c7:: with SMTP id l7mr2575694edr.207.1614089658142; 
 Tue, 23 Feb 2021 06:14:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjRLan4VeLUPotq/oN46sYwXzHn40xCWv+xdpDF/jcY6HUZSQmKoy16zFfBl9xV7ZWWkrn1g==
X-Received: by 2002:aa7:c3c7:: with SMTP id l7mr2575661edr.207.1614089657929; 
 Tue, 23 Feb 2021 06:14:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hc40sm11943980ejc.50.2021.02.23.06.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 06:14:17 -0800 (PST)
Subject: Re: [PATCH v5 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <635d123d-6b67-c082-a7e8-bd19b9fee259@redhat.com>
Date: Tue, 23 Feb 2021 15:14:15 +0100
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

> +    - name: Register the gitlab-runner
> +      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell  --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"

Hmm maybe we want to register them with --run-untagged=false or
explicitly add tags like {{ ansible_facts[\"architecture\"] }}.

Also, maybe have --cache-shared by default?

And set a reasonable limits values...
 --maximum-timeout 10800 # 3h
 --output-limit 8192 # 8MiB

No CPU/memory limits yet.


