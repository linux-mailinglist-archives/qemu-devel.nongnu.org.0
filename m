Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883B4ECA71
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:18:10 +0200 (CEST)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbxR-0002Hl-Fn
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:18:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZbwa-0001IO-4m
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZbwX-0005NA-Ec
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648660632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRonZkfs3WeGED4uyRAdOtqzwU3tVAHxTVYMnVDlDXc=;
 b=HxBoG5y9KeYS+SwX0Ljsb/fzrBXNnttRP4TKaBRHV/sNQu6g8AsCW6Jp4Pjnx0AbJxP9v9
 Nw4c994ukPB4pzwVPYxI8UWkgnpC6/bK2b4vd/KWhzSGqMCWV6WmowSXsK8WyoW1jBr2C+
 DAXif0v/KXxAuTNv88jBhJdmSaeQKXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-cTyfS1WnNyOva8NBZpGdgA-1; Wed, 30 Mar 2022 13:17:09 -0400
X-MC-Unique: cTyfS1WnNyOva8NBZpGdgA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5B3685A5BE
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:17:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96EB057E423;
 Wed, 30 Mar 2022 17:17:07 +0000 (UTC)
Date: Wed, 30 Mar 2022 18:17:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 00/18] tests: introduce testing coverage for TLS with
 migration
Message-ID: <YkSQkIEgJhLxinjz@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <YiqswPa/VV/lY6yN@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YiqswPa/VV/lY6yN@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan,

would you be able to include at least patch 6 in a migration
pull before release ?

On Fri, Mar 11, 2022 at 09:58:24AM +0800, Peter Xu wrote:
> On Thu, Mar 10, 2022 at 05:18:03PM +0000, Daniel P. Berrangé wrote:
> > This significantly expands the migration test suite to cover testing
> > with TLS over TCP and UNIX sockets, with both PSK (pre shared keys)
> > and x509 credentials, and for both single and multifd scenarios.
> > 
> > It identified one bug in handling PSK credentials with UNIX sockets,
> > but other than that everything was operating as expected.
> > 
> > To minimize the impact on code duplication alopt of refactoring is
> > done of the migration tests to introduce a common helper for running
> > the migration process. The various tests mostly just have to provide
> > a callback to set a few parameters/capabilities before migration
> > starts, and sometimes a callback to cleanup or validate after
> > completion/failure.
> > 
> > There is one functional bugfix in patch 6, I would like to see
> > in 7.0. The rest is all test suite additions, and I don't mind
> > if they are in 7.0 or 7.1
> 
> At least patch 1-4, 6-10 look already good candidates for 7.0, imho, if not
> all..
> 
> Thanks for doing this, Daniel.
> 
> -- 
> Peter Xu
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


