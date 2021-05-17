Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4C382536
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:20:00 +0200 (CEST)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXXj-0001XH-8F
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liXWx-0000q2-1E
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liXWu-0005Su-DN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621235946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sIx0wW/SbNJmx9YLhxTH2y+/J2C/FACuDHtXsPyLqI=;
 b=euJ03dAWpYk5y3fgs4w8rzEoWWdb27IG4DG0xfyXQXWrAZaNG7kNw6AUSaPR/Kk0HlAfdI
 ZNhLTBBhdjA3tdKfA8kexJC+4WtoLtfQIwTNeW7/5XIiBMLVYJZhBQ04GuJCEJ3J8Ptkky
 GB7Wluw+WcEzl2U9uNcLWSrwo5e5Yd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-sUR6MiU7P2y0mjBPcLAITQ-1; Mon, 17 May 2021 03:19:04 -0400
X-MC-Unique: sUR6MiU7P2y0mjBPcLAITQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E738015F8;
 Mon, 17 May 2021 07:19:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411AC5D762;
 Mon, 17 May 2021 07:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A6281800869; Mon, 17 May 2021 09:19:00 +0200 (CEST)
Date: Mon, 17 May 2021 09:19:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bibo Mao <maobibo@loongson.cn>
Subject: Re: [PATCH] hw/display/qxl: Set pci rom address aligned with page size
Message-ID: <20210517071900.q3kff56ixqgxj5lo@sirius.home.kraxel.org>
References: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <1621065983-18305-1-git-send-email-maobibo@loongson.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Sat, May 15, 2021 at 04:06:23PM +0800, Bibo Mao wrote:
> From: maobibo <maobibo@loongson.cn>
> 
> pci memory bar size should be aligned with page size, else it will
> not be effective memslot when running in kvm mode.
> 
> This patch set qxl pci rom size aligned with page size of host
> machine.

What is the exact problem you are trying to fix here?

take care,
  Gerd


