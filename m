Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BB5264E9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:40:28 +0200 (CEST)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWSx-0004Mw-6h
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWPl-0002FU-EI
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1npWPj-0005K0-Ou
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFUtQhXBI6mcBGBeNmNg7/khP0t9HLPOnHJbFf6YHBI=;
 b=d83O0vbvxI3IBusDgRnu3g5vO0b1uF58jhQaBsCGf0KI5qutSHD90n7hSibhUaPmEKdtQl
 tpAA0GFDTWCktWoyA4vG/BPdhxfnAe0psp9CJ4sN196+jDNqkFjAAoGmlkbnBD2PuGbCRC
 uwZVzv9SgX9Ao4r+416LVbcHHKngzSg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-JOgNiOfFMWOLtGY6Yg_9-Q-1; Fri, 13 May 2022 10:37:05 -0400
X-MC-Unique: JOgNiOfFMWOLtGY6Yg_9-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso6050404wms.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFUtQhXBI6mcBGBeNmNg7/khP0t9HLPOnHJbFf6YHBI=;
 b=gCzVEyzERlkRB7+LW25mIY+CETk6mmoHo8gJGDNr2b5OLXzTF1R58fzdTixjBLiGaD
 ly+6fwbEiYQgZsSC2dP5Hbdt+DBxAdpzV1bCYUFLR3Z+KE5kzb8fLhJe4gvdEMr0Urkt
 khoJnepq66ORdKKB+ivRUdaSphxCyWTmcn+45dwijRoGjGYYrUOe2dvBRABRjh+Dgapa
 R+eow2OVr97VMOlY+iggksXt/C32gmh17FkykX/QidgqH27DXUtykzVgPOvMV77UcFUf
 MX40AyzlAQ7VDCppgnK/sf3PrtG0yHskG3xs0kh4oYkVkH8qW7rFZtt8WI+aT1+eykN8
 Y8cg==
X-Gm-Message-State: AOAM532+nOelQKlZoE3dFjN8ANLnyIpReWwcExGnFa1EdbjL5CZNOcdh
 cc2xc9L3UBhGdH8pLBxVEOURExaxeEH/gWD8roSeI+d250+kZ/18wOz0gSZVUQ3BbKavu5oe5YS
 bllVFhduIXgTE7kE=
X-Received: by 2002:a05:600c:601c:b0:394:9595:d7f7 with SMTP id
 az28-20020a05600c601c00b003949595d7f7mr15826529wmb.98.1652452624580; 
 Fri, 13 May 2022 07:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI2XHaKvEU8OVLpucKt0E7Q8JRByVl3N7Uk1yGgVhEdRgkXOnnzn7n6i6a8g5jM8/mjEz7qg==
X-Received: by 2002:a05:600c:601c:b0:394:9595:d7f7 with SMTP id
 az28-20020a05600c601c00b003949595d7f7mr15826482wmb.98.1652452624151; 
 Fri, 13 May 2022 07:37:04 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8d0sm2381939wra.28.2022.05.13.07.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 07:37:03 -0700 (PDT)
Message-ID: <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
Date: Fri, 13 May 2022 16:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-block@nongnu.org
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
 <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/2022 15.54, Cédric Le Goater wrote:
> Thomas, and others,
> 
> Are you ok with the qtest extension proposed by Iris ?
> 
> If so, I can take them through an aspeed PR.

Fine for me!

> On 5/13/22 07:50, Iris Chen via wrote:
>> The write_enable latch property is not currently exposed.
>> This commit makes it a modifiable property.
>>
>> Signed-off-by: Iris Chen <irischenlj@fb.com>
>> ---
>> v3: Addressed comments by Peter and Cedric.
>> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. 
>> Fixed comments regarding DEFINE_PROP_BOOL.

Acked-by: Thomas Huth <thuth@redhat.com>



