Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD95329658
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:03:04 +0100 (CET)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGy7b-0003NQ-Co
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0f-0003Nv-St
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy0e-00024S-3e
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614664550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhcN3Ertg2qn7944NWcWgyGuN8mdn/Havi9RTH31LSQ=;
 b=f5bavn4gBIJbdRXlFwwfPutg8Im1iWmt4L1HOFzJSJAFwGXboJJmUX0hGichpqVxUiKOuS
 NWhhiuk3pbflu1wweYOjnDZdOqpIlECwwU6fEJkEm2ccZ82YWrH6dp8072R2CcXDsblGC8
 zjmCGZt8bd0soFqZ7gBS5upMC5NOi7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-b_QGxXCrOe6XzrmPyMe-FA-1; Tue, 02 Mar 2021 00:55:48 -0500
X-MC-Unique: b_QGxXCrOe6XzrmPyMe-FA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD94C107ACE4
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 05:55:47 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-133.pek2.redhat.com
 [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE5C6F96F;
 Tue,  2 Mar 2021 05:55:46 +0000 (UTC)
Subject: Re: [PATCH] net: validate that ids are well formed
To: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210301145658.286342-1-pbonzini@redhat.com>
 <06f16114-3795-3379-ed5c-9fc1f799c90a@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e816f66e-742f-af78-3636-20bc2dec3644@redhat.com>
Date: Tue, 2 Mar 2021 13:55:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <06f16114-3795-3379-ed5c-9fc1f799c90a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/1 11:07 下午, Eric Blake wrote:
> On 3/1/21 8:56 AM, Paolo Bonzini wrote:
>> When a network or network device is created from the command line or HMP,
>> QemuOpts ensures that the id passes the id_wellformed check.  However,
>> QMP skips this:
>>
>>     $ qemu-system-x86_64 -qmp stdio -S -nic user,id=123/456
>>     qemu-system-x86_64: -nic user,id=123/456: Parameter id expects an identifier
>>     Identifiers consist of letters, digits, -, ., _, starting with a letter.
>>
>>     $ qemu-system-x86_64 -qmp stdio -S
>>     {"execute":"qmp_capabilities"}
>>     {"return": {}}
>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
>>     {"return": {}}
>>
>> After:
>>
>>     $ qemu-system-x86_64 -qmp stdio -S
>>     {"execute":"qmp_capabilities"}
>>     {"return": {}}
>>     {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
>>     {"error": {"class": "GenericError", "desc": "Parameter "id" expects an identifier"}}
>>
>> Validity checks should be performed always at the bottom of the call chain,
>> because QMP skips all the steps above.  Do this for the network subsystem.
>>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   net/net.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
> Reviewed-by: Eric Blake <eblake@redhat.com>


Queued.

Thanks


>


