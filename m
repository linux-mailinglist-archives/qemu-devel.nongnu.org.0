Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E144CE03D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:29:25 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGQO-0005CS-82
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGPO-0004IC-Sx
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:28:22 -0500
Received: from [2607:f8b0:4864:20::535] (port=35710
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGPN-0006QN-As
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:28:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id e6so8628696pgn.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2C6jQFvVTWzy9SpOtnw/k9j/etr9nmeSuovKK9z74Ek=;
 b=K45DYilOM1EGXfNqVdY0Q87Vd8pn2C8vUnd4EPpriU/pH1RtpSQEE9GpUyeNJaESSW
 vqjdVn2tkW5F6GVQ/MFJdyTu+K9NtqV6+UzPRQZ2J/viFH+2alatOofRKLjCin5NewIf
 YXe3JME/OEOKj8SyIgoNkXNasraDOimQIK5eDDddeXxX3YucxetTXjahSknY3X/scbFY
 wcK7r69VAmVQVP0ULAEKI1+Ee5VJ5kMgjJnxp7XC8YiPxupCMPQrvTz12xQ2dYtKPYtY
 cV9UnK9U+L0n5PVQV6eyJU/DHfQ6r2vZkQrl+xCi1TCKIeD9u9214LMl00qteVBjEwCf
 LjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2C6jQFvVTWzy9SpOtnw/k9j/etr9nmeSuovKK9z74Ek=;
 b=JQm+u7F02rHcKnyy340yMNavFvdpfbpF33A6TAmDVHDEWpRUJEqZ08B0dkgtRiC/4E
 FCjq8RXY024pSZXBpOTufF9k59EQ/JfoZ5Bdb9jVowO5ejlHGGBX50CaqxazVTCTVxcK
 D8h74YroUlYuQzctoWXY2NLsLDuka25vYpQMqzP3vKJisz4O87+UkIW0or+2XeFsjf1U
 GZwnK/zDnHusZcHpa3gHRbu9uha1EZDrdzzPVMEsIDd6gt5uXgv20Sag1fEDEiIXUEAK
 zSht4LZx97RrhWNNmpjeeO01rhaxeswWUkclfEticoIV9ulOIhXflvVXVj/PXJOKV9Nv
 UWaQ==
X-Gm-Message-State: AOAM530O1ew1N3cQoLUvkYbPYTHnl7GG64I2XumPA1T0uSv9t6PA04CB
 aAPL0HhpQDWZN5DABqSDffx6hg==
X-Google-Smtp-Source: ABdhPJxu9Lbfft8mH26zuQRKc6n0AUYTzKToOZYmxBeFXfKxZKQi1Q/zZlXmDKoy2RAY/J5EsCtjFw==
X-Received: by 2002:a05:6a00:244c:b0:4f6:67b8:a6b4 with SMTP id
 d12-20020a056a00244c00b004f667b8a6b4mr690992pfj.51.1646432899955; 
 Fri, 04 Mar 2022 14:28:19 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 v65-20020a632f44000000b00375ed63b2fasm5365838pgv.86.2022.03.04.14.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:28:19 -0800 (PST)
Message-ID: <332b0e23-0e6b-3680-787d-b5086e2589ae@linaro.org>
Date: Fri, 4 Mar 2022 12:28:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
 <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
 <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
 <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 12:14, Peter Maydell wrote:
>> Yes, that works.  I'll send an update.
> 
> Do check it with KVM as well, to check the "CPU doesn't actually
> have that property" case...

Argh!  No, doesn't work.

Unexpected error in object_property_find_err() at ../src/qom/object.c:1299:
qemu-system-aarch64: can't apply global max-arm-cpu.lpa2=off: Property 'max-arm-cpu.lpa2' 
not found

I think staying with the v4 patch is best.  It matches quite a few other examples in 
hw/arm, and uses the existence of the property as part of the logic already.


r~

