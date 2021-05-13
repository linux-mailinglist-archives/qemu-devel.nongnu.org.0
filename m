Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19C37FD03
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:57:49 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFam-0007GW-KV
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhFYs-0005Be-Cw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:55:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lhFYq-0002kW-SD
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620928548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IatxSZNK5Qw+tqwyPNkzqxPcvdyy4k+0uytbQAjdcao=;
 b=cmlMB+MWudltiMxokP7UinhFgFczaodhJ0o6hMo//CdCNTDWj3PAGm8vn8jgBtjyXjHu2q
 GLpaP5I16DYF7cMVQoGmIF+wTQJjWticUQhkx8PaNbzEo5wPR9gjEV1eL/LpoByukUH2B1
 wjWFvCaXJNSo5uQy57wJp54joH34F4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-xQysxJTgOlaqJV2SUHJI2Q-1; Thu, 13 May 2021 13:55:46 -0400
X-MC-Unique: xQysxJTgOlaqJV2SUHJI2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DED08107ACED;
 Thu, 13 May 2021 17:55:44 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07AF0687C6;
 Thu, 13 May 2021 17:55:39 +0000 (UTC)
Subject: Re: [PATCH v3 02/15] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-3-eesposit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9b387d12-d0e0-6477-5669-142a2f7c9d80@redhat.com>
Date: Thu, 13 May 2021 13:55:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414170352.29927-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:03 PM, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Assuming it doesn't make the linter explode, which I didn't run:

Reviewed-by: John Snow <jsnow@redhat.com>

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
> 


