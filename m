Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FA5B205C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:18:34 +0200 (CEST)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIMT-0002Ue-8L
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWIIZ-0006GJ-B4
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oWIIT-00031d-ID
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662646464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMryqncPRYsp2OaGT9/oQqh9GZrmkxEaNIovOOO/HCc=;
 b=OB5/mOQ8BXIYJC41tjGlXLGE2vml8zGciZw6WThLmqBSyVFLY7ZfoaRrumjyA69a/19vJA
 utwD4gwdFFE3H851K309cMPqV0k0O+r4hhoOFYLbLqVo3ekmWA45pp65l5SRZFvU8J4ljB
 rJOxeQ8NoAq/SueX1d098LqUi8sZPN8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-D1j1VvLSPja1GMKcmBD3nw-1; Thu, 08 Sep 2022 10:14:20 -0400
X-MC-Unique: D1j1VvLSPja1GMKcmBD3nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB2C33801159;
 Thu,  8 Sep 2022 14:14:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA96C1121314;
 Thu,  8 Sep 2022 14:14:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6BF3721E6900; Thu,  8 Sep 2022 16:14:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: liuhaiwei <liuhaiwei9699@126.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  stefanha@redhat.com,
 fam@euphon.net,  eblake@redhat.com,  vsementsov@yandex-team.ru,
 jsnow@redhat.com,  quintela@redhat.com,  dgilbert@redhat.com,  liuhaiwei
 <liuhaiwei@inpsur.com>
Subject: Re: [PATCH] migrate block dirty bitmap: Fix the block dirty bitmap
 can't to migration_completion when pending size  larger than threshold
 size  : =?utf-8?Q?1=E3=80=81dirty?= bitmap size big enough (such as 8MB)
 when block size 1T
 =?utf-8?Q?2=E3=80=81we?= set the migrate speed or the bandwith is small
 enough(such as 4MB/s)
References: <20220908123525.197397-1-liuhaiwei9699@126.com>
Date: Thu, 08 Sep 2022 16:14:14 +0200
In-Reply-To: <20220908123525.197397-1-liuhaiwei9699@126.com> (liuhaiwei's
 message of "Thu, 8 Sep 2022 08:35:25 -0400")
Message-ID: <871qsm54y1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Your subject line is waaaaay too long.


