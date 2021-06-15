Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854843A7DB7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:57:25 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7h6-00069S-L5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7gL-0005Ti-Fv
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7gI-0005iz-Mk
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623758193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a905U9Z+aJ5itmB5uGgPsPn7+8txbErSvFDjXVM5TYA=;
 b=Yco7sxQUmqQJx4UHIcACwE9+dTqyNw4ST062xae+ucdWevHYSfgkAY37uY1n32Zwny/Lvb
 cWjWcReh4a43u1Xm1CmNcDZFxNjWykYqymQUa2tmfEdY03IrYhau0oVKJEqYZdvLXxG0ZF
 l3iC0aNgqFuzJrVnDPadlvQXzQ8pjp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-7OIVNFDuM7ay7AD2M7hOzw-1; Tue, 15 Jun 2021 07:56:32 -0400
X-MC-Unique: 7OIVNFDuM7ay7AD2M7hOzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A495801106
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 11:56:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E50560E3A;
 Tue, 15 Jun 2021 11:56:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 204ED113865F; Tue, 15 Jun 2021 13:56:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 0/9] qapi: untie 'if' conditions from C preprocessor
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
Date: Tue, 15 Jun 2021 13:56:26 +0200
In-Reply-To: <20210608120723.2268181-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:14 +0400")
Message-ID: <8735tjqr2t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Done, except for the tests in PATCH 7.

I agree with the QAPI schema language change.

Having this many classes just for conditionals feels tiresome.  I'm
tempted to try axing all but one just to see how it comes out.  This is
not a demand.

Let's discuss my review comments, and then figure out what still needs
to be done to get merged.


