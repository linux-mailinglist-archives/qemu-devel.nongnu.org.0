Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732E456C68
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:36:04 +0100 (CET)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0JP-0006xj-A2
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:36:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo08v-00019h-6V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:25:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo08p-0006ps-OE
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92CHMIRjo9UQrwVLVmgzU3EhZlb5OTTf5A9M47BJEfs=;
 b=KwE701OSERYGNALaPMmxx2vxD7FjoxrIipFktKDJiVUWPxlFEJyBJRmv+iCsBTH3+bflBE
 emsHkJVoiIkgEU0Y/SYcTyHF01OnMpFE3VQ8xijRRfyXR+Gd637AxjOpvH2is4RhlP+Vli
 fudOrt1TvkUQ5sRAYFNni3/Dd0Ce3KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-0MTvePOMMyqcdo3cappaXA-1; Fri, 19 Nov 2021 04:25:02 -0500
X-MC-Unique: 0MTvePOMMyqcdo3cappaXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95433804141;
 Fri, 19 Nov 2021 09:25:01 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79DBB60854;
 Fri, 19 Nov 2021 09:24:59 +0000 (UTC)
Message-ID: <84c160f2-476f-6d06-4313-24a16375659c@redhat.com>
Date: Fri, 19 Nov 2021 10:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] chardev/wctable: don't free the instance in
 wctablet_chr_finalize
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
References: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
 <CAMxuvaxp0x805rOPA8YsQfGEPHBz=pTVvwiHot5UGVwdbEOKFw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvaxp0x805rOPA8YsQfGEPHBz=pTVvwiHot5UGVwdbEOKFw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, yc-core@yandex-team.ru,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 15:51, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Nov 17, 2021 at 6:25 PM Daniil Tatianin
> <d-tatianin@yandex-team.ru> wrote:
>>
>> Object is supposed to be freed by invoking obj->free, and not
>> obj->instance_finalize. This would lead to use-after-free followed by
>> double free in object_unref/object_finalize.
>>
>> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> 
> Fixes: 378af96155d62 ("Add wctablet device")
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
>> ---
>>   chardev/wctablet.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
>> index e9cb7ca710..fa3c9be04e 100644
>> --- a/chardev/wctablet.c
>> +++ b/chardev/wctablet.c
>> @@ -318,7 +318,6 @@ static void wctablet_chr_finalize(Object *obj)
>>       TabletChardev *tablet = WCTABLET_CHARDEV(obj);
>>
>>       qemu_input_handler_unregister(tablet->hs);
>> -    g_free(tablet);
>>   }
>>
>>   static void wctablet_chr_open(Chardev *chr,
>> --
>> 2.25.1
>>
> 
> 

Queued, thanks.

Paolo


