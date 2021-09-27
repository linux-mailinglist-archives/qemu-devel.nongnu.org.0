Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE3419629
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:22:11 +0200 (CEST)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrWE-0001iJ-R9
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrMv-0003i3-J2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUrMq-0005y8-Ja
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632751947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0W1zZa1Ca8BxENToBjGRq0iFBpjVy+dmwg+/ojrsrEI=;
 b=QGbAUd3j/zSvcF5PnrPthI6tZSJJqfPqTzbFupabPaLazhsRPyERj+bEOyCSokYLD/hpyj
 ncMdX3iPhu5cqI3KqEHc8jqJcqpNnwcN0hUG0n+DQ8njdbQ9TkChIklPtQT576SMkeC5M7
 B8F6nUdlJOQA3pmMaWPwO93DF03urcs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-wfAYSL-1MfyO4T6AvkGAqg-1; Mon, 27 Sep 2021 10:12:24 -0400
X-MC-Unique: wfAYSL-1MfyO4T6AvkGAqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so14244702wrh.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0W1zZa1Ca8BxENToBjGRq0iFBpjVy+dmwg+/ojrsrEI=;
 b=DvQSpwDm7aaKFEkZBj/YxtYaRoBLLYBnhBI7xairnflBRCimH+zg4YQcyEEIW2zgVg
 bj4N66IFhqT9pAlDU30WgJ6c60ygNXxbewjgEbRTZn2RIDcbcsOmYtiTvIXQmxCAvFUG
 EwbTJbgotXEikP4slZUAc4EYjeP4QKYdL2EAIwV2zHGZWiYoYWJEdBR5z26cCZljaG+A
 nEEcIliziK3LiAHV4/EVHcxYQCbv6Uua0ICYau9KwH5YymIgR4SyV02Torfaa66Ium6U
 1vto7Rye9ODtKOAZ5iZr+dL1fidGPy3EkrmJrOxVHSbQ7Z/+O2vyM0mF6nBMFTVyAJC0
 C9ow==
X-Gm-Message-State: AOAM531r/+aPJhc5GuNA6rr4Z7tuw1rlWj3yQqTzvXH3Qkek1+UlO/AY
 NVecSod8aIutDM8jxJ9RReoNMfgQMfNIwqc1r0Zqtlg8LV6nW3wBgQ9u5YoUVsQKFdBMbbucFtu
 ckBh+k49elk01guI=
X-Received: by 2002:a7b:c859:: with SMTP id c25mr147970wml.154.1632751943604; 
 Mon, 27 Sep 2021 07:12:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4g9IaAq0QMcLCE7axyzt26bIrkQ9kh/UBCbl0SUhALrnY2+PWbcdjB2e52hQN4N5TtIo8Pw==
X-Received: by 2002:a7b:c859:: with SMTP id c25mr147941wml.154.1632751943378; 
 Mon, 27 Sep 2021 07:12:23 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k4sm16840591wrv.24.2021.09.27.07.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:12:22 -0700 (PDT)
Message-ID: <fe982e8e-5ead-5be7-48b3-3c962960f21a@redhat.com>
Date: Mon, 27 Sep 2021 16:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/6] avocado_qemu: tweak ssh connect method
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210920204932.94132-1-willianr@redhat.com>
 <20210920204932.94132-5-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210920204932.94132-5-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 22:49, Willian Rampazzo wrote:
> The current implementation will crash if the connection fails as the
> `time` module is not imported. This fixes the import problem and tweaks
> the connection to wait progressively when the connection fails.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index edb9ed7485..c3613f9262 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -13,6 +13,7 @@
>  import shutil
>  import sys
>  import tempfile
> +import time
>  import uuid
>  
>  import avocado
> @@ -305,8 +306,7 @@ def ssh_connect(self, username, credential, credential_is_key=True):
>                  self.ssh_session.connect()
>                  return
>              except:
> -                time.sleep(4)

10 * 4 = 40

> -                pass
> +                time.sleep(i)

sum([0..10[) = 45

The described tweak. Almost the same, OK.

>          self.fail('ssh connection timeout')
>  
>      def ssh_command(self, command):
> 


