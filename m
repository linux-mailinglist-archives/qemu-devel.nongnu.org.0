Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C664152C
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:14:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Oax-0001fc-6u; Sat, 03 Dec 2022 04:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1Oau-0001fT-GW
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:14:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p1Oas-0004k6-Du
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670058837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvceZRkKvOPJfakrN4zUGvZw79x2SgjtCexydoFDtPA=;
 b=fV+e0+Y2n07s2jpF3RRCkewgpzVJq6n2gEtGoS6LcA6dHs6hPTzBVc7BiLjW2EnRPzYiX7
 lJyHvZqAL4g7jVUqUBOIR25K5xgLifOHn/88qjcmLQcUXolI3fZrC3cpPQOzSzIyatXzx0
 DJvM/bHXoRx+6zo08GMvqMkKLiLw7I0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-WUJ87E1dN1mONyKD-buHRg-1; Sat, 03 Dec 2022 04:13:53 -0500
X-MC-Unique: WUJ87E1dN1mONyKD-buHRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24F1B185A792;
 Sat,  3 Dec 2022 09:13:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7E32166B2A;
 Sat,  3 Dec 2022 09:13:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D6F3321E6921; Sat,  3 Dec 2022 10:13:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/11] qapi/migration: Introduce vcpu-dirty-limit
 parameters
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <cover.1669047366.git.huangy81@chinatelecom.cn>
 <3fe7b2324c350b65f2a6fe6e4c585e9de5402e0c.1669047366.git.huangy81@chinatelecom.cn>
Date: Sat, 03 Dec 2022 10:13:49 +0100
In-Reply-To: <3fe7b2324c350b65f2a6fe6e4c585e9de5402e0c.1669047366.git.huangy81@chinatelecom.cn>
 (huangy's message of "Mon, 21 Nov 2022 11:26:37 -0500")
Message-ID: <87sfhwonn6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

huangy81@chinatelecom.cn writes:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Introduce "vcpu-dirty-limit" migration parameter used
> to limit dirty page rate during live migration.
>
> "vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
> two dirty-limit-related migration parameters, which can
> be set before and during live migration by qmp
> migrate-set-parameters.
>
> This two parameters are used to help implement the dirty
> page rate limit algo of migration.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

Could you explain briefly why x-vcpu-dirty-limit-period is experimental,
and vcpu-dirty-limit is not?


