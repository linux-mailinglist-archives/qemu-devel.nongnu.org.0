Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE141399DD5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:32:20 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loji7-0000GD-R7
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lojge-0007as-EY
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lojgb-0001SS-Vo
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622712644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzdGpxPx0s6SYT+JJ/WmDkoZmEkm5a0PxW0eqK0bcDg=;
 b=Q5ndhnNvzmCCE9PcWdmkW6MenVCKsM8yZcq7MsSXvgDTYts2zYD3XH0VnPqregYsheigLc
 D1SE4iTfOMMLjnXVeX1d//d2sqCDKS4dZooidiR3q3wuK96mKt8mSft0s3mheHikZLK4ps
 DndMW2DxjW0vAXX6p4wLkD/YYMkYwsI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-4ovhSds-OISw4HaacM6U0w-1; Thu, 03 Jun 2021 05:30:41 -0400
X-MC-Unique: 4ovhSds-OISw4HaacM6U0w-1
Received: by mail-ed1-f72.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so2968541edq.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NzdGpxPx0s6SYT+JJ/WmDkoZmEkm5a0PxW0eqK0bcDg=;
 b=W+0nM8+REEIOWU2PIXiHrgWULrGNJ6XD+Ud5otBCRJPBuwro/rnea9kzgG0+zavd6z
 VcI8tmzOKq09kXFPgrQSwttbMCiE2/GO9XZV7VdP6P0/GeyOypJj1tqNV0ZSXC2LwNhR
 VdU0J3AC+QrFIfiDe5YlKuIMAmkuSSdetKS75UkPrecLF0j+7fCAOyzlJ5y+pBGdhuIN
 IpXRpUnVK2thkRVClBghhln2ZnkvzRSkBpxwWRI/IUlpLTmAaH6GGom1OB2vztMxSIPp
 4mJ4h1hcOdaUiC6sFsaWQLKGyKbki8iSPzmYpCYTVynok5y4MBqvzQYjGnv1kVfDi1X/
 t5mA==
X-Gm-Message-State: AOAM533qIZS8J3v9xcCEG8+eHnvwqqGM22V4odQ5qACs6VG0bbcUvkaf
 yB5YsDtet6CB+BjrY5Pu8CN8Pm//saNR1DOABewGUuI3SOn1SyrdX0sLpWzMwsFqdd0Eh7u2Dfr
 8nehjEZNedOU4OWo=
X-Received: by 2002:a50:8751:: with SMTP id 17mr33642870edv.340.1622712640689; 
 Thu, 03 Jun 2021 02:30:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQy3cZ0eqVog8TUVk+QwhWk0ycRe/gAelrtpa0e7NK2pfdvBO1cWxyAwJ835csvQFR1OG6EQ==
X-Received: by 2002:a50:8751:: with SMTP id 17mr33642850edv.340.1622712640462; 
 Thu, 03 Jun 2021 02:30:40 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id p14sm1462244eds.19.2021.06.03.02.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 02:30:40 -0700 (PDT)
Subject: Re: [RFC PATCH 2/2] migration/rdma: Enable use of g_autoptr with
 struct rdma_cm_event
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210602175105.2522032-1-philmd@redhat.com>
 <20210602175105.2522032-3-philmd@redhat.com>
 <0d008a0e-62ed-c788-1303-eecca04f3c4a@fujitsu.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <de004f25-615a-ebe5-2bdd-b3af44bab459@redhat.com>
