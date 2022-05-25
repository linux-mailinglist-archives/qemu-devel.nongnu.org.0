Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D314533704
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:05:36 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntl5H-000235-27
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntkZz-0000K6-UC
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ntkZu-0003ro-5v
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653460382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fXW4dqLHyGJ0Pp7orgwEEW/fdF6EXMY+e75gQh0gr/0=;
 b=Zkx6kEeT53RdqhuaNChr5dD5MHjk2hHZuiEsoKCLqX49wW87zI32zXrdxMqymaTrfiMm8H
 YneLW+IlRvKYJyo/kHHSWPnwWMw1Gh2YipcDYh0EceVfiWoQFmSHOHCkYNo//dUs5mnNvG
 csueA5AlZAWXom8ha4k+i9zwCctAGLg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-eH2F4e4xOki08goealdRLA-1; Wed, 25 May 2022 02:32:59 -0400
X-MC-Unique: eH2F4e4xOki08goealdRLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18FC43802128;
 Wed, 25 May 2022 06:32:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0C1F2166B29;
 Wed, 25 May 2022 06:32:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 53C5F18000B4; Wed, 25 May 2022 08:32:57 +0200 (CEST)
Date: Wed, 25 May 2022 08:32:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/2] modules: Improve modinfo.c support
Message-ID: <20220525063257.zs6cqwgtaj7r52bp@sirius.home.kraxel.org>
References: <20210928204628.20001-1-jziviani@suse.de>
 <20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org>
 <077c28cfd3a7d10df6a08d26bcb721aa2d46bec1.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <077c28cfd3a7d10df6a08d26bcb721aa2d46bec1.camel@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 01:49:41PM +0200, Dario Faggioli wrote:
> Hello! Sorry for bringing up an old thread, but I'd have a question
> about this series.
> 
> As far as I can see, the patches were fine, and they were Acked, but
> then the series was never committed... Is this correct?
> 
> If yes, can it be committed (I'm up for rebasing and resending, if it's
> necessary)? If not, would it be possible to know what's missing, so
> that we can continue working on it?

rebase, run through ci, resend is probably the best way forward.
Don't remember any problems, not sure why it wasn't picked up,
maybe paolo (who does the meson + buildsystem stuff) was just busy
so it fell through the cracks,

take care,
  Gerd


