Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C798F6798E6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 14:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIya-0007dU-Fa; Tue, 24 Jan 2023 08:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKIyO-0007cs-4p
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 08:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKIyD-0000sX-D8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 08:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674565452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pk4MbEigUqfkPDpfxtlt5L30xROiHGSo4jHlC8cmF/g=;
 b=NgEQQyvo7TChHFttwZu0HnZB3ajSt4oBZbpntM9EIz3OIOaGzheVk4HGPAeuBb6PCkFyVI
 hTjPZbkM4EwMJ5eVVDmHUhd49C7NIHZ4GxoeZZIU7iVNuLPOnWgM6mo3FjVhyJrtNfqJcZ
 NVBcaFwH9VQSAKtshK7YCccueyxCdE0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-q9WlOai2OcWMYRCjg5Xlcw-1; Tue, 24 Jan 2023 08:04:11 -0500
X-MC-Unique: q9WlOai2OcWMYRCjg5Xlcw-1
Received: by mail-yb1-f199.google.com with SMTP id
 g73-20020a25db4c000000b00802b0159bccso11418712ybf.22
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 05:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pk4MbEigUqfkPDpfxtlt5L30xROiHGSo4jHlC8cmF/g=;
 b=ijLxuLK+sF5YjDJeczIIqeFocCx7J3wpJc0xbc6x/iLbZcM4JYNRdiF4LLQZfxYHYo
 IU13rTQaSze1rB0ncQkDYoORu4fM9MnOkTUaQARS1UfBtSDkYi9SyzcITtQBYiyd7zU+
 dJFfJ3++SGqFuN0RctNFMcaY9MdSRihfkjTPBybAvAFfAuVwoQ1dqpHsCQ2e5uJqWv/f
 v0TbydYCRnDQCmdGHjpF2bH8ce6WGzLvahq2SSumpIPi4G3EgGAnsjOk2f9Sjwsf1c0Q
 4Y02lTlIbaGVPqmaBl7thc5xIKBWrEnv4wQNfO4/M3+rU+tGUxZSabOjfhl8jqMZ6hg8
 sNRA==
X-Gm-Message-State: AO0yUKVXcUMn6Ywu+NIjr22R7H1vC131aHvJiA4dnzV60nO9LtV00fG8
 39P7xBk7VggyGzB2/7Sua9W3h3RPHz4nDCxUDgiL+t8rA3Axl3aYF8qiuvx8g+WotviKNcB+SqZ
 OQ5R9q+XAlry/jqM=
X-Received: by 2002:a05:7500:10d5:b0:f3:9a2b:fd88 with SMTP id
 21-20020a05750010d500b000f39a2bfd88mr14710gai.0.1674565450531; 
 Tue, 24 Jan 2023 05:04:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9Wb9MS6OA/Ztzbf8xdYbeR/wAdXZuZuT7ozNDbI+mfgHp3MX1kfo1e9IV4I5l3eMn8GuM1XA==
X-Received: by 2002:a05:7500:10d5:b0:f3:9a2b:fd88 with SMTP id
 21-20020a05750010d500b000f39a2bfd88mr14689gai.0.1674565450087; 
 Tue, 24 Jan 2023 05:04:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 t21-20020ac85315000000b003b68ea3d5c8sm1197914qtn.41.2023.01.24.05.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 05:04:09 -0800 (PST)
Message-ID: <9807ec99-a746-20e3-10fa-3cc32959fd00@redhat.com>
Date: Tue, 24 Jan 2023 14:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
 <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com> <877cxdcr5l.fsf@suse.de>
 <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com> <87r0vleykh.fsf@suse.de>
 <de042a7e-f9eb-8fe0-cad6-b3277e79b9c6@redhat.com> <87v8kw5cew.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87v8kw5cew.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/01/2023 13.45, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 23/01/2023 22.22, Fabiano Rosas wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> On 23/01/2023 14.32, Fabiano Rosas wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> On 20/01/2023 20.44, Fabiano Rosas wrote:
>>>>>>> These leaks can be avoided:
>>>>>>>
>>>>>>>      759 bytes in 61 blocks are still reachable in loss record 56 of 60
>>>>>>>         at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>>>         by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>>         by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>>         by 0x12083E: qtest_get_machines (libqtest.c:1323)
>>>>>>>         by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>>>         by 0x11556C: main (test-hmp.c:160)
>>>>>>>
>>>>>>>      992 bytes in 1 blocks are still reachable in loss record 57 of 60
>>>>>>>         at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>>>         by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>>         by 0x120725: qtest_get_machines (libqtest.c:1313)
>>>>>>>         by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>>>         by 0x11556C: main (test-hmp.c:160)
>> ...
>>>> (Also, it's valgrind that you used, isn't it? - I wonder why it's
>>>> complaining here at all since the pointer to the memory should still be
>>>> valid at the end?)
>>>
>>> valgrind is complaining about the memory not being explicitly freed at
>>> any point. I guess "leak" was not the most precise term to use in the
>>> commit message.
>>
>> How did you run valgrind? For me, it does not really complain about the
>> non-freed memory here since it is still reachable. The only difference that
>> I see is in the summary. Without your patch:
>>
>>       still reachable: 27,471 bytes in 152 blocks
>>
>> with your patch:
>>
>>       still reachable: 25,713 bytes in 88 blocks
> 
> valgrind --leak-check=full --show-leak-kinds=all

Ok, so that "--show-leak-kinds=all" is the issue here. I think it does not 
make sense to go hunting for each and every "reachable" non-freed memory 
block - since they have not really been leaked during runtime. It's maybe 
better if you just use "--show-leak-kinds=definite,indirect,possible" instead.

  Thomas



