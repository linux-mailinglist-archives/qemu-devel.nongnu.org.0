Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E744DC389
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:04:19 +0100 (CET)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUmzS-0003ti-AG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:04:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUmwD-0002Iq-Eu
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUmwA-0002ul-Ps
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647511253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J2P/WRuHpXdL9bX6yffOfJQrkvEk3/HwU4+xzmOeq1o=;
 b=P6a3nj7ia2zoComQcryV09axtzgJxsF6GG0H3RwlEJpbn4LYwGiYy4PwIVtlPGhKvLQjft
 H8kX9DzUcdHlHjf/EypnE3JiXjaADct9YoFwrNO33+jsRI9qBi42B42gQ/RKabF5jw+tcv
 y4/Rx5BGSPZO7YbeXWXKF3sO/S+uewg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-U-XNXIZANQiUvArTk8rQKg-1; Thu, 17 Mar 2022 06:00:52 -0400
X-MC-Unique: U-XNXIZANQiUvArTk8rQKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C439F185A79C;
 Thu, 17 Mar 2022 10:00:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E23401E7D;
 Thu, 17 Mar 2022 10:00:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46FBE21E66C8; Thu, 17 Mar 2022 11:00:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Subject: Re: [PATCH v20 2/7] net/vmnet: add vmnet backends to qapi/net
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315230741.21578-3-Vladislav.Yaroshchuk@jetbrains.com>
 <87v8weuhi6.fsf@pond.sub.org>
 <CAGmdLqQveMzYzsiWT4gBYoAAL1k2aZ1_KgoXNDCHLnWwLLO2dQ@mail.gmail.com>
Date: Thu, 17 Mar 2022 11:00:50 +0100
In-Reply-To: <CAGmdLqQveMzYzsiWT4gBYoAAL1k2aZ1_KgoXNDCHLnWwLLO2dQ@mail.gmail.com>
 (Vladislav Yaroshchuk's message of "Wed, 16 Mar 2022 19:29:01 +0300")
Message-ID: <87mthoq4od.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:

> On Wed, Mar 16, 2022 at 4:58 PM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:
>>
>> > Create separate netdevs for each vmnet operating mode:
>> > - vmnet-host
>> > - vmnet-shared
>> > - vmnet-bridged
>> >
>> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
>>
>> Any QAPI schema changes since v15?  I'm asking because I acked v8, v13,
>> and v15, but each time you neglected to carry my Acked-by lines in later
>> revisions.
>>
>>
> QAPI is not changed, but the "Since" statement was updated
> for new netdevs (7.0 -> 7.1). That's the reason why I dropped
> your Acked-by. I've also mentioned this in cover letter:

You mean I'm supposed to read the cover letter?!?  (I am).

> v15 -> v16
> [...]
>  - QAPI: change version to 7.1 (cause 7.0 feature freeze
>    happened). This is the only change in QAPI, Markus Armbruster,
>    please confirm if you can (decided to drop your Acked-by due
>    to this change)

Clerical change, keeping my Acked-by would've been fine.

> [...]

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

Thanks!


