Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA431B931
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:29:00 +0100 (CET)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBczr-0006kZ-FE
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBcnh-00030L-LC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBcnf-0005QX-2D
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613391382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ZPUdGgd0NZ19CcRtoRLj5M/qsfIxyMyNz5qpWYWlbU=;
 b=DBofT1LQ/ULFaOiXXBLCNUrZLYEX/wDg8eFtKlv1pmj8uZPsV1intlhsE32OyjSJFAqjfs
 xQoxqizpW94hmgcz6LHM79rjPUpOj2XqVNY+M30UEAcGQXV1WFTfJ52eE0VYeroEDn88Ls
 u0YbwGMvH4pQw4j2CWAi/E/X/ouDjMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-TmR5Xc88NeqoWm2uYpUxvQ-1; Mon, 15 Feb 2021 07:16:20 -0500
X-MC-Unique: TmR5Xc88NeqoWm2uYpUxvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4A9107ACF9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:16:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F385A19C79;
 Mon, 15 Feb 2021 12:16:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 75BBB113865F; Mon, 15 Feb 2021 13:16:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/2] monitor: Shutdown fixes
References: <20210212172028.288825-1-kwolf@redhat.com>
Date: Mon, 15 Feb 2021 13:16:17 +0100
In-Reply-To: <20210212172028.288825-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Fri, 12 Feb 2021 18:20:26 +0100")
Message-ID: <871rdhzfu6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This fixes the bug(s) that Markus reported here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07719.html

Tested-by: Markus Armbruster <armbru@redhat.com>


