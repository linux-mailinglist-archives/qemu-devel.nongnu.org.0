Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5E6224E8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osfsB-0000f7-Bt; Wed, 09 Nov 2022 02:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfr9-0000QJ-6S
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:50:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osfr3-0006u5-DO
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:50:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id l14so24499126wrw.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4rnijDnAeAElMiR+cCUbab9N8bv/5YhO4uhULJeH4fM=;
 b=kJ9fnWV2FyhgfNYw5gj2LT5zWV2RX7fUXiO/ADnom1v3hbUvNOHfIK+gCyZGglzdVU
 WjRYeQ2nGCSsT4u/JPu0Qyt0ORRI1AMx3HemKWRnjeMe/QRBlEUQWiPY7+Y/pfY5NARH
 jAzSiKCdzMV9w7pUy/ugzAvpH1rV99ZmgqQxXQEBibXEwnL0QXeBlTGTODuIwoZg90nx
 pd3AX8G6MT46JdIoTNCNhDkHkuNuHFGidcTSsc+WHJVb4s8QB6cGY9bLt36XBz9HjX+H
 I8KKoKlLh0PhR4Xv7n/YbTSZYs3SIQjGW3dijDtAXXJL+/lYN/JVCV4VhIAMLrXxTk5C
 8cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rnijDnAeAElMiR+cCUbab9N8bv/5YhO4uhULJeH4fM=;
 b=msTGhkjqnuW6hYPofxT1x3yl6va9bZT3I/lF6ISJbcp7C6qzTAmN4SslF47rWBrBL/
 qll34USEpGdfcjoUC8pwbPizWwlveW8mFdkQbnGkd0z6M3nte4LnvT4TiQBHfG6dpHqf
 qOTZpXZFOltTGyKZgWlcgjlUwXn6T/LoSN1H+2Xk4Nfgnyqh+ED5VFpUABaVa50vtcNc
 5mzPXe9RymltVRYae6e4FgFOswAOMVe4v9F39yTpNE35iArVaGqIbbQNeHgY+wXmZIHK
 XECZJSoxSQ7JfeboujIQZbEDL6fGQm6Wk+dTk9WD6e7XYlFzsoIQxTtok+TOD2iYglsd
 i7xA==
X-Gm-Message-State: ACrzQf0HcnhEuu6a7Ce/zC1vd/Xa2ciZlxmSEGqcB3YjegbISHwvBHzV
 5BaLmhcVI7Rs85DhbjP7j3zQuA==
X-Google-Smtp-Source: AMsMyM4YnScOBPC2RNxEmt1e/q1U3YPQHS/VJ/YOt0hRejJB7zNQb7y3n4s4LqLIawfrP7ZCbqsVKw==
X-Received: by 2002:a5d:4004:0:b0:236:cc0a:7c64 with SMTP id
 n4-20020a5d4004000000b00236cc0a7c64mr31418515wrp.149.1667980235164; 
 Tue, 08 Nov 2022 23:50:35 -0800 (PST)
Received: from [192.168.63.175] (218.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.218]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b003b497138093sm685216wmq.47.2022.11.08.23.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 23:50:34 -0800 (PST)
Message-ID: <c3881f4d-53f8-22d0-766f-77ab1b0a51d9@linaro.org>
Date: Wed, 9 Nov 2022 08:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, mjt@tls.msk.ru
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair@alistair23.me,
 bin.meng@windriver.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <mhng-33f90530-6bed-4501-913a-0ce40f4d9e0b@palmer-ri-x1c9a>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <mhng-33f90530-6bed-4501-913a-0ce40f4d9e0b@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/11/22 23:11, Palmer Dabbelt wrote:
> On Sat, 05 Nov 2022 04:53:29 PDT (-0700), mjt@tls.msk.ru wrote:
>> Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
> 
> Not sure if I missed something in QEMU land, but those are usually 
> listed more like
> 
> Fixes: 0694dabe97 ("hw/ssi: Add SiFive SPI controller support")

MST suggested once to try to restrict the 'Fixes:' tag to bug /
regressions, as it might help downstream distributions to filter
commits to cherry-pick.

Since it might be useful to have the offending commit sha1 in the
description, when it is simply an omission or improvement I use
the an inline form instead of a tag:

   Fixes the typo introduced in commit 0694dabe97 ("hw/ssi: Add SiFive
   SPI controller support").

Although in this particular use-case it is not really useful ;)

Another example:

   When adding <the feature> in commit <sha1 ("<subject>")>, we forgot
   to fill the API prototype description. Do it now.

Regards,

Phil.

