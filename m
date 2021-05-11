Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B5379F43
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:42:12 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgL9n-0002dN-Ju
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgL6l-0001fJ-1m
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgL6e-0002qo-Er
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:39:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620711534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTlO3RIIkuaCAwnsOgT1BfSOTjehApxlBJP4gZMmE+Y=;
 b=Hixd/IasAq8qiYpGuYLQonwmms9oZMptMwjJPcHBYmiJl8xVJbzQP7Zg9fB1BpeB+8vds2
 +AT3q+Qp39co1t6yEGQeNU3gb7CxXA4rbIpICkYW155dnoMFUofOro/+YWdsXuG5r+iAr9
 0KE181cldEM3wKPMb4ZERbgDKraSpqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-hcScbUs4Ob29Ux9Kx6yHnA-1; Tue, 11 May 2021 01:38:51 -0400
X-MC-Unique: hcScbUs4Ob29Ux9Kx6yHnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10E151854E21;
 Tue, 11 May 2021 05:38:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0B471037F26;
 Tue, 11 May 2021 05:38:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46A70113865F; Tue, 11 May 2021 07:38:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
References: <20210412170255.231406-1-sgarzare@redhat.com>
 <20210510155738.a4jk42yb2vqubblj@steredhat>
Date: Tue, 11 May 2021 07:38:48 +0200
In-Reply-To: <20210510155738.a4jk42yb2vqubblj@steredhat> (Stefano Garzarella's
 message of "Mon, 10 May 2021 17:57:38 +0200")
Message-ID: <878s4lbziv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mat?= =?utf-8?Q?hieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> Ping :-)
>
> Should I resend for 6.1?

I'm cc'ing qemu-trivial.

For good measure:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


