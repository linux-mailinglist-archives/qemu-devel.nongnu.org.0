Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C084AB89E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:19:13 +0100 (CET)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH172-00073Y-DY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH02m-0002U9-F0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH02j-0004q3-MY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644225039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u58HN+BJlXyxLNmnP8lUYWuZADZiGiY7gz+dtLtVmks=;
 b=brDqLIUefmsJpNZRsMqUz4DwWHKL45cvVv4OO7OuFvYlNYEFO6Q85tFaROaIHZxFJ6a1nx
 /voZ/9m5kiBH2AzfbE8+Y5NH0Ui9tr/JS1C4Amf9Nng7aSVvunTYeFocT/RgLMkJ4iRdfw
 gy9ZW70wsPeCAGcrVwRsadrOsqp9hfM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Oem1l_1YOSeEbaCAKMrUXg-1; Mon, 07 Feb 2022 04:10:38 -0500
X-MC-Unique: Oem1l_1YOSeEbaCAKMrUXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r16-20020a05600c2c5000b0037bb20c50b8so2573203wmg.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=u58HN+BJlXyxLNmnP8lUYWuZADZiGiY7gz+dtLtVmks=;
 b=QSuW3nFsdqwYyBDbmzdRhf7awuUOQlRpE7cQ1UQnHoSyIUBXhyVekz576HCxUmYzNM
 NNettKn9ZVAASYSIDLPvHa/TY9ByIRHpDieh3BQDqfqCxuuoQQ3kTjHSBNqCrM0oVgeD
 zr9BLQiCtRV1Z/7mzuFJ/sr+pAs52jgxXw35tSJLCrXjPCXGbcVcQLVLOZ5mbpEFFA3O
 LJKyz3pewdygXD4zZCHjgxRf5FzKZkbtluezrhQc2aEzLy1nhiSI9/yZqXN0mt5fSXNN
 Zo8dMLFAlWHCc0vF2mPOpT1v1jn5roVqsgPDNRNF5NexTT7DXDYYkb/Xw8cGyLbR/QuL
 p8AA==
X-Gm-Message-State: AOAM532lsGYrFy3L+3ZCMwUe/0QWquJBw8i42wvTH1XvvSc4+Sd9Tydo
 KL5WWXAd0Hx2xHjaTIatpTqlwOwRvqrHk9akf3Hw1NyLgn1BKNnDXLFPXf3WhutNfM39RCqhI70
 h3/XhyPbTzYjyhl8=
X-Received: by 2002:adf:db0a:: with SMTP id s10mr9266614wri.267.1644225036579; 
 Mon, 07 Feb 2022 01:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7bRx5qhJl6Tk3xWdlfTp9d0G1WwUvHbjsbg5yabji/AQBGs83DqTpsFGWhEUnScCLkFc/HQ==
X-Received: by 2002:adf:db0a:: with SMTP id s10mr9266599wri.267.1644225036313; 
 Mon, 07 Feb 2022 01:10:36 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id m2sm18501587wmq.35.2022.02.07.01.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 01:10:35 -0800 (PST)
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <74d9a3d4-58e6-9fb3-cacc-e3b6067d2373@amsat.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7785937e-f840-e151-58c4-78cfbc61c6bb@redhat.com>
Date: Mon, 7 Feb 2022 10:10:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <74d9a3d4-58e6-9fb3-cacc-e3b6067d2373@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On 2/5/22 12:19 PM, Philippe Mathieu-Daudé wrote:
> On 5/2/22 11:49, Peter Maydell wrote:
>> On Thu, 3 Feb 2022 at 22:38, Alex Williamson
>> <alex.williamson@redhat.com> wrote:
>>>
>>> The following changes since commit
>>> 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
>>>
>>>    Merge remote-tracking branch
>>> 'remotes/hdeller/tags/hppa-updates-pull-request' into staging
>>> (2022-02-02 19:54:30 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
>>>
>>> for you to fetch changes up to
>>> 36fe5d5836c8d5d928ef6d34e999d6991a2f732e:
>>>
>>>    hw/vfio/common: Silence ram device offset alignment error traces
>>> (2022-02-03 15:05:05 -0700)
>>>
>>> ----------------------------------------------------------------
>>> VFIO fixes 2022-02-03
>>>
>>>   * Fix alignment warnings when using TPM CRB with vfio-pci devices
>>>     (Eric Auger & Philippe Mathieu-Daudé)
>>
>> Hi; this has a format-string issue that means it doesn't build
>> on 32-bit systems:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
>>
>> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
>> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
>> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
>> 'int'} [-Werror=format=]
>> error_report("%s received unaligned region %s iova=0x%"PRIx64
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../hw/vfio/common.c:899:26:
>> qemu_real_host_page_mask);
>> ~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> For intptr_t you want PRIxPTR.
>
> Thanks Peter.
>
> Eric, can you follow up on this series, looking at Igor comments wrt
> migration state?

Sure I will.

Eric
>
> Phil.
>


