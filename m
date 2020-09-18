Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E0270831
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 23:27:01 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJNuF-0007TC-V7
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 17:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJNOn-00062j-Kt
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJNOl-00078T-VD
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600462467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ax0uGfthEG6B1GpW7sHPY5S9dm1f8wzDjrpuN9+bbKE=;
 b=RAr1Dblekr6N/A3MGLMCnFFnpmPO2yR2YXuTDd0hYQD9sQi2pmzBssQbPJAHm1t1Xqn6Sf
 G0rcT4UPJCxjRwkzTa2qDO06c2bTU25EhWHY4k0+telV9/5ODfO8iTh3mNcDkDUAZ3Qvum
 bugUVu9n4AxSZ7f8z+OFhWisYuwEkZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-0IJKPbMtOi28ZpVVghXmxg-1; Fri, 18 Sep 2020 16:54:25 -0400
X-MC-Unique: 0IJKPbMtOi28ZpVVghXmxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA1E1009454
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 20:54:24 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8556198E;
 Fri, 18 Sep 2020 20:54:24 +0000 (UTC)
Date: Fri, 18 Sep 2020 16:54:23 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] qom: simplify object_find_property /
 object_class_find_property
Message-ID: <20200918205423.GA8041@habkost.net>
References: <20200914135617.1493072-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200914135617.1493072-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 14, 2020 at 02:56:17PM +0100, Daniel P. Berrangé wrote:
> When debugging QEMU it is often useful to put a breakpoint on the
> error_setg_internal method impl.
> 
> Unfortunately the object_property_add / object_class_property_add
> methods call object_property_find / object_class_property_find methods
> to check if a property exists already before adding the new property.
> 
> As a result there are a huge number of calls to error_setg_internal
> on startup of most QEMU commands, making it very painful to set a
> breakpoint on this method.
> 
> Most callers of object_find_property and object_class_find_property,
> however, pass in a NULL for the Error parameter. This simplifies the
> methods to remove the Error parameter entirely, and then adds some
> new wrapper methods that are able to raise an Error when needed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Queued, thanks!

(Paolo, if you wish to get back to handling of QOM patches when
you're back, please let me know)

-- 
Eduardo


