Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEED482565
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:26:18 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3LfV-0001DJ-FX
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Ldw-0000DH-5A
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 12:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Ldt-0003JZ-5c
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 12:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640971475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm0KqvWeKe4/uWQYe65sg3WyV7Qvacvpmu3Di9N+aDw=;
 b=RMLXm7COupWAqR5u2SrB2NutU5kYCx8ah+GXVygkJLZklg6ncGSoud3+zhMdQBdG9TxHcl
 W/xuk1FtaHXmTq1PFUHrxgPyMwb0qKqv1+Dm+McY16M8+nkTRB4T49QQYrbZQHmEed8Jgd
 9r/I2DYbfRYn4oCmbuvGMYXxZxsAbz8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-0-21KY-vNU2dFz54BsHuUA-1; Fri, 31 Dec 2021 12:24:32 -0500
X-MC-Unique: 0-21KY-vNU2dFz54BsHuUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so14429985wmd.5
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 09:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pm0KqvWeKe4/uWQYe65sg3WyV7Qvacvpmu3Di9N+aDw=;
 b=q+g9ClwKjVfyVaeS1+p1VIAZd0m6ofF90VRjfQWmPH5UtqQ2Jv2OvoY4Dg8rB9GcBz
 j34HetNH5nI28GWt/8Ag7SX7VnIUmnA+CrvqqF4vz/wiaawjQ/kFu9soVzo/Hod5HxOD
 mSmcpAMk/9d5WONMOktYbTNc9NZdXMy6j4d3RrZcpfVBYVsegMwSVexphnEuE4Ejmp4d
 Ww2+ARqsckchkMu59vCikOwrJh/Mvy63yBdpJQMEUJeesqqjDCjQYeUP7uFaQp6YLtjL
 5ZTWyiZQ1gCl08dZ/3AO/NksMYC0OWJLewDVB83hqQN7txK9EbqmTUkVKMHGFzS4ESLd
 XTKg==
X-Gm-Message-State: AOAM532RrYJx5f99tZ8riOPoBVyvCWjfTJDWfvVoR4HhXfRFsJzmetfF
 cJhZwh0dnMnKPWKYaq5RZvvuiNtpW096Co7PNoS+ZFw0lJytYW9v9BKEkkWKBFf4qQrw0z8HC4Z
 z6FsBU4Rgwcavq0g=
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr30837291wrc.326.1640971471462; 
 Fri, 31 Dec 2021 09:24:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/y/fh9jujTQzkogYNueOwbkuUgFbV0Z41QGsj2xUiInY3lkMl8Zinn7HrMrntda/1KkqEHw==
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr30837278wrc.326.1640971471272; 
 Fri, 31 Dec 2021 09:24:31 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id m17sm26897401wrz.91.2021.12.31.09.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:24:30 -0800 (PST)
Message-ID: <923a68ea-61fa-eedc-6102-efafe4eb5de6@redhat.com>
Date: Fri, 31 Dec 2021 18:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 00/20] Machine-next patches for 2021-12-31
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211231124754.1005747-1-philmd@redhat.com>
 <2b80ab7e-2225-d23d-38d5-8468d5fdf190@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2b80ab7e-2225-d23d-38d5-8468d5fdf190@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 18:07, Richard Henderson wrote:
> On 12/31/21 4:47 AM, Philippe Mathieu-Daudé wrote:
>> The following changes since commit
>> 69f153667fce723ee546d2f047d66d0cfa67c3cc:
>>
>>    Merge tag 'memory-api-20211231' ofhttps://github.com/philmd/qemu 
>> into staging (2021-12-30 17:02:42 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git  tags/machine-core-20211231
>>
>> for you to fetch changes up to 2ece6e64846e1929c4ed338c73328d3b126e48d3:
>>
>>    MAINTAINERS: email address change (2021-12-31 13:42:54 +0100)
> 
> gpg: Signature made Fri 31 Dec 2021 04:45:35 AM PST
> gpg:                using RSA key FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE
> gpg: Good signature from "Philippe Mathieu-Daudé (F4BUG)
> <f4bug@amsat.org>" [expired]
> gpg: Note: This key has expired!
> Primary key fingerprint: FAAB E75E 1291 7221 DCFD  6BB2 E3E3 2C2C DEAD C0DE
> 
> Wanna push a refresh to your key?

Oops =) Refreshed (pgp.mit.edu & keyserver.ubuntu.com).

Thank you :)


