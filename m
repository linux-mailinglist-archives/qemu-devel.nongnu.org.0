Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B62B033A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:59:22 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdAK1-0000KE-9S
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdAIz-0007tC-OH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdAIw-0007m8-Jg
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605178692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ajcNHCZYzyJg+B4dEvyqDnSbyTw+6t3JjlKfMwIePQY=;
 b=jK3zNtIJaql3k65sD3HsAS+22y9MteDtZ7ShyYeoT+Vnx7wlP/7sBK1jJaX2Xrp2/u1GIP
 tOzd7QdTYypkLgl1b9Ex6L78qkAuV+WPoka34oIdoVHl00sk8ofPA01JQ2xQQugaQ+2Ex6
 bu766jCqtOyCtcNWLc8Bp6jF5T6cLgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-_QbRTHEcMuS4hfpOYr5siw-1; Thu, 12 Nov 2020 05:58:10 -0500
X-MC-Unique: _QbRTHEcMuS4hfpOYr5siw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A0031016CE2
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:58:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06FD05C5DE;
 Thu, 12 Nov 2020 10:58:01 +0000 (UTC)
Date: Thu, 12 Nov 2020 11:58:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] char: Skip CLI aliases in query-chardev-backends
Message-ID: <20201112105800.GB14604@merkur.fritz.box>
References: <20201111130834.33985-1-kwolf@redhat.com>
 <20201111130834.33985-2-kwolf@redhat.com>
 <877dqrkmr5.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <877dqrkmr5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.11.2020 um 09:22 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > The aliases "tty" and "parport" are only valid on the command line, QMP
> > commands like chardev-add don't know them. query-chardev-backends should
> > describe QMP and therefore not include them in the list of available
> > backends.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> I'd call that a bug.

Which is why I'm fixing it, separate from the deprecation.

> In the light of PATCH 2, I propose to put that one first (with the
> help_string_append() hunk dropped), then remove the aliases from CLI
> help, too, like this: [...]

Going one step back without thinking in solutions immediately, what
you're suggesting is that deprecated options should become undocumented
instead of just annotated as deprecated?

Kevin


