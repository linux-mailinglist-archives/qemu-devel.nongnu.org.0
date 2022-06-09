Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3F544D18
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:08:23 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHte-0006BV-3W
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzFUV-00036C-J2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzFUS-00034Q-Li
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654770852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJ5ul6IXcocGX9kbppMRkSAyZ4rtNKi7FFKMHnFiQ+M=;
 b=ZyUmK4RsJbpQ7d++hiRdHFMwPJ6RYEKYQgxzjdRrKqlDC38FpIIrdjysLQ6Zst3RQsEzic
 2WSBRzhMys2bbKvQx5fNcrBJR2HURqN09ffH3JVQ/RGZPkEM6Q2VrVd/McQSkJBnP8DR0t
 0z49UcMVPEFNCWfojf9ObhUkUM5inFI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-IU2sAvcRMb6-nhlYR9Y8cw-1; Thu, 09 Jun 2022 06:34:10 -0400
X-MC-Unique: IU2sAvcRMb6-nhlYR9Y8cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A0C63802B96;
 Thu,  9 Jun 2022 10:34:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59A80C53360;
 Thu,  9 Jun 2022 10:34:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD8F91800094; Thu,  9 Jun 2022 12:34:08 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:34:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220609103408.a5gjaenkzomejxrz@sirius.home.kraxel.org>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
 <20220531202327.14636-3-dongwon.kim@intel.com>
 <YqG/rdSVuEBExaFQ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqG/rdSVuEBExaFQ@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

On Thu, Jun 09, 2022 at 10:38:53AM +0100, Daniel P. Berrangé wrote:
> On Tue, May 31, 2022 at 01:23:27PM -0700, Dongwon Kim wrote:
> > New integer array parameter, 'monitor' is for specifying the target
> > displays where individual QEMU windows are placed upon launching.
> > 
> > The array contains a series of numbers representing the monitor where
> > QEMU windows are placed.
> > 
> > Numbers in the array are mapped to QEMU windows like,
> > 
> > [1st detached window, 2nd detached window,.... Main window]
> > 
> > Usage example: -display gtk,monitor.0=0,monitor.1=1.....
> > 
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  qapi/ui.json    |  7 ++++++-
> >  qemu-options.hx |  2 +-
> >  ui/gtk.c        | 32 +++++++++++++++++++++++++++++++-
> >  3 files changed, 38 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, queued up series.

take care,
  Gerd


