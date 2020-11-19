Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C082B90E3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:26:12 +0100 (CET)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfi4p-00014g-Vl
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kfi2M-0008Vr-VN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:23:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kfi2G-0007q3-Uc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605785010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EunV5AXegE4yHupi9kLIb6F4x4gfCiln6TCsRGm44rk=;
 b=e3WPx0YmipFVyXlvVbKfIDkDyU3B3H1KZXaysxvLFhdEcmg6rWDtgEOpfBVAde9aCoQLl0
 7F/cpMeU0lJsD/Q4NZ4hobpLf/S0K7jUyFBpFSTPZeJI4ZEWIIcQ80vvrq2IWJM5AJDVlA
 cm1YNE9gd9f5Fjs41pWpkWJjVMYN9gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140--O2o9gJCOPyH1YS5LQO0xw-1; Thu, 19 Nov 2020 06:23:28 -0500
X-MC-Unique: -O2o9gJCOPyH1YS5LQO0xw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD4CE75C
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:23:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B7B260C0F;
 Thu, 19 Nov 2020 11:23:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B222A1E2; Thu, 19 Nov 2020 12:23:23 +0100 (CET)
Date: Thu, 19 Nov 2020 12:23:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201119110316.GG701869@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > diff --git a/trace/meson.build b/trace/meson.build
> > index 66395d3e2ba7..3f0fe7b7b74c 100644
> > --- a/trace/meson.build
> > +++ b/trace/meson.build
> > @@ -18,6 +18,7 @@ foreach c : trace_events_config
> >    trace_events_files += [ trace_events_file ]
> >    group = '--group=' + c.get('group')
> >    fmt = '@0@-' + c.get('group') + '.@1@'
> > +  module_ss = c.get('ss', trace_ss)
> 
> One idea: module_ss is already used in other files. Are you sure there
> isn't an identifier naming conflict?

Nope.  Tried s/module_ss/kraxel_ss/, still not working.

I get tons of "undefined reference to `_TRACE_something'"
errors (*not* qxl).  Seems trace_ss is not updated as intended.

take care,
  Gerd


