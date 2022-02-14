Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F574B5349
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:29:03 +0100 (CET)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcLc-0004gV-RF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJbTk-0001xf-K6
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:33:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJbTh-0005OG-RW
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644845596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W86zHw9HygLLkCvYoarW7QJp/Bt6mvGxC39mI213pH0=;
 b=hklr2l1d4iphrWcK2+LIu68/fBfmh1xbCmGZzy6R+wgXFU3gQdZgMqrc2LNT1qtqtBK4ED
 tSRK+z1TUZ0QKyvGbhLV59v1s+Hed7dgVHOcKn2R9egVXuJ4oNBAuoEWui1svPBHEB/4P+
 qSWKqmivIUiKUDCAvMeeeY7u81/3j1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-m3SEtsEyOMKcAgwJ2Qa5mA-1; Mon, 14 Feb 2022 08:33:14 -0500
X-MC-Unique: m3SEtsEyOMKcAgwJ2Qa5mA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D18188E3C0;
 Mon, 14 Feb 2022 13:33:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D39F70D5A;
 Mon, 14 Feb 2022 13:32:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 076FC21E6740; Mon, 14 Feb 2022 14:32:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] ui/cocoa: Do not alert even without block devices
References: <20220213021418.2155-1-akihiko.odaki@gmail.com>
 <2ba4330a-849a-3197-1c8d-3f1d655921b1@amsat.org>
Date: Mon, 14 Feb 2022 14:32:53 +0100
In-Reply-To: <2ba4330a-849a-3197-1c8d-3f1d655921b1@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 14 Feb 2022 13:31:11
 +0100")
Message-ID: <8735klk1yy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 13/2/22 03:14, Akihiko Odaki wrote:
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>>   ui/cocoa.m | 5 -----
>>   1 file changed, 5 deletions(-)
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index ac18e14ce01..271a2676026 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -1715,11 +1715,6 @@ static void addRemovableDevicesMenuItems(void)
>>         currentDevice =3D qmp_query_block(NULL);
>>       pointerToFree =3D currentDevice;
>> -    if(currentDevice =3D=3D NULL) {
>> -        NSBeep();
>> -        QEMU_Alert(@"Failed to query for block devices!");
>> -        return;
>> -    }
>>         menu =3D [[[NSApp mainMenu] itemWithTitle:@"Machine"]
>> submenu];
>>  =20
>
> Cc'ing qemu-block@ and Markus (QMP).
>
> I always wondered the point of this annoying warning but never
> found out.

The condition conflates "query failed" (returns null with error and "no
block devices" (returns empty list, i.e. null, with no error set).
Quite suspicious.

Goes back to

    Author: John Arbuckle <programmingkidx@gmail.com>
    Date:   Fri Jun 19 10:53:27 2015 +0100

        ui/cocoa.m: Add machine menu items to change and eject removable dr=
ive media

        Adds all removable devices to the Machine menu as a Change and Ejec=
t menu
        item pair. ide-cd0 would have a "Change ide-cd0..." and "Eject ide-=
cd0"
        menu items.

        Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
        Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
        Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> Is this menu updated when removable blkdev are hot-plugged from
> the monitor or QMP?
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


