Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE962A4650
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 14:28:22 +0100 (CET)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZwMH-0006RZ-7T
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 08:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kZwJJ-0005IQ-NK
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 08:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kZwJD-0006u4-L2
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 08:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604409904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnwoirs5KVa5efe5xwkp31v8MbbMPYnzs1nE4Iw8a3Q=;
 b=MqwX2uDXjTgdxOmJq46bTqsyz/mK5basDBxwzhTt001a9ms8t6vQLey/x4haRFKAO+vnMN
 iCJjFaSue9VHz+nJhd8zYe+fr4C6doTPC/t5DZKPVXhvpdjWU659Hx5LW04J0R/9kI8E2S
 xeDTnhnUbH9k02whRUamjW/Ss3fACo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-2_CTLtvYPECphw4HeUFbkw-1; Tue, 03 Nov 2020 08:25:03 -0500
X-MC-Unique: 2_CTLtvYPECphw4HeUFbkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D21FF80F05A
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 13:24:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E65F57369F;
 Tue,  3 Nov 2020 13:24:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A44EE16E18; Tue,  3 Nov 2020 14:24:23 +0100 (CET)
Date: Tue, 3 Nov 2020 14:24:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 2/3] console: modify ppm_save to take a pixman image ref
Message-ID: <20201103132423.fzntrq5gedyarqun@sirius.home.kraxel.org>
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
 <20201027133602.3038018-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027133602.3038018-3-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 05:36:01PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The function is going to be called from a coroutine, and may yield.
> Let's ensure our image reference doesn't change over time (due to resize
> etc) by keeping a ref.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Added all to UI queue.

thanks,
  Gerd


