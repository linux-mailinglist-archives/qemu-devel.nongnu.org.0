Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE13058E0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:55:05 +0100 (CET)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4iTY-0002Y9-0f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4iSl-000292-TQ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4iSj-0002e4-6W
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611744850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aq44vgs0NCLnEPQmFv6LudhFkyQiRYyjat0jaa/hmIY=;
 b=Wn5fnx+Nza9ASHqTUZfjR6WaiPxgGjPSMoEcceMZ2+CpYismburURcylTuTC5dm4mR7P0o
 rDhLx+1rknZIKUyz8qGZNfPrKhIr0ejFbC+a+W1n4OhVGK39VIDQau/tOMK8qb/rEmnz7C
 SzynfNdEURIe5Lqngx3d0CoKMDLfc4k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-YvzTFWgfP5-kr1UTbwsUdg-1; Wed, 27 Jan 2021 05:54:08 -0500
X-MC-Unique: YvzTFWgfP5-kr1UTbwsUdg-1
Received: by mail-ej1-f71.google.com with SMTP id by20so508078ejc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 02:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aq44vgs0NCLnEPQmFv6LudhFkyQiRYyjat0jaa/hmIY=;
 b=YLJVtfLRSXPz1NG6RTkGSMtelQplWkoDxfbZZM1g1P5iQp3WMpZXqJvm5Ez93HT7Kx
 Pi9VgRy+SOV8CYBlWpa4Q/1Tj9eOrzHkbgEQSCzRvujgE08iCuD5ZUw+zyrjxgJkT0N/
 kn8R4t+4OjEfnplHYTQEs+p5tl2AKkcTLGtb2oiKUDhxJ+9ZxJry9cgMlZkUs481hlOZ
 LgxWD2Y40ExHkkCTltIU84cV0RMARs3gFXYGxz2/IWMgWz3+twZs5qaq7Jt6kc17VqTc
 7y9kB3tN9YAwcYgEGal21GDjkhRCmIhcDlvl8htrM5XJBKvz5B2h/fCbJT7QLJcr9w0B
 8Crg==
X-Gm-Message-State: AOAM530O8xq1TUGegYBz4F+NetohES6FDZ/CX96Ovgh/XP6NU2bxTHWE
 66G0p67cGr27YbeR4PLZDAiVYCKvIrGb7K5OAfrSBpjeJMz0Z4VQhtElvhc1pWHdbIQyrgzgGlx
 iCHOL3P9jd6e11sk=
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr6174102ejb.149.1611744847109; 
 Wed, 27 Jan 2021 02:54:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6SyowgKRq98akoPScoJq0aOkIieAC3j99MPeMNofyBiQaEhAGgMdZAfq06cp3KKZGmdNeEQ==
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr6174094ejb.149.1611744846882; 
 Wed, 27 Jan 2021 02:54:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g10sm639530ejp.37.2021.01.27.02.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 02:54:06 -0800 (PST)
Subject: Re: [PATCH] ui: fix spice display regression
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
References: <20210127100206.277698-1-marcandre.lureau@redhat.com>
 <CAJ+F1CLJsyq0cQRUg=neJOWOuhm94xKceR4sQFaKOUQxVRi=Yg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20940fd9-8595-26d5-e13f-6915796f1019@redhat.com>
Date: Wed, 27 Jan 2021 11:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLJsyq0cQRUg=neJOWOuhm94xKceR4sQFaKOUQxVRi=Yg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/21 11:18, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jan 27, 2021 at 2:03 PM <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Since commit b4e1a342112e50e05b609e857f38c1f2b7aafdc4 ("vl: remove
>> separate preconfig main_loop"), spice initialization is a bit dodgy, and
>> the client get stuck waiting for server events.
>>
>> The initialization order changed, so that qemu_spice_display_start() is
>> called before the display interfaces are added. The new interfaces
>> aren't started by spice-server automatically (yet?), so we have to tell
>> the server explicitely when we are already running.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

What is the exact different in initialization order once you add commit 
facf7c60ee ("vl: initialize displays _after_ exiting preconfiguration", 
2021-01-02)?

Thanks,

Paolo

>> ---
>>   ui/spice-core.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/ui/spice-core.c b/ui/spice-core.c
>> index 5746d0aae7..6eebf12e3c 100644
>> --- a/ui/spice-core.c
>> +++ b/ui/spice-core.c
>> @@ -830,6 +830,8 @@ static void qemu_spice_init(void)
>>
>>   static int qemu_spice_add_interface(SpiceBaseInstance *sin)
>>   {
>> +    int ret;
>> +
>>       if (!spice_server) {
>>           if (QTAILQ_FIRST(&qemu_spice_opts.head) != NULL) {
>>               error_report("Oops: spice configured but not active");
>> @@ -848,7 +850,13 @@ static int qemu_spice_add_interface(SpiceBaseInstance *sin)
>>           qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
>>       }
>>
>> -    return spice_server_add_interface(spice_server, sin);
>> +    ret = spice_server_add_interface(spice_server, sin);
>> +    /* make sure the newly added interface is started */
>> +    if (ret == 0 && spice_display_is_running) {
>> +        spice_server_vm_start(spice_server);
>> +    }
>> +
>> +    return ret;
>>   }
>>
>>   static GSList *spice_consoles;
>> --
>> 2.29.0
>>
>>
> 
> Oops, it doesn't work reliably. There is some race in spice server now.
> 
> spice_server_vm_start() sends RED_WORKER_MESSAGE_START to the QXL
> worker thread. But if two of those come, it will assert... It should
> probably not, I will send a patch to spice.
> 
> I am looking for other options for QEMU though.
> 


