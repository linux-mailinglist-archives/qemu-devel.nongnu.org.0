Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32841381910
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:21:14 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhuEC-0000Xx-Q0
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhuD4-0008DU-9g
 for qemu-devel@nongnu.org; Sat, 15 May 2021 09:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhuD1-0002QQ-I6
 for qemu-devel@nongnu.org; Sat, 15 May 2021 09:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621084797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJ04ybkW+SSJkwERlSnfS9wAus5cDajFoVyGU3ts6Gc=;
 b=MuAYSA8FkJ6ybLldB93gSqzBAM8gCUHkzO/3qFdQX2glTVeRLijpOSz3dfjetp8ezk91+Q
 OGHGorHsqcsdMpCSYcgxQclWa3X2uuar4twAv9v4SFaKVKLL+xeTPGK0nBLdFxozM6Cf3Y
 REDTM1S0FTSAnnz5oXYcJivMBbWjLPQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-cEwDsx1zMRKv3d89vDt1BQ-1; Sat, 15 May 2021 09:19:56 -0400
X-MC-Unique: cEwDsx1zMRKv3d89vDt1BQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 7-20020adf95070000b02901104ad3ef04so1200772wrs.16
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 06:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NJ04ybkW+SSJkwERlSnfS9wAus5cDajFoVyGU3ts6Gc=;
 b=edZxP+FT1CtnwQs3MOMmNL943fWYa/zDVRunasXJEjGSa8NpVgwXPvik5GoYhbBIX2
 OYSUT6iIjE/CxOGoAMD1rdlfA/DOe6cOeNHEOuPuaWrDC8A2P/m1fJWK+fdQo05NLop7
 AnhazZvxVFYwpQ8TUdi4w5J22i5GmFNv5Wq6rWfdMzcEUctvNnTaxCsMD3K9W6qlzlI/
 eiri1Saxhm+8oaJ1+44r5v5rAQo2ehU0Npf927MZX2N0M0Z2ogDbubfHYqdx+0JtbHGl
 QGwZ9gNzhDyFvv46o1/9DXuqF0/0gEMI+eB4D/qTeU3mumov8lHTatApM6mUhjCZL0do
 vybg==
X-Gm-Message-State: AOAM531aWw/1m0zSxhN+PWIvznB7lmwehtP1aRVh5pMkbevpCJnhYIax
 yY9v1EUbjqjrhxG0XlIEHPcxFokud2ggUdLudSRnmCAJ+0csNzCn9f69KRLdpdtRsChMCW1HK72
 zGQlh85qEb5wAX5t5VmRCxgidwOEK/fHbIZ7RR5w7I09EA3Hr2h79GiNJbU1A6u+A
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr56153234wmq.119.1621084794586; 
 Sat, 15 May 2021 06:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRh2jSnGFm+9+8z0MU2rTQWTSiLE4ZQrBkK6q8Ct3GeGItdIHcHWet+i0HznYOgSzE5gPIOg==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr56153215wmq.119.1621084794345; 
 Sat, 15 May 2021 06:19:54 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f11sm14186766wmq.41.2021.05.15.06.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 06:19:53 -0700 (PDT)
Subject: Re: [PULL v3 0/1] Rtd patches
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
 <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <48378522-0a28-b1c6-2a28-72c85202fcb2@redhat.com>
Date: Sat, 15 May 2021 15:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 8:33 PM, Peter Maydell wrote:
> On Fri, 14 May 2021 at 12:13, <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:
>>
>>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13 20:13:24 +0100)
>>
>> are available in the Git repository at:
>>
>>   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
>>
>> for you to fetch changes up to 73e6aec6522e1edd63f631c52577b49a39bc234f:
>>
>>   sphinx: adopt kernel readthedoc theme (2021-05-14 15:05:03 +0400)
>>
>> ----------------------------------------------------------------
>> Pull request
>>
>> ----------------------------------------------------------------
> 
> 
> Applied, thanks.

After rebasing I'm getting:

Program sphinx-build-3 found: YES
docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
There is a programmable error in your configuration file:

Traceback (most recent call last):
  File "/home/phil/source/qemu/docs/conf.py", line 155, in <module>
    import sphinx_rtd_theme
ModuleNotFoundError: No module named 'sphinx_rtd_theme'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361, in
eval_config_file
    execfile_(filename, namespace)
  File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", line
81, in execfile_
    exec(code, _globals)
  File "/home/phil/source/qemu/docs/conf.py", line 157, in <module>
    raise ConfigError(
sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme was
not found.

Is python3-sphinx_rtd_theme a required dependency now?

$ lsb_release -d
Description:    Fedora release 32 (Thirty Two)

Thanks,

Phil.


