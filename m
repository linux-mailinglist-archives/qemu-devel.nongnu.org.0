Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536D387666
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:25:14 +0200 (CEST)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwuW-00050I-Qt
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liwTf-00086y-Ud
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liwTe-0001EP-Bz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EpFQ2U1M6pOcTmItiDt3gvnG/ZY3NA19eQdmN7naEGw=;
 b=FaV/E3LFyq5w66mqMwqtlLgLyky5NJma1goy7iJ57JgGqjh4QDSmSm0FLXJHgQPz7Igq9D
 L9unWji5BM+gYCY2FuqFUPF56V/VpvZ3o+VXEZ0O6apfDQX09RBK5NREmJIcp8J+4lx8/q
 RmJrBNzv62KSsOPMVdOjUuXmvQV5bJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-UR25Ck-ZPNifE5s0kXECWA-1; Tue, 18 May 2021 05:57:24 -0400
X-MC-Unique: UR25Ck-ZPNifE5s0kXECWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DE2D8049CB;
 Tue, 18 May 2021 09:57:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC79F5C239;
 Tue, 18 May 2021 09:57:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 66449113861E; Tue, 18 May 2021 11:57:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 04/21] qapi/parser: factor parsing routine into method
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-5-jsnow@redhat.com>
Date: Tue, 18 May 2021 11:57:21 +0200
In-Reply-To: <20210511220601.2110055-5-jsnow@redhat.com> (John Snow's message
 of "Tue, 11 May 2021 18:05:44 -0400")
Message-ID: <87sg2k5pq6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> For the sake of keeping __init__ smaller (and treating it more like a
> gallery of what state variables we can expect to see), put the actual
> parsing action into a parse method. It remains invoked from the init
> method to reduce churn.

I'm kind of *shrug* about this.  Well short of "no".

>
> To accomplish this, 'previously_included' becomes the private data
> member '_included', and the filename is stashed as _fname.

Nitpick: you enclose most identifiers in quotes, but not all.

Comments and commit messages often profit from "marking up" identifiers.
Especially when the identifiers are also common words.  I like to use
function(), @variable, .attribute, and .method().

>
> Add any missing declarations to the init method, and group them by
> function so they can be understood quickly at a glance.
>
> Signed-off-by: John Snow <jsnow@redhat.com>


