Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D719702975
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:47:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUmh-0002TC-FR; Mon, 15 May 2023 05:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyUmf-0002St-AA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyUmd-0005z7-R7
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684143982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADorOJ9wL8zDDU98T1j/+L8TnSr9kWgcJ3JLpRx3rZk=;
 b=GA1TVQC6xlBozHeHPg2NLa+jv2R4mTv6o+YCU06Pxk3R6AkpcjEvD2NC+uakyzQc1uHR0R
 YjNRkXkQEAHZzryr+HtpJlSSsTFQiReks8jPu0OFj9wJLikofpxAZdok2ZcgZbcoeZGtpX
 8EzD/+q4PalO8zxS7wE6lPQgIpShJwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-tRzY2GXhMk6vhKM8t8cv-g-1; Mon, 15 May 2023 05:46:21 -0400
X-MC-Unique: tRzY2GXhMk6vhKM8t8cv-g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f4fa463282so15121085e9.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 02:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684143980; x=1686735980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADorOJ9wL8zDDU98T1j/+L8TnSr9kWgcJ3JLpRx3rZk=;
 b=Dyr2Wqt37oNXDWaNDPhP2CXkfTA6Q+CvyLgO60Fvxuxtjc4TlpOCSs18cYhBLWsPJR
 fImqXLVFS+27voFHch+p1CXlBLchVMDZ7wWFSc6KFzzMrMxc38QBwISjOwBY6BA494wb
 Q4Wus5aeboX7dMoKFntwMYTLyhptRRTdXGVrxVfJBnxbMuMGi4QKoqyy0dEhpgHiz+u9
 Ojpk3y7RnCmuYUKRLPf39Ag8/0vbVU4zcu4YRRxZIiYIuo6AVFTnQFa9vT3myo+Y88AK
 vavyVIwFEqa4wehNrH4qBfdUfGMDCj3mG34SG02pC/0fqJvKkWKCz5+GEDAy/jueBBpf
 pYfQ==
X-Gm-Message-State: AC+VfDx44TEBhwoQKJQ0I2snba066K+YWLuIm9Yx+fY5bwjyeXoVBoWp
 PHENKa+eGvLB+1GRKbfnbj3bxLw2JeuELn3j4SR/N4H5AJXjvS147NG0/wVl/V42GbMA6n9NoA5
 CysEyjs7OSK2gqdo=
X-Received: by 2002:a7b:c30d:0:b0:3f1:745d:821 with SMTP id
 k13-20020a7bc30d000000b003f1745d0821mr22027341wmj.23.1684143980043; 
 Mon, 15 May 2023 02:46:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Qf6EEmiKz3y8jxovGG7lRMKQvzvWZSaivqUOB++NfoqFVsqpwExhv5gX33Zng4g3JrbaFqQ==
X-Received: by 2002:a7b:c30d:0:b0:3f1:745d:821 with SMTP id
 k13-20020a7bc30d000000b003f1745d0821mr22027330wmj.23.1684143979722; 
 Mon, 15 May 2023 02:46:19 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-139.web.vodafone.de.
 [109.43.176.139]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f42cc3262asm18131974wmq.34.2023.05.15.02.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 02:46:19 -0700 (PDT)
Message-ID: <a99c3cb8-94f0-125e-422d-c0a33211bf4e@redhat.com>
Date: Mon, 15 May 2023 11:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/18] tests/qtest/meson.build: Run the net filter tests
 only with default devices
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230512124033.502654-1-thuth@redhat.com>
 <20230512124033.502654-17-thuth@redhat.com>
 <CABgObfbbpsUt6yn6XWDy=HS8z_ZDs088w1wgFk_cx3A8ZAizUg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CABgObfbbpsUt6yn6XWDy=HS8z_ZDs088w1wgFk_cx3A8ZAizUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.93, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/05/2023 22.31, Paolo Bonzini wrote:
> 
> 
> Il ven 12 mag 2023, 14:41 Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> ha scritto:
> 
>     These tests rely on a default NIC to be available. Skip them if we
>     used the "--without-default-devices" configure option.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
> 
> 
> This is the only patch I have some qualms about, because it reduces coverage 
> in legitimate setups where the default NIC _is_ included in the binary.
> 
> Still a lot better than before, but please add a FIXME here.

Ok, will do.

> We can perhaps 
> try to use QMP to check if the machines have a usable default NIC, and if 
> not skip the test, but this should not block the bulk of your work from 
> being merged.

I'm currently not aware of a way to query the default NIC via QMP, so this 
might need some extensions there ... but I'll keep it in mind.

The alternative would be to hard-code the default NICs for each architecture 
in the tests again and check for the availability with that hard-coded list 
... but that's also ugly, I think.

> So, apart from this issue, series
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

  Thomas



