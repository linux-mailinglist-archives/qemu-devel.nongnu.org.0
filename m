Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BD66E47B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:09:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpR7-0006V9-Gj; Tue, 17 Jan 2023 12:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHpR6-0006Ux-4n
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:07:48 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHpR4-0004HS-3m
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:07:47 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-4d19b2686a9so303819527b3.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ImkKhV1ueoeYjpoeKaj7bXF8w5vJCvG8EZTVRBeegCg=;
 b=NywC+X8hd/rQn2ulaYiZdqKSNvKJ8oxn2JTcOusZYyudhB3J6lWadWkfkU+/oGUVv3
 OFxMBgJBD/TbTa5FIABvuJDJw391d9iu5+js+34kSiSGcwVuT6j1mWOOwOLS8Pm+81SH
 z3bCl50SBQaewjghUqZBF5wJQMT86pV5rzMMcHMzHGy/EC1WbcRCC/BSycwm/qZBsQFk
 LiFP89+yW4oMOXI8Q+UFASymxahts0PqOzF+cT1q7Qbo5NX9zhf8m4vLIQrypMplKNxH
 6lQ9+1FNjkq3Voli3NdH29hdQFsd7qNwjM6bXFEc+mJX2JfZ/2KPc8G5Io8wY4XhVFbr
 UoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImkKhV1ueoeYjpoeKaj7bXF8w5vJCvG8EZTVRBeegCg=;
 b=xWgX1iugK7AzMS9juIXd9G7ccTjSlhHtJ5I3e77DfX0hR+xSksiUxs9sndYN4LimGj
 hFV4m/P4fsLjCnxK/B8HwiAW8C7/xQVP1kTOi74uWH9OnAwxey73Of+EIimP/BZaY6LO
 SGIua0mYExJqWzEyQQugGpUCEITQv41fUBp5IdLEqPMGN4brDHzZdt6odPzSRdmdtG2V
 llCFRQWTQm1Uh1+ZZMAvvOxKWAXYKcNpPtOM8odcPrlhEuUxWE6T2wZ6CSYSGnr67g/R
 aobPrYLtbZZIs7OTYkGDid5bN+ZzbQkD0C7anRWPaGeWVsMMzwC8+rl3CJZUfR1Bg3Nr
 RftQ==
X-Gm-Message-State: AFqh2krLZTlcd5gvWPSS69iHfmiR+3iSQHHnHCvAa/bnfWhC2Bicd7U4
 9tOxOzeQEeMmfTAw7uHVXZs=
X-Google-Smtp-Source: AMrXdXvZ7mwIhVj86Bq/tRS3w3TXnQFyGflqFn7wswUGIK/0ee5Hb3ySVoKAuddxbT5H5dszqygS8Q==
X-Received: by 2002:a05:7500:6309:b0:f1:8212:2afc with SMTP id
 ib9-20020a057500630900b000f182122afcmr306410gab.11.1673975263530; 
 Tue, 17 Jan 2023 09:07:43 -0800 (PST)
Received: from [192.168.1.14] (pool-100-36-133-78.washdc.fios.verizon.net.
 [100.36.133.78]) by smtp.gmail.com with ESMTPSA id
 64-20020a370c43000000b006cfc1d827cbsm20250521qkm.9.2023.01.17.09.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 09:07:43 -0800 (PST)
Message-ID: <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
Date: Tue, 17 Jan 2023 12:07:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: "John Berberian, Jr" <jeb.study@gmail.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
Content-Language: en-US
In-Reply-To: <Y8UXR6uqdv22auoE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=jeb.study@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Apologies for the late response, I was traveling most of yesterday.

On 1/16/23 4:22 AM, Daniel P. Berrangé wrote:
> When we introduce a new QAPI format for migration args though, I've
> suggested we drop support for passing exec via shell, and require an
> explicit argv[] array:
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg01434.html
> 
> For Windows since we don't have back compat to worry about, we
> can avoid passing via cmd.exe from the start.

I think we should keep the behavior the same on all platforms. If such a 
change is to occur, it should happen at the same time on Windows and 
Unix-like systems. Platform-dependent ifdefs should be used to overcome 
platform-specific differences (e.g. the location of the shell), rather 
than give one platform entirely different functionality - otherwise we 
introduce needless confusion when someone accustomed to Linux tries to 
use an exec migration on Windows and it doesn't work the same way at all.

Best regards,
John Berberian, Jr.

