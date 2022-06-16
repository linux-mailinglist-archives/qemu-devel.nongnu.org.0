Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC354E1AC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:16:33 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pMO-0001Zc-Qc
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1p0F-0000da-Ac
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:53:39 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1p0B-0000Dd-Ew
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:53:38 -0400
Received: by mail-lj1-x22c.google.com with SMTP id s10so1363886ljh.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jSED7nYeJiCaPBZPfo5BFLpJCDhp2pBn7+gGv8ZvIgM=;
 b=ithg8l5+CqT83XkTeovUo/JbZ9J5oBxfzgtYF4d6anZoiMZhOppn9X+2xIgfpYrI+K
 rVCqtSwRFnQGZvK5i5wlAGFPprq3BEwp+2ss/powUTcJr9U+PnPEdfdsSDu8+c8W9IoJ
 aTK8+Y1t2ftfLWuWBgyau+TmEdc+cGhWoL/H3HHc1ffFbY5qXJBY19ccUIADGrqSF+nw
 LMISQ3qMLiUip+sOIfdU2KHVhbGySm8e55AEUhymBzzGE9hZ2TvFSV0VdYL9+rpUWiyH
 fewmh+To6nlsBlquaBZS0+0svNlIfhp9Z4b6muKpj2estLNsW4QQ6ZlegVqR1y0SpK6U
 JePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jSED7nYeJiCaPBZPfo5BFLpJCDhp2pBn7+gGv8ZvIgM=;
 b=zDIvBWaImIMCNkzm6/VnOyg/Wfbyey7t8p5GdE4bkdYGmyr/5dPB/h4883gK4zJ09+
 g/BMQG7N9IcvsM7JtTaicT6Pr/X3s4mdqnYLNVVmqVVPqMfy/1P10oDU7DYsinOSdZhi
 74s9Tkb4371br9aXodW9b2fjNHoEiVFcsJZCIpU3Sf0sFRnOECoxRkF479FHRlQfwO2W
 1/sclpledBxcGb77Pm/TbsHkLNhtgQl8EtfWj6DBEkT2VONqA905O1W53lQwXio8jPPr
 JE0nntP4/9P7Fy9AK2w1VVWMxRi1tkuYPoZ7rFlQi4selTQy4Lemp6Ah4TK420/fXHGr
 AOZw==
X-Gm-Message-State: AJIora+vVNRyZOF1M1xgm/KcXXyRKPGVWC288I24SWIkr/YNwVJ/EgFR
 AtWMQ80z3rj/18INtxLjx5dKnA==
X-Google-Smtp-Source: AGRyM1tiBpwGdZGCMHT7VGNoCZVMDZ0kPY3Fze6Hux63uY5lmJI/X/hs7ffMIYHZ1cQ5MEH21kzHhQ==
X-Received: by 2002:a2e:2c15:0:b0:255:b03f:b483 with SMTP id
 s21-20020a2e2c15000000b00255b03fb483mr2483254ljs.363.1655384012450; 
 Thu, 16 Jun 2022 05:53:32 -0700 (PDT)
Received: from [192.168.0.101] ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05651c10a700b0025572941cc0sm239218ljn.113.2022.06.16.05.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 05:53:31 -0700 (PDT)
Subject: Re: [PATCH 1/8] migration: Implemented new parameter stream_content
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, 
 quintela@redhat.com, dgilbert@redhat.com
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
 <20220616102006.218693-2-nikita.lapshin@openvz.org>
 <YqsGp55KDVGtKOAH@redhat.com>
From: Nikita <nikita.lapshin@openvz.org>
Message-ID: <7d86202a-5d77-a12d-9022-5bc0315af76b@openvz.org>
Date: Thu, 16 Jun 2022 15:53:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YqsGp55KDVGtKOAH@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/16/22 1:32 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 16, 2022 at 01:19:57PM +0300, nikita.lapshin@openvz.org wrote:
>> From: Nikita Lapshin <nikita.lapshin@openvz.org>
>>
>> This new optional parameter contains inormation about migration
>> stream parts to be sent (such as RAM, block, bitmap). This looks
>> better than using capabilities to solve problem of dividing
>> migration stream.
>>
>> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
>> ---
>>   migration/migration.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
>>   migration/migration.h |  2 ++
>>   qapi/migration.json   | 21 ++++++++++++++++---
>>   3 files changed, 66 insertions(+), 4 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 18e2610e88..80acf6dbc3 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -760,6 +760,12 @@
>>   #                        block device name if there is one, and to their node name
>>   #                        otherwise. (Since 5.2)
>>   #
>> +# @stream-content-list: Parameter control content of migration stream such as RAM,
>> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
>> +#                       so migration will work correctly without it.
>> +#                       This parameter takes string list as description of content
>> +#                       and include that part of migration stream. (Since 7.0)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay is experimental.
>>   #
>> @@ -780,7 +786,8 @@
>>              'xbzrle-cache-size', 'max-postcopy-bandwidth',
>>              'max-cpu-throttle', 'multifd-compression',
>>              'multifd-zlib-level' ,'multifd-zstd-level',
>> -           'block-bitmap-mapping' ] }
>> +           'block-bitmap-mapping',
>> +           'stream-content-list' ] }
>>   
>>   ##
>>   # @MigrateSetParameters:
>> @@ -925,6 +932,12 @@
>>   #                        block device name if there is one, and to their node name
>>   #                        otherwise. (Since 5.2)
>>   #
>> +# @stream-content-list: Parameter control content of migration stream such as RAM,
>> +#                       vmstate, block and dirty-bitmaps. This is optional parameter
>> +#                       so migration will work correctly without it.
>> +#                       This parameter takes string list as description of content
>> +#                       and include that part of migration stream. (Since 7.0)
>> +#
>>   # Features:
>>   # @unstable: Member @x-checkpoint-delay is experimental.
>>   #
>> @@ -960,7 +973,8 @@
>>               '*multifd-compression': 'MultiFDCompression',
>>               '*multifd-zlib-level': 'uint8',
>>               '*multifd-zstd-level': 'uint8',
>> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>> +            '*stream-content-list': [ 'str' ] } }
>>   
>>   ##
>>   # @migrate-set-parameters:
>> @@ -1158,7 +1172,8 @@
>>               '*multifd-compression': 'MultiFDCompression',
>>               '*multifd-zlib-level': 'uint8',
>>               '*multifd-zstd-level': 'uint8',
>> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
>> +            '*stream-content-list': [ 'str' ] } }
> These will need to be represented using an enum type rather than
> a string, since this value accepts a fixed pre-determined list of
> strings.
>
> With regards,
> Daniel
First of all thank you for your review!

May be I misunderstood you, but is enum convenient for this purpose? 
List for describing looks pretty good.

Or you mean that it is better to use list of enums?


