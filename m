Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9972B9016
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:29:16 +0100 (CET)
Received: from localhost ([::1]:56348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhBj-0006x2-Gy
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kfh8f-0004YR-Td
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kfh8e-0005Ce-CT
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeO5alN59o0VjDcnMWa9pdfa3PxZsQzDYQIhfqR0MK8=;
 b=iKV/LSwHpPaccGfsA+uoyuCrgfxCkr21AhtLNaX7DDPObdNoRtmxRwoSa0zwwc7mSaWGpB
 lC1qxM4J6DIkG8mAq/B0TF2eG/rEDe6KBaA462cChAdCH6U3LLv1873YUaJj7TuTskFTOF
 GyECpCFUDGDapDrESLNh1wN8fcFw1mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-GTSUeHbMPJK_r7UO8rgh1A-1; Thu, 19 Nov 2020 05:26:01 -0500
X-MC-Unique: GTSUeHbMPJK_r7UO8rgh1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A5A100C667
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:26:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAF3B60843;
 Thu, 19 Nov 2020 10:25:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8C7EA1E2; Thu, 19 Nov 2020 11:25:56 +0100 (CET)
Date: Thu, 19 Nov 2020 11:25:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/4] meson: move qxl trace events to separate file
Message-ID: <20201119102556.gdsqtrcrjuheopcn@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-4-kraxel@redhat.com>
 <20201119100640.GF701869@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201119100640.GF701869@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 10:06:40AM +0000, Stefan Hajnoczi wrote:
> On Thu, Nov 19, 2020 at 09:44:47AM +0100, Gerd Hoffmann wrote:
> > Move qxl trace events to separate trace-events-qxl file.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Can we put modules into their own subdirs so that the existing meson and
> tracing infrastructure (e.g. scripts/cleanup-trace-events.pl) can handle
> them without modifications?

Would probably work too.

But before bikeshedding on those details we need a workable overall
approach.  I have no idea why 4/4 is not working.  Possibly the approach
I'm trying to take is completely wrong ...

take care,
  Gerd


