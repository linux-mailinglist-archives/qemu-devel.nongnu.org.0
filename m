Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031E3C2A88
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:52:47 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xUM-0004jF-7X
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1xRO-0002VY-7o
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1xRL-0000i2-T3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625863779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DfG1p0DvQ7+P9b+B0hBjEuDPp3XqVXnooT69PKv2qtA=;
 b=e715jRCdjqUJoYzy1MCKkGEcUK5Che3uChj1/yptjDMu9q3hGdPslZ9KCUlZ9rd6K2jEi3
 VXQRtYDI/UGBqsYYxlft3RGR2t7i+nMuGVE1QA8EIU7YwnrWC34yB/IG3ZYp9t+qdtP1n+
 lZh+ez9W2Pd9hKBj6AliKsp03Dlhp3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-BI-73PI3O_q1HHo2CtKifw-1; Fri, 09 Jul 2021 16:49:34 -0400
X-MC-Unique: BI-73PI3O_q1HHo2CtKifw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B2E01084F56;
 Fri,  9 Jul 2021 20:49:33 +0000 (UTC)
Received: from localhost (unknown [10.22.9.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245B3604CD;
 Fri,  9 Jul 2021 20:49:33 +0000 (UTC)
Date: Fri, 9 Jul 2021 16:49:32 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH 0/2] numa: Parse initiator= attribute before cpus=
 attribute
Message-ID: <20210709204932.g4tetjtrp7m7rvjz@habkost.net>
References: <cover.1625662776.git.mprivozn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1625662776.git.mprivozn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 03:40:28PM +0200, Michal Privoznik wrote:
> See 2/2 for explanation. The first patch is just cosmetics.
> 
> Michal Privoznik (2):
>   numa: Report expected initiator
>   numa: Parse initiator= attribute before cpus= attribute

Queued, thanks!

-- 
Eduardo


