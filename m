Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4152DBAE4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 06:59:19 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpPqH-0007bx-Ki
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 00:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kpPpG-0007D5-FZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 00:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kpPpE-0003Ud-BH
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 00:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608098290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RT0x/FsCwDkJskdjaDTXX639DC1iwVkKmy5R+MxUDbI=;
 b=Lqml60g8uRwSGalVKPxkNrXOhmcusXnZ5LCkJK/yoTvXCFUiWpmXtwTitjyI5jDm8xqbOR
 5Q5DON//MBxnXqs3VAcilBOu5PB+2JW+OkMvR9grdmudNRRKi8fJM/AEhrec5XNzqqfiXa
 P9KNdYw6TGKkbFFZhTBD8dhjxOAx9b0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-t-_O2mv3MYOrLa5i9CwY-w-1; Wed, 16 Dec 2020 00:58:06 -0500
X-MC-Unique: t-_O2mv3MYOrLa5i9CwY-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9FD81005504;
 Wed, 16 Dec 2020 05:58:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A18EE5C67A;
 Wed, 16 Dec 2020 05:58:04 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED6CC4BB40;
 Wed, 16 Dec 2020 05:58:02 +0000 (UTC)
Date: Wed, 16 Dec 2020 00:58:02 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <92845450.36204439.1608098282759.JavaMail.zimbra@redhat.com>
In-Reply-To: <87o8ivmpia.fsf@dusky.pond.sub.org>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
 <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
 <87o8ivmpia.fsf@dusky.pond.sub.org>
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.8]
Thread-Topic: Use QMP query-netdev in hmp_info_network
Thread-Index: 5Y4DizgRhvqdFxtHH61nuskBxsCvKQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 yc-core@yandex-team.ru, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Alexey Kirillov <lekiravi@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> Jason Wang <jasowang@redhat.com> writes:
> 
> [...]
> > One more stupid question, instead of generating the string via hard
> > codes, is there any method (dict?) to iterate all the key/values
> > automatically?
> 
> QAPI visitors.
> 
> The lazy way: use the QObject output visitor to convert the QAPI type
> (here: NetdevInfo) to QObject, then qobject_to_json() to convert to
> JSON text.
> 
> If you don't want JSON, replace qobject_to_json().  Perhaps you can
> create something that's generally useful for HMP, not just "info
> network".  I'd pick keyval_parse() syntax.
> 
> The detour through QObject creates and destroys a rather fat temporary
> data structure.  Tolerable when the amount of data is small.  An output
> visitor that directly creates the string is more efficient.  Takes a bit
> more code, though.  I intend to post one for JSON, to reduce QMP's
> malloc gluttony.
> 

Thanks a lot for the answer.

Alexey, let's try what Markus suggested here.


