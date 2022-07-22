Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605F57E3E1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:44:29 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEupD-0000zw-1m
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEulG-0005OQ-D5
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEulE-0004ab-J6
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 11:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658504416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NCYf1ws68F6X86Cf7QAFbjrw9NgeWslbdBpAs3+x4o=;
 b=i3iSs5MfshOhN5k597RsO4k7z6Tdg2coudUYkq5cE5mmREOKMulaSPwyl05Dpey82vHLL1
 Sfj3hEM0azLCFBSIt417SUtSOuILLI/CQb2w4WKQFdr0QMZoMLmC/rx1ltK6DbuTOTSPPS
 uTZ+OpxEqHXIALUwwn92e9HqzrEsXA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-qHjkgsrTM_mvbn9Hm3Db7A-1; Fri, 22 Jul 2022 11:40:12 -0400
X-MC-Unique: qHjkgsrTM_mvbn9Hm3Db7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE693810795;
 Fri, 22 Jul 2022 15:40:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05ED8492CA5;
 Fri, 22 Jul 2022 15:40:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] target/arm: display deprecation status in '-cpu
 help'
In-Reply-To: <20220722120224.2311982-4-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220722120224.2311982-1-berrange@redhat.com>
 <20220722120224.2311982-4-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 22 Jul 2022 17:40:10 +0200
Message-ID: <87wnc5ma05.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Fri, Jul 22 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When the user queries CPU models via QMP there is a 'deprecated' flag
> present, however, this is not done for the CLI '-cpu help' command.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


