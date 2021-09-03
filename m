Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF46400407
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:21:38 +0200 (CEST)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCsj-0005qp-PY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMChR-0006d6-7A
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMChM-0004JF-8l
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630688990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Yk5Mkmp0VM67dSuNmhQd5hRlbMvQIpshO5Xo/MC910=;
 b=R6NRMW++nZEmFONw55/wyEXgJdl6VmZVj6AUtLsdvgWZQIQBYiChEEf8f9aDGZyX9HtVaS
 uGbdmfI+7I5Qf+bms8gosi6pplc+jQnMUXLntf2ml8xg8qJ/n9HLhfL0bOwkTePuKC8U2j
 Mpp2kk22S6Z0IfhA6PPLQfRVmlPM/ro=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-GQ8E7S9-NxugchAVwATTfQ-1; Fri, 03 Sep 2021 13:09:47 -0400
X-MC-Unique: GQ8E7S9-NxugchAVwATTfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e33-20020a05600c4ba100b002f8993a54f8so47wmp.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Yk5Mkmp0VM67dSuNmhQd5hRlbMvQIpshO5Xo/MC910=;
 b=ohDcwB0GEzCRPw7oijHc0JR3SK8t6hMlr+WyRmkhkrnlbyJjZMao6ljsbnBEFkV2ca
 CNu7l9qSPXFs1VoMOyNWqw/BPNN9z1lUIenpnO7d0ZQVZ1cl50AbKGG6pXCDY62ACIdP
 GY5/V06YhWQka3KSCQLsCdnz8YLIiWXSpx2wAiNk0FRX80U8agHsjd2iRyQ/PbT2fVwp
 CZDw3efpIiczrShaTvOOrEPO7HuTJR67VpfQ7s1babMGMt5FD7EFEEAa1PUQmcfL0Goo
 gI7GQ7+TpsUdbxAZXO7YHvS69pticuGooh1JBHYubIss3LCL/1U5RlOHUdKOA1WYHjjP
 vz+Q==
X-Gm-Message-State: AOAM5328dlPG3K+a8G30cnew98/32URLFQFmaNPFi+7ZVZyAreH3TzZw
 VQp5UOsMT1fGWwT2WrIj3LxdDgTp0Ids1k+IeJHqPzYv/ROMdSBObJ/gDCYjJ2/kvYZGMmSNzgw
 8SE9vvSyFYyZd4qQ=
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr1411809wmj.109.1630688985970; 
 Fri, 03 Sep 2021 10:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpbAQHdT9zR4RPEuaMvGZxwRW3QkWRVP/v4TWPWl150WcntDG9aCoCOcXSxUtBNtTANxXHCA==
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr1411736wmj.109.1630688985659; 
 Fri, 03 Sep 2021 10:09:45 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm4356404wmq.36.2021.09.03.10.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:09:44 -0700 (PDT)
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com> <YTIEDKAgWGRt/I6y@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b9a88eb-f921-56c5-96ff-4a5fc77c190b@redhat.com>
Date: Fri, 3 Sep 2021 19:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTIEDKAgWGRt/I6y@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 John Snow <jsnow@redhat.com>, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Zhang Chen <chen.zhang@intel.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:16 PM, Daniel P. Berrangé wrote:
> On Fri, Sep 03, 2021 at 01:06:36PM +0200, Philippe Mathieu-Daudé wrote:
>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> (Fedora 34 provides GLib 2.68.1) we get:
>>
>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>   ...
>>
>> g_memdup() has been updated by g_memdup2() to fix eventual security
>> issues (size argument is 32-bit and could be truncated / wrapping).
>> GLib recommends to copy their static inline version of g_memdup2():
>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>> Our glib-compat.h provides a comment explaining how to deal with
>> these deprecated declarations (see commit e71e8cc0355
>> "glib: enforce the minimum required version and warn about old APIs").
>>
>> Following this comment suggestion, implement the g_memdup2_qemu()
>> wrapper to g_memdup2(), and use the safer equivalent inlined when
>> we are using pre-2.68 GLib.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/include/glib-compat.h b/include/glib-compat.h
>> index 9e95c888f54..6577d9ab393 100644
>> --- a/include/glib-compat.h
>> +++ b/include/glib-compat.h
>> @@ -68,6 +68,42 @@
>>   * without generating warnings.
>>   */
>>  
>> +/*
>> + * g_memdup2_qemu:
>> + * @mem: (nullable): the memory to copy.
>> + * @byte_size: the number of bytes to copy.
>> + *
>> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
>> + * from @mem. If @mem is %NULL it returns %NULL.
>> + *
>> + * This replaces g_memdup(), which was prone to integer overflows when
>> + * converting the argument from a #gsize to a #guint.
>> + *
>> + * This static inline version is a backport of the new public API from
>> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
>> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> + *
>> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
>> + *          or %NULL if @mem is %NULL.
>> + */
>> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
>> +{
>> +#if GLIB_CHECK_VERSION(2, 68, 0)
>> +    return g_memdup2(mem, byte_size);
>> +#else
>> +    gpointer new_mem;
>> +
>> +    if (mem && byte_size != 0) {
>> +        new_mem = g_malloc(byte_size);
>> +        memcpy(new_mem, mem, byte_size);
>> +    } else {
>> +        new_mem = NULL;
>> +    }
>> +
>> +    return new_mem;
>> +#endif
>> +}
> 
> Close, but you missed the final piece of the puzzle
> 
>    #define g_memdup2(a) g_memdup2_qemu(a)

Doh :/

> Such that in all following patches you can use the normal "g_memdup2"
> API. This means when we later update min glib, we just delete the
> compat code here, and the callers don't need updates.

Painful rebase in perspective...


