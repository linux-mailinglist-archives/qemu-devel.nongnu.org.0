Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD403DD36C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:52:28 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUcV-0004mz-OH
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mAUbR-00042w-Bs
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mAUbO-0001Fh-BZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627897876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mYlCSzW9L0+aJ8DquP1oBFi2NjUOImTCffeNI/bTB8=;
 b=IPrBma1ZcoPud4KAohjaf/yxNsRVKS6mPTbWEOymixT1WHG8vzby4QQq/QFoho9I7gI0Pm
 RaXZ1KQJYtaFicwDFhhpcc1wJ85qEeMbQ6Kckxy/T+pSF6T5SAJKqq+YtGtTLRd1Y2fbho
 4TJG8HfO9ylNNHi2msXDLs+P5DOFK68=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-cJywiTasOJquBVuYSVQCnQ-1; Mon, 02 Aug 2021 05:51:14 -0400
X-MC-Unique: cJywiTasOJquBVuYSVQCnQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so4915320wmc.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0mYlCSzW9L0+aJ8DquP1oBFi2NjUOImTCffeNI/bTB8=;
 b=YtbobiKr/kF9Xe6eMA82pKOaHCbMf4xCYFx0hSqArlcnGwkgqmT6wbhadSNX9GrSH2
 J7IpNZ4pUpWtT2AESVBXZy81Wy6acJAuWLq9gFP0j6kPU8pJILimYrjTIHoFgM3fS6Tc
 CN0lwDfGkm6vLyC5i+X3ahXeJZIWTWAtlksCznnHwaBK3Iroz0EGFiX/IXgO7dohcmUc
 N7E2PP5xyyvkYx6VQmQlO1unNH38PgqIHVfmg+vUgM1weswG8QeCKOQ+ee1GCCz7Hdb1
 oqlhr7jHXwfMSMrH2AxsfqD0zQilDRVqxfqaC3XE9ygKQmwgn78QsFSQCy6PiFTHh+rz
 Px3w==
X-Gm-Message-State: AOAM530impFwuXMgzqr3ojAnXHhZgxTAOiq+C1WlBYM9bo3c++aKVtbF
 sVVqQ9u9TjBZ57/QgT02Uy0NZEfDg3Yk7PHkox3J/HGyLqR0eF7aVhTQjddt7PZsnpmYgstvI3M
 lmpZF6E3eIVe1Mf0=
X-Received: by 2002:a1c:43c1:: with SMTP id
 q184mr15434746wma.173.1627897873038; 
 Mon, 02 Aug 2021 02:51:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGH0J9ngR6T8rdbESXb+7TiffKEk35AYlDdR+iYQGU0kYDewamDORVuwVGyct8h9m0LoLRew==
X-Received: by 2002:a1c:43c1:: with SMTP id
 q184mr15434733wma.173.1627897872848; 
 Mon, 02 Aug 2021 02:51:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id u2sm10348560wmm.37.2021.08.02.02.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 02:51:12 -0700 (PDT)
Subject: Re: Windows on ARM64 not able to use attached TPM 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
 <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7207680a-5667-33ea-7d3a-99f6297f4b04@redhat.com>
Date: Mon, 2 Aug 2021 11:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Ard Biesheuvel <Ard.Biesheuvel@arm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and also adding Ard if he is aware of any limitation the TPM2
integration may suffer for Windows support. On my end I am only able to
test on Linux atm.

Thanks

Eric

On 8/2/21 11:04 AM, Philippe Mathieu-Daudé wrote:
> Cc'ing Marc-André who is your EDK2 co-maintainer.
>
> On 8/1/21 2:28 AM, Stefan Berger wrote:
>> Hello!
>>
>>  I maintain the TPM support in QEMU and the TPM emulator (swtpm). I have
>> a report from a user who would like to use QEMU on ARM64 (aarch64) with
>> EDK2 and use an attached TPM 2 but it doesn't seem to work for him. We
>> know that Windows on x86_64 works with EDK2 and can use an attached TPM
>> 2 (using swtpm). I don't have an aarch64 host myself nor a Microsoft
>> account to be able to access the Windows ARM64 version, so maybe someone
>> here has the necessary background, credentials, and hardware to run QEMU
>> on using kvm to investigate what the problems may be due to on that
>> platform.
>>
>> https://github.com/stefanberger/swtpm/issues/493
>>
>> On Linux it seems to access the TPM emulator with the normal tpm_tis
>> driver.
>>
>> Regards,
>>
>>    Stefan
>>
>>
>>


