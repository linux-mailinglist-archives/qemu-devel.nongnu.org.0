Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0245E677D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:47:00 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOPk-00077u-0g
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNsB-0008KR-Te
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNsA-0007aZ-F6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663859537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MVJkGVtmd0BxIhNRUcsYjeVc2MouJmgy7qUeKZ203U=;
 b=INXXlp/Ixl7GtFFzC33aYMpfPdcB0bufGni82MzMEk/P33V4GuaPR3WJcLSxSvzegIC77K
 yLAR0pDhkOC3D+WugAniDA7WtB5NeWr7WWvDneE+0Kx55T3MrBHN3pvbRU/B5QWZkdZnxZ
 DTnAeaqGAjRNzngnzshGay/jEThpEwc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-v0ZgiCnIOvSBlEWo_gd2NQ-1; Thu, 22 Sep 2022 11:12:15 -0400
X-MC-Unique: v0ZgiCnIOvSBlEWo_gd2NQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4A8881B709;
 Thu, 22 Sep 2022 15:12:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6071640C2066;
 Thu, 22 Sep 2022 15:12:12 +0000 (UTC)
Date: Thu, 22 Sep 2022 17:12:11 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: songlinfeng <slf553@126.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] try to find out which cluster allocated in qcow2
Message-ID: <Yyx7S2DzzDrmY0ky@redhat.com>
References: <1663747050-122900-1-git-send-email-slf553@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663747050-122900-1-git-send-email-slf553@126.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 21.09.2022 um 09:57 hat songlinfeng geschrieben:
> In our project,we want to full backup a disk only allocated area,but
> qmp block-dity-block-add can create a bitmap with all zero,so we can't
> find out which cluster is allocated.in qcow2,I think l2_table can help
> me find out which cluster should be backup.
> 
> Signed-off-by: songlinfeng <slf553@126.com>

You're just adding a new function without any callers. This would be
dead code. We don't generally commit dead code except as part of a
series where a later patch makes use of it.

Either way, since you just seem to print allocation status to stdout,
maybe 'qemu-img map' is actually the right tool for what you are
trying to do?

Kevin


