Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1E964A99B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qTX-0006at-Vp; Mon, 12 Dec 2022 16:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4qTV-0006Zo-IX
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4qTU-0004u9-46
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670880995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tb33oTf8b9kCwIle5iDGQqFuKaMETOExJVdtFsco8II=;
 b=IgfJhNvaDUt/VZkmqoU6Mw50BHw3rpyiMsnuoVy5FSEJeJju4tLk6l503buW2r5mxY5aa6
 wSA/+ysbpGDPectTFv63JqhhUSK1+aRMUUM8DZllLuH17sWPUwsgYnU9tgCI10mXYU1/s4
 /HZdc3y5auwuqJTTHezxu6UqlcqClqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-SxfunaCsPbaTThRc-hKQDQ-1; Mon, 12 Dec 2022 16:36:33 -0500
X-MC-Unique: SxfunaCsPbaTThRc-hKQDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso2272215wml.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 13:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tb33oTf8b9kCwIle5iDGQqFuKaMETOExJVdtFsco8II=;
 b=1GiCZkXVbmWAOvc0P1ODs2DOIVc4WiwrJYWJrBgzwAh7BiN/IoZ5V9CdT4QQLAHo0+
 bXrLQ1xQhR05iDlnIbXBxYs2Qx+pc0u0Z0PxRuFnEecjJz5RLySIQcpvyIEEE6IkSQN7
 OQv1d5YbWpQ5PZxsLSNnzK9XQO/JK0g+CFCIv0SJ0yClSMWrpPfVii2p0s4eltZn4uXC
 41R53Uar3GBfmCBS3abTuuVVnhdGVrMSrXcxqQ9IooRXQ7cmJ9GeEZf2fWO7sPhgwmC3
 PwRGOotGFZFinNH92GqTA0q2Bcc/wKqnCdfalOlEUxX+IGXwfeW3NewDgPZtCHqLHUVe
 emVA==
X-Gm-Message-State: ANoB5pk1jHeNDKwj4kcqQoRKjB/3d78WHRI1jENQZxIiU3pGJUEDttFA
 UQ7t8Ba0mDG8XJnTaK+vCBFnBEvx/YeHMOUigmt8cRGGOLVszUYHEnXzsPIrCGt1XjfMzmFFbZH
 wpQD8gaMUc/iyo9w=
X-Received: by 2002:a05:6000:1d85:b0:236:7018:5958 with SMTP id
 bk5-20020a0560001d8500b0023670185958mr11106745wrb.10.1670880991624; 
 Mon, 12 Dec 2022 13:36:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43Q4HYv/239fgqFJO7MqWqVzZIwvYoh1ZaLCNF1sT8talIa2QoDYQb4M9d2T0ZnZEaLnJnjQ==
X-Received: by 2002:a05:6000:1d85:b0:236:7018:5958 with SMTP id
 bk5-20020a0560001d8500b0023670185958mr11106741wrb.10.1670880991397; 
 Mon, 12 Dec 2022 13:36:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 l5-20020adfe9c5000000b0023c8026841csm9842900wrn.23.2022.12.12.13.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 13:36:30 -0800 (PST)
Message-ID: <9d09cc9c-f750-30f7-63a0-ec4973ec09e5@redhat.com>
Date: Mon, 12 Dec 2022 22:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 30/30] meson: always log qemu-iotests verbosely
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-31-pbonzini@redhat.com>
 <CAFEAcA_2LajSOA8CE2xiAtX3FaQuxhMoZtmeDRHn5bv+1ozE7g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_2LajSOA8CE2xiAtX3FaQuxhMoZtmeDRHn5bv+1ozE7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 12/12/22 17:55, Peter Maydell wrote:
> On Fri, 9 Dec 2022 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> ---
>>   tests/qemu-iotests/meson.build | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
>> index 583468c5b9b3..3d8637c8f2b6 100644
>> --- a/tests/qemu-iotests/meson.build
>> +++ b/tests/qemu-iotests/meson.build
>> @@ -43,5 +43,6 @@ foreach format, speed: qemu_iotests_formats
>>          protocol: 'tap',
>>          suite: suites,
>>          timeout: 0,
>> +       verbose: true,
>>          is_parallel: false)
>>   endforeach
> 
> How much does this increase the size of a build-and-test logfile by?
> I know the gitlab CI has a size limit on that these days, so if this
> noticeably increases the total log size we might want to check how
> close we are to the limit...

~300 lines, so probably around 20-30 kilobytes.

Paolo


