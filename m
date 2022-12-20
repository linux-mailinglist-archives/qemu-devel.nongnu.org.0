Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A376523AC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eZe-0000tu-DF; Tue, 20 Dec 2022 10:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7eZb-0000ra-8m
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7eZZ-0002dS-Nw
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671550229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihy4XobiuMzD91HfuXeYgwlQuH0qamL+Lw4mrBYUdXc=;
 b=h30HuzbQiYQ7doSwd7PmNbcA887sU644v7TWmUSoa4VS4f9/BNVxRbvcpyUh8qpUgKOYk2
 14WBeG4oNFhXukuRN/P1Teah5VuqJZPI8IrQvRBqxlVCXzvbT6sg9nkI/8NUwW9QwOIG+q
 YsW0ZZloOvG/8xrpuczXykA4hv/liAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-6pn-vqt6MbCoOpjUVUOPCA-1; Tue, 20 Dec 2022 10:30:27 -0500
X-MC-Unique: 6pn-vqt6MbCoOpjUVUOPCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDAE1C008C6;
 Tue, 20 Dec 2022 15:30:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006EF40C2064;
 Tue, 20 Dec 2022 15:30:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3552421E691D; Tue, 20 Dec 2022 16:30:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com,
 berrange@redhat.com
Subject: Re: [PATCH v3 12/18] ui: Move more HMP commands from monitor to ui/
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-13-armbru@redhat.com>
 <cd8d91b0-b639-b7e5-ba62-f9b11fe5567b@linaro.org>
 <87v8m68fcr.fsf@pond.sub.org>
 <0d5454ae-290e-b767-d633-f6dc7ff6d438@linaro.org>
Date: Tue, 20 Dec 2022 16:30:19 +0100
In-Reply-To: <0d5454ae-290e-b767-d633-f6dc7ff6d438@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 20 Dec 2022 13:29:39
 +0100")
Message-ID: <871qou6qk4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

> On 20/12/22 12:49, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 20/12/22 10:06, Markus Armbruster wrote:
>>>> This moves these commands from MAINTAINERS section "Human
>>>> Monitor (HMP)" to "Graphics".
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>    include/monitor/hmp.h |  2 ++
>>>>    monitor/misc.c        | 66 ----------------------------------------=
---
>>>>    ui/ui-hmp-cmds.c      | 66 ++++++++++++++++++++++++++++++++++++++++=
+++
>>>>    3 files changed, 68 insertions(+), 66 deletions(-)
>>>
>>> You forgot to move hmp_sendkey() along.
>>
>> Moved in the previous patch.
>
> Oops :)
>
>> If I get your R-by, I'll squash the two patches together.
>
> Hmm not needed, the previous patch is already big enough.

Yes, but it's just code motion, and the split between the two parts
feels arbitrary.  It came to be by accident: I missed a bunch of HMP
commands hiding in yet another file :)

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!


