Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A86130A0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOWG-0003Ti-Qh; Mon, 31 Oct 2022 02:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOWF-0003TO-1b
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOWB-0005f8-Tz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667198611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLI7oDEOwB7xrZ7IpfYLVF2R3LwLxPNCIs4N1oc07bI=;
 b=MHAW/1fTQ+quypBvM5nXmGMoDCeqU/phb85Yhqed9K31q222OYglXy5UHayZFufNIN0DAh
 1B71L6f2Glv5gok89pF/9RN3iV1xX3WPwiDPgQS2HLf0O1yypeYZmJ5HC599UTK3IPA+EM
 D2Xx44zwYxtDcGqCtuknetk+Nd6wotc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-GOiP9B4mNdioEnhp1xE7_Q-1; Mon, 31 Oct 2022 02:43:29 -0400
X-MC-Unique: GOiP9B4mNdioEnhp1xE7_Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 22-20020ac85756000000b0039cf0d41e2cso7131379qtx.13
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 23:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oLI7oDEOwB7xrZ7IpfYLVF2R3LwLxPNCIs4N1oc07bI=;
 b=ZfTjPKd2jFiJ3JLkf+Mqo2Dy5K7qEoOAy401SKzi8CzIO6XNZlo5brhwPdrYS3rPBX
 d7W0GpqP6DrT2YbXW19/+ObHipB1IzPt2Dx+ZellpmNJqQOu19ink7GU383+IRiBrhwK
 eRKAFycyGrQHMILEJVFN9z+Xb2RppbQYd18nCyiG0UnnkFwrcStTfp3DefZx5Cta3Nhh
 QHVcgp4HR8fwNv6v7LOlNGRl4wPKkEsGXgCE6erbJwl1RSOg3inPfb/BorKYqPGZhz0v
 0yI4gPCD+65puyTLf81oYfRuagQ7ZtQJL0in3GTyfuzSsYC5+aQJT9coPJJ4gAC3IOhc
 II/w==
X-Gm-Message-State: ACrzQf0Sihx/ymtiYAPzGFW6wM2TlX1QAUseqv8mBDqLZBKUVOXDoB5T
 n7gm6atyWBI5vClOcFdIeZIxxduC26NgHSl81QJUXBEScvof5NfrNScmzgtj2VXk2xLNIa8n5m8
 4GXSDLuqo/deGNQ4=
X-Received: by 2002:a0c:ca11:0:b0:4bb:5f97:2d29 with SMTP id
 c17-20020a0cca11000000b004bb5f972d29mr9715152qvk.63.1667198608809; 
 Sun, 30 Oct 2022 23:43:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zDOsWFLkpJG92IGmZBVGfDM2SWoQ5+GsBElMlpn1GUxo96f7Qb89AAFRsfyE47Z2LEvr+BA==
X-Received: by 2002:a0c:ca11:0:b0:4bb:5f97:2d29 with SMTP id
 c17-20020a0cca11000000b004bb5f972d29mr9715144qvk.63.1667198608537; 
 Sun, 30 Oct 2022 23:43:28 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 c17-20020ac853d1000000b0039cc944ebdasm3259201qtq.54.2022.10.30.23.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 23:43:28 -0700 (PDT)
Message-ID: <c3c3371e-12dc-ad3f-6ec8-5317b24572aa@redhat.com>
Date: Mon, 31 Oct 2022 07:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
 <CAEUhbmXmKoE+cZUO-6Z=yPcWr1fknyw5PFyY+=c2-E4kCf-0AA@mail.gmail.com>
 <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
In-Reply-To: <CAEUhbmX4uDWWoc=B23TZS9gbPCMkPu+H-jFcMYuPYWE_QuMR7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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

On 29/10/2022 15.06, Bin Meng wrote:
> Hi Thomas,
> 
> On Sat, Sep 24, 2022 at 5:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Thomas,
>>
>> On Sat, Sep 10, 2022 at 8:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Sat, Sep 10, 2022 at 12:32 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 08/09/2022 15.28, Bin Meng wrote:
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> At present the prerequisite packages for 64-bit and 32-bit builds
>>>>> are slightly different. Let's use the same packages for both.
>>>>
>>>> Not sure whether that's a good idea ... I did that on purpose to save some
>>>> few time during compilation (since the Windows jobs are running very long
>>>> already) ... did you check whether it makes a difference in the run time now?
>>>>
>>>
>>> Not much difference on the build time. Actually I found after we
>>> switched to single thread build the time did not increase too.
>>>
>>> One side note regarding the gitlab shared runner:
>>>
>>> It seems the shared runner Windows VM is quite slow. Is it possible to
>>> get a faster VM externally?
>>
>> Any further comment for this patch?
>>
> 
> Ping?

As long as the Windows CI runners are still that slow, I'm still not 
convinced that it is a good idea to add more stuff here. Maybe to the 32-bit 
build, since it runs a bit faster, but I think we really should avoid to 
extend the 64-bit build.

  Thomas


