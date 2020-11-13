Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0A42B185B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:38:18 +0100 (CET)
Received: from localhost ([::1]:43818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVX7-0008BR-Ep
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdVW5-0007K5-36
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdVW3-00068g-AG
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605260230;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIvyiZRKr8ZD6+UHYM50vEtpnZ8SgBI53kC3MhcHdY8=;
 b=ckOL0pEj4Ymt2ZLl/wdmE1AM1xwl3hUd7S1IzZgIixzYh/Ptf+NOl5u1r5+qtQk7aGQbfU
 NXRNaESPC0w2INFlzWdMMYSWogKmTlSABAOcexOlICS7K0MYMUI/EOOJ75ZHKeryJFkCyV
 atWa2940Ms86i8ILK8SXan17U2pOus8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-0TgWY6Y-O_-MaDhe83GOnw-1; Fri, 13 Nov 2020 04:37:08 -0500
X-MC-Unique: 0TgWY6Y-O_-MaDhe83GOnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69FE9186DD4A
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 09:37:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-180.ams2.redhat.com [10.36.113.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B3B46EF65;
 Fri, 13 Nov 2020 09:37:06 +0000 (UTC)
Date: Fri, 13 Nov 2020 09:37:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] authz-list-file: Fix file read error handling
Message-ID: <20201113093703.GB30434@redhat.com>
References: <20201113062358.2563662-1-armbru@redhat.com>
 <20201113062358.2563662-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113062358.2563662-2-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 07:23:57AM +0100, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> qauthz_list_file_complete() is wrong that way: it passes @errp to
> qauthz_list_file_complete() without checking for failure.  If it runs
> into another failure, it trips error_setv()'s assertion.  Reproducer:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -object authz-list-file,id=authz0,filename=
>     qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
>     Aborted (core dumped)
> 
> Fix it to check for failure.
> 
> Fixes: 55d869846de802a16af1a50584c51737bd664387
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  authz/listfile.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


