Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649492D7FF9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:27:04 +0100 (CET)
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knp0I-0008Gt-HD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1knoka-0002cu-SQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1knokU-0002LB-Mw
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607717438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQZv72fM3esNNv9lIC3wtkIw3XptRtEucGnbqfc2VVc=;
 b=SDjKoQY5EcjMTYxQ2TjY2L/YzZEB6jFtxxhlSfR6t66C8ZftO2FuKVmMq1xIRyzBgKALeK
 nTSe5B2Yoj+obm1bL0M6LSIwEi15vfnw2j4Ob/fBfGowcn7v+RJSlgxkvOUrLB2JBL24we
 KbJA8uUkh4pSHeKW2D2zSdYo0VPGcP0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-p8d5Ir_hNLuG9LfC3LYKyA-1; Fri, 11 Dec 2020 15:10:37 -0500
X-MC-Unique: p8d5Ir_hNLuG9LfC3LYKyA-1
Received: by mail-qt1-f199.google.com with SMTP id v18so7283128qta.22
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bQZv72fM3esNNv9lIC3wtkIw3XptRtEucGnbqfc2VVc=;
 b=VPRAt/ly2wWalU4rGQIpLok92BfKVgJI1C6L4AAp/SjFhn+aSpUtcVx8UCpU114fiu
 gGYF8jU6Hi0Ci8w6z4Ara7wJdIvBZrfzI2U6AkFFGTxrcKsyjtv5pksda/1omp9Y4xLj
 pKOYyfPNZxdPcuf4RP8twB97HQEYY9Q2dJbTBJRmdTuBtOggDLApQaNWiTMt3/wKnT5d
 1JnfwhRcJPeraacgsCHY2Dc5QmpkKHfMngyml/RX14oUyqSe5oPPtwvUptqd9TfR21e9
 BG4f7tKBaLcv43dsK8XtMBdFGhprgxoiGAA9iotNCZH42cglRObMXus3abyCSmibo4QP
 Ap6Q==
X-Gm-Message-State: AOAM532yE0b2l9l0ghgevUEv294W8O2K3BVZf0lkMnLV6rPQUaaIfaSu
 zE8uKStg/s60nZ4SPzppm1G3jBNK5jz3iaKrc4W0+rSOc2MytQfBSEoJ9mkaXY2ZauMVQapRbZJ
 B2ZX7oLMn68Mvxxw=
X-Received: by 2002:a37:6f04:: with SMTP id k4mr18938328qkc.426.1607717436342; 
 Fri, 11 Dec 2020 12:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW7VtcULHviKbSKLUIlDDGTVGKe6IRKmYQ2lWbkrWz77mbvAwusYnLltglMWCcKPNhfCXgGA==
X-Received: by 2002:a37:6f04:: with SMTP id k4mr18938300qkc.426.1607717436119; 
 Fri, 11 Dec 2020 12:10:36 -0800 (PST)
Received: from [192.168.0.13] ([177.194.7.8])
 by smtp.gmail.com with ESMTPSA id a35sm8316530qtk.82.2020.12.11.12.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 12:10:35 -0800 (PST)
Subject: Re: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on
 s390x
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
Date: Fri, 11 Dec 2020 17:10:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211173134.376078-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 PM, Thomas Huth wrote:
> Add two more simple tests to check that virtio-rng and virtio-balloon
> are at least (very) basically working on s390x.
> 
> Based-on: 20201204121450.120730-1-cohuck@redhat.com
> 
> Thomas Huth (3):
>    tests/acceptance: Extract the code to clear dmesg and wait for CRW
>      reports
>    tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng via
>      /dev/hwrng
>    tests/acceptance/machine_s390_ccw_virtio: Test the virtio-balloon
>      device
> 
>   tests/acceptance/machine_s390_ccw_virtio.py | 59 +++++++++++++++------
>   1 file changed, 43 insertions(+), 16 deletions(-)
> 

One observation, test_s390x_devices tends to get longer and difficult to 
debug in case of problems. If a test covers one specific device type, It 
will improve readability, flexibility, and debugging. In case you don't 
want to spend time breaking this into multiple tests, I'll be glad to do 
that after the whole series is merged.

As far as code concerned,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>

Fetching asset from 
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices
Fetching asset from 
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices
JOB ID     : 8ba8e572f2582f9a48f2542423342e51e257db97
JOB LOG    : 
/home/linux1/src/qemu.dev/build/tests/results/job-2020-12-11T15.01-8ba8e57/job.log
  (1/1) 
tests/acceptance/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (7.89 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 8.03 s


