Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAB310FD8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:27:28 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85pH-000222-Kp
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l84gU-0006uR-RO
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l84gS-0001bW-8V
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CX0HhRcNXOMqh0ibhA2ySAN7WIK6s2HtWtKtDUFFhxU=;
 b=c6WRkFjkJGpNdkzBsZySDqqTAY6RrAEg1Hk2M4L8cBVW64vnsxwteV+XWADd2XlyExMW2B
 nKfCPEIEdQJhaZbQjRYZUL3CgQBbzpFA54TJy/BdBAYpIkIOICs4vt6KXNRinbCBOW7R7w
 /WSYWUNA8WttlYYI2vROzZamGby9ROc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-jIrNaa_8Mq2Dsar9F0N7cg-1; Fri, 05 Feb 2021 12:14:11 -0500
X-MC-Unique: jIrNaa_8Mq2Dsar9F0N7cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71CA9801975;
 Fri,  5 Feb 2021 17:14:10 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8310460BF1;
 Fri,  5 Feb 2021 17:14:00 +0000 (UTC)
Subject: Re: [PATCH v4 5/5] qapi: More complex uses of QAPI_LIST_APPEND
To: Markus Armbruster <armbru@redhat.com>
References: <20210113221013.390592-1-eblake@redhat.com>
 <20210113221013.390592-6-eblake@redhat.com>
 <87mtww59jp.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fae1d759-827e-1c16-63ab-0e4ad97da87c@redhat.com>
Date: Fri, 5 Feb 2021 11:13:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87mtww59jp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 3:31 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> These cases require a bit more thought to review; in each case, the
>> code was appending to a list, but not with a FOOList **tail variable.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> ---
>> fix qmp_guest_network_get_interfaces [Vladimir]
> 
> Fails tests/test-qga.  I should've double-checked earlier.

And me, too.  Looks like the culprit is:

>>
>> -        address_list = &info->value->ip_addresses;
>> -
>> -        while (*address_list && (*address_list)->next) {
>> -            address_list = &(*address_list)->next;
>> -        }
>> -
>> -        if (!*address_list) {
>> -            *address_list = address_item;
>> -        } else {
>> -            (*address_list)->next = address_item;
>> +        address_tail = &info->ip_addresses;
>> +        while (!*address_tail) {
>> +            address_tail = &(*address_tail)->next;
>>          }
>> +        QAPI_LIST_APPEND(address_tail, address_item);

right here; the condition 'while (!*address_tail)' should instead be
'while (*address_tail)'.  Will submit v5 now that I've identified the bug.

> I'd like to drop just this part, and merge the rest.  You can then
> respin just this part as a follow-up patch.  Okay?
> 
> I can't test qemu-ga under Windows.  Fingers crossed...
> 
> [...]
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


