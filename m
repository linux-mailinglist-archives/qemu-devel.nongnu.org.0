Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD320A1B6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:17:29 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTd2-0007NE-80
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTbK-0005gP-TJ
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:15:42 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50826
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joTbF-0006BG-D7
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nQxovoW5z7Jti6zAjFOYXXJVqpr7PqjHpy/Y+f6HzM=;
 b=FjlbazS4iCN0lmUMrg8TmTj68LrU8iSfG+AYfr2A3cZeHrz44RX7nRSxZuz2HoUE1brwQJ
 Kt56mxDOh3yLOgUFUW71uC+ycKZ0zlppIhLbO7WkSz5Af+E2rQ5cS6OF/saU2LiQgTH5zX
 8Nt9eX32a5MM8aQUJUX8HiKpD3zYVrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-jp4gi2EDNYKREob2_jS3mA-1; Thu, 25 Jun 2020 11:15:34 -0400
X-MC-Unique: jp4gi2EDNYKREob2_jS3mA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEC0919200C5;
 Thu, 25 Jun 2020 15:15:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF315C661;
 Thu, 25 Jun 2020 15:15:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D31E911384D4; Thu, 25 Jun 2020 17:15:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 43/46] qdev: Smooth error checking manually
References: <20200624164344.3778251-1-armbru@redhat.com>
 <20200624164344.3778251-44-armbru@redhat.com>
 <aba1dbee-8183-9907-8e9c-08dd4dbad4b4@redhat.com>
Date: Thu, 25 Jun 2020 17:15:29 +0200
In-Reply-To: <aba1dbee-8183-9907-8e9c-08dd4dbad4b4@redhat.com> (Eric Blake's
 message of "Wed, 24 Jun 2020 16:42:57 -0500")
Message-ID: <87zh8rw50u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 02:30:11
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 6/24/20 11:43 AM, Markus Armbruster wrote:
>> When foo(..., &err) is followed by error_propagate(errp, err), we can
>> often just as well do foo(..., errp).  The previous commit did that
>> for simple cases with Coccinelle.  Do it for one more manually.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   hw/block/fdc.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>
>> @@ -2566,11 +2566,9 @@ static void fdctrl_connect_drives(FDCtrl *fdctrl, DeviceState *fdc_dev,
>>           blk_ref(blk);
>>           blk_detach_dev(blk, fdc_dev);
>>           fdctrl->qdev_for_drives[i].blk = NULL;
>> -        qdev_prop_set_drive_err(dev, "drive", blk, &local_err);
>> +        ok = qdev_prop_set_drive_err(dev, "drive", blk, errp);
>>           blk_unref(blk);
>
> Perhaps some glib g_auto* magic could make this even easier (to mark a
> variable to be blk_unref'd when it goes out of scope).  But for now,
> your pattern is fine.

It's PATCH 43, my hatchet needs sharpening, and my arm hurts ;)

>> -
>> -        if (local_err) {
>> -            error_propagate(errp, local_err);
>> +        if (!ok) {
>>               return;
>>           }
>>   
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


