Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C901E698DE3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYrW-0005fJ-Ji; Thu, 16 Feb 2023 02:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYrQ-0005e9-50
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSYrO-0002Jg-Ip
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676533157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmIYwqtS5racSw6UEcuF5eYcwsYcc6j4GjLr01RvMYo=;
 b=a46cYif80Y8ZLRlL2wOxwfE4kv3vG6QYNtOM/JXv1RC08MNrhU6p83V6s5QY51vgSQZwM/
 ls/8hxV3+zn/sYHzs58rDFAVEYuHMHRzKjCcm5Rsiz5qFFQdzaahxsUdmdiXgBjzP+yO4x
 OeKW4s1x1U9QkjvUBQ9jW9cvQlcVekA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-yYNSor-qNyG1b49JvXqWXw-1; Thu, 16 Feb 2023 02:39:14 -0500
X-MC-Unique: yYNSor-qNyG1b49JvXqWXw-1
Received: by mail-qk1-f197.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so697550qko.15
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SmIYwqtS5racSw6UEcuF5eYcwsYcc6j4GjLr01RvMYo=;
 b=0fLGXbZWySedgGV04QCn55sAQGOj5lWXKc+/a3+h3j0CzV0kUHIunnu1s6+BDOJzIh
 xw7FB4eipVavdqSHuuIbA0v50kluYgvAsvZlSg1xdoUqxggYctNx8iCEiep4Zb0omdX8
 w4de7kJzrwtDU/IezeaN2rVYDycHvjJY4yCOzQZGZnqb/c6A6JMv8uu/UEfZOy1Tk87o
 MgdO1RnAcTj43Fdt8Vzdl1UNn4F5hg9P3LAbGDDsDbfABlD98AwEVC+Y+rpXg5D4shXj
 je4GxtBQzB0Aox/RcEPuoNSNF0sRbXJgRRtB8OKRg4O9tRwdbv8EykBDYY98TwGxK/L7
 PJGA==
X-Gm-Message-State: AO0yUKUTAwQJ/hXhd4j6edyPZjUrMx7GqPMAGNZUYJdAcbF8P3C1tWpB
 Mod6F/1qmOYOFqyXCBT4urbCSqlqjG4+ETBjWmO/R9aB96wvH1VnEKz3eYoBILjk0P4kcYupUjw
 6Noat2Wtqxh51Bow=
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr8872426qtk.57.1676533153772; 
 Wed, 15 Feb 2023 23:39:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8bC44HR8Rurw95k5vVNFhvYgwMMfmiQE5sWroVs1GbTIyPYUHDIWisbyOVl1896XZDP4WpHQ==
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr8872409qtk.57.1676533153545; 
 Wed, 15 Feb 2023 23:39:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 t68-20020ae9df47000000b0073b8459d221sm684900qkf.31.2023.02.15.23.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:39:13 -0800 (PST)
Message-ID: <bdc45bcc-c29e-6da8-9474-0444cdb14988@redhat.com>
Date: Thu, 16 Feb 2023 08:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 06/12] gitlab: extend custom runners with base_job_template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/02/2023 20.25, Alex Bennée wrote:
> The base job template is responsible for controlling how we kick off
> testing on our various branches. Rename and extend the
> custom_runner_template so we can take advantage of all that control.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml                      |  3 ++-
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 10 +++++-----
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 10 +++++-----
>   4 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


