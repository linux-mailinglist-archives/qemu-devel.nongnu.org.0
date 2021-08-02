Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AC3DD72D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:33:07 +0200 (CEST)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAY42-0003y8-GJ
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAY2M-0002bv-0O
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAY2K-0005yD-9S
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627911079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbZ9rAXZPe37dG36SIRwK5Mr+crLYqeXwBeW7c8rFqg=;
 b=Fl11LxhMKI4wnhPO8w4Tf2U3yu9vPzScO7KkctAaZaXqxO0l1tAuuWJl/XyOOBmnLmAvun
 +YKBASGKOSH4zYVJVRIL6Iotxg8lyeYcXqg8kznWeWS4rv+mHuSug/Ly0s76w5IvOATlfg
 pBdZrXW8oGKNNOh8MUhRqjVq8M8UyW4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237--SNkgk17NOG34DtUBI7T5w-1; Mon, 02 Aug 2021 09:31:16 -0400
X-MC-Unique: -SNkgk17NOG34DtUBI7T5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 d72-20020a1c1d4b0000b029025164ff3ebfso5073681wmd.7
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbZ9rAXZPe37dG36SIRwK5Mr+crLYqeXwBeW7c8rFqg=;
 b=C1dydnVJ1737g0QChxRvkypgEShn9msmrAQgbr4X2mpQYbTtHT2C7GJjc0KAxgTBfD
 +6biaNaSOIHWlnmm2aKFIw711ek8thkl4Fca472R+rGxrzDeWh/umMPE5enoD7rMHarf
 ifP6MWZt7foxkJ7t2NSjenZ70AQUVYlIhQ1E1cxns8tmNRJlyL9LQgBs06GRErRM5EOY
 mcRcl8kfopbU7YfOqlobg+o7Erz6I5iIC9FgRsRLLPU+8xOFRTj34FjRe7qrZaFo3Qz6
 dQUmOXdap8a5iJILfhIpDcV61+fYAAJ1N+LsTBKMK6rWQSakwbR6rWEyZNZMHRZHjRJY
 HRBA==
X-Gm-Message-State: AOAM530MAhq2qE2iTiIG2lPnLp3haDnwc8TW2yx4rwpmvd8z2ERqxHol
 ecm8G4kuHxyzjI9HfkqMxEOIkZVjEKhxH/5ss2SzWooKYLux6ZP0rQRIq94318zDXq29Yn7Axl+
 mZmY6fD5Q9rTed8E=
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr16641797wmj.53.1627911074993; 
 Mon, 02 Aug 2021 06:31:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3S1yEu0L9/IN9YJ3Wog1HJAjTSS/eFljEwuo3yoJAYM1Rk3Zv1xgIwycCQjMCB3Rhn/dxsQ==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr16641769wmj.53.1627911074706; 
 Mon, 02 Aug 2021 06:31:14 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 129sm10407473wmz.26.2021.08.02.06.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:31:14 -0700 (PDT)
Subject: Re: Windows on ARM64 not able to use attached TPM 2
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
 <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
Message-ID: <308ef739-3c19-04f8-86d0-9d41509a87d9@redhat.com>
Date: Mon, 2 Aug 2021 15:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: eric.auger@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 11:04 AM, Philippe Mathieu-Daudé wrote:
> Cc'ing Marc-André who is your EDK2 co-maintainer.

Oops sorry, I meant your EDK2 "co-designated Package
Reviewer"

  R: Package Reviewer: Cc address for patches and questions.
     Reviewers help maintainers review code, but don't have push access.
     A designated Package Reviewer is reasonably familiar with the
     Package (or some modules thereof), and/or provides testing or
     regression testing for the Package (or some modules thereof),
     in certain platforms and environments.

OvmfPkg: TCG- and TPM2-related modules
R: Marc-André Lureau <marcandre.lureau@redhat.com>
R: Stefan Berger <stefanb@linux.ibm.com>

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
> 


