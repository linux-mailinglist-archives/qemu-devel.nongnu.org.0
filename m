Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69447369106
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:23:44 +0200 (CEST)
Received: from localhost ([::1]:38496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtuR-0006rC-HU
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtoi-0002wp-2I
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZtoU-0006Kd-5x
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=alanhRDcUYk5ryF9RYUmSglvTCBJKyItpO0g9ru3w44=;
 b=c0RZYuXKI4gMjbX9MwE44N3C32CJHhdukEjWBPSIKudbCFmdJmZa6tetGHs0ZFJ6YgPBoj
 aumO/dks7JSuv1ABFXcpNYmsQ4OD7ML6jiLLis2PoYlGJs2LxwWm3/lvTreHLPFOOQZhah
 /Rh/TLv0o2ZCsxXol929KnWEoavxnls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-jpZg3H0ZMLO9c0nl35s1hA-1; Fri, 23 Apr 2021 07:17:31 -0400
X-MC-Unique: jpZg3H0ZMLO9c0nl35s1hA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9608D343A2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:17:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF3D860613;
 Fri, 23 Apr 2021 11:17:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 704C5113525D; Fri, 23 Apr 2021 13:17:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 5/5] sockets: Support multipath TCP
References: <20210421112834.107651-1-dgilbert@redhat.com>
 <20210421112834.107651-6-dgilbert@redhat.com>
Date: Fri, 23 Apr 2021 13:17:22 +0200
In-Reply-To: <20210421112834.107651-6-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Wed, 21 Apr 2021 12:28:34 +0100")
Message-ID: <87sg3hgshp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: berrange@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Multipath TCP allows combining multiple interfaces/routes into a single
> socket, with very little work for the user/admin.
>
> It's enabled by 'mptcp' on most socket addresses:
>
>    ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

For the QAPI schema:
Acked-by: Markus Armbruster <armbru@redhat.com>


