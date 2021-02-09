Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57809314D57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:47:47 +0100 (CET)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QYc-0008Ja-4G
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9QXP-0007gQ-CW
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9QXM-0001vo-6b
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612867586;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXTsleixK1TszblQuycQNroZmGYPG+mviv36SRF41Ng=;
 b=O3MXleHNIpppdiC3ngUQMRDz+RfxTs9AFfXFnPGZpqDQ5MQ5d1w7lftrpuOilPvQWntYd0
 uVo+5F0Hm+E0+BXW+hskHqrrVZPN0E6yuukwf8b0/S/pvsoz9XiXjQ6LL6uP1MPuWvji21
 4MdaIjYvHVOrdO6Wn6DzgUch9HRO2IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-kMMpimEKO1SPRZfbd9zV-A-1; Tue, 09 Feb 2021 05:46:14 -0500
X-MC-Unique: kMMpimEKO1SPRZfbd9zV-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893BF100CCC3;
 Tue,  9 Feb 2021 10:46:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF955D9DC;
 Tue,  9 Feb 2021 10:46:09 +0000 (UTC)
Date: Tue, 9 Feb 2021 10:46:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hao Wang <wanghao232@huawei.com>
Subject: Re: [PATCH v2 1/2] migration/tls: fix inverted semantics in
 multifd_channel_connect
Message-ID: <20210209104607.GE1166421@redhat.com>
References: <20210209104237.2250941-1-wanghao232@huawei.com>
 <20210209104237.2250941-2-wanghao232@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210209104237.2250941-2-wanghao232@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, alex.chen@huawei.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, dgilbert@redhat.com, xiexiangyou@huawei.com,
 qemu-devel@nongnu.org, zhengchuan@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 06:42:36PM +0800, Hao Wang wrote:
> Function multifd_channel_connect() return "true" to indicate failure,
> which is rather confusing. Fix that.
> 
> Signed-off-by: Hao Wang <wanghao232@huawei.com>
> ---
>  migration/multifd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


