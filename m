Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012E3EDCFD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:18:07 +0200 (CEST)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFhBW-0001VT-5o
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFh9s-0000d7-Ty
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFh9m-0005Bs-CW
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629137775;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O47pu5mh1B3W/peaUXLmf7ZqpjIt+GjL8j54t66fvNI=;
 b=EBVYvsuJzOFL03ApAf0yL2jmOiK1DfuF8W/gpTQj+g96UlvQNQXVjWihPUuuIrMnc5gqL0
 oIUBA8BeSDxYDmNY8UGxhRE/zo2gAMEB1cn7Z+175+38YHgGkzyjdBqvcO2NDnRo3EQOwc
 k6qthmt8Z7phtWAJFi527Fc13Vgbciw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Wv5t5BoEMiiJuN_GFMQSaw-1; Mon, 16 Aug 2021 14:16:12 -0400
X-MC-Unique: Wv5t5BoEMiiJuN_GFMQSaw-1
Received: by mail-pj1-f72.google.com with SMTP id
 v18-20020a17090abb92b0290178fa401bdcso13102667pjr.4
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 11:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=O47pu5mh1B3W/peaUXLmf7ZqpjIt+GjL8j54t66fvNI=;
 b=Rd4FcwMmjJTnoV5zPYMKIyU9sSlr4/Ew1m4h5fHyCea4jW6E5Yycpb7GWbdih3Ghe9
 WTjtkiuNRmzY6HdvbDnKO0kks2KNzw645Ompmazc1/Sx1O6SBZQA7IU76A37ABq6TNga
 PAAOow016ZAx/NSRb6dyyugvvRfATp2oHE1hJeHLM7Kc6dvfF2JMB8ml8bGVxlbHm5OW
 b7zb+XAQISNUKLtLjwibosnvbaXWY5FP4lmoXeP1EJi2KKQidwtbv1TKNtHU05a3Knll
 vcUkEtZR5d+6JihVWFoUKzl7+wzBfu0qpl1kukMiyEgS8miAmGEN6AZ6b4ZjCWRCDzUw
 IQAQ==
X-Gm-Message-State: AOAM532C72OWrD/98sO4v03dkh+ojQ2RfQfZwLPwfvm4ywAFLCKkjl+H
 OZQiq5KQ7egdXceUGcEEdyaK8TaJu6b7p1hdPQL/I82Dzr9XyU9EDfaMM43N7Qwq7kCEUAWtahm
 WoNBoVAezvbFVhi8=
X-Received: by 2002:a62:878c:0:b029:3c5:f729:ef00 with SMTP id
 i134-20020a62878c0000b02903c5f729ef00mr17672667pfe.43.1629137771577; 
 Mon, 16 Aug 2021 11:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9wLZaYtNCo94UnJH3ioCN3Zs6t4vlzTPd3myeewRTSonsbsCuOB7XC8RSxN9DddXE3aQ6IA==
X-Received: by 2002:a62:878c:0:b029:3c5:f729:ef00 with SMTP id
 i134-20020a62878c0000b02903c5f729ef00mr17672656pfe.43.1629137771352; 
 Mon, 16 Aug 2021 11:16:11 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.241.196])
 by smtp.gmail.com with ESMTPSA id s5sm146319pji.56.2021.08.16.11.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:16:10 -0700 (PDT)
Subject: Re: [PATCH 1/2] Acceptance Tests: add standard clean up at test
 tearDown()
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <180dc18d-0a8f-7a6a-ca57-940f8d7505ab@redhat.com>
Date: Mon, 16 Aug 2021 15:16:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803193447.3946219-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 8/3/21 4:34 PM, Cleber Rosa wrote:
> The avocado.Test class, used as the basis of the avocado_qemu.Test
> class, performs a clean of temporary directories up as part of its own
> tearDown() implementation.
>
> But the avocado_qemu.Test class is currently missing the same clean
> up, as it implemented its own tearDown() method without resorting to
> the upper class behavior.
Good catch Peter!
>
> This brings avocado_qemu.Test behavior in sync with the standard
> avocado.Test behavior and prevents temporary directories from
> cluttering the test results directory (unless instructed to do so with
> Avocado's "--keep-tmp" option).
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 2c4fef3e14..1e807e2e55 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -276,6 +276,7 @@ def tearDown(self):
>           for vm in self._vms.values():
>               vm.shutdown()
>           self._sd = None
> +        super(Test, self).tearDown()

Could you use the new form of super [1] to make the pylint happier?

[1] https://www.python.org/dev/peps/pep-3135/

Thanks!

- Wainer

>   
>       def fetch_asset(self, name,
>                       asset_hash=None, algorithm=None,


