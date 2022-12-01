Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A376863EDAD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gm2-0000AB-HH; Thu, 01 Dec 2022 05:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gm0-00007H-El
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0gly-00085W-US
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOq8JBTalrFCVqtHv+LY98vZvNyW73YMP4HGhzHvdEk=;
 b=f89csLgAyHSbLjcQrnLWYzssEzwGpVkTIq4rrcHgASNV1MjfJg5H/+DosbWQzkbVMSa13g
 bgB3ysJnlHIL+sSSyGw6KLgCn3Mxc6gLtRgiRHCPRHxvtvNn9QIOE0fXT92TbmeS6+WAxs
 dw6J5LXxYyD6BYmbLiukV7VHf0HB39Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-cpbISPBvNpyqr1e1ZHsgnQ-1; Thu, 01 Dec 2022 05:26:26 -0500
X-MC-Unique: cpbISPBvNpyqr1e1ZHsgnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 931FD85A588;
 Thu,  1 Dec 2022 10:26:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6967BC15BA5;
 Thu,  1 Dec 2022 10:26:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 552F121E6921; Thu,  1 Dec 2022 11:26:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 6/9] ui: Move HMP commands from monitor to new
 ui/ui-hmp-cmds.c
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-7-armbru@redhat.com>
 <362ce92d-720d-9013-640b-6edb008bd075@linaro.org>
Date: Thu, 01 Dec 2022 11:26:23 +0100
In-Reply-To: <362ce92d-720d-9013-640b-6edb008bd075@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 1 Dec 2022 08:14:45
 +0100")
Message-ID: <87a647zagg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 1/12/22 07:13, Markus Armbruster wrote:
>> This moves these commands from MAINTAINERS section "Human
>> Monitor (HMP)" to "Graphics".
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   monitor/hmp-cmds.c | 342 ------------------------------------------
>>   ui/ui-hmp-cmds.c   | 360 +++++++++++++++++++++++++++++++++++++++++++++
>>   ui/meson.build     |   1 +
>>   3 files changed, 361 insertions(+), 342 deletions(-)
>>   create mode 100644 ui/ui-hmp-cmds.c
>
>
>> +#ifdef CONFIG_SPICE
>> +void hmp_info_spice(Monitor *mon, const QDict *qdict)
>> +{
>> +    SpiceChannelList *chan;
>> +    SpiceInfo *info;
>> +    const char *channel_name;
>> +    const char * const channel_names[] =3D {
>
> Can be static (pre-existing).

Separate patch, to keep the code motion pure.

>> +        [SPICE_CHANNEL_MAIN] =3D "main",
>> +        [SPICE_CHANNEL_DISPLAY] =3D "display",
>> +        [SPICE_CHANNEL_INPUTS] =3D "inputs",
>> +        [SPICE_CHANNEL_CURSOR] =3D "cursor",
>> +        [SPICE_CHANNEL_PLAYBACK] =3D "playback",
>> +        [SPICE_CHANNEL_RECORD] =3D "record",
>> +        [SPICE_CHANNEL_TUNNEL] =3D "tunnel",
>> +        [SPICE_CHANNEL_SMARTCARD] =3D "smartcard",
>> +        [SPICE_CHANNEL_USBREDIR] =3D "usbredir",
>> +        [SPICE_CHANNEL_PORT] =3D "port",
>> +    };
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!


