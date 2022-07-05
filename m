Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C9566225
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 06:16:20 +0200 (CEST)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Zz0-0006Um-Nf
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 00:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8ZxD-0004wF-7M
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8Zx9-0001uO-Go
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 00:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656994462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5O1e761BDD/5lmyqG8EdYvJdtlpLQpt08cwtVrp8kEc=;
 b=D6p27JUG0iTAo0QdZTAb5xuSUb8gKkfJICLuVEFQVurx0tsiuX6p7Ecla0fDlH6k9Nk+2Q
 JUoSWczrg0IJJNWMl8ZCoSzvCTjzTvZtC/Whe5T4utPW8DiPG5Ok2Ih82WvWqxzk4LoBe/
 lNVBUw2zmQO3AOYn5R9xlcDxOvIYd+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-_xB8rgAVNoiJoPOFtPLYPA-1; Tue, 05 Jul 2022 00:14:19 -0400
X-MC-Unique: _xB8rgAVNoiJoPOFtPLYPA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BA30101A589
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 04:14:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F7C40334D;
 Tue,  5 Jul 2022 04:14:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7139821E691E; Tue,  5 Jul 2022 06:14:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,  Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-3-leobras@redhat.com>
Date: Tue, 05 Jul 2022 06:14:18 +0200
In-Reply-To: <20220704202315.507145-3-leobras@redhat.com> (Leonardo Bras's
 message of "Mon, 4 Jul 2022 17:23:14 -0300")
Message-ID: <87mtdotcv9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Leonardo Bras <leobras@redhat.com> writes:

> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Acked-by: Markus Armbruster <armbru@redhat.com>


