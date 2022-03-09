Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BD4D2BDF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:28:53 +0100 (CET)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRscm-0007bl-9R
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRsaK-0006NN-KF
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:26:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRsaG-0005uf-Sy
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 04:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646817975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2e0fdUh4cHQylnG6+Vc7fErZNg3k5mhcbszPx5pDpk=;
 b=JAX6fT6uTjp2+w+TJO850eiI8rVLB9us8Ex89NQoSBPyNCHMpURzmbq/RKzxQJnOkLoe5f
 ZUXMo+4e/3wg1eh7LXkHp1aPrQvValDZPlbwLJdL2Acd1F+y4zFsHUKyxRAbcSQWa0sP/K
 xxAWnOGH5lH122hjT48Q+4nORwOhhbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-Z4HRfK3lMB6Iz0jqdOS8Rw-1; Wed, 09 Mar 2022 04:26:12 -0500
X-MC-Unique: Z4HRfK3lMB6Iz0jqdOS8Rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A63F1854E21;
 Wed,  9 Mar 2022 09:26:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B986C72198;
 Wed,  9 Mar 2022 09:26:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 890A91800098; Wed,  9 Mar 2022 10:26:05 +0100 (CET)
Date: Wed, 9 Mar 2022 10:26:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Message-ID: <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,
 
> dpy_gfx_switch and dpy_gfx_update need to be called to finish the
> initialization or switching of the non-OpenGL display. However, the proposed
> patch only calls dpy_gfx_switch.
> 
> vnc actually does not need dpy_gfx_update because the vnc implementation of
> dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the model of
> ui/console expects the two of dpy_gfx_switch and dpy_gfx_update is separated
> and only calling dpy_gfx_switch violates the model. dpy_gfx_update used to
> be called even in such a case before and it is a regression.

Well, no, the ->dpy_gfx_switch() callback is supposed to do everything
needed to bring the new surface to the screen.  vnc isn't alone here,
gtk for example does the same (see gd_switch()).

Yes, typically this is roughly the same an explicit dpy_gfx_update call
would do.  So this could be changed if it helps making the opengl code
paths less confusing, but that should be a separate patch series and
separate discussion.

take care,
  Gerd


