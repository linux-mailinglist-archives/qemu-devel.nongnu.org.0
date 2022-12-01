Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC263E9EF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dD7-0007eD-Lg; Thu, 01 Dec 2022 01:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0dD5-0007Zh-T9
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0dD3-0000LY-Q8
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669876692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4M3ZZ1P28a9lOFyJ7b3d2Rcy5xTqpeGO8AfE0aWRdvw=;
 b=WNteRCfZJYKbzIPXBkqZqqE+HNljcz6e/DKB2M7zY/6bc8LcZ2h7m3dpmrWKpigjhqzrka
 yntBvBGcl2SFHnzJNYMLUGN7Kh5+fOdpomQ7M/pldMAZfNK+DEZvnGpt55zIDgFSCge5zD
 38ZTL2hx0j0peSCWFydN42QU/NYnLMo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-xRf4I_yjPuahCoq9D36N-g-1; Thu, 01 Dec 2022 01:38:11 -0500
X-MC-Unique: xRf4I_yjPuahCoq9D36N-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B153C0D841
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:38:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1DB40C6EC4;
 Thu,  1 Dec 2022 06:38:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA5B521E6921; Thu,  1 Dec 2022 07:38:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 5/9] ui: Move QMP commands from monitor to new
 ui/ui-qmp-cmds.c
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-6-armbru@redhat.com>
Date: Thu, 01 Dec 2022 07:38:07 +0100
In-Reply-To: <20221201061311.3619052-6-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 1 Dec 2022 07:13:07 +0100")
Message-ID: <87wn7b1ve8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Markus Armbruster <armbru@redhat.com> writes:

> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "Graphics".
>
> Command add-client applies to socket character devices in addition to
> display devices.  Move it anyway.  Aside: the way @protocol character
> device IDs and display types is bad design.

Last sentence no verb.  Trying again:

  Aside: @protocol is either a display type or else a character device
  ID.  Bad design.

> Signed-off-by: Markus Armbruster <armbru@redhat.com>


