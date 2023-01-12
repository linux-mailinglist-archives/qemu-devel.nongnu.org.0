Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE769667135
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFw3G-0007Me-9A; Thu, 12 Jan 2023 06:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFw3E-0007MH-R6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:47:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFw3D-0008RS-HB
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nbZuOUZA1MpVypC8WS+XsPUquWy7tmpa1Tr7PrVo+c=;
 b=JYn+TTybgJHL9bQ0rV/0n1RA840En2KCG69lTk4SYmgU8hZuEnJRYPt3Uf5wXsf0214IJs
 gRIy2HTavmi1TblZnTu6MOA+Xo9XL5HPH4LwZ0jYf/Gtr6QDhHIOmBHy0bwtqv3KdRx8X4
 7IOw7xX4bCVS2knQh2QDfvBzx+mj+Bc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-JFCv3V_jOryhAMwK9aBf2w-1; Thu, 12 Jan 2023 06:47:15 -0500
X-MC-Unique: JFCv3V_jOryhAMwK9aBf2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51C8185A588;
 Thu, 12 Jan 2023 11:47:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79AE34085720;
 Thu, 12 Jan 2023 11:47:14 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:47:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Questions about how block devices use snapshots
Message-ID: <Y7/zQYejj+PiT9GC@redhat.com>
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
 <Y77IajRLJOC6ohih@redhat.com>
 <26114701-2d32-136d-ca44-01048c61842d@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26114701-2d32-136d-ca44-01048c61842d@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 11.01.2023 um 17:21 hat Zhiyong Ye geschrieben:
> Hi Kevin,
> 
> Can I ask again how base.img + diff.qcow2 can be re-merged into one image
> via qemu-img or hmp command when modified.img is discarded?

You can either use 'qemu-img commit' to copy all of the data from
diff.qcow2 back into base.img (this is probably what you want), or
'qemu-img rebase' to copy all of the data from base.img into diff.qcow2.

Kevin


