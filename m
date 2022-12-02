Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8C6408F8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 16:11:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p17fL-0000qC-Ma; Fri, 02 Dec 2022 10:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p17fK-0000q2-Bw
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p17fI-00063R-QX
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669993763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tre7bGRpk9UypmQ3nO/enC6pUQDhridrYMWhS0Hnmo8=;
 b=i5ezq73ulibdzvysv1BPs5uISI563XYVnfiFvBXOXsSPK9c+fG31pWnCfOUsKy6XIAkvbr
 0tq2cYxRwz8qtbVtapgCCC86zpdWhPuntRNnMyoD5IcPSctdezfBH6mGlTG4CnGSeh5d+7
 6Y9YW8jZcsd6LVK1VZ+AL3MnBmq3cMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-phB21nPmNryD_4MHSotERQ-1; Fri, 02 Dec 2022 10:09:21 -0500
X-MC-Unique: phB21nPmNryD_4MHSotERQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305B387B2A2;
 Fri,  2 Dec 2022 15:09:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F420E2166B2A;
 Fri,  2 Dec 2022 15:09:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D7E7D21E6921; Fri,  2 Dec 2022 16:09:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com,
 berrange@redhat.com
Subject: Re: [PATCH v2 10/14] ui: Factor out qmp_add_client() parts and move
 to ui/ui-qmp-cmds.c
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-11-armbru@redhat.com>
 <78832eb6-215d-6818-7e41-a78d0648ac16@linaro.org>
Date: Fri, 02 Dec 2022 16:09:16 +0100
In-Reply-To: <78832eb6-215d-6818-7e41-a78d0648ac16@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 2 Dec 2022 11:57:50
 +0100")
Message-ID: <87o7slrgf7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

> On 2/12/22 11:05, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   include/monitor/qmp-helpers.h | 26 ++++++++++++
>>   monitor/qmp-cmds.c            | 74 ++++++++++++++++-------------------
>>   ui/ui-qmp-cmds.c              | 41 +++++++++++++++++++
>>   3 files changed, 100 insertions(+), 41 deletions(-)
>>   create mode 100644 include/monitor/qmp-helpers.h
>
>
>> @@ -174,54 +172,48 @@ void qmp_add_client(const char *protocol, const ch=
ar *fdname,
>>                       bool has_skipauth, bool skipauth, bool has_tls, bo=
ol tls,
>>                       Error **errp)
>>   {
>> +    static struct {
>
> const.

Okay.

>> +        const char *name;
>> +        bool (*add_client)(int fd, bool has_skipauth, bool skipauth,
>> +                           bool has_tls, bool tls, Error **errp);
>> +    } protocol_table[] =3D {
>> +        { "spice", qmp_add_client_spice },
>> +#ifdef CONFIG_VNC
>> +        { "vnc", qmp_add_client_vnc },
>> +#endif
>> +#ifdef CONFIG_DBUS_DISPLAY
>> +        { "@dbus-display", qmp_add_client_dbus_display },
>> +#endif
>> +    };
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!


