Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080443E8389
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:19:59 +0200 (CEST)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXI6-0003uv-3U
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXGz-0003ER-PT
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXGx-0005h2-IC
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628623127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5lcUZ3oohXmzQHhdW/xpsWiAGQ9LlDh3AnHeF7xXbc=;
 b=OpcEBVfK/YVJYOF1/10YIJq9CB/QIewsZwos7lODy23dWyuLws6wWxfL2eilo8Y29pDFaP
 gl5Y5X9OfXPLLAHWoeDbvXrvDFapMkxbMr+r9iJqUubXWIlAD3tEF1rfx/+Yo9uBX9ncPP
 /wS3EdFcpljfKDzTK4ypfyXGkebhyO0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-v6TBbS4rMX2Hs77YdKvSUg-1; Tue, 10 Aug 2021 15:18:45 -0400
X-MC-Unique: v6TBbS4rMX2Hs77YdKvSUg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n17-20020a7bc5d10000b0290228d7e174f1so83223wmk.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F5lcUZ3oohXmzQHhdW/xpsWiAGQ9LlDh3AnHeF7xXbc=;
 b=REryL1Na54g1FyGTHFX49S5S9Rr2Vlw7SJQClosi5RewfS9caqzOLEga1GG38qIvm2
 Z/ew9+WN9QpP5N+BRKHeAdrpnBFzd4n4ftoALIl7q9NheQCpYUw8ZQy9E89BilWkE/ay
 0zmTmRG6VbuKnty3qvkXsS8M48Wgj4VrI2YxKSp/UUGN9JaMBmmnGD6tTKkHzAYHzXbf
 BzcxAf4erMH9zl6gRE2KWwxcotjYCyv7kxEcaaZS1TWPXp/E5p4wpZpb96GAgG38U8Cd
 7mUlcTYzQM7OtD5jkF6fmmJ1bc5ZJcnKAVVWvTXIjPr1JhFcPIMmJM5rgJ+xeixHe2QC
 Fcig==
X-Gm-Message-State: AOAM532gLmWsFUDhf1vx+k0P4mo61PZ1QJgeWmVWFi+aaoXSZV430hFk
 QnJOujcVBKcv/raDZdffEFQwM1TFKr9p/0qWnj0RK0CDlegz6mNzn3DlcbzLSKmVSOM43/QM2aH
 MX0KQjPSWu57HI4s=
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr5027965wmc.23.1628623124459; 
 Tue, 10 Aug 2021 12:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsym5e+nc5JsPdLGxIQH0TV/LVKq98HIpcZKo3nNPYZfaDdWq4Si2pPJegrtz0r8t2I8PhLQ==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr5027948wmc.23.1628623124184; 
 Tue, 10 Aug 2021 12:18:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h9sm24444570wrw.38.2021.08.10.12.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:18:43 -0700 (PDT)
Subject: Re: [PATCH-for-6.2] tests/acceptance: Allow overwrite smp and memory
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210802222257.50946-1-email@aabouzied.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae891a6f-fc3d-5234-010f-58356140e752@redhat.com>
Date: Tue, 10 Aug 2021 21:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802222257.50946-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 12:22 AM, Ahmed Abouzied wrote:
> Removes the hard-coded values in setUp(). Class inheriting from
> avocado_qemu.LinuxTest can overwrite the default smp and memory instead.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 2c4fef3e14..2639b89c84 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>      distro = None
>      username = 'root'
>      password = 'password'
> +    smp = '2'
> +    memory = '1024'
>  
>      def _set_distro(self):
>          distro_name = self.params.get(
> @@ -471,8 +473,8 @@ def _set_distro(self):
>      def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>          super(LinuxTest, self).setUp()
>          self._set_distro()
> -        self.vm.add_args('-smp', '2')

I don't understand why we use 2 as default value, but this is unrelated
to this patch, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> -        self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-smp', self.smp)
> +        self.vm.add_args('-m', self.memory)
>          # The following network device allows for SSH connections
>          self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
>                           '-device', '%s,netdev=vnet' % network_device_type)
> 


