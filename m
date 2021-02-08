Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFF3143D3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:32:53 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G1U-0003Kb-F6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9D2T-00012D-58
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9D2O-0004R9-Gj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612815694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiVv3IxhqMzeVWO2mXovapn1d4X8fRiZT2W/wdmmQPM=;
 b=UHu8BOAwFQLmuHaqVsTQ9Q/UcghT2XIVTgOxcEiQfn0ODouaw5QR7MoEoPqUZVgdMUUYsZ
 JdGg3CwKQ9H1H60AdSAK9yflJTKWT57QoDvkex0F1DTWvTyzrh9ek3iX+GRmiIZpbBiXG4
 RO5Rf0N8nq+O2Cqk+8QtClL75ZWpaOA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-IjjVRv74NJuuX2AQd4xmuw-1; Mon, 08 Feb 2021 15:21:32 -0500
X-MC-Unique: IjjVRv74NJuuX2AQd4xmuw-1
Received: by mail-ej1-f70.google.com with SMTP id jl9so9082533ejc.18
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tiVv3IxhqMzeVWO2mXovapn1d4X8fRiZT2W/wdmmQPM=;
 b=YfKPblUzU9ibeTr2iSlc/TQ/FHDSmxPUJ0QWMLBNbPjyFSSvmNbf33UKBtfZk90vvS
 CiSmzOeeHijlhuH1Nvtddy0NYnheOkAgQCIzdN0arCFGsbgkNgzLWaCA2LjrzqSdfMVT
 /w04Jqd0W+RuM9D9gRZLMqls1dfzdDRQPxmMzCg9pPz0j/ZAcCaXG+ijbi3bdYbYljs9
 WiYtdRSsTMe5XzZO4w31uoxJT3IhPfA8jGR//DQ8NowLhLiIIJNWPGmic2TOCWaZRLJZ
 Uv/4EWAm7WTJsWJjo458AkTR3sgrsrZ4pUFDrBxdVTLNDDSDzoL+WWXC2m8i+8XTyuMB
 10MA==
X-Gm-Message-State: AOAM532gc5jqBmW1IHg+gZqmyvmd3ouSyTZhhfxau1/Y1MWK+FOS7RcD
 7pzl/oOrQ0t6OpRWN0j+9NDmW3qQYx1XKPSPW0YzC9jA3XZTb1VZPG2u2oNVkQD4doiFUw9eWwd
 LHYBfmSDrP7jCM+I=
X-Received: by 2002:a17:907:c27:: with SMTP id
 ga39mr19384594ejc.68.1612815691021; 
 Mon, 08 Feb 2021 12:21:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpAF8xSeKrHMyMI7NfjXGk7piCGQOa7p1zqsla0XN+u/zQ/6FqlvwOfe9XXCpp6nkPEwsMYw==
X-Received: by 2002:a17:907:c27:: with SMTP id
 ga39mr19384578ejc.68.1612815690847; 
 Mon, 08 Feb 2021 12:21:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm10241669edw.7.2021.02.08.12.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 12:21:30 -0800 (PST)
Subject: Re: [PULL 00/18] Integration testing patches for 2021-02-08
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210208133711.2596075-1-philmd@redhat.com>
 <CAFEAcA-mrzsrOiNw3Fjes=AAg=X3xXh40DZ5fMO=+dA6YUonaQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <45a65770-787f-1e47-12a0-0c828b2ed140@redhat.com>
Date: Mon, 8 Feb 2021 21:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mrzsrOiNw3Fjes=AAg=X3xXh40DZ5fMO=+dA6YUonaQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 9:06 PM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 19:58, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60:
>>
>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' into staging (2021-02-05 22:59:12 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/philmd/qemu.git tags/integration-testing-20210208
>>
>> for you to fetch changes up to fce8a00839564bf620b6c2957ed924197e54a127:
>>
>>   Acceptance Tests: remove unnecessary tag from documentation example (2021-02-08 14:31:03 +0100)
>>
>> ----------------------------------------------------------------
>> Integration testing patches
>>
>> Tests added:
>> - Armbian 20.08 on Orange Pi PC (Philippe)
>> - MPC8544ds machine (Thomas)
>> - Virtex-ml507 ppc machine (Thomas)
>> - Re-enable the microblaze test (Thomas)
>>
>> Various fixes and documentation improvements from Cleber.
>> ----------------------------------------------------------------
> 
> gpg thinks the key you signed this with has expired. I tried
> refreshing from the keyserver to see if the expiry date had
> been updated, but it doesn't seem so ?

Oops sorry. I signed the same tag with my other key (because
re-signing this one is not straight forward).

Do you mind retrying?

Thanks,

Phil.


