Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A049B7D2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:42:29 +0100 (CET)
Received: from localhost ([::1]:60906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNxk-0006An-G0
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNUR-00005M-1q
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:12:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNUO-0006rs-MW
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123528;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rR5nrc6xQJSxh3gb6ipylx2EMoeESj/trMiMDERdXR4=;
 b=MMTLw4cQKmZH/mxd6iSJqN1iaLrHsqgQKEXmRn6QcI7CQyYDpwHbe5QLm5WeucDI4+Q7Bh
 Hst32n6iZjpQoNe8OxACZ94Fvhp5KpBDUFhR4pK0wpBtt18JrZohaZUHJym8Vpbo9JfCj4
 2aguMkcyALZcEGa3zqhq7J44e8KuSrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-CdBzSmbuNzadWxmTsDm8iQ-1; Tue, 25 Jan 2022 10:12:06 -0500
X-MC-Unique: CdBzSmbuNzadWxmTsDm8iQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A1284B9A4;
 Tue, 25 Jan 2022 15:12:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05944708D2;
 Tue, 25 Jan 2022 15:12:03 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:12:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Message-ID: <YfATQN5htkyoYVTo@redhat.com>
References: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 ?? Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 22, 2022 at 08:12:16PM +0100, Christian Schoenebeck wrote:
> The 9p test cases use mkdtemp() to create a temporary directory for
> running the 'local' 9p tests with real files/dirs. Unlike mktemp()
> which only generates a unique file name, mkdtemp() also creates the
> directory, therefore the subsequent mkdir() was wrong and caused
> errors on some systems.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
> ---
>  tests/qtest/libqos/virtio-9p.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


