Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF1351FBC4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:55:49 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1zQ-0004ax-P5
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no1xE-00036I-Mp
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1no1xA-0000Oc-SJ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652097207;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZGqqEEumDVJPiXiRbm/0HAhKlQ1xZvGh04BRtTzNxI=;
 b=DbFrpNA6BGI1uCmaZWFyVK+brGTHooMPHlrMQ7eJ8jaDw1z0kIyQa5mlUA+fI1LyTC0Gzd
 ZDw1yUhlcXVP4LEdXPuiMUu4w5sdDP5lI0CGsjI2wjQ/DfyfJ4xQhGu2xURv+yC5oPtgmK
 XZh12Zitje+qiXnOXdYaTqBuxzntITc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-wVvNRljQN8y5ReUCtBy05Q-1; Mon, 09 May 2022 07:53:26 -0400
X-MC-Unique: wVvNRljQN8y5ReUCtBy05Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AFC0800B21
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 11:53:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B26C27AE3;
 Mon,  9 May 2022 11:53:25 +0000 (UTC)
Date: Mon, 9 May 2022 12:53:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/26] block: fix coroutine_fn annotations
Message-ID: <YnkAsxsrvan0yCWY@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 09, 2022 at 12:29:53PM +0200, Paolo Bonzini wrote:
> This is the initial result of reviving Marc-André's series at
> https://patchew.org/QEMU/20170704220346.29244-1-marcandre.lureau@redhat.com/.
> A lot of the patches are similar to the ones that Marc-André wrote,
> but due to the changes in the code it was easier to redo them.
> 
> For nbd, the patch is on top of "nbd: mark more coroutine_fns" that
> I sent a few days ago and that (AIUI) Eric has already queued; only
> one function was missing, much to my surprise.
> 
> Apart from this, I also identified the following functions that
> can be called both in coroutine context and outside:

snip

> - qio_channel_readv_full_all_eof
> - qio_channel_writev_full_all

I'm trying to understand what criteria makes those two functions
liable for the annotation, but not others in the I/O code ?

What is the actual rule for when to apply 'coroutine_fn' annotation
to a function, and does it apply transitively to up and/or down the
call stack ? 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


