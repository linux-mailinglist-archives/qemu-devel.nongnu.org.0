Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30535BF0DA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:10:03 +0200 (CEST)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamNO-0002gG-Ei
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oahXS-0006xM-LF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oahXO-0007kL-Uh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663696800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0/UKHJxQr2+vQCQ9qVj9IcDPi5DauB5sbCwxn6agY8=;
 b=AWrNHnm4FBlCkjLe5gb+XAiU25uF93NQZpyJ/A7DnUvP/Z7XJMvV5Sv2IRhKoVW9plEXK4
 rKWYmNCS8cjCymuJJkDWG6C2tFNX6c64uP+yUrsZdwQsr8x2U/yktwwJC7Jjia1S2rHZFn
 qde+3f9hg2ShubQuy8O0mQI+V67yAd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-QdpSu0bmNIe3RiSwrL9C2A-1; Tue, 20 Sep 2022 13:58:42 -0400
X-MC-Unique: QdpSu0bmNIe3RiSwrL9C2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D05A8027EA;
 Tue, 20 Sep 2022 17:58:42 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.8.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F41449BB60;
 Tue, 20 Sep 2022 17:58:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C4DA12209F9; Tue, 20 Sep 2022 13:58:41 -0400 (EDT)
Date: Tue, 20 Sep 2022 13:58:41 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Yusuke Okada <yokada.996@gmail.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>,
 Yusuke Okada <okada.yusuke@jp.fujitsu.com>, qemu-devel@nongnu.org
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: use g_date_time_get_microsecond
 to get subsecond
Message-ID: <Yyn/UUVAHwV+bMP7@redhat.com>
References: <20220818184618.2205172-1-yokada.996@gmail.com>
 <YwZiyXqPTlSadOOR@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwZiyXqPTlSadOOR@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 01:41:29PM -0400, Stefan Hajnoczi wrote:
> On Thu, Aug 18, 2022 at 02:46:19PM -0400, Yusuke Okada wrote:
> > From: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> > 
> > The "%f" specifier in g_date_time_format() is only available in glib
> > 2.65.2 or later. If combined with older glib, the function returns null
> > and the timestamp displayed as "(null)".
> > 
> > For backward compatibility, g_date_time_get_microsecond should be used
> > to retrieve subsecond.
> > 
> > In this patch the g_date_time_format() leaves subsecond field as "%06d"
> > and let next snprintf to format with g_date_time_get_microsecond.
> > 
> > Signed-off-by: Yusuke Okada <okada.yusuke@jp.fujitsu.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Thanks, applied to my block tree for QEMU 7.2:
> https://gitlab.com/stefanha/qemu/commits/block

Hi Stefan,

Wondering when do you plan to send it for merge. This seems like
a simple fix. Not sure why it does not qualify as a fix for
7.1 instead.

Thanks
Vivek