Date: Thu, 3 Jun 2021 11:30:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0d008a0e-62ed-c788-1303-eecca04f3c4a@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 3:34 AM, lizhijian@fujitsu.com wrote:
> 
> 
> On 03/06/2021 01.51, Philippe Mathieu-Daudé wrote:
>> Since 00f2cfbbec6 ("glib: bump min required glib library version to
>> 2.48") we can use g_auto/g_autoptr to have the compiler automatically
>> free an allocated variable when it goes out of scope,
> Glad to know this feature.
> 
> However per its code, a  'ack' does much more than just free the memory.
> not sure g_autoptr have the ability to do the same.

See
https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#G-DEFINE-AUTOPTR-CLEANUP-FUNC:CAPS

  Defines the appropriate cleanup function for a pointer type.

  The function will not be called if the variable to be cleaned
  up contains NULL.

  This will typically be the _free() or _unref() function for
  the given type.

This does not change the code to call free(ptr), but to call the
registered cleanup function, which is rdma_ack_cm_event().

> 
> 2212 static void ucma_complete_event(struct cma_id_private *id_priv)
> 2213 {
> 2214 pthread_mutex_lock(&id_priv->mut);
> 2215 id_priv->events_completed++;
> 2216 pthread_cond_signal(&id_priv->cond);
> 2217 pthread_mutex_unlock(&id_priv->mut);
> 2218 }
> 2219
> 2220 static void ucma_complete_mc_event(struct cma_multicast *mc)
> 2221 {
> 2222 pthread_mutex_lock(&mc->id_priv->mut);
> 2223 mc->events_completed++;
> 2224 pthread_cond_signal(&mc->cond);
> 2225 mc->id_priv->events_completed++;
> 2226 pthread_cond_signal(&mc->id_priv->cond);
> 2227 pthread_mutex_unlock(&mc->id_priv->mut);
> 2228 }
> 2229
> 2230 int rdma_ack_cm_event(struct rdma_cm_event *event)
> 2231 {
> 2232     struct cma_event *evt;
> 2233
> 2234     if (!event)
> 2235         return ERR(EINVAL);
> 2236
> 2237     evt = container_of(event, struct cma_event, event);
> 2238
> 2239     if (evt->mc)
> 2240 ucma_complete_mc_event(evt->mc);
> 2241 else
> 2242 ucma_complete_event(evt->id_priv);
> 2243 free(evt);
> 2244     return 0;
> 2245 }
> 
> Thanks
> Zhijian
> 
>> removing this
>> burden on the developers.
>>
>> Per rdma_cm(7) and rdma_ack_cm_event(3) man pages:
>>
>>    "rdma_ack_cm_event() - Free a communication event.
>>
>>     All events which are allocated by rdma_get_cm_event() must be
>>     released, there should be a one-to-one correspondence between
>>     successful gets and acks. This call frees the event structure
>>     and any memory that it references."
>>
>> Since the 'ack' description doesn't explicit the event is also
>> released (free'd), it is safer to use the GLib g_autoptr feature.
>> The G_DEFINE_AUTOPTR_CLEANUP_FUNC() macro expects a single word
>> for the type name, so add a type definition to achieve this.
>> Convert to use g_autoptr and remove the rdma_ack_cm_event() calls.
>>
>> Inspired-by: Li Zhijian <lizhijian@cn.fujitsu.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC: build-tested only
>> ---
>>   migration/rdma.c | 27 ++++++++++-----------------
>>   1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index b50ebb9183a..b703bf1b918 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -38,6 +38,9 @@
>>   #include "qom/object.h"
>>   #include <poll.h>
>>   
>> +typedef struct rdma_cm_event rdma_cm_event;
>> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(rdma_cm_event, rdma_ack_cm_event)
>> +
>>   /*
>>    * Print and error on both the Monitor and the Log file.
>>    */
>> @@ -939,7 +942,7 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
>>       int ret;
>>       struct rdma_addrinfo *res;
>>       char port_str[16];
>> -    struct rdma_cm_event *cm_event;
>> +    g_autoptr(rdma_cm_event) cm_event = NULL;
>>       char ip[40] = "unknown";
>>       struct rdma_addrinfo *e;
>>   
>> @@ -1007,11 +1010,11 @@ route:
>>           ERROR(errp, "result not equal to event_addr_resolved %s",
>>                   rdma_event_str(cm_event->event));
>>           perror("rdma_resolve_addr");
>> -        rdma_ack_cm_event(cm_event);
>>           ret = -EINVAL;
>>           goto err_resolve_get_addr;
>>       }


