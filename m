Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6413F5B75
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:53:38 +0200 (CEST)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIT7c-0000Db-5d
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIT6W-0007rZ-9I
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIT6T-0005oW-4P
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629798739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXag7SZoBh7W0XxAfUj+VAJvM4pFxIcVCJcvojPLE3c=;
 b=g92O7Wj+dy3cbhXIAuvB1AVlXPVurimITZ3CPFQuQcjt1BOBIqv1DZWc37BBU4rB5iqv0j
 wCBkS7P7M0QslPf5lSb6uY1PddQ1hg5DrqjBS5someuPX6Y+1AYnxYa8MSYkSS9XVJLpxF
 1LkQKQ4OMszLrrbOhqpDreGfVS4IdqM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-xYVAKLoTPvSrzYGbZalA2A-1; Tue, 24 Aug 2021 05:52:17 -0400
X-MC-Unique: xYVAKLoTPvSrzYGbZalA2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so3916815wma.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NXag7SZoBh7W0XxAfUj+VAJvM4pFxIcVCJcvojPLE3c=;
 b=HFi1mVqJGtvry6dIFpWHAWIuVcmJ63VoSzRcFAfpa7hHdTiXLEZx22YRKx7yRpZ2MC
 JcO+LNXFsFcb9yWiXstNClP1TBnGqW83V/lTxSZ0/s46l715supo71QFi8rIDnhfoLt+
 x+DOjwF8kxaTQRAd7rZ/+UJTKVNP+wv+60CTRdbI+0RUt9UBW31+gNdpcjcR5aYDsK5J
 koB2Hkcc3pashDsv/LooOJqtf4SkjhjyiGjWFrCJ9kzdxaeeTnFzr49UCQz2dZIbVITq
 j8AVZOijD1mTqs68bgTN59TALcWl7k66jfXFQvC1PNrX5EjAyq58taa/7cU0NezmFTsD
 37Ww==
X-Gm-Message-State: AOAM530HgGvlKYGMDNkhDCsVizNChpkJ1aGLWxekkcXbsQLEEuihUCiu
 jBFlXOA/spZ3DyGZMOSzK4vInQL1vuraJXobtPQXuYjxNUN+e/Mee5nlJmvlzeEcQqGyI8wDf/u
 QDjfGesNk7jcQEik=
X-Received: by 2002:a7b:c097:: with SMTP id r23mr3290035wmh.114.1629798736507; 
 Tue, 24 Aug 2021 02:52:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxH0H1HyKVNW97CWtqswe686Lo1c2bkWuu6BxdmHyt8kmRlyKnzSQowykLrRJmRQ7+U3bZ+w==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr3290023wmh.114.1629798736351; 
 Tue, 24 Aug 2021 02:52:16 -0700 (PDT)
Received: from thuth.remote.csb (p5791d776.dip0.t-ipconnect.de.
 [87.145.215.118])
 by smtp.gmail.com with ESMTPSA id t64sm49914wma.48.2021.08.24.02.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 02:52:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210824072702.520187-1-thuth@redhat.com>
 <CAFEAcA90Y-+Ri42LibkptBbLy_YWi10rV5GKtU+s-m6nNEoPKw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH] Update the information about the required
 version of macOS
Message-ID: <0217a23e-c2dc-c0ae-c7fa-8fcd9c773f92@redhat.com>
Date: Tue, 24 Aug 2021 11:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90Y-+Ri42LibkptBbLy_YWi10rV5GKtU+s-m6nNEoPKw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 11.16, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 08:27, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The versions that we specify for macOS are way too old already. Let's
>> rephrase this without specific version numbers, pointing the users
>> to the latest version instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   _download/macos.md | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/_download/macos.md b/_download/macos.md
>> index 06aa811..6832436 100644
>> --- a/_download/macos.md
>> +++ b/_download/macos.md
>> @@ -6,5 +6,5 @@ QEMU can be installed from <strong>MacPorts</strong>:
>>
>>   <pre>sudo port install qemu</pre>
>>
>> -QEMU requires Mac OS X 10.5 or later, but it is recommended
>> -to use Mac OS X 10.7 or later.
>> +QEMU requires the latest version of macOS (or at least the previous one if
>> +it is not out of service yet).
> 
> This is a stronger, or at least different, commitment than
> docs/about/build-platforms.rst makes:
> 
> # The project aims to support the most recent major version at all
> times. Support
> # for the previous major version will be dropped 2 years after the new major
> # version is released or when the vendor itself drops support, whichever comes
> # first.

Ok, true, I'll try to rephrase it.

  Thomas


