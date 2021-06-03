Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2239A920
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:26:25 +0200 (CEST)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor6u-0002Mb-R3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor5x-0001RQ-2q
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:25:25 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lor5u-00051V-Iv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:25:24 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k15so5402653pfp.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FXjBrc/n5IOancEwJAEX2KJhF6ui+4lM02FJ/reccQ4=;
 b=ROxMUNwyqBpQQMtig1iK88FbxB7aUyRgr8WOCH9llZzHa1H8NGEcYHWvk/zV4fhU2J
 gx0xXCFAGuJVh6ZhSukQH55106hBstH8rKXxLmNxGAOqPfKlnpeZwfjS4/JnXLlneJpU
 24AJojMs0D3ek8zqQsg7dn2LYMNa5EYDxcuIzB35U6C9AUUJFOmolt9v//lb0CUdyIKU
 a7ShzU03KTqmIiwpN4Cfz4pfYrqpHnxoxr06+dv1IfM48ach1yfMkV9ex0VT9bVY3Mqv
 806npL8dFqL+2Z4gR3xcJJU9MnyTv/ifKAFXn61oM2ANpH3mS4u/gYQL1n2hFzBA+OZQ
 bnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXjBrc/n5IOancEwJAEX2KJhF6ui+4lM02FJ/reccQ4=;
 b=D3AzYY1Gm6nWsLdpZodu6W06Sh/IpLFzdmXnYro+uJAgfELJA2h1zUDzUvXgwwylSe
 MkXc6jModJpA0yppYKVNcqomKsI88i/qN6B92KBZPuAkXp/RXWNoTMjZsqgvj2lM8a9d
 OG7nPDYSRZ4JJXzvKD+NZotsAFuzvrlH5EhtWJH4js5u1YrlSners900QViNT5pYaglF
 vgwe3UzZuPl/yA9O6shVzHPNXv83Ln0j+45oPD5soZSURLVpHzC34Be2uFeVB0rD42Qm
 ye9yN7gmvAP2iK58xkhnlFbKhwdDDnwY35TlvBrWT2HUyZIPDYQIB2Ft8emUYnqf6Rw7
 Hniw==
X-Gm-Message-State: AOAM532wW9Jas/CC3nWGEp4Ik7jorjQ/+K8Ic1WRt8asu34XXqOdVqua
 7Tj9VA4n9Cb/dkj8llSRrVs6cg==
X-Google-Smtp-Source: ABdhPJxR2MO9MzUVYel5OjlGYeNh5eZmdLZHRb+IPIt2Bz8/T0ZGKd5AjDA4RlzyF2oH7rhuXZdSSQ==
X-Received: by 2002:a62:d411:0:b029:2b5:fce4:7e64 with SMTP id
 a17-20020a62d4110000b02902b5fce47e64mr117924pfh.15.1622741121205; 
 Thu, 03 Jun 2021 10:25:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h13sm2444668pfv.213.2021.06.03.10.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:25:20 -0700 (PDT)
Subject: Re: [PATCH v2 09/26] s390x/tcg: Simplify vflr64() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-10-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8e80a30-db1d-2083-d79f-4ea4d29bfc82@linaro.org>
Date: Thu, 3 Jun 2021 10:25:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-10-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  1 -
>   target/s390x/translate_vx.c.inc |  3 +--
>   target/s390x/vec_fpu_helper.c   | 29 +++++++----------------------
>   3 files changed, 8 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

