Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F93308D80
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:38:30 +0100 (CET)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZbB-00049J-9U
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l5ZZv-0003hD-9I
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l5ZZs-0002Hb-KN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611949027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=omwprqib/6BZ6S1+ikkMxqykOSJXVdKrJa7JubRIp4Y=;
 b=faOMb+pnvpjSDrPqEQH3ugksebIRKUYI4UIylwUOSycvm2N18rdPLiBKE0TZ//FXDm1XYf
 KzhfXE9UwO+eojfYpzWdANIal6LC7eZrx/FCJEyBrlDTYJTUR/wy62K8qi6mdhqN20l/nH
 zKZbUeQ7XI4I/lpSlgmmEdO2kK/XLnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-D3wSKPwoMeqQBp5N4aUXVQ-1; Fri, 29 Jan 2021 14:37:02 -0500
X-MC-Unique: D3wSKPwoMeqQBp5N4aUXVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADFFA8F174C;
 Fri, 29 Jan 2021 19:36:31 +0000 (UTC)
Received: from localhost (ovpn-118-2.rdu2.redhat.com [10.10.118.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616355D705;
 Fri, 29 Jan 2021 19:36:31 +0000 (UTC)
Date: Fri, 29 Jan 2021 14:36:30 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v14 15/22] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
Message-ID: <20210129193630.GU1227584@habkost.net>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-16-cfontana@suse.de>
 <171c61e2-36f2-86cf-a5e0-15806cccfd0b@linaro.org>
 <c0b59810-98b1-5de2-3077-6521cc68f673@suse.de>
 <33c1da5b-6f35-6540-becc-5d4e8a4703c8@linaro.org>
MIME-Version: 1.0
In-Reply-To: <33c1da5b-6f35-6540-becc-5d4e8a4703c8@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 09:19:00AM -1000, Richard Henderson wrote:
> On 1/28/21 11:00 PM, Claudio Fontana wrote:
> > Do you think I should redo the series anyway? I would have started this way
> > in the first place, but I tried not to redo Eduardo's work.
> I think that would be a good idea, yes.

Maybe just removing the #ifdefs from patch 01 (which were not
present in the patch I wrote) could be a way to avoid redoing the
whole series.

-- 
Eduardo


