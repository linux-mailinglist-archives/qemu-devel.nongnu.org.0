Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADE4D2CF4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:17:55 +0100 (CET)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtOE-0006sM-L3
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRtJq-0003Jy-J3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRtJo-0004pG-Kr
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646820799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jM1Cx4F32/JmvjPw3kDudBSS7+DYatONSTNu7NHDwNo=;
 b=Trv+D1FuInOy+n2jDgKaE4ipilJnmyY7l5BbwEqzUN7Mw5C4rmKdNThe8k/Hst6ij2gxTm
 y6yD19E0WGHk83iKgWhyx7hNXVilDT4ez3Trfd4uiwm4EET81iGFPf1cETphAAfH5Jh+M8
 /XdPvXtmOwzoK+3rePYkrDYxRxVQb78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-qQSW1y1BMS6oB8LPwgARtA-1; Wed, 09 Mar 2022 05:13:18 -0500
X-MC-Unique: qQSW1y1BMS6oB8LPwgARtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DA751EA;
 Wed,  9 Mar 2022 10:13:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7631006936;
 Wed,  9 Mar 2022 10:13:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E12318000A6; Wed,  9 Mar 2022 11:13:15 +0100 (CET)
Date: Wed, 9 Mar 2022 11:13:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Message-ID: <20220309101315.yqwxz7vd5haiivcv@sirius.home.kraxel.org>
References: <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
 <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
 <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> If dpy_gfx_switch() implies a full dpy_gfx_update(), then we would need
> another callback to just set the new surface. This would avoid intermediary
> and useless switches to 2d/surface when the scanout is GL.

We can certainly change what dpy_gfx_switch() is supposed to do.

Current behavior dates back to the days where opengl support didn't
exist, so changing things and doing an explit update (when needed)
instead of an implicit automatic update makes sense to me.

When doing that the current ui implementations need a review though,
that's why I think it would be best to do such a change as separate
patch series.

take care,
  Gerd


