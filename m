Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781BF58CC73
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:00:04 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL66l-0004Eq-9u
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL64I-0002lr-Lb
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:57:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oL64G-00016S-Qr
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:57:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so2036189pjo.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GxnCBQdZ1FhxZPSW3aA0efqdhRsKLHGq4mEKi7aEzqs=;
 b=dRVP8uCL/SL99ZqRdehVE6wQuFBFF8JTUFlWZfyjDIMggntZUI3TX1mCfDvxmjsxXQ
 bKg7lYPmrdtUI/9vJkPMgIRGYvHrZ+1l5oLp9LiTyoc+5Dp31STwKKR3BbPY2ziymn39
 CRip4GMXj7l3nYNRIUDDfm+9oEO9L5D62xJUL6AspMKY0jRoWuuwnaeG72F99oNY7uS6
 05vSKgHEGxXqWEIpDp4+tKKO81MwG+YKTxNBGzhOXz4dH8IK0MwObNuEl/X6PiBaQ4tz
 RY9q7pXWFwU4Dj7GeqXONNmVHRfz4FsybKDXgz/O2vQ3m5yn9P/DWOBLqLO2ckuiDsJB
 8I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GxnCBQdZ1FhxZPSW3aA0efqdhRsKLHGq4mEKi7aEzqs=;
 b=bN5rmaQbmHrU6oTJikuH4kyEhdEUxrAxWYjXcKehKqJsKL5yYxpEfuLskChqywBAo+
 cWikbQ4nm7Si81EmaLyuXZfyQ9TITCEAfoYu16CdCq28Qfl+i6zR4MeqJRsomx+hn0iE
 8GCNVbvEAz2a+D1jVPwp/Fics/DiGbEyIuzt9EP0/dFeW2A3F71uTZ55U3My/w4tC1dw
 elpyUrHC0A9TKvdMYrztTt3JQy0StcCpjGzAUM+x07Ls0s9ggzjE4zr0QQYaIYMJ8XcC
 BREiiSG8f8ggfVF3bS5s9TJcMWV7M+28Zevg8dWyIIryQYJ9iHQEV9KbgnECPnhX1hiM
 aWmw==
X-Gm-Message-State: ACgBeo3Tdsz08PZVUi6dBz7S23yA/rEqT4LMMG4PY4Tvsq50LPcwgnp7
 c8nZM2DSojgUi26G5uSSgcfIvg==
X-Google-Smtp-Source: AA6agR4ZwUpw7PJpHiQkOoz7IrAK+J3y/H9eQCs25KuggnAlPC1L0087+SUFZnO5E/AXjd9GkEY7EA==
X-Received: by 2002:a17:902:f650:b0:16d:473b:903b with SMTP id
 m16-20020a170902f65000b0016d473b903bmr19166560plg.174.1659977846539; 
 Mon, 08 Aug 2022 09:57:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b?
 ([2602:ae:154e:e201:6ef5:1d2f:d0f8:3a7b])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a621b0d000000b00518a473265csm8801812pfb.217.2022.08.08.09.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 09:57:25 -0700 (PDT)
Message-ID: <e23a7acf-9c20-05e3-c186-d7865ed8415c@linaro.org>
Date: Mon, 8 Aug 2022 09:57:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/4] Fixes for QEMU 7.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <20220808050515.1283174-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808050515.1283174-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/22 22:05, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit c669f22f1a47897e8d1d595d6b8a59a572f9158c:
> 
>    Merge tag 'pull-la-20220805' of https://gitlab.com/rth7680/qemu into staging (2022-08-05 12:55:53 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-08
> 
> for you to fetch changes up to 407634970dc5dba9330c360cfdc4e69e7aea3b37:
> 
>    tests/qemu-iotests/264: Allow up to 5s for the BLOCK_JOB_CANCEL event to arrive (2022-08-07 18:51:35 +0200)
> 
> ----------------------------------------------------------------
> * Fix booting in the s390-ccw bios when physical and logical block sizes differ
> * Fix the replay-linux avocado test
> * Relax a time constraint in iotest 264

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Pavel Dovgalyuk (1):
>        tests/avocado: fix replay-linux test
> 
> Thomas Huth (3):
>        pc-bios/s390-ccw: Fix booting with logical block size < physical block size
>        pc-bios/s390-ccw: Update the s390-ccw.img with the block size fix
>        tests/qemu-iotests/264: Allow up to 5s for the BLOCK_JOB_CANCEL event to arrive
> 
>   pc-bios/s390-ccw/virtio-blkdev.c |   2 +-
>   pc-bios/s390-ccw.img             | Bin 42608 -> 42608 bytes
>   tests/avocado/replay_linux.py    |   1 +
>   tests/qemu-iotests/264           |   2 +-
>   4 files changed, 3 insertions(+), 2 deletions(-)
> 


