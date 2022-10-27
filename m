Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0960F833
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:56:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2Pk-0004KK-AQ; Thu, 27 Oct 2022 08:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oo2Pf-0003li-Bn
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oo2Pb-0002Y3-Fo
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666875306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTWz5EiTcVniVQWJsZ11CW8gxKOyrN72mwW3MijDf8o=;
 b=f6jKwWeR6KlnJO/32ceutyQrYXntMNaaN2JJhAqCZKUOfZZfYk2WWd3Bk75ZEW8UY2bjtn
 x4BX+Vt5lUCCXpHNzhYxCfvc/I6s4jev9+NWUYw4CmuEY8RyVb1hydNvGigh7hbsnn46ZF
 wPtESXi3vSDTW4nTGqk7pTeB72FpZjo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-RwQGVqrJO7Swf7nYEMi9GQ-1; Thu, 27 Oct 2022 08:55:04 -0400
X-MC-Unique: RwQGVqrJO7Swf7nYEMi9GQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 x18-20020a05640226d200b00461e027f704so1041455edd.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTWz5EiTcVniVQWJsZ11CW8gxKOyrN72mwW3MijDf8o=;
 b=LFZ+GiBGKd35+CRBH/2PWnU4pRdH50jRbW2McPsa+BBBX+/nk16lPwhkso/YF598Je
 zrwawlHI1haqsxIqXU8WFYBqs9QLPEONNVaKIUE/ZbvMGfPWy+EDQOccOpi2eZrVVW5B
 5RBfz28sOnNXRfx9K0qqtjfLhZAm1lJCT+yoRyr39agXlQczvjLbdsDS+f59lif2Tyf/
 VB/D7s44a6KSgrl6gXu2XGHpf9qs/d4w0JH93q+CZNf8pVnWi3YYKXGhTHDZQyyEZE9D
 xtkoIILgVW8UNcDkTKDRuHueqmbH00q37dKJw/JyiWAzOWUuRbajgufTaZYx2BBLuerx
 RbeQ==
X-Gm-Message-State: ACrzQf0dl2Y15JVbIpqoDbKd1LxZKa7iZ4UBXbSuaDE6ZUq59R1oz5VN
 g6WPVrDpgbgvhP3K7Z8YE6fLadA+Nnip7Uc44+MEtGiwJ/gW22U4Z2aqe8Fo+9Pb3Goz7M+FnD/
 3nlA/X1tX8sOQ/HY=
X-Received: by 2002:a05:6402:2486:b0:460:8f86:1fca with SMTP id
 q6-20020a056402248600b004608f861fcamr35214240eda.70.1666875303687; 
 Thu, 27 Oct 2022 05:55:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EkQEetexm9SyPgr++2YQhES/s9VCt2h6v3IkJwTDYVDg15IvapGn75SJlSf2DYfSk50Zksw==
X-Received: by 2002:a05:6402:2486:b0:460:8f86:1fca with SMTP id
 q6-20020a056402248600b004608f861fcamr35214224eda.70.1666875303432; 
 Thu, 27 Oct 2022 05:55:03 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ds4-20020a170907724400b0072a881b21d8sm801082ejc.119.2022.10.27.05.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:55:02 -0700 (PDT)
Message-ID: <e8d750e3-b48e-8695-887b-de04af8bfd86@redhat.com>
Date: Thu, 27 Oct 2022 14:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] seccomp: Get actual errno value from failed seccomp
 functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <80c86614e3b21dda074b81fe9c3866fdbbb7420e.1666769319.git.mprivozn@redhat.com>
 <Y1kpKGP+a2toN/4w@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <Y1kpKGP+a2toN/4w@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 14:33, Daniel P. Berrangé wrote:
> On Wed, Oct 26, 2022 at 09:30:24AM +0200, Michal Privoznik wrote:
>> Upon failure, a libseccomp API returns actual errno value very
>> rarely. Fortunately, after its commit 34bf78ab (contained in
>> 2.5.0 release), the SCMP_FLTATR_API_SYSRAWRC attribute can be set
>> which makes subsequent APIs return true errno on failure.
>>
>> This is especially critical when seccomp_load() fails, because
>> generic -ECANCELED says nothing.
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>
>> v2 of:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg04509.html
>>
>> diff to v1:
>> - added comment when setting SYSRAWRC attribute per Philippe's
>>   suggestion
>>
>>  meson.build            |  9 +++++++++
>>  softmmu/qemu-seccomp.c | 13 +++++++++++++
>>  2 files changed, 22 insertions(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thank you. Can somebody merge this please? I don't have commit access.

Michal


