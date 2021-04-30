Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6723936FA07
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:19:18 +0200 (CEST)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcS73-0005vK-EW
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRFX-00061P-QK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcRFV-0003AB-1G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619781836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU/thrpum2PmG9OlU1wZY/97dJ51AWeDZ5siAvtGTH4=;
 b=IuGIOEJGvpEyexlIU+ik3lGMnddH/jVxyB20W3HINblBJomYSNBBMkf/vTRIvoMl3+gkHH
 502qfkSNrAzWK9M7gcr30RULwgNwj44mnFQHP8vVqPqerLt9ei5v+Nwfk1Wianga8Igz90
 Klx6bbRf/5cw9E0M4eWZdSkg7eYiaDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-xTJDUe2wN8CcRjAZHYRJBw-1; Fri, 30 Apr 2021 07:23:54 -0400
X-MC-Unique: xTJDUe2wN8CcRjAZHYRJBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB60A800C7A;
 Fri, 30 Apr 2021 11:23:53 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 241646E71D;
 Fri, 30 Apr 2021 11:23:51 +0000 (UTC)
Subject: Re: [PATCH v3 02/15] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-3-eesposit@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4d917da4-4500-864f-54ac-3fafc816b375@redhat.com>
Date: Fri, 30 Apr 2021 13:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/qtest.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index 39a0cf62fe..c18eae96c6 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -111,6 +111,7 @@ class QEMUQtestMachine(QEMUMachine):
>       def __init__(self,
>                    binary: str,
>                    args: Sequence[str] = (),
> +                 wrapper: Sequence[str] = (),
>                    name: Optional[str] = None,
>                    test_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
> @@ -119,7 +120,8 @@ def __init__(self,
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
>               sock_dir = test_dir
> -        super().__init__(binary, args, name=name, test_dir=test_dir,
> +        super().__init__(binary, args, wrapper=wrapper, name=name,
> +                         test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
>                            sock_dir=sock_dir)
>           self._qtest: Optional[QEMUQtestProtocol] = None

Reviewed-by: Max Reitz <mreitz@redhat.com>


