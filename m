Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41305545C27
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 08:20:40 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzY0c-0007Qd-SJ
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 02:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXrn-0004PB-BB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzXrk-0007Sd-FZ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 02:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654841487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O4uSGlMCH5gzQlqxL0VwDuz28PPU7LsB9/WOXFmAEdw=;
 b=LxRcKCkc7oFXG+OP+Matqu0kqVh4SqbKxGqd8HHFVb+/3hFYdClWf1WnJkqzZ+5VGOYILF
 IXglqU5Z07qZIqDbJVKy/H/FqExKkuVJCCPEIWuN/NBWZu6MnC4vQeaL/P7RNRRXmOd/nf
 Pi9IExxdpLfyM+0nbia8YO1FriQZOdY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-jZmGb0HdNx-love75faXAA-1; Fri, 10 Jun 2022 02:11:25 -0400
X-MC-Unique: jZmGb0HdNx-love75faXAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC3832949BBF;
 Fri, 10 Jun 2022 06:11:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0C1492C3B;
 Fri, 10 Jun 2022 06:11:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 543FF18000A3; Fri, 10 Jun 2022 08:11:21 +0200 (CEST)
Date: Fri, 10 Jun 2022 08:11:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220610061121.flb36excjfwzw6ww@sirius.home.kraxel.org>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
 <20220531202327.14636-3-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531202327.14636-3-dongwon.kim@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 31, 2022 at 01:23:27PM -0700, Dongwon Kim wrote:
> New integer array parameter, 'monitor' is for specifying the target
> displays where individual QEMU windows are placed upon launching.
> 
> The array contains a series of numbers representing the monitor where
> QEMU windows are placed.
> 
> Numbers in the array are mapped to QEMU windows like,
> 
> [1st detached window, 2nd detached window,.... Main window]
> 
> Usage example: -display gtk,monitor.0=0,monitor.1=1.....

Depends on patch #1, so dropped both.  Please fix patch #1, rebase &
resend.

thanks,
  Gerd


