Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2DD56311C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:14:25 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DfM-0007G6-2L
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7DcC-0003lu-Dd
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7Dc6-000491-Hr
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656670261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8nuhRuhy8I2mvYz2umnD0HqsB7m9uaBVDsb4KTJVJA=;
 b=PxAtnVvHiKaYwUnTpZhP8vKad6knoajfvkK3H7LgNpLENeGg1cMPQ1f1/gCI4N7vGfO3Ho
 HfcmKA57LPriT0ZkIhdln+xTf/0/XaDMZOyK6OLH8EDQZwI00aZ8iX0JSkYy7N1YWvdUtY
 lhZaUaiM3Tz+UWFMBBP4OI4cyvvy134=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-suhm-cavNkK47QCgZ8ZIvA-1; Fri, 01 Jul 2022 06:10:57 -0400
X-MC-Unique: suhm-cavNkK47QCgZ8ZIvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67256802D1C;
 Fri,  1 Jul 2022 10:10:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3420C10725;
 Fri,  1 Jul 2022 10:10:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89E21180091D; Fri,  1 Jul 2022 12:10:55 +0200 (CEST)
Date: Fri, 1 Jul 2022 12:10:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3] ui/cocoa: Take refresh rate into account
Message-ID: <20220701101055.ru3j4b2r5nuvwfgx@sirius.home.kraxel.org>
References: <20220620202921.21062-1-akihiko.odaki@gmail.com>
 <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Tue, Jun 21, 2022 at 09:51:38AM +0100, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 21:29, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Retreieve the refresh rate of the display and reflect it with
> > dpy_set_ui_info() and update_displaychangelistener(), allowing the
> > guest and DisplayChangeListener to consume the information.
> 
> But why? What goes wrong if we don't bother to do this?

Nothing goes wrong.  This provides a hint to the guest how often the
display is updated, so the guest has the chance to adapt to that.
When we run 30 Hz display updates on the host side it is pointless for
the guest to update the screen at 60Hz frequency, the guest can spare
some cpu cycles instead.

[ this should be better explained in the commit message ]

take care,
  Gerd


