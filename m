Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F356BA33
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 14:59:20 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9nZm-0003kg-W8
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 08:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9nTl-00076u-W0
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9nTk-0002AG-67
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657284783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Zt/ZjAWZaCzy66f46RSiVYww6amglB9md7om9AsRxM=;
 b=XjRnSvLhh0HRR60Xn8ORdZeA06AOJNVkTGEnFm9VzFU7N1VeVRTFgipq0xANS31FLvi7Ck
 IMGseH857E2W0twl3bF1uQTzMbNnmgWjdj0pGHOp4fuT5SvfaZ1s6q3KNpi7j/hhtnLnBB
 +mbTz5roZlOL7NF/pX2sVCxaq6lGqS8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-UeJm70FkPj6v8Cp04GCn_w-1; Fri, 08 Jul 2022 08:52:59 -0400
X-MC-Unique: UeJm70FkPj6v8Cp04GCn_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C328E3C0CD2D;
 Fri,  8 Jul 2022 12:52:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1A58A4D1;
 Fri,  8 Jul 2022 12:52:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69F3921E690D; Fri,  8 Jul 2022 14:52:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Liuxiangdong <liuxiangdong5@huawei.com>,  Cindy Lu
 <lulu@redhat.com>,  Zhu Lingshan <lingshan.zhu@intel.com>,  "Gonglei
 (Arei)" <arei.gonglei@huawei.com>,  Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>,  Stefano Garzarella
 <sgarzare@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Harpreet
 Singh Anand <hanand@xilinx.com>,  Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Eli Cohen <eli@mellanox.com>,
 Parav Pandit <parav@mellanox.com>,  Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 22/22] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220708105013.1899854-1-eperezma@redhat.com>
 <20220708105013.1899854-23-eperezma@redhat.com>
Date: Fri, 08 Jul 2022 14:52:57 +0200
In-Reply-To: <20220708105013.1899854-23-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?= message of "Fri, 8 Jul 2022 12:50:13 +0200")
Message-ID: <87h73r7oly.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Please carry forward Acked-by and Reviewed-by you received for prior
revisions unless you change something that invalidates them.  This
ensures reviewers get credit, and also saves them time: if the tag is
still there, nothing much changed, and no need to look at it again.


