Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C4662A59
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:44:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuIT-0007ex-HI; Mon, 09 Jan 2023 10:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEuIR-0007eZ-N9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:42:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEuIP-0006F6-VM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:42:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so9397230wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcjt8GRqrhxCOLryltN0KqgWw+coxdZhL65SUIiCpTM=;
 b=OGatsdms3DoVwczZHLZWLXesCj/uT3sd9fdHbKL2VMJmZ+nTNX7UZtESkJXyX46kdx
 pzKzcrTJqW4D6vsVYShyaSTnYmStMm+n72p0FxSaqcfxRPLzQCFXq5ifMwEKMFw+a3qe
 cI6wj6RydMG/tKZ8tqSIuRymmIvil9tNnYimeYt5M9Gc1D3IRxnuvS2MV7W+jMAyecvA
 mwO6szafw2eo1NI6PnyZPwKzEZkkxht+Y8Xj9QKCTsbpRFZ4OTNyV8Ql+XltLxAcObSI
 qb5mseQILnHq3rbEgpsGr3IhjdbM2SMJrlCcrnWYJvfYIKA/ZTb/yirHuNEbUZUgTg+4
 RhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fcjt8GRqrhxCOLryltN0KqgWw+coxdZhL65SUIiCpTM=;
 b=whZFj1mM82DWlz/DVArGnMgkl25oD/QJDwjisbrP0/vu+woTeiRkil2WEH6jjr/6f6
 J+a3DHWh6YKi6KFAeKgfxCEXl0jbxW0/7yJswXpKtOEKpx+QSkxlUwJthfA9BDbAn++f
 1TOmzJ3rkLFAaysWEVXsZxpyUwW1OAHhRckeQ6bUyGMIfqbMGYGNIJi/El6xMrYp1Xgj
 1LsCR7wgF9oJ7JMrvVfi0z8PrsvykAtKRTGXGHeMFRyqWnvXNeg1oBRli4v7r1NHY6Mm
 wuzGXiDxa4s5wYivk9XNqr9tZqQBmHbFTc1LYsVCkZgodYGAuPxPEcYfcdR5quMIpKlP
 dWmA==
X-Gm-Message-State: AFqh2koj9xSew/guPT44Ww0u5L1HA4VjBJzf5gQfZygTwklktR0pRKPE
 Sd3iM8ajjFoX0dJ2OZm5fz15qQ==
X-Google-Smtp-Source: AMrXdXuI7MdGERFuzvq+xL6DKSivwjYprEYi0PtD0l//qkh3ehodzS8UMsn0377vf2z28daKrp0n/w==
X-Received: by 2002:a05:600c:35d0:b0:3d2:3f55:f757 with SMTP id
 r16-20020a05600c35d000b003d23f55f757mr46209153wmq.20.1673278964337; 
 Mon, 09 Jan 2023 07:42:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t8-20020a1c7708000000b003d9f00c8f07sm3799458wmi.21.2023.01.09.07.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:42:43 -0800 (PST)
Message-ID: <2a1d1243-2675-8be8-c35f-8c072065645e@linaro.org>
Date: Mon, 9 Jan 2023 16:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221215224725.3236-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215224725.3236-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/12/22 23:47, Fabiano Rosas wrote:
> This test currently fails when run on a host for which the QEMU target
> has no default machine set:
> 
> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
> no default
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/avocado/version.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..dd775955eb 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>   class Version(QemuSystemTest):
>       """
>       :avocado: tags=quick
> +    :avocado: tags=machine:none
>       """
>       def test_qmp_human_info_version(self):
>           self.vm.add_args('-nodefaults')

Looking at previous attempt in 
https://lore.kernel.org/qemu-devel/20220104122104.849084-1-alex.bennee@linaro.org/

* tests/avocado/empty_cpu_model.py

   Forced via vm.add_args('-machine', 'none')

   tags=machine:none would be cleaner.

* tests/avocado/info_usernet.py and
* tests/avocado/vnc.py

   -> Fixed by 5104b73824 ("tests/avocado: set -machine none
   for userfwd and vnc tests")

* tests/avocado/version.py

   -> This patch

* tests/avocado/migration.py

   => Missing

Maybe we can squash to this patch?

Meanwhile:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


