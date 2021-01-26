Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E764303740
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:19:14 +0100 (CET)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Id7-0003kw-Dn
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4IZK-00024T-QO
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:15:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4IZ6-0001CO-OP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611645303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVrUlI9Tx7nVy9DA3EyIvzFC38KSp5yv3qt+aOx93rA=;
 b=KlW5dCmL2OvjlMPCR2iDj61ZUtrCfRUsL2OOqVMumiI4dEQdqj3kiJDPy+dlKBMizEcUgD
 KznnXHSiyf0EAzdKBSdPXiqga75SQtO6k1/S5rDnD6HR3l7R9Jw1ij1AHLs/21ZoyPwNCS
 +3kM6nkI4PCPMp7LPm4rWiG2UcZZbQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-kQxk5WquMpGL3KLmnoFjFA-1; Tue, 26 Jan 2021 02:15:01 -0500
X-MC-Unique: kQxk5WquMpGL3KLmnoFjFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E601C9CC0D;
 Tue, 26 Jan 2021 07:15:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E62625D9C2;
 Tue, 26 Jan 2021 07:14:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 782DA113865F; Tue, 26 Jan 2021 08:14:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/3] fdc: Inline fdctrl_connect_drives() into
 fdctrl_realize_common()
References: <20210125162402.1807394-1-armbru@redhat.com>
 <20210125162402.1807394-3-armbru@redhat.com>
 <20210125170736.GG7107@merkur.fritz.box>
Date: Tue, 26 Jan 2021 08:14:56 +0100
In-Reply-To: <20210125170736.GG7107@merkur.fritz.box> (Kevin Wolf's message of
 "Mon, 25 Jan 2021 18:07:36 +0100")
Message-ID: <877do0cgpb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 25.01.2021 um 17:24 hat Markus Armbruster geschrieben:
>> The previous commit rendered the name fdctrl_realize_common() somewhat
>> misleading.  Get rid of it by inlining the (now pretty simple)
>> function into its only caller.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/block/fdc.c | 23 ++++++++---------------
>>  1 file changed, 8 insertions(+), 15 deletions(-)
>> 
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index c6c9393e29..7fc547c62d 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -2521,20 +2521,6 @@ void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
>>      fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
>>  }
>>  
>> -static void fdctrl_connect_drives(FDCtrl *fdctrl, DeviceState *fdc_dev,
>> -                                  Error **errp)
>
> The commit message talks about fdctrl_realize_common(). I assume it
> really means fdctrl_connect_drives() then?

Yes.  dabbrev-expand accident.  Thanks for spotting it!


