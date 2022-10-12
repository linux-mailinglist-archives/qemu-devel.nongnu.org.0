Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F95FCB4A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:05:35 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oih2s-0000ik-Lk
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oigzy-0007eN-JH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oigzj-0008BY-Qa
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665601336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lGnjmk4QXLnhNqdwHBPxF72WybIXh4Ra987sk9L3oQ=;
 b=boddau4F0csbVQ8xyAfK7XReE9DaiD0cGHUa50Ka6DtAgjtIc7D6tzQ5lu4HrBuRh1MXOY
 vkmDZpqFWaGG1zlXXghstU33+FMdUKvB43cp3+fvTFYBm8frQc0uUmheP0GmzXvCTdNSNX
 oRUuo6JQArvssFxdxm5zfQTjykFii9M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-6vx15wTJMNefZW3UgZew7A-1; Wed, 12 Oct 2022 15:02:14 -0400
X-MC-Unique: 6vx15wTJMNefZW3UgZew7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so10434504wmb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 12:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lGnjmk4QXLnhNqdwHBPxF72WybIXh4Ra987sk9L3oQ=;
 b=tiTkCbv3pqIdQO/9S3ICgBf0dyLPyJi0FHXRcGyP4coyAu0nKgaCa8v4bHsde9Ct7j
 BCJ9Zaw5LwnjhCTRXYLRrLbrB2NXtj8nlhgY64UHmog09+BiN+nxfkAyYcsCuK8Fk3/A
 eu3lw6qbF+Thls57lW9gHa+axVVyulOhutWovLUFnaWGch+HVZVoB+MUNIyoH+9luLTS
 RK+QZ4UOQR7IyLW8DGJEBg9pnmMcqaJ1sed87lq8g4ffcNrUjfaKd4R/11usAYFTCcIg
 ZSyXw6UA8o9OSCBctQgovYu3FHEnpFI2w1V9jUQjAgT5YBvErMmynXGvIHlk6t0XV1bl
 0ujA==
X-Gm-Message-State: ACrzQf0rWu56GQZ7T5qhkwfoF4LLp2c929u0we5XWhWJO/8UWijzlbhn
 Mj5R4tSA8znu9o/dda9mMuVdq5JAx7626yWIXgynROvz47jgz1gFcxm1Qg0Td0BMtZnU5kh6Wd1
 fffeB7NTtqbuKPYU=
X-Received: by 2002:a05:600c:444b:b0:3b4:cb9e:bd5c with SMTP id
 v11-20020a05600c444b00b003b4cb9ebd5cmr3789550wmn.124.1665601333224; 
 Wed, 12 Oct 2022 12:02:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zfnZLqKhzo6Pd0xsPwRTQmegRT1QPcE053UeeonfEMp9xQcbueO1uCpBI1STvMF8WorMf1w==
X-Received: by 2002:a05:600c:444b:b0:3b4:cb9e:bd5c with SMTP id
 v11-20020a05600c444b00b003b4cb9ebd5cmr3789502wmn.124.1665601332447; 
 Wed, 12 Oct 2022 12:02:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:fd00:9f9b:c2f8:47fc:4836?
 (p200300cbc713fd009f9bc2f847fc4836.dip0.t-ipconnect.de.
 [2003:cb:c713:fd00:9f9b:c2f8:47fc:4836])
 by smtp.gmail.com with ESMTPSA id
 i18-20020adfefd2000000b00231a5fa1ae2sm389849wrp.20.2022.10.12.12.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 12:02:12 -0700 (PDT)
Message-ID: <aded961a-3367-3430-be04-36dd0b89629e@redhat.com>
Date: Wed, 12 Oct 2022 21:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/4] qtest: Improve error messages when property can not
 be set right now
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net
References: <20221012153801.2604340-1-armbru@redhat.com>
 <20221012153801.2604340-4-armbru@redhat.com>
 <e5dd172e-1b9f-3817-a87f-3ed52a0ce120@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e5dd172e-1b9f-3817-a87f-3ed52a0ce120@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12.10.22 20:05, Thomas Huth wrote:
> On 12/10/2022 17.38, Markus Armbruster wrote:
>> When you try to set qtest property "log" while the qtest object is
>> active, the error message blames "insufficient permission":
>>
>>       $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -chardev socket,id=chrqt0,path=qtest.socket,server=on,wait=off -object qtest,id=qt0,chardev=chrqt0,log=/dev/null
>>       QEMU 7.1.50 monitor - type 'help' for more information
>>       (qemu) qom-set /objects/qt0 log qtest.log
>>       Error: Insufficient permission to perform this operation
>>
>> This implies it could work with "sufficient permission".  It can't.
>> Change the error message to:
>>
>>       Error: Property 'log' can not be set now
> 
> Can it be set later? ... if not, that error message is almost as confusing
> as the original one. Maybe it's better to tell the users *when* they can set
> the property?

I assume it's mostly about "This property cannot be set." and "This 
property can no longer be set." ?

-- 
Thanks,

David / dhildenb


