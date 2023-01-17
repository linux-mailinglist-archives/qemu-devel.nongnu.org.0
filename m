Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97466D3F7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 02:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHbAh-0001Ml-7O; Mon, 16 Jan 2023 20:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pHbAe-0001Mb-U4
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 20:53:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pHbAc-00053k-A1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 20:53:52 -0500
Received: by mail-pl1-x636.google.com with SMTP id b17so24522969pld.7
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 17:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P1cSErYZX5+X7R5aRv8JSqU/19dByDwatqtQpsb7Pi4=;
 b=Lm3J8QRNaaN0sbvT+C9rCvYg5Hc57uUYUbCol37kVWGoGWP0Uy4S0iwaaIq/VMYnii
 HGIN0SaoUUepJRxIUIIeTfDwFWNhNVLu2YUgOlqdca8brQZ77wgCcAwPkiQkETk/583e
 UwkV0YK3R3wnBdQP8rFNcRjm/MZHVRo0Z8xagNgj1tOQM6LgKp1hX+4QeCYdy1R1mCxi
 JOoRNpdzaeS5XRNavK0RxnbHzDeisI9HurOOCxnL//1VEkzkx//GPW+zbCO+xX6NkK4w
 JnVgCrykcYSKQRcqZFNnSZvbFB7cwvo2Q96g3o6x+DvhcY+8xFLDdhzONDjOOZlDEkBM
 bzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P1cSErYZX5+X7R5aRv8JSqU/19dByDwatqtQpsb7Pi4=;
 b=ppUYWdYEu8JcIOIKMj7Hx77WSaa14h9w05PI7rIfxeUz91DYxwdLdA2cWcEZZCF07Y
 pQqZZV6+1z2JV5U8SOJp+FdapFqA2LkIErMgmB/0O8gDkHUKXXHCFSM66vZaF3hXI65A
 leNgvzbqJEm3uijEd360kV2CFLwM8f+wRGTt0dFwzYQOx8liyDuZ1rTML4Y71srSfq9S
 sBeE5s3s/ZiUZW+2KHkNEhSzP9B7NER6HWlNPDdctkMP/04Mhr+dvPoaoP1JIYsTAslO
 eoZHR1/Qd90HnmLJv3AJIbXIiCCbO/+TnxcfITzEGWnaFttB0KYXMPpO2X7q3AZDleBZ
 F6XQ==
X-Gm-Message-State: AFqh2koD+03L3t7vwYFFd+EwKCdL8fxAUF5o4xPvPvU+qQ+toaH7Ujqp
 69yTjzCkGix1vsszkttoPeV2xA==
X-Google-Smtp-Source: AMrXdXtYtR0qxqdxk+d826qcvr6Ij3L5I1+RHtpz3iMRArzKCZc1L8EuSlDlvdeSFYcX/IQ6TCNGsA==
X-Received: by 2002:a05:6a21:3a96:b0:ad:e5e8:cfe8 with SMTP id
 zv22-20020a056a213a9600b000ade5e8cfe8mr1202644pzb.48.1673920425878; 
 Mon, 16 Jan 2023 17:53:45 -0800 (PST)
Received: from [10.3.43.196] ([61.213.176.7]) by smtp.gmail.com with ESMTPSA id
 m7-20020a63ed47000000b0046fe244ed6esm16181680pgk.23.2023.01.16.17.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 17:53:45 -0800 (PST)
Message-ID: <306d8861-f23b-7100-63fc-1645364bb354@bytedance.com>
Date: Tue, 17 Jan 2023 09:52:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: Re: [for-8.0 v2 00/11] Refactor cryptodev
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, eblake@redhat.com, armbru@redhat.com,
 michael.roth@amd.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221220103602-mutt-send-email-mst@kernel.org>
 <e91ab7d3-1a5a-08f1-cfbe-500885abb1f2@bytedance.com>
 <Y8U0mmAUGGiabJaF@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Y8U0mmAUGGiabJaF@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/16/23 19:27, Daniel P. Berrangé wrote:
> On Mon, Jan 16, 2023 at 05:53:07PM +0800, zhenwei pi wrote:
>> On 12/20/22 23:36, Michael S. Tsirkin wrote:
>>> On Tue, Nov 22, 2022 at 10:07:45PM +0800, zhenwei pi wrote:
>>>> v1 -> v2:
>>>> - fix coding style and use 'g_strjoin()' instead of 'char services[128]'
>>>>     (suggested by Dr. David Alan Gilbert)
>>>> - wrapper function 'cryptodev_backend_account' to record statistics, and
>>>>     allocate sym_stat/asym_stat in cryptodev base class. see patch:
>>>>     'cryptodev: Support statistics'.
>>>> - add more arguments into struct CryptoDevBackendOpInfo, then
>>>>     cryptodev_backend_crypto_operation() uses *op_info only.
>>>> - support cryptodev QoS settings(BPS&OPS), both QEMU command line and QMP
>>>>     command works fine.
>>>> - add myself as the maintainer for cryptodev.
>>>>
>>>> v1:
>>>> - introduce cryptodev.json to describe the attributes of crypto device, then
>>>>     drop duplicated type declare, remove some virtio related dependence.
>>>> - add statistics: OPS and bandwidth.
>>>> - add QMP command: query-cryptodev
>>>> - add HMP info command: cryptodev
>>>> - misc fix: detect akcipher capability instead of exposing akcipher service
>>>>     unconditionally.
>>>
>>>
>>> Can we get ACK on QAPI things please?
>>> Thanks!
>>>
>>
>> Hi Michael
>>
>> I pinged QAPI maintainers, but I got no ACK.
>> Could you please have a glance at this?
> 
> I am /not/ a  QAPI maintainer, but I've given some review of the patches
> that touch QAPI.
> 

A million thanks to you!

> With regards,
> Daniel

-- 
zhenwei pi

