Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3E54C823
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 14:08:40 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Rp9-0006BT-Hg
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 08:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Rlm-0004Dj-DW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Rlh-0003lW-A6
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655294704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeHmRCBqSd2OdTxVb7olD9e6BwDF7paJIdiive+fub8=;
 b=PDUM0p8djLBjM50myMNJhPjjyuAKz20RwudKw01zQr1JClwlNNjxF/bRV5eKNSezB9I5fA
 6ID63rE+Qyoi2yoTZhyGZnTMwjWLtitZQScOLD8EPqlFIa5hzqWjkMMek6gRS5WkSwDjBB
 hSk3m1nFyQNEg2mkfxw0oO8LY46yFLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-rOtNwYNoPmKji2XDU454ZA-1; Wed, 15 Jun 2022 08:05:00 -0400
X-MC-Unique: rOtNwYNoPmKji2XDU454ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F8C3801E67;
 Wed, 15 Jun 2022 12:05:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA334010E4D;
 Wed, 15 Jun 2022 12:04:57 +0000 (UTC)
Date: Wed, 15 Jun 2022 13:04:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 4/4] net: convert to use qemu_find_file to locate
 bridge helper
Message-ID: <YqnK5z5l4e9gNqeE@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
 <20220615105212.780256-5-berrange@redhat.com>
 <c614ed56-0c6e-e964-44a5-2b614ec3cd34@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c614ed56-0c6e-e964-44a5-2b614ec3cd34@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Jun 15, 2022 at 01:42:58PM +0200, Paolo Bonzini wrote:
> On 6/15/22 12:52, Daniel P. Berrangé wrote:
> > +    case QEMU_FILE_TYPE_HELPER:
> > +        rel_install_dir = "";
> > +        rel_build_dir = "";
> > +        default_install_dir = default_helper_dir;
> > +        break;
> > +
> 
> You're replacing ad hoc rules in Akihiko's meson.build with an ad hoc enum +
> the corresponding "case"s here in qemu_find_file().  There is duplication
> anyway, in this case between Meson and QEMU (plus QEMU needs to know about
> two filesystem layouts).

IMHO this is simpler to deal with than the meson additions, and also
avoids the confusion of having files appearing in two places in the
build dir.

If we really want to have the build dir look just like the install
dir though, why write custom meson commands per file type at all,
instead add a rule that always invokes

   DESTDIR=$(BUILDDIR)/vroot ninja install

to populate a dir that's guaranteed identical to the install layout

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


