Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A30332FBC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:18:04 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJinr-0006Za-3c
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJhWl-00034E-Ef
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:56:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lJhWi-0004Ms-0G
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615316174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDubvha3N8l5NtRPp9N8PBL1iR6oMkUISI0pEvzD5uY=;
 b=KwyDbdpiiSi1i8wkYLgxDnhA8KaoAycMUbRFinDIU73pU/cMpZXGmj3zCKO/Q4pHpSQDRe
 OMVroNyzAhL1QxLHkglDiTZEpg+MajYqUeXPpfEoz3K6y/9PeJbKF3Va6oWzdGLe8rD2M6
 0wNHYSojxiMU/4WCLX+dAWBgMSbHAM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-8Gu1ikkFMB6P9RK0JDeuxA-1; Tue, 09 Mar 2021 13:56:12 -0500
X-MC-Unique: 8Gu1ikkFMB6P9RK0JDeuxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F571842144;
 Tue,  9 Mar 2021 18:56:10 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89C2E5C233;
 Tue,  9 Mar 2021 18:56:08 +0000 (UTC)
Subject: Re: [PATCH] tests/migration: fix unix socket migration
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <256cd77a-d14f-da4f-e111-6245d01ec001@redhat.com>
Date: Tue, 9 Mar 2021 15:56:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/9/21 1:00 PM, huangy81@chinatelecom.cn wrote:
> From: Hyman <huangy81@chinatelecom.cn>
>
> The test aborts and error message as the following be throwed:
> "No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
> when the unix socket migration test nearly done. The reason is
> qemu removes the unix socket file after migration before
> guestperf.py script do it. So pre-check if the socket file exists
> when removing it to prevent the guestperf program from aborting.
>
> Signed-off-by: Hyman <huangy81@chinatelecom.cn>
> ---
>   tests/migration/guestperf/engine.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 83bfc3b..86d4f21 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -405,7 +405,7 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
>               progress_history = ret[0]
>               qemu_timings = ret[1]
>               vcpu_timings = ret[2]
> -            if uri[0:5] == "unix:":
> +            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
>                   os.remove(uri[5:])
>               if self._verbose:
>                   print("Finished migration")


