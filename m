Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217893196C3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:39:58 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALYz-0006tL-69
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALX9-0004We-KL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALX4-0005LM-Kf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613086677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8hpxHomxmo5qdGG144EWdtmkSoCx5qFamNsHfSUYjw=;
 b=X3xnxEUKXPwbnSU4yKknP6n448njtPmcAqqs9MvPAG/Egh0PNRlYwYxbOvE2zRfCnV/V/r
 a4xb2a6MqmwWN99+wdPdzhaZq1F5LSWEgkfu/SVR6Q/65WCPBX6+T9VrY0UFuOg3VteB8G
 9cENAPYB5SB4vvLIrHtptra8cuIbA4Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-z4EgKhvZPQit3YLpK8zpKQ-1; Thu, 11 Feb 2021 18:37:56 -0500
X-MC-Unique: z4EgKhvZPQit3YLpK8zpKQ-1
Received: by mail-wm1-f70.google.com with SMTP id b201so4014870wmb.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v8hpxHomxmo5qdGG144EWdtmkSoCx5qFamNsHfSUYjw=;
 b=l9ozyWUsDNebjZyRETaEsINXfx1w/ealPKSMDPYoK+9JKP2Lz1N2V5q7XBP15duJJa
 SWcM5TG48M4wqpKBmbsZF4QQ76jQruUtLSmiUz7gK9tom4NWO94w6gTDQduq1+ZwRrmW
 p2pUS0lUitXXfV9uXY8IrBvsQ3VO+IV4UhyWFZVVr6WKL8zpMvA+pMxWr9CoT5u6GmjF
 HfcQdENhyAy1nsO8dxrDvvvGc3FCVOjphl9wniPdQQmaIdNrHAZWFYlpnTkadvcbod5I
 +40EWQV+LCdlnZEI0zjELm/t+HrBWOBRIRk1elvaM/B0oX62rggqFY/ojC6x5rV/Dl7L
 W7xQ==
X-Gm-Message-State: AOAM532xe7IllhKRlb6qMLW8jWdgD1/2ljgnZNm0ou9HGxyQCZMXPn2n
 tylB3q5NJaEO2XRDbxzeG2vqeezamvxxmCiPkccdy4yjBoqSQ44PdXf26dwCjglNG1nHXvKrEZS
 GvURk+yMGLbtL8ME=
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr307998wmm.170.1613086674869; 
 Thu, 11 Feb 2021 15:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSW5AfDEyxtddyz06aURuu14YqaQjD9V9uptpv3m5T0znuBhoPgyIOrXvP/LiVHyxW44FhvQ==
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr307990wmm.170.1613086674750; 
 Thu, 11 Feb 2021 15:37:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t17sm11587214wmi.20.2021.02.11.15.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:37:54 -0800 (PST)
Subject: Re: [PATCH 6/6] tests/acceptance/virtio-gpu.py: preserve
 virtio-user-gpu log
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-7-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f99d48a1-cef8-8ef6-00e4-55bc302538da@redhat.com>
Date: Fri, 12 Feb 2021 00:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-7-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:01 PM, Cleber Rosa wrote:

"Preserve log" ...
> At location already prepared for keeping the test's log files.
> 
> While at it, log info about its location (in the main test log
> file), instead of printing it out.
> 
> Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.logdir
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Using full sentence:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


