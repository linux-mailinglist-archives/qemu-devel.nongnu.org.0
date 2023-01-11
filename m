Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38830665D23
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:56:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFba9-0007sy-AH; Wed, 11 Jan 2023 08:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFba5-0007q1-5i
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFba2-0007Jd-Pt
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673445344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+yZEMv4aGliaTVK/phgo8/47ivCfAPs6V6jkQcWRXU=;
 b=imJdu2g+b69E95SJBPYKw6OFk8e2U9YJvCjQEaOvJdcP67u/wpZbWMtr4A47ZbAATewuQc
 9hQOsw2sl/2eeekQzXimrlOe326Banj5WxzN3tOXCoyFoIIoMtrRHXl0aDdPW1jlxZot/I
 3TI2DpklWdw/JyPFOwLBFcWG1n32PjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-E6D8HWdbNVeIXUTGrDvaiQ-1; Wed, 11 Jan 2023 08:55:40 -0500
X-MC-Unique: E6D8HWdbNVeIXUTGrDvaiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E222D1C0897B;
 Wed, 11 Jan 2023 13:55:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A89422A9;
 Wed, 11 Jan 2023 13:55:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DC7521E675B; Wed, 11 Jan 2023 14:55:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Eric Blake
 <eblake@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH RESEND v3 04/10] qapi/migration: Introduce
 x-vcpu-dirty-limit-period parameter
References: <cover.1670087275.git.huangy81@chinatelecom.cn>
 <cover.1670087275.git.huangy81@chinatelecom.cn>
 <d10a1ef4c7cc99beb6050af1a4374dbecb9db5f1.1670087275.git.huangy81@chinatelecom.cn>
Date: Wed, 11 Jan 2023 14:55:38 +0100
In-Reply-To: <d10a1ef4c7cc99beb6050af1a4374dbecb9db5f1.1670087275.git.huangy81@chinatelecom.cn>
 (huangy's message of "Sun, 4 Dec 2022 01:09:07 +0800")
Message-ID: <87358hfa5h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is in the range of 1 to 1000ms and used to
> make dirtyrate calculation period configurable.
>
> Currently with the "x-vcpu-dirty-limit-period" varies, the
> total time of live migration changes, test results show the
> optimal value of "x-vcpu-dirty-limit-period" ranges from
> 500ms to 1000 ms. "x-vcpu-dirty-limit-period" should be made
> stable once it proves best value can not be determined with
> developer's experiments.

I'm not a native speaker, but let me try to polish your prose anyway:

  The value of "x-vcpu-dirty-limit-period" affects how long live migration
  takes.  In my testing, the optimal value of "x-vcpu-dirty-limit-period"
  ranges from 500ms to 1000 ms.  If we can find a single value that is
  good enough for all use cases that matter, "x-vcpu-dirty-limit-period"
  can go away.  Else, "x-vcpu-dirty-limit-period" should be made stable.

Does this capture your intent?

> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86..c428bcd 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -776,8 +776,13 @@
>  #                        block device name if there is one, and to their=
 node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (in milliseconds) of dirty l=
imit during
> +#                             live migration. Should be in the range 1 t=
o 1000ms,
> +#                             defaults to 1000ms. (Since 7.3)

8.0, not 7.3, unless we change our versioning habits.  More of the same
below and later in this series; I'm not flagging it again.

> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Members @x-checkpoint-delay and @x-vcpu-dirty-limit-period
> +#            are experimental.
>  #
>  # Since: 2.4
>  ##

[...]


