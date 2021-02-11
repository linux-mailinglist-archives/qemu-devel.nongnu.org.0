Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8383193D8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:04:52 +0100 (CET)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAICo-0003G4-Sm
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAHwy-0007th-SK; Thu, 11 Feb 2021 14:48:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAHwx-0008Qh-40; Thu, 11 Feb 2021 14:48:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r21so5339726wrr.9;
 Thu, 11 Feb 2021 11:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y1b+4hHf6ErfIBxKQJWdmhNKGtAw6EfCy+pEo7OPJ/k=;
 b=X0vrLr9oiX+y7/yTfeuJs4lVqKQ3Ar4wXzBqz+bubX2fchE9quwNMyZSETAdNu1ysf
 k1Sl/z3ScQelxhjek4O+ML9cSV5FNVi/mpGAhrdnbaUCQw4ADEPSiANnayLwHUaAm4sg
 rTgm0hrN8H4/h59ZJZCGF5hD8BwKGfQRpEGO03H4uhMJytdBpckpCwSSoa+4xx52+9w+
 TrpHyqtnQN/dT2zSi+aacL9QW/+dpDpp/6t7D0fHA9yjw12uXgDDxSg25fA/R/lheD79
 yNSFK7tSnHfKTuq9AuaGeCAFFz9D+RtDftofkz7KFjuT/SBP/D+C13sJB1swypX44s9z
 4Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1b+4hHf6ErfIBxKQJWdmhNKGtAw6EfCy+pEo7OPJ/k=;
 b=Z0Kg5qZkGLZRAHS2eu8qIOp1qxN0uSfxeHiUCIzRDO5rSZdkSWe/hlxi1D7t9SvSd7
 BmCfhVtYRuqGOxd6KgrAlCcwqotTRgmMKW16AmIgntfqhcSUQXO4kY8FT9BFkZ28hI5b
 bwyelVVOcJitLvHb4/6E/uMQNdP+igcZx4f4wEifuZcUnOhnLlNjS5sEzrqFL2yh63kh
 xeArfrJgWsGTWJcDDWxd+7XsLl2FENtj3e0Mp0NGXZIqEGxGLWchlQBSS9dIUmZfQ7S1
 TLLzVi95c7sexs0qiUBsTx9DBH8Ho1cn+Ypj1HYrnisXLk1fmka/rLiRQTDvhKxJK44G
 Cbdw==
X-Gm-Message-State: AOAM532oyqaLnM4owFyJI27OGssdj4wBicvloA/yMGuljIeD311F/laW
 JMAvmexMgT2OYd4sux1v3BE=
X-Google-Smtp-Source: ABdhPJxEAESnYxYH1wOHaSAQrlcyVI4Y7IAKb/G5cEMBnroTPS4br9sor+74ow+0aUR74myJKAM1GA==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr2321611wrr.191.1613072902965; 
 Thu, 11 Feb 2021 11:48:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm2424322wru.80.2021.02.11.11.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 11:48:22 -0800 (PST)
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 Alistair Francis <alistair23@gmail.com>
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPLD68GXeMyU_LTVYjv8YUXex4wvyAnHkOgu=PK48pP7w@mail.gmail.com>
 <CAA8xKjWojtJgOM-M6NYvWH5cPhEhxSdcWQ55Nz-24MstOr=xYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75b11565-98fd-b242-2b32-0c04e5cce181@amsat.org>
Date: Thu, 11 Feb 2021 20:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjWojtJgOM-M6NYvWH5cPhEhxSdcWQ55Nz-24MstOr=xYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 9:52 AM, Mauro Matteo Cascella wrote:
> Hello,
> 
> On Wed, Feb 10, 2021 at 11:27 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Tue, Feb 9, 2021 at 2:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> At the end of sdhci_send_command(), it starts a data transfer if
>>> the command register indicates a data is associated. However the
>>> data transfer should only be initiated when the command execution
>>> has succeeded.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Fixes: CVE-2020-17380
>>> Fixes: CVE-2020-25085
>>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>> Reported-by: Sergej Schumilo (Ruhr-University Bochum)
>>> Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
>>> Reported-by: Simon Wrner (Ruhr-University Bochum)
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
>>
>> Isn't this already fixed?

The previous patch was enough to catch the previous reproducer,
but something changed elsewhere making the same reproducer crash
QEMU again...

> It turned out the bug was still reproducible on master. I'm actually
> thinking of assigning a new CVE for this, to make it possible for
> distros to apply this fix.

It sounds fair. Do you have an ETA for the new CVE?

> --
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0
> 
> 

