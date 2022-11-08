Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6835620F59
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:43:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osN0I-0003qf-AB; Tue, 08 Nov 2022 06:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osN0D-0003qH-L4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1osN0C-0004kz-8b
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667907767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8oNULGh/IZxvN7vxriQBpsPNHIeWTi1RCGBdN91F+OI=;
 b=VzJYIWfYMvlG9gMjslxq6Nc4lJOlXPbPLKYlJkYo0DcvH+uCF0kIHpTMOEeE8rnws2rcM5
 zBaRaa+RuvH3ZyD7YT9IklNG7yR+yuUJ52emM0yXR2wTBfyulfRQGZbkcm2f4NzWKZs6Fh
 s4lsWkL4tLOz1TuV1qmwFiMJdEWlUZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-jEhN-lVmNKm9L_c7znTIYg-1; Tue, 08 Nov 2022 06:42:43 -0500
X-MC-Unique: jEhN-lVmNKm9L_c7znTIYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F97880600C;
 Tue,  8 Nov 2022 11:42:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54251121314;
 Tue,  8 Nov 2022 11:42:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C4DE180039D; Tue,  8 Nov 2022 12:42:40 +0100 (CET)
Date: Tue, 8 Nov 2022 12:42:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: GTK clipboard implementation causing regression, falling through
 the cracks?
Message-ID: <20221108114240.5qa35yqib6y5lelg@sirius.home.kraxel.org>
References: <8fb722cc-ff51-8d51-803b-996072afabe4@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fb722cc-ff51-8d51-803b-996072afabe4@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 12:49:19PM +0200, Claudio Fontana wrote:
> Hi all,
> 
> the GTK clipboard implementation seems to be causing some stability issues (guest CPUs stuck),
> 
> Gerd can you take a look?

Sorry, no.  Just back online from sick leave, no bandwidth for that
right now.

Easy way out is adding a config option for clipboard support.  The real
solution is probably to rewrite the clipboard support to avoid calling
the blocking clipboard functions as they apparently (from looking at
reports & stack traces) can block forever at times.

take care,
  Gerd


