Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE14A9583
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:49:52 +0100 (CET)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuHv-0006ve-HQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFtVu-0007pL-5j
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nFtVq-0000cp-8t
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643961609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBC+urVGJNfXL8t8wlwBQ/WeKMjN98PPVM+Fy2AGeWk=;
 b=epX27M+13zlU2is0vEkvte8l+rq2RfrzigPyALcIIuuPUkl1ETwLK59YDM5WN0gGLaYxn/
 1TuTykjUR2Z6IScJVGj0QtMI5B3XFCYV3lddIzMWLFIuhwjOB0yhIKwxmFr3m53+pNZNIt
 rHKtuU0mcg4SUteAKksFovok1SQRKOA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-mEa-cI0MPKC0YY6oShqQFw-1; Fri, 04 Feb 2022 03:00:03 -0500
X-MC-Unique: mEa-cI0MPKC0YY6oShqQFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 c10-20020adfa30a000000b001d79c73b64bso1655919wrb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 00:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LBC+urVGJNfXL8t8wlwBQ/WeKMjN98PPVM+Fy2AGeWk=;
 b=zSFaZjLlHMdJlyA8lBzzUbdtOfSINmXo8UxGqN1hG1uEfAvj7WlreU0xPWNNg8npd9
 iTqTFMkLReA8v8o3vPGS7P+6NXPLJ/mXk9N8aHWl0oqCdSUm8c+oxSlA6PE9eNenJ0eR
 OCoys2exAnZPW5dx4eCZ3SUh5YgE+31fiuMI33ICcw+pqfRuroymqtNVGXtiCB6lsfiz
 4eR0+TAhLQlEmeiop7Pi9iH3/iTn2H5Qa1fe1K+VBGEUDzpVBTXBj9IjKShhJgCStEab
 4E/2K/O8RycfFaQYZ81Dt+ULMghI7Wq72TzCWyy+zPrS3jvTRJY6Tp7hSt06CMckkEvm
 dnjQ==
X-Gm-Message-State: AOAM532A5NYUWWFIlKDS9xUCnHlq562903dNPtDySKC/mSRWEBNvgJTF
 ozVw+teHS7JIE3h5g0SG5v00fhhJynuS9v1pvCKE8hbRqYlwbmzSxn9VljgdpFyYn/QV38IcZgX
 dDk6DocPQJBGjd0o=
X-Received: by 2002:adf:f64e:: with SMTP id x14mr1357591wrp.216.1643961602471; 
 Fri, 04 Feb 2022 00:00:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQMwTKBF2PsakzTMen77VgF+uxSfALpl6tjHQa/KiG/Xa6XTyLIvhHU0oXJ3rna8JGgZQ/Tw==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr1357571wrp.216.1643961602257; 
 Fri, 04 Feb 2022 00:00:02 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id m28sm10004517wms.34.2022.02.04.00.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:00:01 -0800 (PST)
Message-ID: <5cec360f-f2e6-8138-d53c-7834aec10870@redhat.com>
Date: Fri, 4 Feb 2022 09:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/21] accel/meson: Only build hw virtualization with
 system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-3-f4bug@amsat.org>
 <f94843c9-c8f0-d78d-5e6e-a289d8bcb6a8@redhat.com>
 <bf89f8c1-5f22-4941-0266-5f58b1ff93c9@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bf89f8c1-5f22-4941-0266-5f58b1ff93c9@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022 08.51, Philippe Mathieu-Daudé wrote:
> On 4/2/22 08:37, Thomas Huth wrote:
>> On 03/02/2022 20.17, Philippe Mathieu-Daudé wrote:
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   accel/meson.build | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/accel/meson.build b/accel/meson.build
>>> index dfd808d2c8..b9a963cf80 100644
>>> --- a/accel/meson.build
>>> +++ b/accel/meson.build
>>> @@ -2,12 +2,14 @@ specific_ss.add(files('accel-common.c'))
>>>   softmmu_ss.add(files('accel-softmmu.c'))
>>>   user_ss.add(files('accel-user.c'))
>>> -subdir('hvf')
>>> -subdir('qtest')
>>> -subdir('kvm')
>>>   subdir('tcg')
>>> -subdir('xen')
>>> -subdir('stubs')
>>> +if have_system
>>> +  subdir('hvf')
>>> +  subdir('qtest')
>>> +  subdir('kvm')
>>> +  subdir('xen')
>>> +  subdir('stubs')
>>
>> Doesn't this render your first patch useless?
> 
> No, we don't want to build non-TCG stubs in user-mode ;)

Ah, well, looking at this twice, I think it's ok, indeed. I was confused by 
the fact that "have_system" and the "CONFIG_SOFTMMU" from patch 01 can have 
two different meanings if the QEMU build has been configured with both, 
softmmu and user targets. So never mind, please!

  Thomas


