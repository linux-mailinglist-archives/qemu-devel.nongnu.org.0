Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE593D2F7D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:06:43 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6gq2-0004Di-7c
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6gou-0003XR-Vk
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6got-0002xU-FR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626991530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50U8XGXKC09IYwLj7u517s6FcmM9FVyHIm9gPPYVShM=;
 b=UB48EKUnnBs6NVZDEJzbNrEYRjZ15Lkz9Yoc6GJRktRcgQ7ashmaSA7D3muAPlbTwqhwNR
 Mhmo+eS8/XY2jf0vqdcxhFZuCJV50KOEWn5rPjlSLo/NDQKC08XYYw7UJIRZr3z/tiMzNQ
 7SV491Oy5r2pv8GJYR3dUuGwXFudPBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-vVidDUnIO8GLU7glMcCy8w-1; Thu, 22 Jul 2021 18:05:29 -0400
X-MC-Unique: vVidDUnIO8GLU7glMcCy8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35161802575;
 Thu, 22 Jul 2021 22:05:28 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBB6163C6;
 Thu, 22 Jul 2021 22:05:20 +0000 (UTC)
References: <20210722181322.516635-1-philmd@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.1 v2] gitlab-ci: Extract OpenSBI job rules and fix
 'when' condition
In-reply-to: <20210722181322.516635-1-philmd@redhat.com>
Date: Thu, 22 Jul 2021 18:05:19 -0400
Message-ID: <87eebq0zts.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn?= =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 writes:

> First, all jobs depending on 'docker-opensbi' job must use at most
> all the rules that triggers it. The simplest way to ensure that is
> to always use the same rules. Extract all the rules to a reusable
> section, and include this section (with the 'extends' keyword) in
> both 'docker-opensbi' and 'build-opensbi' jobs.
>
> Second, jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep running
> jobs depending on it. The correct condition is 'when: on_success'.
>
> The problems were introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
> Add jobs to build OpenSBI firmware binaries"), but were revealed in
> commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
> container").
>
> This fix is similar to the one used with the EDK2 firmware job in
> commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
> section").
>
> Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: when 'always' -> 'on_success' & reworded (danpb)
>
> Supersedes: <20210720164829.3949558-1-philmd@redhat.com>
> ---
>  .gitlab-ci.d/opensbi.yml | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>


