Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A245E2B460B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:43:19 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefiw-0007wN-OI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kefhF-0007HI-Tr
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kefhE-0002Ho-1X
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605537691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3GiiuvdPl+IdyOAda7PnsJnSNaaUrGGzeAc8Hj4o2U=;
 b=WUediJkwwObhwVhs+4xyozDm1t00D1CTAn1HN9ewgp024Vl2OrNPxjpBup9UbSIuic0dPz
 jgs9aRxSC0vAJgXOZE26pb1geknXKXTrBN/nKjeKBycAd/kwPeQ8NrM9rifoJVxxcODIlO
 83If5i2iKAdil4Sf1MFRLz/T5kotVSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-o_DE9qPIPNSxx_0FqZ-9QA-1; Mon, 16 Nov 2020 09:41:27 -0500
X-MC-Unique: o_DE9qPIPNSxx_0FqZ-9QA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA501DDF4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 14:41:26 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DED2176BB;
 Mon, 16 Nov 2020 14:41:26 +0000 (UTC)
Subject: Re: [PATCH v2 1/7 for-5.2?] net: Fix memory leak on error
To: Markus Armbruster <armbru@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-2-eblake@redhat.com>
 <87pn4didod.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3f6e330f-ca1c-3aa8-362d-dafd9f4ad813@redhat.com>
Date: Mon, 16 Nov 2020 08:41:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87pn4didod.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:22 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> If qmp_query_rx_filter() encounters an error on a second iteration, it
>> leaks the memory from the first.
>>
>> Fixes: 9083da1d4c
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  net/net.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/net/net.c b/net/net.c
>> index 794c652282cb..eb65e110871a 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -1213,6 +1213,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>        NetClientState *nc;
>        RxFilterInfoList *filter_list = NULL, *last_entry = NULL;
> 
>        QTAILQ_FOREACH(nc, &net_clients, next) {
>            RxFilterInfoList *entry;
>            RxFilterInfo *info;
> 
>            if (has_name && strcmp(nc->name, name) != 0) {
>                continue;
>            }
> 
> If @has_name and we get here more than once, then multiple @net_clients
> have the same name.  How can that be?  We are not supposed to return
> multiple replies with the same @name, are we?

Oh, good spot. I was going off of the fact that the loop had an early
exit, but did not further note that early exit is only possible in the
case where the bulk of the loop executes exactly once.

> 
>            /* only query rx-filter information of NIC */
>>          if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
>>              if (has_name) {
>>                  error_setg(errp, "net client(%s) isn't a NIC", name);
>> +                qapi_free_RxFilterInfoList(filter_list);
> 
> Unless multiple @net_clients are named @name, @filter_list is null,
> isn't it?

Correct.

> 
>>                  return NULL;
>>              }
>>              continue;
>            }
> 
>            /* only query information on queue 0 since the info is per nic,
>             * not per queue
>             */
>            if (nc->queue_index != 0)
>                continue;
> 
>            if (nc->info->query_rx_filter) {
>                info = nc->info->query_rx_filter(nc);
>                entry = g_malloc0(sizeof(*entry));
>                entry->value = info;
> 
>                if (!filter_list) {
>                    filter_list = entry;
> 
>>From now on, we must either return or free @filter_list.
> 
>                } else {
>                    last_entry->next = entry;
>                }
>                last_entry = entry;
>> @@ -1238,6 +1239,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
>>          } else if (has_name) {
>>              error_setg(errp, "net client(%s) doesn't support"
>>                         " rx-filter querying", name);
>> +            qapi_free_RxFilterInfoList(filter_list);
> 
> Unless multiple @net_clients are named @name, @filter_list is null,
> isn't it?
> 
>>              return NULL;
>>          }
> 
>            if (has_name) {
>                break;
>            }
>        }
> 
> I dislike this loop.

No joke.  But you've confirmed that this patch is unnecessary; and the
rest of my series is 6.0 material, so there's nothing left to worry
about for 5.2 from this series.

> 
>        if (filter_list == NULL && has_name) {
>            error_setg(errp, "invalid net client name: %s", name);
>        }
> 
>        return filter_list;
> 
> I should've strangled the optional @name parameter in the crib.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


