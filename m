Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58390216790
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 09:39:33 +0200 (CEST)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsiCS-0000Dg-5R
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 03:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jsiBg-00084q-Jm
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:38:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53530
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jsiBe-0000Kw-3Z
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 03:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594107519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkrfwaSL3DYXrFjNi7YeBJgziwZtm364r8VzMSJSocQ=;
 b=TTsxsB+k+TuWxeSNYtO1UalesLZRvY+zhoz5EElWvhTlDxoGLW+3NkFLuKgdgpXMwItxPa
 D9RHXkIyQxVfAMeXFqQ41a+9RU7xsQj9BEt8pAQLqdwx3W6XSrEqOGrd+NbzjofXf4wliz
 0/Oo+XXL04vDQFw8cISJmN45a1YktR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-0ANGK52HNsCXkeBTCsI_Aw-1; Tue, 07 Jul 2020 03:38:37 -0400
X-MC-Unique: 0ANGK52HNsCXkeBTCsI_Aw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA7481015DA3
 for <qemu-devel@nongnu.org>; Tue,  7 Jul 2020 07:38:36 +0000 (UTC)
Received: from [10.72.13.254] (ovpn-13-254.pek2.redhat.com [10.72.13.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCCE727DE6A;
 Tue,  7 Jul 2020 07:38:27 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: fix removal of failover device
To: "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <20200703114813.5911-1-quintela@redhat.com>
 <20200703075920-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c3447cc9-e648-7bba-8f6a-287ea2ef7223@redhat.com>
Date: Tue, 7 Jul 2020 15:38:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703075920-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/3 下午7:59, Michael S. Tsirkin wrote:
> On Fri, Jul 03, 2020 at 01:48:13PM +0200, Juan Quintela wrote:
>> If you have a networking device and its virtio failover device, and
>> you remove them in this order:
>> - virtio device
>> - the real device
>>
>> You get qemu crash.
>> See bugzilla:https://bugzilla.redhat.com/show_bug.cgi?id=1820120
>>
>> Bug exist on qemu 4.2 and 5.0.
>> But in 5.0 don't shows because commit
>> 77b06bba62034a87cc61a9c8de1309ae3e527d97
>>
>> somehow papers over it.
>>
>> CC: Jason Wang<jasowang@redhat.com>
>> CC: Michael S. Tsirkin<mst@redhat.com>
>>
>> Signed-off-by: Juan Quintela<quintela@redhat.com>
> Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
>
>
> Jason can you queue this pls?


Queued.

Thanks


>


