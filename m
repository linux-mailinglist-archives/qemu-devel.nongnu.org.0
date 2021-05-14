Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79C380B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:10:09 +0200 (CEST)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYW0-00032F-0i
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lhYUy-0001uE-Nm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lhYUu-0000Bm-QG
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621001339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gq0U4smhJOd8NyYG0+OdvvpSJZFFIQhBEsVQcPVsuuY=;
 b=TRJInfIQ/t8OcyXe2mcAJRrFG/uneHW/EXQXulm1hbSdnFd01XSNYscV3e5gF8rYGDlRq4
 ZbEwSlF7uvTqnWzxd9u+bpY8S9yR2G4yLwGsmIQTPRclfKwzGNWB4ToW1eff7/YhMeIuLu
 7g7kgRr6fQrfvMZ0jkmewjTjWK0Px10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-3iKUTaDCO8G75z5F1legKQ-1; Fri, 14 May 2021 10:08:56 -0400
X-MC-Unique: 3iKUTaDCO8G75z5F1legKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A9D8015A8;
 Fri, 14 May 2021 14:08:55 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-173.gru2.redhat.com
 [10.97.116.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5A62BFEB;
 Fri, 14 May 2021 14:08:49 +0000 (UTC)
Subject: Re: [PATCH 03/10] python/machine: use subprocess.run instead of
 subprocess.Popen
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-4-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <03a2e3c2-d5e6-de83-dc44-b9c9a4e4923f@redhat.com>
Date: Fri, 14 May 2021 11:08:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210512214642.2803189-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/12/21 6:46 PM, John Snow wrote:
> use run() instead of Popen() -- to assert to pylint that we are not
> forgetting to close a long-running program.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/machine.py | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 41f51bd27d0..c13ff9b32bf 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -223,13 +223,16 @@ def send_fd_scm(self, fd: Optional[int] = None,
>               assert fd is not None
>               fd_param.append(str(fd))
>   
> -        proc = subprocess.Popen(
> -            fd_param, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
> -            stderr=subprocess.STDOUT, close_fds=False
> +        proc = subprocess.run(
> +            fd_param,
> +            stdin=subprocess.DEVNULL,
> +            stdout=subprocess.PIPE,
> +            stderr=subprocess.STDOUT,
> +            check=True,
> +            close_fds=False,
>           )

Now it might throw a CalledProcessError given that `check=True`. 
Shouldn't it capture the exception and (possible) re-throw as an 
QEMUMachineError?

- Wainer

> -        output = proc.communicate()[0]
> -        if output:
> -            LOG.debug(output)
> +        if proc.stdout:
> +            LOG.debug(proc.stdout)
>   
>           return proc.returncode
>   


