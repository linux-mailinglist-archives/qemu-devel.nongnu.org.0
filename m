Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48F3F9460
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:27:42 +0200 (CEST)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVL1-0003UM-Sx
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJVJV-0001sB-F2
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJVJT-0003Ja-OB
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630045563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7C7wySMAe9JOpVvX4txeGPlYFMX6w4zeJtEoSMMFacY=;
 b=cCcGm4c+LJyfoED83HJENbr+PcqHqI45zmX0kC3+nI6zc8zqHa3a2wkFiKYd0Jj+woc0Mg
 BsiQeQz33C5bm8zsxnoTGiDsX3Bj8ig94sAe2nnTXtwcmxa7WeGgM/a/xelJLhE9r2qcjQ
 oyxSYPCmthp5vxE/B5BgQtphHqq3hSQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-mEeNrHf7PHuWjSiJ3xZ-HQ-1; Fri, 27 Aug 2021 02:26:01 -0400
X-MC-Unique: mEeNrHf7PHuWjSiJ3xZ-HQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso4121348wmx.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 23:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7C7wySMAe9JOpVvX4txeGPlYFMX6w4zeJtEoSMMFacY=;
 b=oUox8V/laV27QjKP+MzwjjBAiB1JwtCY9NxzCRzjN1yUNB1n4wj785PpFm6Vqi3/8b
 8Eb39Q1ZNqt7CyBKC42ADQ3KFc9fAQnsBunXZYSMLNKAycmlXkn8/Qav3ijbvaBV9HsT
 e5KVHfs55JoKtdHYwuVmiiMAXgsAEIfyGduViV9xT87bvQCLBuOaBUv2VOdXT6MAk4Ik
 40riBlH5ZRzemQGImDyhnEMdaQb5xUo0k9WGLd/ws0wdqnFOAvH/Mflt4bno6OW67FON
 2WxZE377d8O0dbQzvIdpsmaDFLF05UMI6mdohNovjefYmsCtAncb7QqaczH0Nzk74ZI0
 +wNA==
X-Gm-Message-State: AOAM532gHjPVUKUx/OsMqZTF321O5NfjisUdih2ny0qdW6rOzDwAb2cb
 kdatYwCaBaVc6pOegw0bGpVjrafvE8gU/45ZRgMnaSUMx9vR/VqmibtR6/WXzhw86kHjjH+cHE/
 8o8+jRJv5ALI/q5I=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr8512069wrn.248.1630045560535; 
 Thu, 26 Aug 2021 23:26:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVlEeyspfsXWJ3R5+fA2VjoXZ9jwegyWJfup74/4XBcJsDPqshgJsgL31vhBpeYVzOo1sE+A==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr8512046wrn.248.1630045560293; 
 Thu, 26 Aug 2021 23:26:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r16sm703292wrg.71.2021.08.26.23.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:25:59 -0700 (PDT)
Subject: Re: [PATCH v2 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
To: Klaus Jensen <its@irrelevant.dk>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-9-philmd@redhat.com>
 <YSh+w0Avk/vUu7zE@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdc6e3e7-4c0e-6ebb-025e-38b0b3394bf3@redhat.com>
Date: Fri, 27 Aug 2021 08:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSh+w0Avk/vUu7zE@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 7:57 AM, Klaus Jensen wrote:
> On Aug 26 21:50, Philippe Mathieu-Daudé wrote:
>> Have qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
>> propagate eventual errors to callers.
>>
>> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  util/vfio-helpers.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
>> index 306b5a83e48..7de5081dbd3 100644
>> --- a/util/vfio-helpers.c
>> +++ b/util/vfio-helpers.c

>>  static int
>> -qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
>> +qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova,
>> +                         Error **errp)
>>  {
>>      int i;
>>  
>> @@ -718,6 +722,8 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
>>              return 0;
>>          }
>>      }
>> +    error_setg(errp, "temporary iova range not found");
>> +
>>      return -ENOMEM;
>>  }

>> @@ -776,7 +782,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
>>              }
>>              qemu_vfio_dump_mappings(s);
>>          } else {
>> -            if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
>> +            if (qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
>>                  ret = -ENOMEM;
>>                  goto out;
>>              }
> 
> Not related to this patch, but it is slightly confusing that these
> functions actually already return a negative errno, but then we
> overwrite it.

Good point. I'll make it return a boolean.


