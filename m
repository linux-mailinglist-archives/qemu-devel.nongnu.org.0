Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798C274448
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 16:30:34 +0200 (CEST)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKjJR-0005rU-0z
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 10:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKjGh-0004eC-27
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 10:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kKjGc-0007ND-CA
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 10:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600784856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MSG34l19f4oiwGuvJUJ+bClbsAy09DQL+6yQkTFOZ3M=;
 b=ERc3Bk9Z+lxNyTFwu51XFQcwEYTpYOYEoWhNvF4IUJv3DR4pN5BUYiSITJ+VFu7ahIKFSU
 tYiyaa8rcrgmALG1ROGKF8zNyceu73RJkC/28xxuAmRUIGB7AeCFhLY6ik03e5XLFeg5sv
 zeSHMOdepp4EixYfkTpQ3ElcnvWRXng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Dp2FRleGMrCWrY9mj22qEQ-1; Tue, 22 Sep 2020 10:27:34 -0400
X-MC-Unique: Dp2FRleGMrCWrY9mj22qEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C58FA88EF31;
 Tue, 22 Sep 2020 14:27:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54D1D10013D7;
 Tue, 22 Sep 2020 14:27:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACA561132E9A; Tue, 22 Sep 2020 16:27:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kirillov <lekiravi@yandex-team.ru>
Subject: Re: [PATCH v4 1/4] qapi: net: Add query-netdev command
References: <20200921191912.105305-1-lekiravi@yandex-team.ru>
 <20200921191912.105305-2-lekiravi@yandex-team.ru>
Date: Tue, 22 Sep 2020 16:27:20 +0200
In-Reply-To: <20200921191912.105305-2-lekiravi@yandex-team.ru> (Alexey
 Kirillov's message of "Mon, 21 Sep 2020 22:19:09 +0300")
Message-ID: <87tuvpopiv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Vincenzo Maffione <v.maffione@gmail.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 yc-core@yandex-team.ru, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexey Kirillov <lekiravi@yandex-team.ru> writes:

> Add a qmp command that provides information about currently attached
> backend network devices and their configuration.
>
> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>

Acked-by: Markus Armbruster <armbru@redhat.com>


