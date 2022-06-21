Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95B655368B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:45:03 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3g3q-0006XF-K8
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3g1H-000448-Gi
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3g1F-0000zm-JQ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655826141;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWE04UgHso7LUY70gQ8B8j9FtJW83OXTdSnMAp7fzwo=;
 b=VfZkE95fcZVspew3qI+0QVhETtF9rnXbqZqbPrJh8BzTqSvkqgCmEhLQPAA6yibVZRGt2l
 QWCmZldejnJeaPMkUGTkZmjfl8adz5LA/gSVvLYw7g9WIYqDlLUBVVNBoQMTAZ5MEwwNYN
 Yjmxssl3I5BEzlF3EtEoNI/YW0erfNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-NgFSDZlTM-6aqssZImPQTQ-1; Tue, 21 Jun 2022 11:42:19 -0400
X-MC-Unique: NgFSDZlTM-6aqssZImPQTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AE6A811E75;
 Tue, 21 Jun 2022 15:42:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 984CE1121314;
 Tue, 21 Jun 2022 15:42:16 +0000 (UTC)
Date: Tue, 21 Jun 2022 16:42:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 09/21] migration: introduce a QIOChannel impl for
 BlockDriverState VMState
Message-ID: <YrHm1ehAcS9nCzaU@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-10-berrange@redhat.com>
 <871qvivxcs.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qvivxcs.fsf@secure.mitica>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 21, 2022 at 05:40:19PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Introduce a QIOChannelBlock class that exposes the BlockDriverState
> > VMState region for I/O.
> >
> > This is kept in the migration/ directory rather than io/, to avoid
> > a mutual dependancy between block/ <-> io/ directories. Also the
> > VMState should only be used by the migration code.
> >
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> I will maggically charge this to a:
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> O:-)

Opps, yes, please.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


