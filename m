Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2F47D6DE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:30:58 +0100 (CET)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06O8-0006gP-D8
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n06L4-000537-Up
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n06Ky-000466-24
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640197658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyO+Zr4NVuwS/T8HoAsB2Q4l5mCIjKCx6IDBujTp3qA=;
 b=ezy6o/ZUAzrjWrX3rAvhJEL0aM/NGRF+QhsRG80SMIKgZdSEzsdrvkevVAtk+f2231OlM/
 h8olvgRIRYL74O09UhdyQrgnQ0k2KvZE0wx3HDB+S63ikgNiUkBj/KXQEck+RZaz/iyO5+
 H++6GGvt4OHFniedC8fbEOXUBjXIhWs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-3hQM6RPpM6GuOU9AcbAShg-1; Wed, 22 Dec 2021 13:27:37 -0500
X-MC-Unique: 3hQM6RPpM6GuOU9AcbAShg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h7-20020a05640250c700b003f800db4193so2527212edb.1
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 10:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GyO+Zr4NVuwS/T8HoAsB2Q4l5mCIjKCx6IDBujTp3qA=;
 b=UOwOPNZUGBbZj5gX2AOunVppdetxMtomhSwmLWAy5vRBhZbyQ956HjQmH0tgVs5nW6
 7IoDuOKeiv8oO0iJ8nAmKxCGMfr96eW2TgPhvXIHxuNyEvZ9g9kw4kktB5NlpC36X8NW
 wkwLEjRY+ofus04Ry+8tctMsedPUGkeoNeCo6GvN7/NTYbutXjESo9ispHVs3WAszPkQ
 pKsq/Hieo+S12ezuiz8kcwXzkbcltraxQXqrPDdjtUSZDbQiZway024mpE2bwEqUsUsc
 uA7UArJkTQg2/WhLhGIOxFaIgHpoR1AiZu9sQ5TFWyZw21vxCzeMKfz66OshCO+DdaBZ
 Uk3Q==
X-Gm-Message-State: AOAM530ZfcVjltgRA+DiUOzxoS64uZLFAirRTXR+Epz2kDoH8EAs0/w5
 cHUu9moIle/ouJHWNo5dF52h40iAfp7U0k73s/7Tx/MPusj0mfzadpgniCGAHMJkS9CjlgpFUIp
 IH7YBOXrnmJocxhc=
X-Received: by 2002:a17:907:7f13:: with SMTP id
 qf19mr3293718ejc.103.1640197656471; 
 Wed, 22 Dec 2021 10:27:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfskuzQi8B3I2+mlJDy42sBRqDNDfVx6MlKoLTTKd4uXMRJOTjHVI5WUPM8Ml/QIb8hbS3Pg==
X-Received: by 2002:a17:907:7f13:: with SMTP id
 qf19mr3293704ejc.103.1640197656274; 
 Wed, 22 Dec 2021 10:27:36 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id ne39sm983059ejc.142.2021.12.22.10.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:27:35 -0800 (PST)
Message-ID: <55fec69e-5a1f-e4c6-594e-067dd5bf6f07@redhat.com>
Date: Wed, 22 Dec 2021 19:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
To: Markus Armbruster <armbru@redhat.com>
References: <20211220200034.2233987-1-philmd@redhat.com>
 <20211220200034.2233987-3-philmd@redhat.com>
 <87h7b1dsqz.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87h7b1dsqz.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.694, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 08:05, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Do not list vhost-user-blk in BlockExportType
>> when CONFIG_VHOST_USER_BLK_SERVER is disabled.
>>
>> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
> 
> My immediate reaction was "what exactly is broken before this patch?"
> 
> I think it's introspection: query-qmp-schema has vhost-user-blk even
> though it's not actually available.  Let's spell that out.

Yes, OK.

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  qapi/block-export.json | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/block-export.json b/qapi/block-export.json
>> index c1b92ce1c1c..6bc29a75dc0 100644
>> --- a/qapi/block-export.json
>> +++ b/qapi/block-export.json
>> @@ -277,7 +277,8 @@
>>  # Since: 4.2
>>  ##
>>  { 'enum': 'BlockExportType',
>> -  'data': [ 'nbd', 'vhost-user-blk',
>> +  'data': [ 'nbd',
>> +            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>>              { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
>>  
>>  ##
> 
> Doesn't compile when I configure --disable-vhost-user.  Fix:
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 6bc29a75dc..f9ce79a974 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -320,7 +320,8 @@
>    'discriminator': 'type',
>    'data': {
>        'nbd': 'BlockExportOptionsNbd',
> -      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
> +      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
> +                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>        'fuse': { 'type': 'BlockExportOptionsFuse',
>                  'if': 'CONFIG_FUSE' }
>     } }

Oh, thank you very much for fixing this part!


