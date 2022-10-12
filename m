Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950B5FC576
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:37:58 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiazl-0006D2-4d
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiavn-0002uO-Aj
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiavk-0001aS-1k
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665578027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C+6220+ZOxacK4FkeyA+eOSU50wIB8IGurj8+jDqqsY=;
 b=BO4BbD/BDM+ECmXpC4Uo65m+TWS8OPgltHK0KIYoEc4DWkyWPmtT/OezN5IxvUnOopaaJK
 Eg5YOIC4dVPepVg57LJiKp9coFU9pDllRUjqZ+LBLVOwjVYvK+P2uR6iK1xlgYGmpzscrr
 WxghK7clHHwLiduoj3AnESoJB3AoCHM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-rC1GW7mfOKSAWtcuN6tm_g-1; Wed, 12 Oct 2022 08:33:46 -0400
X-MC-Unique: rC1GW7mfOKSAWtcuN6tm_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13981C08969;
 Wed, 12 Oct 2022 12:33:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D33E1111C60;
 Wed, 12 Oct 2022 12:33:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4EBC418003A8; Wed, 12 Oct 2022 14:33:44 +0200 (CEST)
Date: Wed, 12 Oct 2022 14:33:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sebastian Mitterle <smitterl@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] qemu-edid: Restrict input parameter -d to avoid division
 by zero
Message-ID: <20221012123344.e7splbwfnux2llse@sirius.home.kraxel.org>
References: <20221011151216.64897-1-smitterl@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011151216.64897-1-smitterl@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Oct 11, 2022 at 05:12:16PM +0200, Sebastian Mitterle wrote:
> A zero value for dpi will lead to a division by zero in qemu_edid_dpi_to_mm().
> Tested by runnig qemu-edid -dX, X = 0, 100.
> 
> Resolves: qemu-project/qemu#1249
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>

Added to queue.

thanks,
  Gerd


