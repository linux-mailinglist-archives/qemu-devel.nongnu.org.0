Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD4624269
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6kJ-0007XY-Rc; Thu, 10 Nov 2022 07:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6kD-0007V0-52
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6kB-0008JZ-Qi
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668083599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CbhvrM+ODstORkNRkKD5uI6DcEhZzQVHZqK7CDkAtS8=;
 b=bl6whOwU1y2LpWYuDMyfKoG6jcMfXQaIm+u1r/AWzGTW23rs6atIe3n0+SAs3BGLUoJzX9
 z/jMCkWxlzN9liKV56/NhuiVX8ttJTZlZQq4iCKFnDCeRgWzeTjVRgYJkuGzGithVB1lqd
 rr+Mvsz1eEt1/av5QyW0FNA2nulYeQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-SOOWmmqdOtmceN1XbgdXuw-1; Thu, 10 Nov 2022 07:33:17 -0500
X-MC-Unique: SOOWmmqdOtmceN1XbgdXuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A3A5833A12;
 Thu, 10 Nov 2022 12:33:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF24A1759E;
 Thu, 10 Nov 2022 12:33:16 +0000 (UTC)
Date: Thu, 10 Nov 2022 13:33:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH for-7.2 5/5] iotests/151: Test active requests on mirror
 start
Message-ID: <Y2zvi1XSdX1DLQqG@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
 <20221109165452.67927-6-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109165452.67927-6-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.11.2022 um 17:54 hat Hanna Reitz geschrieben:
> Have write requests happen to the source node right when we start a
> mirror job.  The mirror filter node may encounter MirrorBDSOpaque.job
> being NULL, but this should not cause a segfault.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


