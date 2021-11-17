Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18F455127
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 00:29:31 +0100 (CET)
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnUMs-0001CR-Kq
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 18:29:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnULE-0008GF-0w
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnULC-0002Zh-H4
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637191665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leNpANgltyxYJPMUqt1+geBHH/ivz/dbIwOHTsPE4Y0=;
 b=GvNIiVcoix0/qByT65Rcyc6pPL/seBGbY+pQdbEDWqdgDaer7reQw6tO82RE6B1wrhqkIL
 kSOXSVa3dAp7b5pHC9zKsZlYMWcaRefn9yO/OuvdVaAXurxN9YAD0wtT+KZIY+V8bbtTxC
 Q0ItsLQ+TD7JVUSIgITQCMBnS8BNeyo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-6Apng43dMHSdYGQOL2tXYQ-1; Wed, 17 Nov 2021 18:27:44 -0500
X-MC-Unique: 6Apng43dMHSdYGQOL2tXYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so2100219wmh.6
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 15:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=leNpANgltyxYJPMUqt1+geBHH/ivz/dbIwOHTsPE4Y0=;
 b=g6YQnxzoUJPjpYV43IY7nOd6bOy7qmnnXe2Ge1uK1y3zc3zLpW/clokpTW6e3pmuLI
 4RcqfgrgP82Yvn/jF5vd4qrDAPzc5xPXE+s/8yjyCblVZRx3LIE4AgtGMnPeL2omyGKb
 UD8vM8yWLxPtLEkXnl0kzZ/sTlqiSlJdhaVXuYrMBi2UJ9vBdFG1M4+DdUm8A7Zvkna3
 mif4S1Cas35fVVc4z5kPHYQekq2B0X5gZJTGOG1EAs0k/BrBoeqHEfkFiS8sb+KrodIU
 3eAcNP4Z/vcHfhs5eTMKHeooScPWJgzW6L5LwqK0fj74ZbZuOJQeYP/96ozCdSC5vzkG
 dTCw==
X-Gm-Message-State: AOAM532X37XgAjybapDCrFIrKovF+jiQAitO1CcVytZv1ezBCkkvIp83
 LTaFpdQ3V9MX6DnW6ABmfz/XUwt6cg//DrQCtdaeRWjHBwH7TJZCI8Wyp05sZuLxaZ1l1kTDcZC
 NMp0g/NuZf2UoYRg=
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr4135277wmo.179.1637191663662; 
 Wed, 17 Nov 2021 15:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUHbpThZhI5UF+LfQ9l5ncwLMAL7HHubx5ZfhrjCqRI7cTTZsYBFqp/QOkNmPhR4RfwHfwUg==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr4135244wmo.179.1637191663464; 
 Wed, 17 Nov 2021 15:27:43 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n13sm1242121wrt.44.2021.11.17.15.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 15:27:42 -0800 (PST)
Message-ID: <2130deed-8f14-05fb-5da1-3c86744bbffb@redhat.com>
Date: Thu, 18 Nov 2021 00:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] Fix some typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20211117210702.1393570-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211117210702.1393570-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 22:07, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/devel/multi-process.rst            | 2 +-
>  docs/devel/qgraph.rst                   | 2 +-
>  docs/devel/writing-monitor-commands.rst | 2 +-
>  docs/hyperv.txt                         | 2 +-
>  docs/system/cpu-models-x86.rst.inc      | 2 +-
>  docs/system/devices/nvme.rst            | 2 +-
>  docs/system/gdb.rst                     | 2 +-
>  docs/system/ppc/ppce500.rst             | 2 +-
>  docs/system/riscv/shakti-c.rst          | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
> index 6e8be7d79b..884b6d20fb 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -49,7 +49,7 @@ future OS and toolchains are likely to target newer ABIs. The
>  table that follows illustrates which ABI compatibility levels
>  can be satisfied by the QEMU CPU models. Note that the table only
>  lists the long term stable CPU model versions (eg Haswell-v4).
> -In addition to whats listed, there are also many CPU model
> +In addition to what's listed, there are also many CPU model
>  aliases which resolve to a different CPU model version,
>  depending on the machine type is in use.

For a non-native English speaker, this is clearer:

"In addition to what is listed"

Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!


