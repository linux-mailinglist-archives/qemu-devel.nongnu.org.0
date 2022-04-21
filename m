Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7450A310
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:47:22 +0200 (CEST)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhY5Y-0001C3-RI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhY4C-0000VK-Vw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhY4A-0006kP-Bb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650552352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+UDc5aXy26wZhJaj6WRsIQ3C9+xrKxXwGh3OLI3PwU=;
 b=elMDYjBmgZYM11Bs7CcxMUYL7LsF7WDuCNx4YoCGPgATPpSL9621WIz0LRAfJabna0RWPd
 RaIsmxttvCq+XJ94tDL2T5TF83RZ5m/3o9zokmXROQuA8KgwEQGa7Vfp7a7Heiu74+jNVW
 xwX7bQE60TvEJhfSlgkQsVTy9zDbfQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-BX7HIyxIPLWjVm0H3wIrDA-1; Thu, 21 Apr 2022 10:45:48 -0400
X-MC-Unique: BX7HIyxIPLWjVm0H3wIrDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADF32805346;
 Thu, 21 Apr 2022 14:45:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38DAF4010FC9;
 Thu, 21 Apr 2022 14:45:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1144C21E6A1F; Thu, 21 Apr 2022 16:45:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 06/15] monitor: expose monitor_puts to rest of code
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-7-alex.bennee@linaro.org>
Date: Thu, 21 Apr 2022 16:45:46 +0200
In-Reply-To: <20220408164742.2844631-7-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 8 Apr 2022 17:47:33 +0100")
Message-ID: <87a6ceqyud.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This helps us construct strings elsewhere before echoing to the
> monitor. It avoids having to jump through hoops like:
>
>   monitor_printf(mon, "%s", s->str);
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

There's just one caller other than monitor_vprintf().  Even if you add a
few more, I'm not sure keeping it in the interface is worthwhile.

If we conclude it is, then this patch should come with a conversion of
existing uses of monitor_printf(MON, "%s", STR) to monitor_puts(MON,
STR).

If we conclude it isn't, switch the lone caller to monitor_printf() and
make monitor_puts() static in monitor.c.


