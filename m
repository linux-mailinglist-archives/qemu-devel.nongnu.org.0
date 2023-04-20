Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D26E9314
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:40:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSdL-0007fB-VD; Thu, 20 Apr 2023 07:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppSbV-0007be-G6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppSbC-0001ON-Po
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681990632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SudnPadI0gEi52D5C6CYZr4WgReFDEo6BczhcbdBK/Y=;
 b=dLdmhO6GAaYXOXdbHU2Vlj0BsCVTZHrP1Igm7sHmuG+W8Pj3pqHUa1W1uOEQR6LwY/Fp4S
 6GgC9i0UxEI4D35gBRDL4gZ9pUrCgwUgIgp5d4fcAK0yII5AKtK/32t9Pw4lWlUkLGiMAL
 F7/9hJhj1Ym/mJw1zfGtq2AWg78cieQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-sCOc20IPPsmXUQuX-9FqjA-1; Thu, 20 Apr 2023 07:37:10 -0400
X-MC-Unique: sCOc20IPPsmXUQuX-9FqjA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99B8C8996F1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 11:37:10 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8FA492C3E;
 Thu, 20 Apr 2023 11:37:09 +0000 (UTC)
Date: Thu, 20 Apr 2023 12:37:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] tests/qtest: capture RESUME events during migration
Message-ID: <ZEEj48pjEBcStwwi@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-2-berrange@redhat.com>
 <87zg72yeju.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zg72yeju.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 01:32:37PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > When running migration tests we monitor for a STOP event so we can skip
> > redundant waits. This will be needed for the RESUME event too shortly.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> 
> I am waiting for you to check the problem than Lukas detected, but this
> part of the patch is "obviously" correct.
>
> Famous last words.

Actually it has a small flaw - I don't set  'got_resume = false' at the
start of each test :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


