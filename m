Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5636F843
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:04:05 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQ0C-00037p-3N
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPyk-0002X2-Ih
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcPyi-0007I6-SI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619776952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXtVbHYLkG4jXjrsYtAEwwvVePiF7C/g4Y0jnUWvHbo=;
 b=Vifqlv1zv9a2J/cVt+lclYBCMdxFa2TrjvuZHmoFdIwomPAEZyyCGszT+6N8K/vm8QfjW0
 kd3ESGBtEQetySPf0tMrbiPuVRRhmzUNGXC4NTmnE0rZzkCoLVQ0sEU/M/JzeMRoNCk40i
 T2v+zWzvBux+pQreRLKKXyYFF+Ew4gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-9yYgX5hpM06k_RoCF246Fg-1; Fri, 30 Apr 2021 06:02:30 -0400
X-MC-Unique: 9yYgX5hpM06k_RoCF246Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A598107ACCD;
 Fri, 30 Apr 2021 10:02:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 543CF5D9C6;
 Fri, 30 Apr 2021 10:02:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A69451800380; Fri, 30 Apr 2021 12:02:23 +0200 (CEST)
Date: Fri, 30 Apr 2021 12:02:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 12/27] virtio-snd: Add control virtqueue handler
Message-ID: <20210430100223.un4lrgjawd7cqokh@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-13-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-13-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +        } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
> +            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");

For that kind of tracing / debug logging it is useful to have
enum -> string mapping helper function(s).

take care,
  Gerd


