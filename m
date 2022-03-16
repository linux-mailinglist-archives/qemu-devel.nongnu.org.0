Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E604DB21E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:03:54 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUFl-0002k6-4y
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:03:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUA6-0003B2-JX
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUA4-0001Vb-FH
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647439079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RtUm5jsmIc1/c0JfO2Z807EFBPgorTeZ3hf/E8Pyofk=;
 b=TnwlIOXg5y71tsI2Rh7Bwmwj1UscQbGhiyDBMuotRt9Qo7X0G2IM5L5IIKWE2iKi+498/s
 YpiO0yG8gDJj8XVgWN3+xl1iXekT2j1S1TGOCT1okR1Ft92jlz+K8+ZUmrilcLlemEOoub
 oPZbwtUWxHHt/vQQpHOtNcZ6W7EGh0A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-IiB3_k-MMfuddX8a_Ps2Tw-1; Wed, 16 Mar 2022 09:57:56 -0400
X-MC-Unique: IiB3_k-MMfuddX8a_Ps2Tw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 980D33C1984D;
 Wed, 16 Mar 2022 13:57:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 184C4441E15;
 Wed, 16 Mar 2022 13:57:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E60E121E66D2; Wed, 16 Mar 2022 14:57:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Subject: Re: [PATCH v20 2/7] net/vmnet: add vmnet backends to qapi/net
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315230741.21578-3-Vladislav.Yaroshchuk@jetbrains.com>
Date: Wed, 16 Mar 2022 14:57:53 +0100
In-Reply-To: <20220315230741.21578-3-Vladislav.Yaroshchuk@jetbrains.com>
 (Vladislav Yaroshchuk's message of "Wed, 16 Mar 2022 02:07:36 +0300")
Message-ID: <87v8weuhi6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, qemu-devel@nongnu.org, dirty@apple.com,
 f4bug@amsat.org, roman@roolebo.dev, r.bolshakov@yadro.com, agraf@csgraf.de,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:

> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
>
> Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>

Any QAPI schema changes since v15?  I'm asking because I acked v8, v13,
and v15, but each time you neglected to carry my Acked-by lines in later
revisions.


