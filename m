Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8757C9DB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:43:22 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUaP-0007fa-Ex
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEUYQ-0006Dr-PG
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEUYN-0004b0-LA
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658403673;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tkPwjkjbkYQWOb7aq6HswIiasgQd/9j7am1ZMCHQk4=;
 b=hLyFT+4Cm4pxtocHjO3XfxjCokn1myJ+VkaScYAwCsW8qWiQIRIaCcLCkcH2JUy922UwqQ
 Q93jxvE8UsfySyPePHBzsF3cxBAa7QnhFCiPgZ1xnaWdaE0SJOB5RaIq+SzKrozLgS9tgT
 EYY2e5CQBcuKU8ZlBgVu3ckTHJecAIU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-TKTlIK52NWGScz6g8NXAdw-1; Thu, 21 Jul 2022 07:41:02 -0400
X-MC-Unique: TKTlIK52NWGScz6g8NXAdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F0281C1BD2D;
 Thu, 21 Jul 2022 11:41:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 294B7492C3B;
 Thu, 21 Jul 2022 11:41:00 +0000 (UTC)
Date: Thu, 21 Jul 2022 12:40:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hogan Wang <hogan.wang@huawei.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, wangxinxin.wang@huawei.com
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
Message-ID: <Ytk7Sg2s5J0AgsxA@redhat.com>
References: <20220721062118.2015-1-hogan.wang@huawei.com>
 <YtkKwf7K6oev/3CP@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtkKwf7K6oev/3CP@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 21, 2022 at 09:13:53AM +0100, Daniel P. Berrangé wrote:
> On Thu, Jul 21, 2022 at 02:21:18PM +0800, Hogan Wang via wrote:
> > There's no way to cancel the current executing dump process, lead to the
> > virtual machine manager daemon((e.g. libvirtd) cannot restore the dump
> > job after daemon restart.
> > 
> > Add the 'cancelling' and 'cancelled' dump states.
> > 
> > Use 'dump-cancel' qmp command Set the dump state as 'cancelling'.
> > The dump process check the 'cancelling' state and break loops. 
> > The 'cancelled' state mark the dump process cancelled success.
> 
> On the one hand this patch is fairly simple which is obviously
> desirable.
> 
> On the other hand though, this feels like it is further re-inventing
> the jobs concept.
> 
> IMHO ideally the 'dump' command probably ought to get a 'job-id'

I meant to say an *optional* job-id field, since we need to keep
back compat. Possibly we could secretly create a job anyway
internally if job-id is omitted, if it makes code easier.

> parameter, and integrate with the generic background jobs  framework.
> This would unlock the ability to use existing commands like
> 'job-cancel', 'job-pause', 'job-resume', 'queyr-jobs' to interact
> with it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


