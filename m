Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352D5F848C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 11:08:42 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh5p2-0000pH-Id
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 05:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5lN-00062a-Do
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 05:04:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5lG-00077w-UU
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 05:04:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c7so6518959pgt.11
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBb01UEwF9Go/TmHvZgqrzEmHtTHqg+6sqOcR85UWNo=;
 b=YH2zERnFseuCc4d9ZLx+y43ibGy5MoynRATyhEfFqQeNp8rhFPdDgyJVWIxQpcNl2x
 cC8w6hv7xWGDW5ViS12G4qQjrVxxHODcMkA8H6ed9TutCM20TcpkhDpMG8zfe2FG4iUo
 F5VcTRFRLl4If5tO6SrCuHuwyAkDlzO/8BuRclBJF5rcG3Uqx02+9iZ+OWCAuOar1iln
 I2JVTIvJBocgu5RkxELg69/xO0n7AaoUaa5Tx3996dknNkIkYPzzfhQgxK81TeXsrweZ
 n+Bo+BeEwy6gvbJb4zFi5/galc6OHe64xvkDSwjN48rWgzaxSGmXfuUWDOdSlja9LY6k
 uK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oBb01UEwF9Go/TmHvZgqrzEmHtTHqg+6sqOcR85UWNo=;
 b=ObzwpXpv41LQIodrB2qiR7Dz4NwsK86ErDEaBwznaN4CpBnJoJ8j4SW0K/ejfb/DpH
 Ic5v5+8rInTUy27pxnVLKYVUhzwzOpmZ5BMbNiktSMrXWufNbmfdxuogotOx4B4huThf
 bUTJBbA2Jr593X61x1KrRqjqkKZelxcdBoZ7OXcFyGI1TpvmyRNS8XrQxoBVTqHc3KBX
 o7pVz8hROypUpeX/m9KXbd4b91V6KTH5RcCycEEONSmF9iG5a/4ILgUH3L0y7iRSpB1S
 bCe9eUBWlbKs0P/phHGs174pJOlFA5kYx2mbYZ70aa69dLi2FptSTQ/yt1pgYb+XwYU7
 Dl3w==
X-Gm-Message-State: ACrzQf1Y+8XEMv4kRllsZ345Dw3jGp0AaAA+p9AMfGs9I1AArQO/cf+w
 v1eqrJ0Wp42/MWlZwJCawTbGeg==
X-Google-Smtp-Source: AMsMyM5WC4zc5POsmDmF/RgfpZMLqeFgS5XzeOYY1UI9/Av7cK2x/ElmzDsyl8wt4LcA739t1YNZ5Q==
X-Received: by 2002:a05:6a00:2392:b0:549:be0:cd3c with SMTP id
 f18-20020a056a00239200b005490be0cd3cmr9138454pfc.8.1665219884527; 
 Sat, 08 Oct 2022 02:04:44 -0700 (PDT)
Received: from [10.82.6.144] ([63.216.146.185])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a634550000000b004308422060csm2874664pgk.69.2022.10.08.02.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 02:04:43 -0700 (PDT)
Message-ID: <896cb965-42f3-abf6-98c1-2401d047c3db@bytedance.com>
Date: Sat, 8 Oct 2022 17:04:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Cc: helei.sig11@bytedance.com, qemu-devel@nongnu.org, berrange@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com
Subject: Re: [External] Re: [PATCH 0/4] Add a new backend for cryptodev
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220919035320.84467-1-helei.sig11@bytedance.com>
 <20221007102500-mutt-send-email-mst@kernel.org>
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <20221007102500-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-2.699, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2022/10/7 22:25, Michael S. Tsirkin wrote:
> On Mon, Sep 19, 2022 at 11:53:16AM +0800, Lei He wrote:
>> This patch adds a new backend called LKCF to cryptodev, LKCF stands
>> for Linux Kernel Cryptography Framework. If a cryptographic
>> accelerator that supports LKCF is installed on the the host (you can
>> see which algorithms are supported in host's LKCF by executing
>> 'cat /proc/crypto'), then RSA operations can be offloaded.
>> More background info can refer to: https://lwn.net/Articles/895399/,
>> 'keyctl[5]' in the picture.
>>
>> This patch:
>> 1. Modified some interfaces of cryptodev and cryptodev-backend to
>> support asynchronous requests.
>> 2. Extended the DER encoder in crypto, so that we can export the
>> RSA private key into PKCS#8 format and upload it to host kernel.
>> 3. Added a new backend for cryptodev.
>>
>> I tested the backend with a QAT card, the qps of RSA-2048-decryption
>> is about 25k/s, and the main-loop becomes the bottleneck. The qps
>> using OpenSSL directly is about 6k/s (with 6 vCPUs). We will support
>> IO-thread for cryptodev in another series later.
>>
>> Lei He (4):
>>    virtio-crypto: Support asynchronous mode
>>    crypto: Support DER encodings
>>    crypto: Support export akcipher to pkcs8
>>    cryptodev: Add a lkcf-backend for cryptodev
> 
> Seems to fail build for me - probably a conflict applying.
> Coul you pls rebase and repost? Sorry about the noise.

I did a rebase but no conflicts seem to be found, this patch causes a 
compile error when neither nettle nor gcrypt is enabled - I've fixed it 
and reposted it as v2.

> 
>>   backends/cryptodev-builtin.c    |  69 +++--
>>   backends/cryptodev-lkcf.c       | 620 ++++++++++++++++++++++++++++++++++++++++
>>   backends/cryptodev-vhost-user.c |  51 +++-
>>   backends/cryptodev.c            |  44 +--
>>   backends/meson.build            |   3 +
>>   crypto/akcipher.c               |  17 ++
>>   crypto/der.c                    | 307 ++++++++++++++++++--
>>   crypto/der.h                    | 211 +++++++++++++-
>>   crypto/rsakey.c                 |  42 +++
>>   crypto/rsakey.h                 |  11 +-
>>   hw/virtio/virtio-crypto.c       | 324 ++++++++++++---------
>>   include/crypto/akcipher.h       |  21 ++
>>   include/sysemu/cryptodev.h      |  61 ++--
>>   qapi/qom.json                   |   2 +
>>   tests/unit/test-crypto-der.c    | 126 ++++++--
>>   15 files changed, 1649 insertions(+), 260 deletions(-)
>>   create mode 100644 backends/cryptodev-lkcf.c
>>
>> --
>> 2.11.0
> 

Best regards,
Lei He
--
helei.sig11@bytedance.com


