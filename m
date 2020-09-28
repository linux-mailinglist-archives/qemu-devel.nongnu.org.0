Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66427AF0E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 15:29:07 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMtDG-0001ul-7q
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 09:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMt0o-0003cl-G3
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 09:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMt0m-0002Mc-V5
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 09:16:14 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601298971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d43fWDR8b1Cl+ncfjSQt6zla0jEieutuU3KRAkLgvoc=;
 b=T7AZHGPwEqCYRhagpCEMSrbvFdtuv3x1ey55DEQYnNcxqLkEOwrV1D8q2NY+gHbrJpGM1w
 dKuv3h+xzeWbf8CIqASeCYfT23lzlkbrQfwBfqrtF/jtKLsL8rfRCaEC9lctnGjhBlS9/T
 hUKFIMp9wBEUX2Wiks5iqDXVRUDNl74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-J8nIASO8PfK1CT48nbsXCQ-1; Mon, 28 Sep 2020 09:16:09 -0400
X-MC-Unique: J8nIASO8PfK1CT48nbsXCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089F7188C153;
 Mon, 28 Sep 2020 13:15:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEAF273666;
 Mon, 28 Sep 2020 13:15:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB9BC40827; Mon, 28 Sep 2020 15:15:39 +0200 (CEST)
Date: Mon, 28 Sep 2020 15:15:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Amey Narkhede <ameynarkhede03@gmail.com>
Subject: Re: [PATCH] hw/usb: Use lock guard macros
Message-ID: <20200928131539.grogkdnwunlltiwu@sirius.home.kraxel.org>
References: <20200923134327.576139-1-ameynarkhede03@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200923134327.576139-1-ameynarkhede03@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Sep 23, 2020 at 07:13:27PM +0530, Amey Narkhede wrote:
> Use qemu LOCK_GUARD macros from "qemu/lockable.h" in
> hw/usb/ccid-card-emulated.c, saves manual unlock calls.
> 
> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>

Added to usb queue.

thanks,
  Gerd


