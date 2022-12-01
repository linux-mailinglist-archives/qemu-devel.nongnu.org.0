Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A895963F433
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lc6-0002Ms-7e; Thu, 01 Dec 2022 10:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0lc4-0002MU-T4
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 10:36:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0lc3-0002Zb-Fy
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 10:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669908994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28mQkVHIYKUT4TFJ/b2xhHUBQN3ItHNn2kwZBczNp8o=;
 b=T9Hr500tCg5UVNmDfIUZsShhvgJv2HN9/Xarj72qhlw6o2lmQyjaw0px5Ybkz3cHB6s9QN
 TpHR0ugTnkPee93qUo/aQGNOAsKIlur3YJqLC+jAOumzTybO/YZMq9f5wj3A2JZsjFcw4J
 r1GWr8UBtd12wflZyEu5hRzaTI/Tj8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-dYa1WT4tPvix4Lgu39GGPg-1; Thu, 01 Dec 2022 10:36:31 -0500
X-MC-Unique: dYa1WT4tPvix4Lgu39GGPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 246AD3815D26;
 Thu,  1 Dec 2022 15:36:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA18C2DF60;
 Thu,  1 Dec 2022 15:36:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D0F721E6921; Thu,  1 Dec 2022 16:35:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-block@nongnu.org,  qemu-devel@nongnu.org,  Kevin Wolf
 <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH] blockdev: add 'media=cdrom' argument to support usb
 cdrom emulated as cdrom
References: <20221201134227.1983-1-luzhipeng@cestc.cn>
Date: Thu, 01 Dec 2022 16:35:57 +0100
In-Reply-To: <20221201134227.1983-1-luzhipeng@cestc.cn> (luzhipeng@cestc.cn's
 message of "Thu, 1 Dec 2022 21:42:27 +0800")
Message-ID: <871qpjf86a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

luzhipeng <luzhipeng@cestc.cn> writes:

> From: zhipeng Lu <luzhipeng@cestc.cn>
>
> The drive interface supports media=cdrom so that the usb cdrom
> can be emulated as cdrom in qemu, but libvirt deprived the drive
> interface, so media=cdrom is added to the blockdev interface to
> support usb cdrom emulated as cdrom
>
> Signed-off-by: zhipeng Lu <luzhipeng@cestc.cn>

What problem are you trying to solve?


