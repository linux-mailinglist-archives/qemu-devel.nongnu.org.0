Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33E6A0DF9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEPs-0002oH-OH; Thu, 23 Feb 2023 11:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVEPo-0002mz-J2
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:25:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVEPm-0005ka-U0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677169550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77pOp31gLkzA/cgii0kSFFxhWF8lybTb5WxqNJxk6f4=;
 b=eYJ6We8Wk115WjWx6l10sd3TJkURvBvNMV3FZOPbCn/CT90xVZMsuXB67LhU5j3ivq3XpY
 erHoZXGOgHMVbSLmMUNh6j76xfW7R7ov231nxYgRqVJxy3vsFvMYwEilkSwJKdouAXP3No
 HaR5i9vUtVD3+DhJXCgX/SxbcaMs9Ak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-Jv8upbT6MoGeSfNyPaA7Kw-1; Thu, 23 Feb 2023 11:25:44 -0500
X-MC-Unique: Jv8upbT6MoGeSfNyPaA7Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B6B38173C2;
 Thu, 23 Feb 2023 16:25:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB871140EBF4;
 Thu, 23 Feb 2023 16:25:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F0B721E6A1F; Thu, 23 Feb 2023 17:25:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  Song Gao
 <gaosong@loongson.cn>
Subject: Re: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
References: <20230223124340.95367-1-philmd@linaro.org>
 <87sfew331b.fsf@pond.sub.org>
 <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
 <eececf08-0ae6-a46e-ae2d-f7f19653651b@linaro.org>
Date: Thu, 23 Feb 2023 17:25:42 +0100
In-Reply-To: <eececf08-0ae6-a46e-ae2d-f7f19653651b@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 16:58:16
 +0100")
Message-ID: <87leko5oxl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

> On 23/2/23 16:56, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 23/2/23 14:49, Markus Armbruster wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>
>>>> All series reviewed, can patches be picked by corresponding
>>>> maintainers, or should I include them in on of my PRs?
>>>
>>> I'm sitting on a lonely patch for the monitor subsystem.=C2=A0 Want me =
to
>>> throw in your series, so my PR is a less complete waste of CI minutes?
>>
>> That would be lovely! v4:
>> https://lore.kernel.org/qemu-devel/20230223155540.30370-1-philmd@linaro.=
org/

Okay, I'll take care of it.

> btw I didn't add these files in your MAINTAINERS Monitor section because
> I expect them to be taken care by each $target maintainer.

Makes sense, thanks!


