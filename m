Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E830E261
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:21:01 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Mlw-0001Tq-Qm
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MEj-0005Qb-LH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MEi-0007t1-1J
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0ZXIFDEkX8SG5LCJGOs3M0cM2KDSPKGjyLqJlmWoJM=;
 b=QL+akd3BcphHsxvKiykAya3HVo8kEicVm9h1Tz29CcH29JmPf3Z8TT2Zi5Crj9REk7Vo9d
 N7lXAHSLJ/nAxCfnUNjkbdzK/bthCQ9NxxmfBM4ddO+7pgpHEjvtYkDH0fUV+yCoubDzsp
 XNUhsVF4joc3JyfXPa1id/nQc4io7cI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-QMNbTndBMveXBCas7fsS3Q-1; Wed, 03 Feb 2021 12:46:36 -0500
X-MC-Unique: QMNbTndBMveXBCas7fsS3Q-1
Received: by mail-ed1-f70.google.com with SMTP id ay16so308745edb.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0ZXIFDEkX8SG5LCJGOs3M0cM2KDSPKGjyLqJlmWoJM=;
 b=H1eMf/9+LuP0+gw6VYYmXDSiMUfJPZQVu3lgCyL666iGQQP+FDxroi52NJHJD3rJps
 zkwxUEodnbC4OZnDxhPDdV+dZf30HaccLYlzPQMDIVN3pgyo7JMzh4dA3iHow2D19D4d
 zmeFD9FDIw7j8nEE5wQcDhR3DHrbnhpv3U8cHrKIDefm4GmKNdR3VzInoGX/j1FJQAdY
 R+IpgvzZVSjUAB9ZD/VP5AHC+Vb+B7klSj/9SPUJspiZngDYdOWRUHtLwOLWcdFpaIti
 QYg0tJCU6IVKnkBHiPjn9yEfSvfWL2U4C4rgvxDNmMG4xyAgqHtq3w4IJ8evLMb6p31m
 2jug==
X-Gm-Message-State: AOAM532Yl6TQWcKBV8pDv6p6JsIXm+adGR79Xkha9ciOfPW6NIxGAA4A
 OeUp9PLYdx/B6rxaMEBJum9wYsiQ8Is4MDkU90C/JDUZNMgXIUU1FUGC5IjAbGld19i65BVA7QV
 cJpmXtp8bPFM/Los=
X-Received: by 2002:aa7:ca55:: with SMTP id j21mr4157653edt.172.1612374395351; 
 Wed, 03 Feb 2021 09:46:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDI0H9/pXMYjrgIs5Dr9DHnZENIud5j4/NlTpHKaxVGOTchLGTUlUoM3KnAU+11aDAIKQs8Q==
X-Received: by 2002:aa7:ca55:: with SMTP id j21mr4157626edt.172.1612374395161; 
 Wed, 03 Feb 2021 09:46:35 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id u18sm1307020ejc.76.2021.02.03.09.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:46:34 -0800 (PST)
Subject: Re: [PATCH 19/22] Acceptance Tests: add port redirection for ssh by
 default
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-20-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e0f187b2-8cc2-f187-a44c-e9448cbe5fc2@redhat.com>
Date: Wed, 3 Feb 2021 18:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-20-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> For users of the LinuxTest class, let's set up the VM with the port
> redirection for SSH, instead of requiring each test to set the same
> arguments.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 2 ++
>  tests/acceptance/virtiofs_submounts.py    | 4 ----
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 5f4dd6b9ec..89669cc604 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -301,6 +301,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>          super(LinuxTest, self).setUp()
>          self.vm.add_args('-smp', '2')
>          self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
> +                         '-device', 'virtio-net,netdev=vnet')

You need a machine with a virtio-bus to be able to plug a virtio device,
not all provide one.


