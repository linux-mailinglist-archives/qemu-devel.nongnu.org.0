Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07CC3308FB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:51:53 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJAgC-0001WL-9c
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAeW-0000kS-J9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAeT-00012E-K8
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615189803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdilp73AuirF724i5VenkGAx8C9V0SGJGdomHDOsg+U=;
 b=IT5NhmaLTPc3FH4rr9a9zm1lDvnHcpn9velOHZbft0ozEFy+EKLfjSMNbqL3GPma3IaGiK
 Ozd7ACgCPL9GDbVAe3l0ZkjxlK6ngwqLfo5Md3xXOGxpg0GyEWCqTfhIL3RmWZUX0obgy/
 yTr81SoOLMZgKRVXRmWFvrEThkCY8C8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-6Ueydo-jPL6SvZ0CfOF3EA-1; Mon, 08 Mar 2021 02:49:59 -0500
X-MC-Unique: 6Ueydo-jPL6SvZ0CfOF3EA-1
Received: by mail-wr1-f69.google.com with SMTP id p15so4406543wre.13
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 23:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdilp73AuirF724i5VenkGAx8C9V0SGJGdomHDOsg+U=;
 b=KQyZDhMTOEeBTxIV+RGZE0dvFoVp1s/QlzdVVPNGfjdqi+rv8AOu12CepqRYTDvfAz
 kyC27cmRnVXtyoRR6mrDWosktWDmJjW7UKDpU6svwC5Ml6ZAYlSI96mi3KoYvO+5EHYS
 svmOkS5AHTYlkS4a2teFO2JgAUXXdw0uumEnywtnCdeIPHPn4vcn8OJdLRae3ywY9LPf
 7EN9OuqKOp6MuMZc239lA20E7PuuWigVOzeFpKqXTQBW9XsWB0nG14z5txxmk4LD7JX8
 s5aHwjtuihupfuRRlfxnc+msV2UmD8sCUIprwwGl+cHIHx0Z8lzxoFKUPCm6O3gXz44B
 /Bvw==
X-Gm-Message-State: AOAM532BlYdSKGS487yTFEP3gdm2Ln1ZbDKfIxxjTRAg8KDqYIszbkUg
 g/xfplHYu7VohZba++cIH+QwucYGia1mbyho3v2PP3vJnwIQVffNWBuRdNhTv6a/WROS+keZdbI
 s4FFxi+djRoBkju4=
X-Received: by 2002:adf:a1ce:: with SMTP id v14mr21781634wrv.228.1615189798788; 
 Sun, 07 Mar 2021 23:49:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwXnnjwU0DMy80ATOfQmnOrL21wGXzJUOSg5M05S3+Hw60dHCZSfpqW65dmZazuSEM1NAx8Q==
X-Received: by 2002:adf:a1ce:: with SMTP id v14mr21781611wrv.228.1615189798617; 
 Sun, 07 Mar 2021 23:49:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v18sm13873563wrf.41.2021.03.07.23.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 23:49:58 -0800 (PST)
Subject: Re: [PATCH v3 4/5] tests/acceptance: update sunxi kernel from armbian
 to 5.10.16
To: Willian Rampazzo <wrampazz@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-5-nieklinnenbank@gmail.com>
 <CAKJDGDawHKo0=q_psWrSOGVXvDf+QjjM20E29bdbogNfBTUsXg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c4868bb-374e-ec77-a7cd-4ae901e1e684@redhat.com>
Date: Mon, 8 Mar 2021 08:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDawHKo0=q_psWrSOGVXvDf+QjjM20E29bdbogNfBTUsXg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:04 PM, Willian Rampazzo wrote:
> On Thu, Mar 4, 2021 at 5:45 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The linux kernel 4.20.7 binary for sunxi has been removed from apt.armbian.com:
>>
>>   $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
>>   Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>>   ...
>>   (1/6) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>>     CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.55 s)
>>
>> This commit updates the sunxi kernel to 5.10.16 for the acceptance
>> tests of the orangepi-pc and cubieboard machines.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>  tests/acceptance/boot_linux_console.py | 40 +++++++++++++-------------
>>  tests/acceptance/replay_kernel.py      |  8 +++---
>>  2 files changed, 24 insertions(+), 24 deletions(-)
>>
> 
> I think some devs will not like it,
Maybe you refer to my previous NACKs regarding similar changes in
integration tests. Niek is the author of the test and the maintainer
of the machine, so if he is OK to stop testing the 4.20.7 kernels
and test the 5.10.16 from now on, I won't object.

> but, for me, it is fine as we
> don't have the old kernel available anymore:
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 


