Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3956F0586
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:14:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0Up-0008LO-0v; Thu, 27 Apr 2023 08:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps0Um-0008L9-4p
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps0Uj-0003NS-LW
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682597583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vcUNbaAS2df0g9CzzbPN6h3hP13jyYTFAIvYxE0zJY=;
 b=B5RjHDayWLrjEGbYm/wxF9Y7a+Z2RHVoyrI9Kxdzgx70Tk96mkdl3TrE6ZBnZXpZq27ZfS
 AMfBIsqSVMtaA1vlB467RNxZY3ILPLzQSxwBdvzuw9r9c0BHQReJ7bc2N1s/43SoCa6NkG
 BlrRLPYccYwwcdacZfVVy+xshLUo7Ro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-g1lMtlD9OWC6TxT-DOIDcQ-1; Thu, 27 Apr 2023 08:13:02 -0400
X-MC-Unique: g1lMtlD9OWC6TxT-DOIDcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so21503995e9.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682597581; x=1685189581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2vcUNbaAS2df0g9CzzbPN6h3hP13jyYTFAIvYxE0zJY=;
 b=bJt8e5/iAqxKSehuABAnsvRY3xfSv5f8JJcoJFBY2ZE55ivfG/ahgGSVT9+aRJTTF2
 YvCYByLGgBW9Qi4bNzsna9kIl06ir2c+qcJeNRE/Wy9m0qUNyqN5ovZiFe23pik8ya8S
 Zg45G/fLzqY2jFlRkaOLZqksOgneZxpMIHxuXJpbRpWnmICyJWskdgyr7Bel1/kfAexs
 NJwCbGggFd7jnTRUJB+mUa1oooh1gsGNCipBx7dcX/AVpm2y8Vg5Kcq9d/y6KZ78eytm
 KN8KMZovThD9e5mCRjVQvD2cyYM8m0zhRrNaVFBbxzkNkJneq2j4vDtFTT8+z98dYHHk
 bhEw==
X-Gm-Message-State: AC+VfDyNiywPe7FkdHp41DTJua71MuI2D9vyCNJj7mLQqXnGqB2wT6c5
 E1Q9jxT3n0yhAFaDbScqwLLUVGcC5Cl1tIG25pCV9dI42sBN0tpmyXI3cWtmv7uNNTJWApxkNha
 0NVJV6GXJKgSCbVU=
X-Received: by 2002:a7b:c4c2:0:b0:3eb:29fe:f922 with SMTP id
 g2-20020a7bc4c2000000b003eb29fef922mr1247037wmk.29.1682597581590; 
 Thu, 27 Apr 2023 05:13:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6URmeSB5qlWHMpuJ0jVMRe+zBCVJ8VrmNUgnDvRGEfUlkOnwQnCA4iSAU4o+bd8aBm/ElwUA==
X-Received: by 2002:a7b:c4c2:0:b0:3eb:29fe:f922 with SMTP id
 g2-20020a7bc4c2000000b003eb29fef922mr1247024wmk.29.1682597581333; 
 Thu, 27 Apr 2023 05:13:01 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c0b5200b003edf2dc7ca3sm20938229wmr.34.2023.04.27.05.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:13:00 -0700 (PDT)
Message-ID: <b3198ac7-4569-8903-b6a1-64aee26f8885@redhat.com>
Date: Thu, 27 Apr 2023 14:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
 <ZEoyNt0UtSYRt9Go@redhat.com>
 <CABgObfbqD+C4aME0yApeb_9dWA=22Yz+oi_7ECUtf6A4McHrhA@mail.gmail.com>
 <ZEozZX/eH7BzUrWl@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZEozZX/eH7BzUrWl@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/04/2023 10.33, Daniel P. Berrangé wrote:
> On Thu, Apr 27, 2023 at 10:31:00AM +0200, Paolo Bonzini wrote:
>> On Thu, Apr 27, 2023 at 10:28 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> I wonder if we should take this a step further and rename qemu-system-x86_64
>>>> to qemu-system-x86!  Distros can if they wish create symlinks to both
>>>> qemu-system-i386 and qemu-system-x86_64.
>>>
>>> I can't help feeling this just creates a new upgrade burden for distros
>>> for no obvious win.
>>
>> We can create the symlinks on install as well during the deprecation
>> period. It doesn't have to be done by distros.
> 
> What's the actual win though ?  Why would anyone want to create guests
> using qemu-system-x86, if both qemu-system-i386 / qemu-system-x86_64
> still exist indefinitely for backwards compat.

We could deprecate the old wrappers at one point in time, so we would 
finally have a cleaner interface.

>  What does having a
> qemu-system-x86 add that can't be achieve just though hardlink
> between the two existing binaries ?

We'd finally have a binary with saner default settings compared to the 
backlevel "pc" machine type that we have as a default now?

  Thomas


