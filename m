Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57C66993B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKYb-0002GP-LU; Fri, 13 Jan 2023 08:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGKYX-0002ET-Un
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pGKYV-0000RK-V8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673618235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NrQg7ILU0BG89aNNTPa3gdKfsMXOW9egUeImyvizTs=;
 b=hSIK8Z76z1UWe0+3zVXUoLJXuy3sDIpDQP+lqueoopZZQfLoURBXClfSkuNbXbb4KO0rAh
 DJLvMuLg23X9ySjTJ8CoDWOEE7e/Nxw85qH2GJeqwj37zWm27bhdLppyZEOFwogcUiWCAn
 IL8I85j70vbb6dbusfYp/zStGI6mZ4M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-gKau6a-HMiKg7Amf9oP69Q-1; Fri, 13 Jan 2023 08:57:07 -0500
X-MC-Unique: gKau6a-HMiKg7Amf9oP69Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B6B43C0219C;
 Fri, 13 Jan 2023 13:57:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E92114171B7;
 Fri, 13 Jan 2023 13:57:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A40721E675B; Fri, 13 Jan 2023 14:57:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,  Greg Kurz
 <groug@kaod.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Huacai Chen <chenhuacai@kernel.org>,  Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,  qemu-arm@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict
 'qapi-commands-machine.h' to system emulation
References: <20221220111122.8966-1-philmd@linaro.org>
Date: Fri, 13 Jan 2023 14:57:04 +0100
In-Reply-To: <20221220111122.8966-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 20 Dec 2022 12:11:17
 +0100")
Message-ID: <87y1q61qrz.fsf@pond.sub.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> [resend fixing my last name typography...]
>
> All series reviewed, can patches be picked by corresponding
> maintainers?
>
> The "qapi-commands-machine.h" header is not generated in user-only
> emulation. This series removes its use in user-emu code by moving
> the QMP code depending on this header into a separate sysemu unit.
>
> Since v1:
> - renamed cpu-monitor.c -> monitor.c on loongarch

Quick drive-by remark: we usually name C files containing just QMP
commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
files seem to be named target/TARGET/monitor.c.

Keeping QMP and HMP two separate is desirable, but not required.
monitor.c is a fine name for a file containing both.

Use your judgement.


