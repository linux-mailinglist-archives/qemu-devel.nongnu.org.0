Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675533E858
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 05:18:05 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNdD-0005MM-MU
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 00:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMNc9-0004w6-Ul
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMNc6-0001da-0i
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615954611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkSaba+DwdDt4qK4VmH8vZBIvd8B5f4hxXoglRSC59A=;
 b=Oj8Y6FNRPAzc+3DR44hvTEvRkDdGcl1n3b2aPUPxe1wcfhxpETyIleArdyQaXP+ddYqRDh
 PYC5n37UQCxXvZRNCg//bvAS1u8SqwhKGnJYQHRXfs4b0pq2+GxlTIdmdPKXQrK5ixS8E9
 hueMk/WW8Fm2bJXEOJIx9xXqplZGaEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-0A031LjrMSi6gMtv4TZtUQ-1; Wed, 17 Mar 2021 00:16:49 -0400
X-MC-Unique: 0A031LjrMSi6gMtv4TZtUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B182D107ACCA;
 Wed, 17 Mar 2021 04:16:48 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-188.pek2.redhat.com
 [10.72.12.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55EAD1A3D8;
 Wed, 17 Mar 2021 04:16:46 +0000 (UTC)
Subject: Re: [PULL V2 16/20] qapi: net: Add query-netdev command
To: Peter Maydell <peter.maydell@linaro.org>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
 <1615799673-31549-17-git-send-email-jasowang@redhat.com>
 <CAFEAcA94g-5CEf2n=TiZ4yMK6KNyJY3KNv3YnrfmAaiRTo-w7w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bcd43317-feb1-20aa-946b-758fc44eeba7@redhat.com>
Date: Wed, 17 Mar 2021 12:16:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA94g-5CEf2n=TiZ4yMK6KNyJY3KNv3YnrfmAaiRTo-w7w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alexey Kirillov <lekiravi@yandex-team.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/17 上午5:27, Peter Maydell 写道:
> On Mon, 15 Mar 2021 at 09:15, Jason Wang <jasowang@redhat.com> wrote:
>> From: Alexey Kirillov <lekiravi@yandex-team.ru>
>>
>> The query-netdev command is used to get the configuration of the current
>> network device backends (netdevs).
>> This is the QMP analog of the HMP command "info network" but only for
>> netdevs (i.e. excluding NIC and hubports).
>>
>> The query-netdev command returns an array of objects of the NetdevInfo
>> type, which are an extension of Netdev type. It means that response can
>> be used for netdev-add after small modification. This can be useful for
>> recreate the same netdev configuration.
>>
>> Information about the network device is filled in when it is created or
>> modified and is available through the NetClientState->stored_config.
>>
>> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Hi; Coverity is doubtful (CID 1450841) about this code:
>
>> @@ -668,12 +686,65 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>> +        if (!stored->has_fds) {
>> +            stored->has_fds = true;
>> +            stored->fds = g_strdup_printf("%d", fd);
>> +        } else {
>> +            char *tmp_s = stored->fds;
>> +            stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
>> +            g_free(tmp_s);
>> +        }
> Here we have a bit of code which maintains stored->fds as a
> colon-separated string of integers, by tacking the new fd onto
> the end of the old string if it's already present.
>
>> @@ -731,6 +813,15 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>>           }
>>           options.opaque = (void *)(uintptr_t)vhostfd;
>>
>> +        if (!stored->has_vhostfds) {
>> +            stored->has_vhostfds = true;
>> +            stored->vhostfds = g_strdup_printf("%d", vhostfd);
>> +        } else {
>> +            char *tmp_s = stored->vhostfds;
>> +            stored->vhostfds = g_strdup_printf("%s:%d", stored->fds, vhostfd);
>> +            g_free(tmp_s);
>> +        }
> Here we have a bit of code that's kind of similar, except that
> the first argument to g_strdup_printf() is 'stored->fds', not
> 'stored->vhostfds'.
>
> Coverity suspects cut-n-paste error -- is it right ?


Yes, stored->vhostfds should be used here.

Alexey, please send patch to fix this.

Thanks


>
> thanks
> -- PMM
>


