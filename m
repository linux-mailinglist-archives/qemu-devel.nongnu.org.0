Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EF561EC2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:06:44 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6vkh-00077i-52
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vjC-0005eQ-A0
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6vj5-0000Kk-50
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656601501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGuVt8KioYLwI9WkfOMa7xpBflQz4leCjmCThSMaFjQ=;
 b=hHRba1IlJOuUrJSOtUCU4Ul597J9iZywcGbMuL57fM1onnp/jOzatRhLyfaPmRnazU2/7o
 6KhHETVbfaksLrnuxIagUvmVMEqRe9gwjKX4httb8LS4L+ZAIgnG6ajapRaAT01UiO1ryW
 BYIQMP0xsGCMm8Hn8Dvn6DCAtddCfXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-hhUaIspROGqGH8lfDBi0zw-1; Thu, 30 Jun 2022 11:04:57 -0400
X-MC-Unique: hhUaIspROGqGH8lfDBi0zw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6802C803478;
 Thu, 30 Jun 2022 15:04:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 261CB492C3B;
 Thu, 30 Jun 2022 15:04:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0B3C21E690D; Thu, 30 Jun 2022 17:04:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Vivek
 Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 1/3] ui/gtk: detach VCs for additional guest displays
References: <20220630005141.16680-1-dongwon.kim@intel.com>
 <20220630005141.16680-2-dongwon.kim@intel.com>
Date: Thu, 30 Jun 2022 17:04:55 +0200
In-Reply-To: <20220630005141.16680-2-dongwon.kim@intel.com> (Dongwon Kim's
 message of "Wed, 29 Jun 2022 17:51:40 -0700")
Message-ID: <87a69u5h0o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Dongwon Kim <dongwon.kim@intel.com> writes:

> Detaching any addtional guest displays in case multiple displays are
> assigned to the guest OS (e.g. max_outputs=3Dn) so that all of them are
> visible upon lauching.
>
> v2: - making sure type of VC is GD_VC_GFX before qemu_console_is_graphic
>       (Gerd Hoffman)
>     - vc[0] is always primary guest display so we won't need n_gfx_vcs
>       (Gerd Hoffmann)
>     - making sure detached window's size same as original surface size
>       (Daniel P. Berrang=C3=A9)

Patch history ...

> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---

... goes here, so it doesn't end up in git.  You can also keep it in the
cover letter instead.

>  ui/gtk.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)


