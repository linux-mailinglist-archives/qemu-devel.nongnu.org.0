Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BB2B44BA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:33:24 +0100 (CET)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keedH-00006v-Ue
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1keeYz-0005VK-Tl
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1keeYu-0000c7-GF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605533331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C84wb64GVK5Hfx4W9EPu91xWCvByaxhkzJ7uMzAPmYY=;
 b=ebH94QgDmjoFV3iZ0F7T/jcvyDPqcRFtl68jf+oThhVyVvKUY2S3iny4R9av5lK6YPrqeL
 FhVDE4AdRF5pzDLK9pFnlisRiYPRzoR9RxFzTx2YJAhr7xtSm63PKPHQ8AUEHU0AhuQgaZ
 e9959zLOzjfCMpjID/tmWRc6hoQw2Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-vwjTsNNkPamHm4Zunxhe3g-1; Mon, 16 Nov 2020 08:28:48 -0500
X-MC-Unique: vwjTsNNkPamHm4Zunxhe3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464798015AA;
 Mon, 16 Nov 2020 13:28:47 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ACBB5D9D2;
 Mon, 16 Nov 2020 13:28:01 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] qapi: More complex uses of QAPI_LIST_APPEND
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-8-eblake@redhat.com> <20201113193903.GX3251@work-vm>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <55fccf13-d431-3986-f7f8-e6b8ca02cfde@redhat.com>
Date: Mon, 16 Nov 2020 07:27:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113193903.GX3251@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, armbru@redhat.com,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 1:39 PM, Dr. David Alan Gilbert wrote:
> * Eric Blake (eblake@redhat.com) wrote:
>> These cases require a bit more thought to review; in each case, the
>> code was appending to a list, but not with a FOOList **tail variable.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---

> 
> <snip>
> 

>> +++ b/monitor/hmp-cmds.c
>> @@ -1699,7 +1699,8 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
>>  void hmp_sendkey(Monitor *mon, const QDict *qdict)
>>  {
>>      const char *keys = qdict_get_str(qdict, "keys");
>> -    KeyValueList *keylist, *head = NULL, *tmp = NULL;
>> +    KeyValue *v;
>> +    KeyValueList *head = NULL, **tail = &head;
>>      int has_hold_time = qdict_haskey(qdict, "hold-time");
>>      int hold_time = qdict_get_try_int(qdict, "hold-time", -1);
>>      Error *err = NULL;
>> @@ -1716,16 +1717,7 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>>              keyname_len = 4;
>>          }
>>
>> -        keylist = g_malloc0(sizeof(*keylist));
>> -        keylist->value = g_malloc0(sizeof(*keylist->value));
>> -
>> -        if (!head) {
>> -            head = keylist;
>> -        }
>> -        if (tmp) {
>> -            tmp->next = keylist;
>> -        }
>> -        tmp = keylist;
>> +        v = g_malloc0(sizeof(*v));
>>
>>          if (strstart(keys, "0x", NULL)) {
>>              char *endp;
>> @@ -1734,16 +1726,17 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
>>              if (endp != keys + keyname_len) {
>>                  goto err_out;
>>              }
>> -            keylist->value->type = KEY_VALUE_KIND_NUMBER;
>> -            keylist->value->u.number.data = value;
>> +            v->type = KEY_VALUE_KIND_NUMBER;
>> +            v->u.number.data = value;
>>          } else {
>>              int idx = index_from_key(keys, keyname_len);
>>              if (idx == Q_KEY_CODE__MAX) {
>>                  goto err_out;
>>              }
>> -            keylist->value->type = KEY_VALUE_KIND_QCODE;
>> -            keylist->value->u.qcode.data = idx;
>> +            v->type = KEY_VALUE_KIND_QCODE;
>> +            v->u.qcode.data = idx;
>>          }
>> +        QAPI_LIST_APPEND(tail, v);
>>
>>          if (!*separator) {
>>              break;
> 
> Don't you need to arrange for 'v' to be free'd in the err_out case?

Good catch.  Pre-patch, the allocation was appended to the list before
it was possible to reach 'goto err_out', but post-patch, the use of a
separate variable and delayed addition to the list matters.  Will fix.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


