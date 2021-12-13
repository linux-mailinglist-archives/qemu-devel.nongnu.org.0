Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863D47205D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 06:21:54 +0100 (CET)
Received: from localhost ([::1]:52756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwdmb-0005bE-9y
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 00:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwdky-0004ut-LV
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 00:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mwdku-0000hn-MI
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 00:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639372805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0N4zhpNn8pzyMthh4KNmdAJkCAUrMF9zWI/c480HNA=;
 b=FsZ4Bu9pbwp9vmx93+G0W6aiMDLSPsWH+XQzh8pgMB0Vb/A8JuC135UhWZ0ewyw4LlW40l
 KkLFfFYZcDWLIzHxUdNNceArgmY6FlqAck+qW1dppqXGkUX01M6BAc/yCWl7NwhtxbYRmF
 t1CdsmMp1594gc+HPudo9dcIiGvXPn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-555-5UB_gx7VPX6z2Bz5-DoVhg-1; Mon, 13 Dec 2021 00:20:00 -0500
X-MC-Unique: 5UB_gx7VPX6z2Bz5-DoVhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543AD81CCB4;
 Mon, 13 Dec 2021 05:19:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11CF745D86;
 Mon, 13 Dec 2021 05:19:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8ADB1113865F; Mon, 13 Dec 2021 06:19:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v8 2/7] net/vmnet: add vmnet backends to qapi/net
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
 <20211211104413.50524-3-yaroshchuk2000@gmail.com>
Date: Mon, 13 Dec 2021 06:19:53 +0100
In-Reply-To: <20211211104413.50524-3-yaroshchuk2000@gmail.com> (Vladislav
 Yaroshchuk's message of "Sat, 11 Dec 2021 13:44:08 +0300")
Message-ID: <87v8zt13pi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, r.bolshakov@yadro.com, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


