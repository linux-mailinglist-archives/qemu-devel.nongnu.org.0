Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D36A59D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWzfq-0002xf-6B; Tue, 28 Feb 2023 08:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWzfo-0002xL-K0
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWzfl-0008N0-Ho
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677589536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lT/d0Scmg1OdxW8p2cG1Ykl7OzAJ+7wei7yHq1LntwA=;
 b=AVAL+HbAp7TuY3Ml4St8hPssldES+DKuJLUa5PIEIw3zOjATMJ1RLpr7PvAc1xoWIEzcoo
 9kEbJtJ06dLtE817t+u+iapLKH8Ik9fW1bs2J42TBf8iLEXMDKqdCb26R2MJqmyb/wzmOo
 4dvYJgtJwqsZky/tL4wdc2jrXLUdGqY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-a-fHVAO5Noaj-CFh0s-vsQ-1; Tue, 28 Feb 2023 08:05:33 -0500
X-MC-Unique: a-fHVAO5Noaj-CFh0s-vsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8E285A5A3;
 Tue, 28 Feb 2023 13:05:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFDD492B0F;
 Tue, 28 Feb 2023 13:05:30 +0000 (UTC)
Date: Tue, 28 Feb 2023 13:05:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, jasowang@redhat.com,
 pbonzini@redhat.com, arei.gonglei@huawei.com, yechuan@huawei.com,
 eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <Y/38GP03PUA7XKWZ@redhat.com>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
 <20230228051830-mutt-send-email-mst@kernel.org>
 <Y/3gaVgDcf26vo6Y@redhat.com>
 <20230228072616-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228072616-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 28, 2023 at 07:29:42AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 11:07:21AM +0000, Daniel P. Berrangé wrote:
> > IMHO it is not appropriate to criticize the writing of people
> > who may not have English as a first language. 
> 
> Sorry if I offended anyone. I do want change log messages to be clear
> and unambigous though since they are a permanent record. Me rewriting
> them for contributors does not seem to scale. I was hoping a grammar
> checker will help but if not I don't know what to suggest then.

Agreed that having the maintainer frequently rewriting them isn't
scalable in general, but that's not the common case I think/hope.

If a commit message truely isn't easy enough to understand, it is
reasonable to ask the contributor to clarify it and post a v2,
giving them some hints where appropriate.

If it is just sub-optimal grammar that doesn't massively impact
understanding, then I'm inclined to just accept patches as is,
or do very minor copy editting for obvious / simple issues.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


