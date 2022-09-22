Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B735E5A3C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 06:35:52 +0200 (CEST)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obDwE-0002IZ-Tw
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 00:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obDrn-00080a-Rh
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 00:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obDrl-0007HK-UZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 00:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663821072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lSkV1x7IQKjVpP6UtZdbIbDYwioU5Owum2gI/99hFI=;
 b=aR0oR9ZP7rXuwSxQQmR6cmMaMUPbOcmPSB4kklZUb1U3rhm2ge73mJOnoICKnhzja8vjIi
 W4PjZSMxuIpwYClelrOw1bX//4pFV+ouJCNfTb/yAuvT5+IPqrTRRv8UfoSuXVLZ4mIdLY
 HQurXDW2AXyzmXUOdGqr5sxXC5Pt/40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-o0ljLAFqP26aC-3NpNhwSQ-1; Thu, 22 Sep 2022 00:30:57 -0400
X-MC-Unique: o0ljLAFqP26aC-3NpNhwSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D575811E81;
 Thu, 22 Sep 2022 04:30:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF6E2024CB7;
 Thu, 22 Sep 2022 04:30:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC75821E6900; Thu, 22 Sep 2022 06:30:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  minyihh@uci.edu,  ma.mandourr@gmail.com,
 Luke.Craig@ll.mit.edu,  cota@braap.org,  aaron@os.amperecomputing.com,
 kuhn.chenqun@huawei.com,  robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,  Hanna
 Reitz <hreitz@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),  qemu-ppc@nongnu.org
 (open list:New World (mac99))
Subject: Re: [PATCH  v1 01/10] monitor: expose monitor_puts to rest of code
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-2-alex.bennee@linaro.org>
Date: Thu, 22 Sep 2022 06:30:50 +0200
In-Reply-To: <20220921160801.1490125-2-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 21 Sep 2022 17:07:52 +0100")
Message-ID: <87leqc6net.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This helps us construct strings elsewhere before echoing to the
> monitor. It avoids having to jump through hoops like:
>
>   monitor_printf(mon, "%s", s->str);
>
> It will be useful in following patches but for now convert all
> existing plain "%s" printfs to use the _puts api.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


