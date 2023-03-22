Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136C6C4C06
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyhL-0003lg-5T; Wed, 22 Mar 2023 09:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peyhI-0003lB-MD
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peyhF-0007qY-Bi
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679492407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TT6ib18/ulHT8sw2xEItFmFdpUNdTmc7raq7ZGa12JY=;
 b=NpEyihMDUx2DUDOAhAjRF2e5c7nrumN1sR7UdcqL9xi8VA18fOHW4PcVNM48bbSacziuLN
 fQOhi010eR9T5OnHFEeiaOHjPVJfxMX0FGWvFXMbp0mLEp7kjHqDGNqtPlkfCUsJMvLcWO
 tHZfpRTDMOV2LYRSbAiG8MBv8jz3cac=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-ZpczIEFgO_m10WiCEuya9Q-1; Wed, 22 Mar 2023 09:40:06 -0400
X-MC-Unique: ZpczIEFgO_m10WiCEuya9Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 px9-20020a056214050900b005d510cdfc41so2035877qvb.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679492405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TT6ib18/ulHT8sw2xEItFmFdpUNdTmc7raq7ZGa12JY=;
 b=jl8CKpvqbLPD2inM5KmRRahH2cG4/Nms4Xpz/RtiyV9paqWuk7AIm60CKCqP0wz1y0
 irTber28sOxL64+Au8ZQOSkH1coULfMJYL6Un8IN8hFEdrsyaNgsFKgsEA6RAjLzL2Z9
 r/Zg0q5V9Lit8rDrSFnD671LblR890U22DVB8XwzM98zQx/a3Gy6pMy5STl621R9FKbB
 0TeKFiTLD7rJgYp/ERlVjMtOYwLZP+6SJuOZsFeuOJhH0XjEge5HRHgKyGwm64nwju21
 nx33HbVBgaSU+FAJYzqSsc4bigWQJz301oJig5Z99nO+UNf6X615uQMkVM38MszB6nNi
 68DQ==
X-Gm-Message-State: AO0yUKVxiF9tYWc2FwkYwDM2Xp9LOwjleREGdJxYmDbs0yuy8uZuXUa+
 qxHG9eZZ0awNwNwlBqO9sr342aNoL+u5JsAx65jyWJa4t7T/swI83f3HWgG8+k726A9v6o+6bh+
 57M+gLovRC2PgGgg=
X-Received: by 2002:a05:622a:10d:b0:3e1:90e4:c1d with SMTP id
 u13-20020a05622a010d00b003e190e40c1dmr5297162qtw.58.1679492405688; 
 Wed, 22 Mar 2023 06:40:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set9+ZCo+w7FG4RkdK0wPUBB/DXv/uTO6peM4DESzzDbmEEHRKkirWJ+AY6xABCiutTkEft/lCA==
X-Received: by 2002:a05:622a:10d:b0:3e1:90e4:c1d with SMTP id
 u13-20020a05622a010d00b003e190e40c1dmr5297129qtw.58.1679492405411; 
 Wed, 22 Mar 2023 06:40:05 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 c68-20020a379a47000000b00746aa080eefsm1735527qke.6.2023.03.22.06.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 06:40:05 -0700 (PDT)
Message-ID: <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
Date: Wed, 22 Mar 2023 14:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 22/03/2023 14.38, Philippe Mathieu-Daudé wrote:
> On 22/3/23 13:36, Daniel P. Berrangé wrote:
>> As a VM used only for automated testing there is no need to
>> install the X11 stack.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   tests/vm/openbsd | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>> index eaeb201e91..6af7afac0d 100755
>> --- a/tests/vm/openbsd
>> +++ b/tests/vm/openbsd
>> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>>           self.console_wait("Password for root account")
>>           self.console_send("%s\n" % self._config["root_pass"])
>>           self.console_wait_send("Start sshd(8)",           "yes\n")
>> -        self.console_wait_send("X Window System",         "\n")
>> -        self.console_wait_send("xenodm",                  "\n")
>> +        self.console_wait_send("X Window System",         "no\n")
> 
> Wasn't this useful to link a X11-ready binary, even if only testing
> with -display=none?

tests/vm/openbsd later installs sdl2 and gtk+3, so I assume that will pull 
in the required libraries if necessary, without all the other non-necessary 
stuff.

  Thomas


