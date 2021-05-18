Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1853879E9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:27:13 +0200 (CEST)
Received: from localhost ([::1]:50282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizke-0006Mf-3p
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lizhH-0002mO-PM
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lizhF-0004LW-S0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621344221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3QjXbmmOsHKSdBBTKRzMS1b6hVqkO4aPN+Hx0ZG2a4=;
 b=P3Uu+gAmEYwGpUz2gGhN3WiF5ArWjbwDFYL6ZXZ8rWgSfhqnAxXhobL8bu9cKiVfJNP0GS
 xDeMz0E5UImct2vU9F7bxGe4EfiFRnhJdSwCzCK+8hrzQKw2OqKI7L9YGpWIrkwHSr5Agv
 D05MrZLG6ljijNCmxHluzhEfCcs1M7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-8cy-DrWUPRS4mkuLHNTlZw-1; Tue, 18 May 2021 09:23:39 -0400
X-MC-Unique: 8cy-DrWUPRS4mkuLHNTlZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5CB100A5EE;
 Tue, 18 May 2021 13:23:38 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DB5E100AE43;
 Tue, 18 May 2021 13:23:37 +0000 (UTC)
Date: Tue, 18 May 2021 15:23:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] block: file-posix queue
Message-ID: <YKO/2COfzVc0pHIQ@merkur.fritz.box>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2021 um 10:38 hat Paolo Bonzini geschrieben:
> Hi Max/Kevin,
> 
> this is a combination of two series that both affect host block device
> support in block/file-posix.c.  I suspect both of them evaded your radar,
> so I'm grouping them together and sending them out again.

Is this based on any other series? The first two patches seem to fail to
apply, on my block branch as well as on master.

Kevin


