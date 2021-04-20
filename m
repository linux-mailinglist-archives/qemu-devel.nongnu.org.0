Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1211736597F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYq5U-0006KB-4F
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYq3o-0005bi-1l
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYq3m-0005V2-8J
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mpo/8Widc0AWgIOFU3Pqp20StE/WprW9Pcckoqr2uDQ=;
 b=bQ9/brNtq4MAOIdNrISaOlguma6nNyx3Tmh8kLPVioLDL7MmIbWbuqLnOX9ebXz4frRI30
 OspR4WyEi1mQ5cLhXeY/EZvMrSKvwBXpHx5PExPhUGdg+dl7SlVQjnvfL68mufWsSyNxga
 HFMmhR2MH8PHN9TnW2zLHxdplcAhzx0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-MlktXxbJMFO5dkAbpX0iVw-1; Tue, 20 Apr 2021 09:04:44 -0400
X-MC-Unique: MlktXxbJMFO5dkAbpX0iVw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z135-20020a1c7e8d0000b02901297f50f20dso397767wmc.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Mpo/8Widc0AWgIOFU3Pqp20StE/WprW9Pcckoqr2uDQ=;
 b=BLqGe6ixI5w0A4FM7NYmb99hdwMBks3GSaxXnRwISnUiqx9MX22UvE2tRF7kDRdsk7
 Ii/BptuynC0SnsxF8/jBSihxd2DNRLGjQk3MXt/BUSjaLnsJG/FkhqW+CVGwjNhydJw/
 Dz6LRUGDCCsGAtjzvp0S2QUzeJtF+elCnlws+oZbm3LX3bwEXI6mnkYUonUxtaO8IbNU
 EzCj56PQUf6qrdqBczbyiwzC+76DI/BEU9xMglZHg5Z48PUrLfmwrPhwc3Rxh1PByP/F
 32kZwUoLMfzOUP/P5u4TVivXtpSmSdIjWCIWJz1v30/C5pyyyJ/QA2b6nwAyf7ijOMdN
 WTtQ==
X-Gm-Message-State: AOAM531X/xmgGaL1ml6vx12chyuxUZQqGf6irGywH33LaLpi3e/DB+vx
 9obC2o3prBruZGoNIi9+h3p1cvReWd5uwzc67uXZXPTZ5cj3m17mNR1qpvnUc7TwlH371U9S7Dh
 qKNypl8sIwp897UA=
X-Received: by 2002:adf:f00e:: with SMTP id j14mr19825480wro.180.1618923883587; 
 Tue, 20 Apr 2021 06:04:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbQphI8gUvasblCn9ezOgl/T8/gHVQhCVj6QgdnD90k2Ig5FrgbrcvUQVN/zEEzUka64tqqA==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr19825430wro.180.1618923883188; 
 Tue, 20 Apr 2021 06:04:43 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 18sm3369532wmo.47.2021.04.20.06.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:04:42 -0700 (PDT)
Subject: Re: [RFC v2 04/13] target/s390x: remove tcg-stub.c
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-5-cfontana@suse.de>
 <f40727a3-9687-6821-804b-d35fa2bd5d23@redhat.com>
 <3f7d3cda-9319-9004-7568-55459bc05c78@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <96f7ed07-137b-f337-4a00-77785d8e3bcc@redhat.com>
Date: Tue, 20 Apr 2021 15:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3f7d3cda-9319-9004-7568-55459bc05c78@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 15:00, Claudio Fontana wrote:
> On 4/20/21 2:54 PM, David Hildenbrand wrote:
>> On 20.04.21 12:36, Claudio Fontana wrote:
>>> now that we protect all calls to the tcg-specific functions
>>> with if (tcg_enabled()), we do not need the TCG stub anymore.
>>
>> You need compile-time checks, not runtime checks. Any calls have to be
>> protected by #ifdef, otherwise the compiler might bail out.
> 
> This is not true though, tcg_enabled() is #defined as 0 if tcg is not enabled.
> 
> #define kvm_enabled()           (0)
> 
> Compiler will elide the code if after the preprocessor pass the code is:
> 
> if (0) {
> }
> 

Just that we are talking about the same thing:

The following will fail to compile

void main(void)
{
         if (0) {
                 return hello("Test");
         }
}

You at least need the prototypes. But I guess we still keep them and 
really only remove the stubs -- which works because the linker will 
never stumble over them.


-- 
Thanks,

David / dhildenb


