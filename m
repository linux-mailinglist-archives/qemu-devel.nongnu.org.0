Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B59664554
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:52:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEZp-0007Wz-4H; Tue, 10 Jan 2023 08:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEZ3-0007Gh-1E
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:21:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFEZ0-0002SQ-33
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673356870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6jJCyaRkEvv/DU8BDVKsHWRcxVkQN5O8Ji1gW19ygBY=;
 b=OS5HrRcFqBut9b3eK2hzgwut0gL57ZdhLIskXKQ8+53/MYND8elIz34TL1y8ThV23ppyy6
 H702kB4YiyOQBrIUgWFch1At3iz9ww3GtlrMN/lo7hMMZBOqcgVZpYGhIRz4BArS9Fm64V
 67z0hmN8Dw/msXoqc8HxS/G5eyS8tVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-fqatW1NXPzuMn5m45dWC3Q-1; Tue, 10 Jan 2023 08:21:06 -0500
X-MC-Unique: fqatW1NXPzuMn5m45dWC3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AA60811E9C;
 Tue, 10 Jan 2023 13:21:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10B2AC16031;
 Tue, 10 Jan 2023 13:21:03 +0000 (UTC)
Date: Tue, 10 Jan 2023 14:21:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, hreitz@redhat.com,
 qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown
 QEMU
Message-ID: <Y71mPi0TL1y0R9jc@redhat.com>
References: <20221207131452.8455-1-borntraeger@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207131452.8455-1-borntraeger@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 07.12.2022 um 14:14 hat Christian Borntraeger geschrieben:
> Without a kernel or boot disk a QEMU on s390 will exit (usually with a
> disabled wait state). This breaks the stream-under-throttle test case.
> Do not exit qemu if on s390.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>

Thanks, applied to the block branch.

Kevin


