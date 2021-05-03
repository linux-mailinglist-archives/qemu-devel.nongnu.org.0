Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EFA37121E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 09:42:31 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldTDq-0001R9-7L
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 03:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldTCF-0000uh-LE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldTCD-0008VT-Jq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620027648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0zWfhRuA9vgh7kNdUZxT3QwLLNRTxidyxgLmPB3kTc=;
 b=PnI9T+nwBl4RGRLe3rOmXZcuWGQ6pJH8Pq2cbiJ2I+2sVlABTuoy/aJM8T5SQcK+2v5AvS
 pKxz5BgbwXIt5VZtIdtxZzZrGscG0fw6h56wLuFirkLz2YGXIeuI8XwGDbrzyxNxeWZ0lw
 6t6/8N8g+M9uf7xEnbnh0cWadh32BeI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Glkei18AO62t-XVmcwlTvg-1; Mon, 03 May 2021 03:40:47 -0400
X-MC-Unique: Glkei18AO62t-XVmcwlTvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso326710wmb.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 00:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m0zWfhRuA9vgh7kNdUZxT3QwLLNRTxidyxgLmPB3kTc=;
 b=cWdJtJW62E23eXxrFUR1HtuVAQcMS8zVgGw/nPj/nv3hxomyumc5OxMVM5PQEQV9jw
 mN+auZRjPk4ZS0Brw3HBF0o8pzl+r8kLgN3bK5691EKOrvV1WgI62iVz25hJndPyNjSQ
 xmWiiTfS8stNQ21JLlkd6Khv0zXOVJmacrGy/upegPmSamn9trmc4ug21bIBNIwbTEq6
 tJDwsPDPNXkYga+LFK69lSd7Los2Gy7itWpn5xlgOW3I09bkE+6EcqxfpV0ceVAIekUu
 SLjHd/UzbPYhg6wvDeWH/kvW9CuyeOZWGcRsO6AlgcX7czJhzMryfSXe5MqKc29sc5hC
 C7lA==
X-Gm-Message-State: AOAM532mu8fCrjWx65VkYupktfAQWFL9r0ztJ32zgrSdL/C70vWz8r3X
 HfYE5u6d031jLFDI+ej3kw1/a4VczS4aYRFD+xc7QaTdVB84srdgCfIQvbKSThCzthJL/Xsuei7
 SJ96gsYo2mqwxTlaFMF2E9RGqmwesVsVTI7K4ErcsNiE+souVVjcgsxpUHP9QpEM9
X-Received: by 2002:a1c:f60a:: with SMTP id w10mr31081593wmc.5.1620027645731; 
 Mon, 03 May 2021 00:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGp/MpDqjZc4LnE5fdP1mV87Yx9Pig0NaS/48Sdw+zyb/zq81sFaPDgZrW5AQLscj1C/JtrQ==
X-Received: by 2002:a1c:f60a:: with SMTP id w10mr31081576wmc.5.1620027645544; 
 Mon, 03 May 2021 00:40:45 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id r13sm12325205wrn.2.2021.05.03.00.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 00:40:45 -0700 (PDT)
Subject: Re: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by
 marking panic() as noreturn
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-2-thuth@redhat.com>
 <04140977-282c-2579-3073-42b6bb4148ee@redhat.com>
 <f2f4a4fa-9b0a-b1c7-66a1-4c83bc864a04@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70298aa0-c3fe-030c-23d5-d535bb56f6f3@redhat.com>
Date: Mon, 3 May 2021 09:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f2f4a4fa-9b0a-b1c7-66a1-4c83bc864a04@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 6:53 AM, Thomas Huth wrote:
> On 02/05/2021 20.57, Philippe Mathieu-Daudé wrote:
>> On 5/2/21 7:48 PM, Thomas Huth wrote:
>>> When compiling the s390-ccw bios with Clang, the compiler emits a
>>> warning:
>>>
>>>   pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used
>>> uninitialized
>>>    whenever switch default is taken [-Wsometimes-uninitialized]
>>>       default:
>>>       ^~~~~~~
>>>   pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
>>>       IPL_assert(found, "Boot device not found\n");
>>>                  ^~~~~
>>>
>>> It's a false positive, it only happens because Clang is not smart enough
>>> to see that the panic() function in the "default:" case can never
>>> return.
>>>
>>> Anyway, let's explicitely mark panic() with "noreturn" to shut up the
>>> warning.
>>
>> Why not simply initialize the variable instead?
> 
> First, it's a false positive. If you only look at the code, someone
> might later wonder whether it's really necessary or not and try to
> remove it again (and since there is no warning with gcc, this patch
> would also have a good chance to get merged, bringing us back to where
> we are right now).
> 
> Second, declaring panic() as noreturn is certainly more sustainable,
> since it might prevent similar situations in other parts of the code in
> the future.

Fine then:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


