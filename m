Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C25197EC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:17:53 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9Gi-0007qq-7f
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nm9AB-0004S6-1i
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nm9A6-0007AP-7o
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651648259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxa8bMVRXwdb5ulQMr9guZhaW+Xho7EnZYRl0ly+pjs=;
 b=CUOBkWG1qIpYpLzYtNRLPqx0uFx/QZ4lk8NFqE59IVBJHfi6g/GI6MXiUd2LYlOj3xUpK5
 Pgv5SP6eCvtPfnjBkQ9rVqo9sdpbVhKEMkl8Uh+YWOpztMPar/6OAVTjVR+Yt6NJV/uySM
 y4OFt6Igr2yU/R6sH7/ajINp9xYsGi4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-QEoYUYgGNpyapI2yBMYE9w-1; Wed, 04 May 2022 03:10:58 -0400
X-MC-Unique: QEoYUYgGNpyapI2yBMYE9w-1
Received: by mail-ed1-f72.google.com with SMTP id
 s29-20020a50ab1d000000b00427e495f00cso318902edc.14
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vxa8bMVRXwdb5ulQMr9guZhaW+Xho7EnZYRl0ly+pjs=;
 b=lazbCwqxNMBTlZoq7Z94w9gBz4fwImz0pfKEUqcfZHH/mwbW9JrZ1fsxWgxloqWOrT
 8INUYC3EfvaIPBacfeWW66nECWiMaVaxGIg+TgNM/BFn0tFWe2w50YyLOURfL1SQHf2B
 qHTeQjifnL9mbtSLrY51lVsIRFArmVPe/0v7etHgooHgdblicOGb6eRK9X46WOORgetS
 PzkElVTc5Dv4D6DddUfnrlotcW2YDGpu5sppLuYLDvayyzMSFx/V/JMld4j6lP8oDzZc
 tCyM2koIJNLb4LgEHlae4mDLnJGzDQYYFTUrG2j5j8GpAfUHZDpAbugADspzl0ZxPgi+
 +vNg==
X-Gm-Message-State: AOAM531kFCJ6coz7J7ObGHgijBItYZHMNUOw5OQfgnXaxLFE8y2VIINr
 v91UbW/W7uAvPBqY7rVwgopPo1zPPVjz6C0mUjEeQRtDuxZeTSepCqarduwPEWcsi9vnORxbkCA
 vJ3cn2clZO2xPaEw=
X-Received: by 2002:a50:d585:0:b0:425:c9db:cf26 with SMTP id
 v5-20020a50d585000000b00425c9dbcf26mr21833381edi.222.1651648257129; 
 Wed, 04 May 2022 00:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygdPiN0Tv8htKIVfDMbvhOIiIIzqT2R2jfOWEApmAC5fz5kKrUn5aTNrjpmsEF+nIWMksySA==
X-Received: by 2002:a50:d585:0:b0:425:c9db:cf26 with SMTP id
 v5-20020a50d585000000b00425c9dbcf26mr21833359edi.222.1651648256833; 
 Wed, 04 May 2022 00:10:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 hz13-20020a1709072ced00b006f3ef214db2sm5305877ejc.24.2022.05.04.00.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:10:56 -0700 (PDT)
Message-ID: <bfc57634-58a2-ad3a-ad87-6cc8bcddd916@redhat.com>
Date: Wed, 4 May 2022 09:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] block/file: Add file-specific image info
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-5-hreitz@redhat.com>
 <20220503185047.4w4ulpdrzn2wbpdq@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220503185047.4w4ulpdrzn2wbpdq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03.05.22 20:50, Eric Blake wrote:
> On Tue, May 03, 2022 at 04:55:29PM +0200, Hanna Reitz wrote:
>> Add some (optional) information that the file driver can provide for
>> image files, namely the extent size.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   qapi/block-core.json | 26 ++++++++++++++++++++++++--
>>   block/file-posix.c   | 30 ++++++++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+), 2 deletions(-)
>>
>> +++ b/block/file-posix.c
>> @@ -3068,6 +3068,34 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>>       return 0;
>>   }
>>   
>> +static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
>> +                                                Error **errp)
>> +{
>> +    BDRVRawState *s = bs->opaque;
>> +    ImageInfoSpecificFile *file_info = g_new0(ImageInfoSpecificFile, 1);
>> +    ImageInfoSpecific *spec_info = g_new(ImageInfoSpecific, 1);
>> +
>> +    *spec_info = (ImageInfoSpecific){
>> +        .type = IMAGE_INFO_SPECIFIC_KIND_FILE,
>> +        .u.file.data = file_info,
>> +    };
>> +
>> +#ifdef FS_IOC_FSGETXATTR
>> +    {
>> +        struct fsxattr attr;
>> +        int ret;
>> +
>> +        ret = ioctl(s->fd, FS_IOC_FSGETXATTR, &attr);
>> +        if (!ret && attr.fsx_extsize != 0) {
>> +            file_info->has_extent_size = true;
>> +            file_info->extent_size = attr.fsx_extsize;
>> +        }
>> +    }
>> +#endif
> Can/should we fall back to stat's st_blksize when the ioctl produces
> nothing?

I don’t think so, that’s a different value.  For example, by default, we 
use an extent-size-hint of 1 MB for new images (which is applied at 
least on XFS), but that doesn’t change st_blksize (which is 4096 here).  
So I’d only report the extent-size for filesystems that actually 
differentiate between the two.

Hanna


