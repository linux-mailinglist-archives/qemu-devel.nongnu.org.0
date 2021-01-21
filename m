Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EFB2FF620
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:42:49 +0100 (CET)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gn2-0001wi-JI
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2glc-0000PW-RX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2gla-0005P3-Ei
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611261675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GcMneY5ZksTuHaON16lG1yiZ1BIY1so3HNtCBvDS8no=;
 b=D6F8fFpcQU7HHf/FY2tlQCtUlXU66o3UfG9IgatNnG15vkFc+Ykftm7/FlSD2KWqx4WVQC
 OEKeNeW2YMO6Ej/ZzNC0qBJJwEWN6djDGTKuSp7y35a5m0GM94uNg3k+US/DZ/45XUToFB
 vpzMXjDeVTMKw9Jvb1fYJ0gTaY9xp+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-TYOZS-y5PVe9GHMoaQXQ5w-1; Thu, 21 Jan 2021 15:41:12 -0500
X-MC-Unique: TYOZS-y5PVe9GHMoaQXQ5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A29DE107ACE3;
 Thu, 21 Jan 2021 20:41:10 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AFCC19C59;
 Thu, 21 Jan 2021 20:41:04 +0000 (UTC)
Date: Thu, 21 Jan 2021 15:41:03 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/3] nvdimm: read-only file support
Message-ID: <20210121204103.GY1227584@habkost.net>
References: <20210104171320.575838-1-stefanha@redhat.com>
 <20210104210226.GI18467@habkost.net>
 <20210114140506.GE292902@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210114140506.GE292902@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 02:05:06PM +0000, Stefan Hajnoczi wrote:
> On Mon, Jan 04, 2021 at 04:02:26PM -0500, Eduardo Habkost wrote:
> > Is anybody already going to merge this?  If not, I can merge it.
> 
> Great, thank you for merging it, Eduardo!

I had just queued the patches, but I will be able to send a pull
request only next Monday.  Sorry for the delay!

-- 
Eduardo


