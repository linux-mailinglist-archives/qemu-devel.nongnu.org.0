Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C512C2B68
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:34:23 +0100 (CET)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaKk-0005Cl-Tz
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khaJT-0004kp-FG
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:33:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khaJQ-0002We-57
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606231977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eK1tgRyy+oHtcgj/EOoyr9ziyFPl/6nUePnLygYF4xQ=;
 b=EjYTvRqcs3gLkeuiJ+4w9s4mMpZKonRNfzR9GSug4pS/FkjBOK7um5rHEn9jDiQPl7kfDr
 n3+7g5GKXTUKkMftJzE7XH4+DPHQPqCl6mGyFgZyFbB5zJXLSazSqyWI+D8ABlu/uou0Pc
 NA0Su3pQL6Il1rdUnG8J1fus/M1BgMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-nZq1KVnpORKN279LLAVYYg-1; Tue, 24 Nov 2020 10:32:55 -0500
X-MC-Unique: nZq1KVnpORKN279LLAVYYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3AB1922960;
 Tue, 24 Nov 2020 15:32:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F8319C44;
 Tue, 24 Nov 2020 15:32:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A80EF113864E; Tue, 24 Nov 2020 16:32:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 <87blfnp20k.fsf@dusky.pond.sub.org>
 <87lferm4x5.fsf@dusky.pond.sub.org>
 <CAOEp5Oe18jtsgHVqwtm+-sqspD6KoJTOO9nNPmcWS++AVGjXKQ@mail.gmail.com>
 <87tutej3dc.fsf@dusky.pond.sub.org>
 <87blfmj2qx.fsf@dusky.pond.sub.org>
 <f508a7ef-69f4-0bf1-2e9f-b9ea151a8557@redhat.com>
Date: Tue, 24 Nov 2020 16:32:52 +0100
In-Reply-To: <f508a7ef-69f4-0bf1-2e9f-b9ea151a8557@redhat.com> (Eric Blake's
 message of "Tue, 24 Nov 2020 08:49:31 -0600")
Message-ID: <87360yhisb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnichenko <andrew@daynix.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 11/24/20 7:36 AM, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>>> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>>>
>>>> Please confirm that this patch is intended to solve only the problem with
>>>> hmp (and disallow duplicated ids)
>>>
>>> The intent is to reject duplicate ID and to accept non-duplicate ID, no
>>> matter how the device is created (CLI, HMP, QMP) or a prior instance was
>>> deleted (HMP, QMP).
>>>
>>>> With it the netdev that was added from qemu's command line and was deleted
>>>> (for example by hmp) still can't be created, correct?
>>>
>>> Yet another case; back to the drawing board...
>> 
>> Next try.  Hope this is one holds water :)
>> 
>> 
>> diff --git a/net/net.c b/net/net.c
>> index 794c652282..c1dc75fc37 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -978,6 +978,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>>  static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>>  {
>>      NetClientState *peer = NULL;
>> +    NetClientState *nc;
>>  
>>      if (is_netdev) {
>>          if (netdev->type == NET_CLIENT_DRIVER_NIC ||
>> @@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>>          }
>>      }
>>  
>> +    nc = qemu_find_netdev(netdev->id);
>> +    if (nc) {
>> +        error_setg(errp, "Duplicate ID '%s'", netdev->id);
>> +        return -1;
>> +    }
>
> Here, we fail if qemu_find_netdev() succeeded, regardless of whether
> is_netdev was set...
>
>> +
>>      if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
>>          /* FIXME drop when all init functions store an Error */
>>          if (errp && !*errp) {
>> @@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>>      }
>>  
>>      if (is_netdev) {
>> -        NetClientState *nc;
>> -
>>          nc = qemu_find_netdev(netdev->id);
>>          assert(nc);
>
> and here, when is_netdev is set, we expect qemu_find_netdev() to
> succeed.  Does the first hunk need to be 'if (nc && !is_netdev)' ?

My head hurts.

I suspect splitting the function into one function for is_netdev=false
and another one for is_netdev=true would result in more readable code.
Same for net_client_init().

That said, a duplicate ID is to be rejected regardless of is_netdev,
isn't it?

Let's examine how we can get here with is_netdev=false.

Callers:

* net_client_init(): passes its own is_netdev argumet

  Callers:

  - netdev_add(): passes true

  - net_init_client(): passes false

    Caller: net_init_clients() for each -net.  The IDs are all distinct.
    The error check I add in this patch redundant in this case.  It is
    not wrong.

  - net_init_netdev(): passes true

  - net_param_nic(): passes true

* qmp_netdev_add(): passes true

Okay?


