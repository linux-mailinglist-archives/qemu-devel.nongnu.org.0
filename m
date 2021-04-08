Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370723584EC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:40:36 +0200 (CEST)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUtf-0004bt-A3
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUUrl-0003jO-Lv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUUre-0002r9-Nn
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617889109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pi3Cdr6qUm7syA4bJiTUAQKtVnVmhYQTf/5SWzr0QrA=;
 b=f1CWBliXrCLTJLeLwvxLRQQOKKqtujkFzKbGuvfnoCyOQbv+Ue9sFIKs7P4B+ta9NpMEtU
 V2MhxB8Xv8vOjOpnksbuDoeGj+YzPFNHLiyxKiujckQhYDsfhEM1WRcqSa78jTtjFTp01q
 zP3CcZ+mMtRjv+dGlMPyF9aG1LwR8Wc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-uv_4vUdQN3qdbm2JAEge2A-1; Thu, 08 Apr 2021 09:38:27 -0400
X-MC-Unique: uv_4vUdQN3qdbm2JAEge2A-1
Received: by mail-ej1-f69.google.com with SMTP id kx22so867041ejc.17
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pi3Cdr6qUm7syA4bJiTUAQKtVnVmhYQTf/5SWzr0QrA=;
 b=ID91wthGLDNAM2p9w6CmzJQMpsta/gxxqaay7b1GE9H66cYdPuTKcVf6L4KvXw9zCA
 6wEzZG6Jnnn+AwlXZvpaKxp2PyUA5SlguEFcxTxY8MvWW88wzGHMzK6kKLDTXDNEE6Cb
 mdN5ttgI0A6RJxOA+mAprnrqD1m3cIJa4Ti9P7f8oqfl2QzhP6F0d+NKGIs5fhDiHiOa
 zKxKEMVPl29xQup5mVyHTWApFUsdm92FDuBJitOn4VSrvp4XAzTfgIWuJtuiMf0wjIk8
 ZPQ5VLwklx6QbSrAIa7P6TW9iOUeOEOs2883XDo6AMqeUPY7IDqpEIFRE4TAhGGbWB/q
 AYZQ==
X-Gm-Message-State: AOAM533oE5Arf3UYdbviTcvykACbVoGVukhl+5M0YGyuhbA5wcjPz2u6
 dkJJWEpajQA09mfipEmorTDBviGo4OPaToiYgay+p41Qz0fh2B9T9Qi/TFbUGiAY/8ppC5/BMa2
 g9fq2bo9tSlX+RSslS4rx3WNQi640lYhgNcH146AweyTSm2Kq06tEQ+LEhUzAc8Ij
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr11516350edd.91.1617889106411; 
 Thu, 08 Apr 2021 06:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysGAhh0uupkBrH+MU69Tbg9Retdhv4UGwI4qCD6xkEL4+4bNIWoo/6cXW0UNZk3iOV4A/LRw==
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr11516317edd.91.1617889106184; 
 Thu, 08 Apr 2021 06:38:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s20sm17650410edu.93.2021.04.08.06.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 06:38:25 -0700 (PDT)
Subject: Re: [PATCH v28 00/23] i386 cleanup PART 2
To: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <eb692e31-72b6-1ba4-f784-6cc7d0993907@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a4f356eb-4e5d-d9f1-d2f3-e5e13e0eae4f@redhat.com>
Date: Thu, 8 Apr 2021 15:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <eb692e31-72b6-1ba4-f784-6cc7d0993907@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 3/22/21 5:41 PM, Paolo Bonzini wrote:
> Looks good to me, thanks for all the effort!
> 
> Paolo
> 
> On 22/03/21 14:27, Claudio Fontana wrote:
>> v27 -> v28:
>>
>> * rebased on latest master;
>>    I indicated the conflicts for the affected patches in the commit
>> message,
>>    in case a new review/eye is required.
>>
>> * added three patches:
>>    - accel: move call to accel_init_interfaces
>>
>>      This matches more closely the initialization phases definitions
>> (Paolo)
>>
>>    - accel: add init_accel_cpu for adapting accel behavior to cpu type
>>         This in particular is useful for ARM, that needs different TCG
>> behavior
>>      depending on the CPU subclass.
>>
>>    - XXX RFC accel: add cpu_reset
>>
>>      This adds an accel cpu behavior to execute after CPU reset.
>>      This can be used on x86, arm, s390x, mips for KVM and TCG.
>>
>>      The RFC nature of this has to do with the fact that cpu_reset()
>> remains
>>      in hw/core/cpu.c , which is common_ss,
>>      and cpu_reset() calls accel_cpu_reset() which is in specific_ss.
>>           So it seems weird that this builds fine, and all tests seem
>> to pass,
>>      without using a specific_ss call.

What about this cpu_reset() part?

>>
>>
>> v26 -> v27: rebased on latest master


