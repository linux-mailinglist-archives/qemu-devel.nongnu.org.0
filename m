Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A450698950
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:34:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSE6-0000Nv-IL; Wed, 15 Feb 2023 19:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSSE4-0000KU-2H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSSE1-0004IJ-AD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676507652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JzpVjzrwr7is1a7jL9GKKxS6V6EqnEwEq0yQJ83yTiA=;
 b=WVF5LyAtg51jK1l5Oaw38acHKWjkmLBDTKfw1XMqqCUjSflVZE76U7NATnUcSaY6vHlQ6l
 naLcgwnNFEAUwla98214N8Zb+7JzZ7u4wuoQRFIPSl81skQg7g9YU9g5aL2zocgm3K3hnO
 Uy/gWuTXMp9bU20MCp0SrlQeeqH5mnc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-_wtPJKOvPc6ER1BXSyBySg-1; Wed, 15 Feb 2023 19:34:04 -0500
X-MC-Unique: _wtPJKOvPc6ER1BXSyBySg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30BC23811F35;
 Thu, 16 Feb 2023 00:34:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD89C492B0E;
 Thu, 16 Feb 2023 00:34:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBBE321E6A1F; Thu, 16 Feb 2023 01:34:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 eblake@redhat.com,  eduardo@habkost.net,  pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com,  mst@redhat.com,  philmd@linaro.org,
 den-plotnikov@yandex-team.ru,  antonkuchin@yandex-team.ru,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+ts1vBvI+IEH//K@redhat.com> <87fsb8jw7r.fsf@pond.sub.org>
 <Y+uTz2QfWGo2HUZ1@redhat.com> <87wn4kfbz2.fsf@pond.sub.org>
 <d9306845-6cf8-1c40-35a0-19b2bef90ac8@yandex-team.ru>
Date: Thu, 16 Feb 2023 01:34:02 +0100
In-Reply-To: <d9306845-6cf8-1c40-35a0-19b2bef90ac8@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 16 Feb 2023 00:00:44 +0300")
Message-ID: <873576wirp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:


[...]

> So, if no objections, I plan to resend with old "optional id & qom_path" designation for devices. We still can do a deprecation in future.

Yes, please.


