Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582546A23DD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfjG-0002Ka-8P; Fri, 24 Feb 2023 16:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfjB-0002Gf-7g
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:35:43 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfj9-0001SY-FF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:35:41 -0500
Received: by mail-wr1-x430.google.com with SMTP id r18so524658wrx.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AdK31VQh3zAfOAn3mp01Drk6eshABiV/CmcWjbqpl7U=;
 b=rBivFqOpWaWmXR6LSm3t8SKQiqHZVe61O0o/ZTV0M3X3ZGouoLEUznKzCk9ZhYg+wf
 WBIBAIN7Ef/ve7YsvCD9SyUd4hIqRxvewR6Pn9eHkHfRSgiSvtfAxirBo3CDB5YFFBvO
 NnDD9AU9JNXbv1S5pe7MiWnzpBAlKFaLmLgxsWFtQFDq2XFs9IwA/Kplla6paMUqKW5Y
 df87eNs7nErSK8sd6UtI/0FfMradStvCYDD22NyYICE/88zdCioepXETUaoOHEorRM61
 RUyGcEWcOtnxsLN92zhUb7zpLVUGRkTgJ2g0vgCPBufDlEfhJqSfi7v3Z65mWu3KHHRF
 +s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AdK31VQh3zAfOAn3mp01Drk6eshABiV/CmcWjbqpl7U=;
 b=sc+QwxK39+Cds9FKc2rUxwWSwAchMRVIfRPAUKPQYJCkO9z1LB0G36BKiCG4JinjMd
 xuFBk0i7ZuB5qy1JkDiCL4tBskZBn5mpyjF2ejFaSCsKMwy6C/6j5fnG5xPMybT94aYL
 lcYdZqF3k76YsBP3uL1j0dOoW+05RnKOrtPoaetRynF4kiCxOYrzjVbStagMA15iVOUj
 m+j6NS49F720PlyybYFeHRg7jzqmdUlJyrUd2DKS1gr2MeQ281fGlYY6x+jhY3PhImAy
 MG0ie8k0vE+rZJgf/Y+JqnhNXCzqUHfBSPFz9t3sYXLQ8Th7ReikOUISu0RxbQjAEmP9
 0Slg==
X-Gm-Message-State: AO0yUKVe6k0LUcKmN3W4bp/cFjsRKnyTGNeMJJ6jliEBhCrMRFr01uJF
 lRRe5HiEe4Oq0Ex2sUnpFxUzWQ==
X-Google-Smtp-Source: AK7set+4Be0nMYhestajIyelre28YRnhOjZAE7nZcNo1Png1WcouEj81IwvG8Q8w/ZABS00NGo47OA==
X-Received: by 2002:adf:f50b:0:b0:2c6:e91d:1359 with SMTP id
 q11-20020adff50b000000b002c6e91d1359mr14814448wro.61.1677274537140; 
 Fri, 24 Feb 2023 13:35:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a5d4bcf000000b002c54c7153f0sm16574715wrt.1.2023.02.24.13.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:35:36 -0800 (PST)
Message-ID: <d6280636-d40f-a79d-ead0-4b94a0628f10@linaro.org>
Date: Fri, 24 Feb 2023 22:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/29] Block layer patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
 <CAFEAcA8uYhS=MoOuGpYo90uF7mCa1JH6fapy+qvW8iCsNMmBfA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8uYhS=MoOuGpYo90uF7mCa1JH6fapy+qvW8iCsNMmBfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 24/2/23 19:50, Peter Maydell wrote:
> On Thu, 23 Feb 2023 at 18:51, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>>
>>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
>>
>> for you to fetch changes up to 0f385a2420d2c3f8ae7ed65fbe2712027664059e:
>>
>>    block/rbd: Add support for layered encryption (2023-02-23 19:49:35 +0100)
>>
>> ----------------------------------------------------------------
>> Block layer patches
>>
>> - Lock the graph, part 2 (BlockDriver callbacks)
>> - virtio-scsi: fix SCSIDevice hot unplug with IOThread
>> - rbd: Add support for layered encryption
>>
>> ----------------------------------------------------------------
> 
> 
> Applied, thanks.

Configuring with --extra-cflags=-ggdb, on

C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
version 14.0.0 (clang-1400.0.29.202)")
C linker for the host machine: clang ld64 820.1
Host machine cpu family: aarch64
Host machine cpu: aarch64
...
     CFLAGS                       : -ggdb -g -O2

I'm getting:

../../block/io.c:182:38: warning: reading variable 'bdrv_aio_preadv' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
                                 drv->bdrv_aio_preadv ||
                                      ^
../../block/io.c:997:14: warning: reading variable 'bdrv_aio_preadv' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
     if (drv->bdrv_aio_preadv) {
              ^
../../block/io.c:1003:20: warning: reading variable 'bdrv_aio_preadv' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
         acb = drv->bdrv_aio_preadv(bs, offset, bytes, qiov, flags,
                    ^
../../block/io.c:1076:14: warning: reading variable 'bdrv_aio_pwritev' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
     if (drv->bdrv_aio_pwritev) {
              ^
../../block/io.c:1082:20: warning: reading variable 'bdrv_aio_pwritev' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
         acb = drv->bdrv_aio_pwritev(bs, offset, bytes, qiov, flags,
                    ^
../../block/io.c:2899:25: warning: reading variable 'bdrv_aio_flush' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
     } else if (bs->drv->bdrv_aio_flush) {
                         ^
../../block/io.c:2905:24: warning: reading variable 'bdrv_aio_flush' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
         acb = bs->drv->bdrv_aio_flush(bs, bdrv_co_io_em_complete, &co);
                        ^
../../block/io.c:2991:49: warning: reading variable 'bdrv_aio_pdiscard' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
     if (!bs->drv->bdrv_co_pdiscard && !bs->drv->bdrv_aio_pdiscard) {
                                                 ^
../../block/io.c:3058:28: warning: reading variable 'bdrv_aio_pdiscard' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
             acb = bs->drv->bdrv_aio_pdiscard(bs, offset, num,
                            ^
../../block/io.c:3094:24: warning: reading variable 'bdrv_aio_ioctl' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
     if (!drv || (!drv->bdrv_aio_ioctl && !drv->bdrv_co_ioctl)) {
                        ^
../../block/io.c:3102:20: warning: reading variable 'bdrv_aio_ioctl' 
requires holding mutex 'graph_lock' [-Wthread-safety-analysis]
         acb = drv->bdrv_aio_ioctl(bs, req, buf, bdrv_co_io_em_complete, 
&co);
                    ^
11 warnings generated.

