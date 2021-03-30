Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EB34E810
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:57:18 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDvp-0000NN-Vl
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDko-0005Hi-T2
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRDkk-0006Wt-P1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eqc5HWi9aQO17nP+BYUSVBhVTt36V2Lnef/7tINUDM=;
 b=GhA5riwmUrEqg698yinNQ7JQpN6hmT25jFD6AUH22VqWMUDsXDMmMBWH5whCANG+haFzp7
 bs/qkpcBc8mPHvBmSXWnakEXGUSLpQtkYYoaF3X+jrdV3kidlaNetiWMqUHnNBMu0d6UQz
 JRv29hLLfMYovrbozEF1x326wMeYu14=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-6H-dCRK7OWG6GN2BUyEPfw-1; Tue, 30 Mar 2021 08:45:47 -0400
X-MC-Unique: 6H-dCRK7OWG6GN2BUyEPfw-1
Received: by mail-wm1-f70.google.com with SMTP id c7so644933wml.8
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3eqc5HWi9aQO17nP+BYUSVBhVTt36V2Lnef/7tINUDM=;
 b=A6QFd+l0PwhD5NLbMESI7v5Ijk8t90SURrkzPW3bkvMVcCfmzs4croAasrv+P/CdQh
 kwUaZ9QnS8BaJkAp31Oo5kQvxuTS4YY7UpMhn+8IOFwL8LNDmPbO+kjkh82zCVfyxhU8
 JI/uyRM5V7q4laOvuUMIJO+GHMYH2J//QiMaqfr09u22wcXNX3qztPIIs8eKWQXacOJm
 UV5FzLIPWZ+toVmK+ktVT2n9zMWavk26+IXDlOsNRo5b1szA2IoPtDSwuE/gDfJqDTgY
 ZEbfTUSbkno4Ykj773W10V2vqvSpP0Hn00z196Kf1mrUu/ueF3fxJlwgUibMXXmbY+xJ
 iE9g==
X-Gm-Message-State: AOAM530p4UEWuXR5LlyI9nspkpYeBMJrqjbHmtlcyJwEk8E/RmEGW5AN
 TnNdMV8ozvYS6cUaPDEyYU/90XCrppgD3SA6KNZyxQzYO2I/DTUG6QKl0oPoiuCU8MUKcOaIUhU
 yWsZ4nTirb2uaBEg=
X-Received: by 2002:a7b:c188:: with SMTP id y8mr3865984wmi.76.1617108346318;
 Tue, 30 Mar 2021 05:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY9YSTMPmnaC1LuF8hsfvVyLwFLHYtXEu9ZIhCb+QJzqbF+cGJtJv7Um4l2vSuNUObP+wMgg==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr3865961wmi.76.1617108346097;
 Tue, 30 Mar 2021 05:45:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d13sm35650005wro.23.2021.03.30.05.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:45:44 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
 <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1bb868bb-d9d7-3a9a-cbd4-2e1780b46442@redhat.com>
Date: Tue, 30 Mar 2021 14:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 14:23, Philippe Mathieu-Daudé wrote:
> On 3/30/21 2:09 PM, Paolo Bonzini wrote:
>> On 30/03/21 13:55, Thomas Huth wrote:
>>>
>>> Also I wonder whether we could maybe even get rid of the capstone and
>>> slirp submodules in QEMU now
>>
>> At least for slirp, we probably want to stay more on the bleeding edge
>> which implies having to keep the submodule.
> 
> FYI QEMU libSLiRP submodule doesn't point to bleeding edge branch but to
> the stable branch (which should be what distributions package).

Now, but that may change already in 6.1 in order to add CFI support.

Paolo


