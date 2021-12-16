Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26BB47796E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:40:58 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtoP-0007SD-Pq
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:40:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxtn4-0006Af-QD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxtn2-0005lG-I4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639672766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYFfqzSJwbx+ErAZPfyo+D7N4l9ybQslI2Zf9Hah63c=;
 b=Oe4RLSxD0oVGmlsrMVfXVCVr/r3jfBdD0bRFzeDfGT6TIULh77FWO4QUg1GJAkae0PdWf0
 n8xM4rHvciSNwmztHz8uikEPvJUVz66oawMQ1Tmc2TkFF4sjeWSTOELX3WSNIL7020b8ky
 C4YRPeRpJThF3vpLErshNp4KTWM54BY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-JSpISjgWNAWMzCxP-XL1Hg-1; Thu, 16 Dec 2021 11:39:25 -0500
X-MC-Unique: JSpISjgWNAWMzCxP-XL1Hg-1
Received: by mail-ed1-f70.google.com with SMTP id
 dm10-20020a05640222ca00b003f808b5aa18so885969edb.4
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TYFfqzSJwbx+ErAZPfyo+D7N4l9ybQslI2Zf9Hah63c=;
 b=NrfDNzJjGoPoXTmBNbEg56Vklg7iu8g2ET9JgPpvJAMq9XIjQ54jwmDxIcZjYBvSTi
 NzQyFh2JdwnUWI9pf+w3wEneSHH7vDxSrwlkQ9iPqhhvrhobK01kHhGW1udP4O4J9dVj
 PnqStBnCtZd8tBQgEyneq9FiWCNUdtJYYkmIasSFbLetDzZ1lqmZ9e+TTDPzpWK7jkvI
 0nGY4eOEoa4Wx2Wn30LHz6UxX3Z09eyfX00U7PPEoY2qcaNw7DbbDv/ndcgvUo66i3vy
 PbJ6AWRCTMIU3tLsvoKcH5UAVz6tZKD9vUuC2yWAUgWEKvE2sXPOkinkDZ7W9xa0IFk7
 NMXw==
X-Gm-Message-State: AOAM533FkPd/RA+M/P4+DNoMcPxZAvDs6Y4bCIJK1N8wsWE13mwkDTUk
 FV11Fw4GSedg5CyCcdOyzxO+a1CeSRXHuAt0LQUl4WEfN+FkMjsAt8Lst8g1mb7dxg9KXnTHvrr
 lcuSY1EmEl/k8tb4=
X-Received: by 2002:a17:907:608b:: with SMTP id
 ht11mr16320916ejc.558.1639672764054; 
 Thu, 16 Dec 2021 08:39:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwGs/NTi+n+Qt+9QW76R82L7LVudAF0xI72OahtsU+iL0FzVctxpPDC7J0hJ6Am99p/1QmfA==
X-Received: by 2002:a17:907:608b:: with SMTP id
 ht11mr16320878ejc.558.1639672763680; 
 Thu, 16 Dec 2021 08:39:23 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id c13sm1985102ejj.144.2021.12.16.08.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:39:23 -0800 (PST)
Message-ID: <63b9e91f-23d9-edc7-d011-4ecd233d0af2@redhat.com>
Date: Thu, 16 Dec 2021 17:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 13/31] block.c: add assertions to static functions
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-14-eesposit@redhat.com>
 <2ed0053b-0868-b60e-7a55-2987ea5efccb@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <2ed0053b-0868-b60e-7a55-2987ea5efccb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/12/2021 17:08, Hanna Reitz wrote:
> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>> Following the assertion derived from the API split,
>> propagate the assertion also in the static functions.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 44 insertions(+), 1 deletion(-)
> 
> Looks good to me, just one small question:
> 
>> diff --git a/block.c b/block.c
>> index 5516c84ec4..b77ab0a104 100644
>> --- a/block.c
>> +++ b/block.c
> 
> [...]
> 
>> @@ -1241,6 +1252,7 @@ static void bdrv_temp_snapshot_options(int 
>> *child_flags, QDict *child_options,
>>                                          int parent_flags, QDict 
>> *parent_options)
>>   {
>>       *child_flags = (parent_flags & ~BDRV_O_SNAPSHOT) | 
>> BDRV_O_TEMPORARY;
>> +    assert(qemu_in_main_thread());
> 
> Stylistically, it’s a bit strange that in other places, this assertion 
> comes right after all local variable declarations, or after some 
> assertions that are already present in that place; but here, it follows 
> a normal statement.  Is that on purpose?

Nope :) Just a misread, I don't even recall when I added this.
But I appreciate the investigative spirit :)
> 
>>       /* For temporary files, unconditional cache=unsafe is fine */
>>       qdict_set_default_str(child_options, BDRV_OPT_CACHE_DIRECT, "off");
> 


