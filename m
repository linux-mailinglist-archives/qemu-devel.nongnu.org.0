Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4039F876
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:08:39 +0200 (CEST)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcPF-00022v-OV
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcOS-0001NY-De
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqcON-0000fk-Oi
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+XshwnpLQ4ETr1+CpvOStuZ0FTFhtpbHHBiYzQWI9Y=;
 b=crF0WFAJJNI/OAiBsnoV1CsjFADugZfgIDccpfA3gfed5lkqjN9nNgiyuFJ4y+iZZPKDSl
 8bu1btVDKL+XZ3o7QyadCFMdu6E0xCCmDx/4cayr0CHcuIJOqUr3kv6B7xdCx+0RhSJ11b
 PaQ+thB3qjmywFcVBfTbd2rqA1MWfy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-KYW6fqS2NnKdqpDZ5C8iYA-1; Tue, 08 Jun 2021 10:07:41 -0400
X-MC-Unique: KYW6fqS2NnKdqpDZ5C8iYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604C3101371B;
 Tue,  8 Jun 2021 14:07:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AE2B5C1BB;
 Tue,  8 Jun 2021 14:07:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B53CF113865F; Tue,  8 Jun 2021 16:07:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Subject: Re: A bug of Monitor Chardev ?
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
Date: Tue, 08 Jun 2021 16:07:30 +0200
In-Reply-To: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com> (Longpeng's
 message of "Mon, 17 May 2021 14:56:39 +0800")
Message-ID: <87o8cgxxel.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: chenjiashang@huawei.com,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
<longpeng2@huawei.com> writes:

> We find a race during QEMU starting, which would case the QEMU process coredump.
>
> <main loop>                             |    <MON iothread>
>                                         |
> [1] create MON chardev                  |
> qemu_create_early_backends              |
>   chardev_init_func                     |
>                                         |
> [2] create MON iothread                 |
> qemu_create_late_backends               |
>   mon_init_func                         |
> 	aio_bh_schedule-----------------------> monitor_qmp_setup_handlers_bh
> [3] enter main loog                     |    tcp_chr_update_read_handler
> (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
> tcp_chr_new_client                      |
>   update_ioc_handlers                   |
>                                         |
>     [4] create new hup_source           |
>         s->hup_source = *PTR1*          |
>           g_source_attach(s->hup_source)|
>                                         |        [5] remove_hup_source(*PTR1*)
>                                         |            (create new hup_source)
>                                         |             s->hup_source = *PTR2*
>         [6] g_source_attach_unlocked    |
>               *PTR1* is freed by [5]    |
> 			
> Do you have any suggestion to fix this bug ? Thanks!

Do we?  We talked, but I'm not sure we reached a conclusion.


