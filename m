Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0A346B02
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:25:11 +0100 (CET)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoWU-0002Rn-8M
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOoUL-0000Dh-BU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOoUI-0004SD-Jn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15IFVTw8PxJFfSqTWaf6slL5QxnVDHfyko/9vfyBvWI=;
 b=WKbuJSNU1JZJ/16zslsHi84bm+LIX0poz15ZkvY8IkTOkfzfPH1lBBPZFCBWVRW+tpys5/
 htW8cKTUChMJWeDR6M/xmn9K0Zu9lWzd0FhOWdDzw0XoIa4FGcfAWU+gb9j016J2i6ZVNW
 jL8bCYycgFoZBAICwsQC0vCwcepiOAA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-BsEGXLpyMRmGdQ0foAsqNg-1; Tue, 23 Mar 2021 17:22:51 -0400
X-MC-Unique: BsEGXLpyMRmGdQ0foAsqNg-1
Received: by mail-wr1-f72.google.com with SMTP id n17so1720490wrq.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 14:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15IFVTw8PxJFfSqTWaf6slL5QxnVDHfyko/9vfyBvWI=;
 b=H02ZM7UebzEbTF8lt0vH9NQ+eh/wOgunQtz9iNcZC2o6lZ6ejDFfHsj9XkwHQS72hz
 pnUCZSHtxoYfqmEccd2hnaHyq1UwuhP6v4j9hGB+joNM3MMNL64R4uBXQffVuFtKV7Ad
 tLsaSf9/08QD0Z8NQoZHltf0rRWq0/2NLZgKRrQW5D/vCTwgjE+CaRyJj6UNCwNFq6wp
 ovTtFR5ciqJQEI9z3c9Bnod4l7NCtRxdujJVpS4RvWhmJmM8M/Tik40OHd0IK/JOxiiz
 PZ8n+XtYFdqiq/NZ75flEAHITt7rCIUiGh1v5bluH+0Mn3cVrZUR0AzCgBYwW3fd+oZ+
 ph5Q==
X-Gm-Message-State: AOAM533Cuf2gCZYdvXNG7soGxiKpoprrHtYiNLr9J4e3a0CljueHx5zV
 S7IgFLdXVkKO0Y3KE15Te/J2dxBIjzymtaUQBT8P5EVX3w1hSpLLUGOAHJTWucXRzaeXjncNc8i
 R22bsAObNMe+MLiY=
X-Received: by 2002:adf:f743:: with SMTP id z3mr6039858wrp.304.1616534570688; 
 Tue, 23 Mar 2021 14:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfVYlF09mEIakVMMRpm2lat8Uhm9Mu1ZLNjgigKZ4fWSLljKOleVuhMqYhKb1qVbGTv5X3BA==
X-Received: by 2002:adf:f743:: with SMTP id z3mr6039838wrp.304.1616534570431; 
 Tue, 23 Mar 2021 14:22:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o7sm211720wrs.16.2021.03.23.14.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 14:22:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] qemu-iotests: allow passing unittest.main
 arguments to the test scripts
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-3-pbonzini@redhat.com>
 <69c695a1-e0c0-dd5a-7473-0b70ca2becdf@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fb872acc-bc21-c1b1-3dcc-d6c74da5cef2@redhat.com>
Date: Tue, 23 Mar 2021 22:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <69c695a1-e0c0-dd5a-7473-0b70ca2becdf@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 20:17, Vladimir Sementsov-Ogievskiy wrote:
>>
>> +    unittest.main(argv=argv,
>> +                  testRunner=ReproducibleTestRunner,
>> +                  verbosity=2 if debug else 1,
>> +                  warnings=None if sys.warnoptions else 'ignore')
>>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>>                            supported_platforms: Sequence[str] = (),
>> @@ -1350,7 +1354,7 @@ def execute_test(*args, test_function=None, 
>> **kwargs):
>>       debug = execute_setup_common(*args, **kwargs)
>>       if not test_function:
>> -        execute_unittest(debug)
>> +        execute_unittest(sys.argv, debug)
>>       else:
>>           test_function()
>>
> 
> If you decide to resend for some of my comments (or due to another 
> reviewer be more careful), I think it would be nicer to merge part of 
> this commit which moves us from passing object to passing 
> ReproducibleTestRunner to the previous commit, to not remove line that 
> we've added in the previous commit. And here only add argv argument.

Well, it's the price to pay to make the previous commit as independent 
as possible.  In particular in the previous patch there's no reason to 
add the complexity of warnings.

I could make it three commits, but at some point too much splitting adds 
clutter, the patches are already pretty small.

Paolo


