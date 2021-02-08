Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B03313E62
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:04:01 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BpI-0002V4-50
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l96Wr-0000wb-85
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:24:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l96WT-00023p-Mb
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612790644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8X6MCPvTcX06F0PMh4IrWKI1EzdZOT1mfpt3PvYQ0Ps=;
 b=R5lCaB6ok1gAJrkCD01grB7H9LP103Ve3MH4QVzhTrZeuVIk0R3CAjAY5V7sjnUE+a+FDi
 4Zf9je8EdGxStKGibe0dKEFEAHkn4C43Ppdj1VASGOw6fURxfFKGVufhOywjiQdfaDmJiG
 IsLnL/1U6GiCqrugXZXZzHVU1Ajpvek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-7-Kqi86bNzGORgEHuoVM7A-1; Mon, 08 Feb 2021 08:24:02 -0500
X-MC-Unique: 7-Kqi86bNzGORgEHuoVM7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1876E801962;
 Mon,  8 Feb 2021 13:24:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C60AF60C05;
 Mon,  8 Feb 2021 13:24:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55EDD113865F; Mon,  8 Feb 2021 14:23:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v5] qga: Utilize QAPI_LIST_APPEND in
 qmp_guest_network_get_interfaces
References: <20210205171634.1491258-1-eblake@redhat.com>
Date: Mon, 08 Feb 2021 14:23:59 +0100
In-Reply-To: <20210205171634.1491258-1-eblake@redhat.com> (Eric Blake's
 message of "Fri, 5 Feb 2021 11:16:34 -0600")
Message-ID: <878s7y66c0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> I found another spot that can benefit from using our macros instead of
> open-coding qapi list creation.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Mike, would you like me to stick this into a QAPI pull request?


