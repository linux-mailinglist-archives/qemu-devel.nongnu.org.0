Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A8943B0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:13:36 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKOc-0006Zy-PG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJmh-0004HC-It
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJmf-0005Oh-BB
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3AgMCQ8Mr/IMYiyDgwrdAEl+p5HC67e68maw61vY/0=;
 b=G0mV2Dqgq5WSoVifasgsv7d1AwlS9SK1MduRTpcT1AlVd4OvCF844An90iV4CJAxowdNQk
 gf4YizhYiqwdWUx+MvDOoOacMDHuln5yYk8hegPfP1QxsE4jGfv0qJd6lxKfP0cIuPxj4V
 w6aJ+odtNtTxy9+vfRKZbABCMDw76Gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-tYcU_vLlPymD86YH2C7G7A-1; Tue, 26 Oct 2021 06:34:17 -0400
X-MC-Unique: tYcU_vLlPymD86YH2C7G7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE15D112C144;
 Tue, 26 Oct 2021 10:34:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8A81835B;
 Tue, 26 Oct 2021 10:34:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 607DA11380A7; Tue, 26 Oct 2021 12:34:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] qapi: Improve input_type_enum()'s error message
References: <20211020180231.434071-1-armbru@redhat.com>
Date: Tue, 26 Oct 2021 12:34:12 +0200
In-Reply-To: <20211020180231.434071-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 20 Oct 2021 20:02:31 +0200")
Message-ID: <87bl3ckrbv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 michael.roth@amd.com, hreitz@redhat.com, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> The error message claims the parameter is invalid:
>
>     $ qemu-system-x86_64 -object qom-type=3Dnonexistent
>     qemu-system-x86_64: -object qom-type=3Dnonexistent: Invalid parameter=
 'nonexistent'
>
> What's wrong is actually the *value* 'nonexistent'.  Improve the
> message to
>
>     qemu-system-x86_64: -object qom-type=3Dnonexistent: Parameter 'qom-ty=
pe' does not accept value 'nonexistent'
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Queued.


