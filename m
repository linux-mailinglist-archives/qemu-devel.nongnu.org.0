Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B634AA51
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:42:18 +0100 (CET)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnfG-0008H7-0y
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPndt-0007pf-Ov
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPndl-0002H5-Gj
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616769643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maqZTfnA2to2mhv3QYAz6+03QWrWNdQX4F0GDz1dies=;
 b=ZJKUxXEDHXla+pWZFa3JY+vp88X7jo30uWuJvAV1vRzC6cJ8rtsdi/jhyfzb2F1M8OEglk
 h0WW9y8ZzTFQlipc5e52hr6cUNrVJtqHruzFD+lvwTk0XWA8funnOcHYz4hupuytgBmtvJ
 z0YR/kKdLNJRHdo/7sK1+5mAztlz9hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-dH0fy89aNmqgim5dLM5zgg-1; Fri, 26 Mar 2021 10:40:40 -0400
X-MC-Unique: dH0fy89aNmqgim5dLM5zgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0014380791A;
 Fri, 26 Mar 2021 14:40:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8092B10013D6;
 Fri, 26 Mar 2021 14:40:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED43411327E1; Fri, 26 Mar 2021 15:40:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <li.zhang@ionos.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
Date: Fri, 26 Mar 2021 15:40:00 +0100
In-Reply-To: <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
 (Li Zhang's message of "Tue, 23 Mar 2021 14:14:52 +0100")
Message-ID: <874kgykmgv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 QEMU <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <li.zhang@ionos.com> writes:

> Hi,
>
> Any comments about this patch?

I wanted to review this before my Easter break, but I'm out of time :(

When I'm back (April 6), I'll check whether it still needs review, but I
do hope somebody else can look at it sooner.


