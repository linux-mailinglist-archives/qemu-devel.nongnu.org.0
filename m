Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184D62EEDE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwLV-0008Tz-6T; Fri, 18 Nov 2022 03:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovwLS-0008Ti-I4
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovwLQ-00032w-Pu
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668758608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpKUrW+dc9/6Ad+mUSp5jFqyq9ql8ti4y5uFCfACKEA=;
 b=F7EA6cb2mDUg21Ak8rxm7eR9BMZpWcOsMIa8Zt1olGMK65Csl21mevJtbdrKUIyrK6sr5q
 UB+W4qriX9MiZF+53C73T2OyR8xVqvSNGt4QQLS+RjfTLCGhEeoaxFWQ7Jj83iN1iQTfPF
 Rzsn2/nVNyCBJ/UAJNmyQk0zl4x3v68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-peGghYViPVuU0y8qOAlcyA-1; Fri, 18 Nov 2022 03:03:26 -0500
X-MC-Unique: peGghYViPVuU0y8qOAlcyA-1
Received: by mail-wr1-f71.google.com with SMTP id
 i12-20020adfaacc000000b0023cd08e3b56so1284665wrc.12
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 00:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpKUrW+dc9/6Ad+mUSp5jFqyq9ql8ti4y5uFCfACKEA=;
 b=T3noR0z+6h5vg6UkU6fv6kuRIVDlQjetFrehxElw0d3oWGx/m7AhNfhFhBhxiSTwY5
 Klo+xeWF6QGNwp8IfjVUSMG4+mHNLH0Zxruh8phrzyEJnmlLU07HDGaRlUmps9/HskY/
 FNXvfwPVAZHGAI6vwyZY54l6zdwGhsyJUoi2IqCcxo9pUbnWZQQ+HPv2a8GC4aMfVh+9
 t4um/nKzhzCX32gwMG+fHiZD6ClK23EmYbZWNXP5M/KtFwuCqmIGdUbOoTwN91flnqlH
 lHFuQJT2PGx1LqyOtqsJf2dJcP5uor5kFtK9Apvt5bRblG1jk96qW45+dGWWwTP/wC91
 1+9g==
X-Gm-Message-State: ANoB5pnyAtQ5P7zajhQ6n1Vq4CZ7KnssILedxCizR7eDrZXbB4E3CRcc
 ovhn3HOFulgHfHYk3glwe2Gt4jWLW9kpAuqEwzVmIKt1Nm4WGGgZfdU1iZkJL/0rklyiD0DT4j9
 vCskA302llCR1I8Y=
X-Received: by 2002:a5d:58f5:0:b0:241:bcae:98a9 with SMTP id
 f21-20020a5d58f5000000b00241bcae98a9mr2444680wrd.54.1668758605044; 
 Fri, 18 Nov 2022 00:03:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tua9KQInRjLjOEaEEPr5HMY2XQvh8Reuciwj8YkPSxJb/8qHWXKvD4ci9WAlhmEmbZlnlBg==
X-Received: by 2002:a5d:58f5:0:b0:241:bcae:98a9 with SMTP id
 f21-20020a5d58f5000000b00241bcae98a9mr2444657wrd.54.1668758604769; 
 Fri, 18 Nov 2022 00:03:24 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-78.web.vodafone.de.
 [109.43.177.78]) by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c3b2a00b003cf47556f21sm8923774wms.2.2022.11.18.00.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:03:24 -0800 (PST)
Message-ID: <27365556-af01-1af2-b841-9fabc6a4369a@redhat.com>
Date: Fri, 18 Nov 2022 09:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
 <CAARzgwzYn8=vsWO+pEfRouJY3PWYn_XEZps9wurpHpVogxcEHg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwzYn8=vsWO+pEfRouJY3PWYn_XEZps9wurpHpVogxcEHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18/11/2022 05.05, Ani Sinha wrote:
> On Wed, Nov 16, 2022 at 8:54 AM Ani Sinha <ani@anisinha.ca> wrote:
>>
>> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
>>>
>>> Instead of using a hardcoded timeout, just rely on Avocado's built-in
>>> test case timeout. This helps avoid timeout issues on machines where 60
>>> seconds is not sufficient.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>
>>> ---
>>>   tests/avocado/acpi-bits.py | 10 ++--------
>>>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> Thomas, since you are picking up my other patch, maybe you want to
> also pick this one up as well if you have not sent out your PR
> already?

Sorry, too late, it's already merged:

https://gitlab.com/qemu-project/qemu/-/commit/1b7a07c4414323d985e89c4e7

  Thomas


