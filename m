Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0431C3E9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:07:03 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBm1G-0004ss-76
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlyy-0003lh-Fg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlys-0001Ab-AC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613426672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/k+wkAumx1NtwxXPcjVCbWj28ot/7/DpM7mOFCiRkuU=;
 b=SKWbdNpPWnFmuPBhNm9iIja4+uJWZQBvui0GKk8ys7oZapBWD2IPnhmNbjkQPq9UIsQyC1
 idJOGMpg7wjsgTdi7vGdVRMz2oJrXx3wrsdTcAI0bEErC0V3ukcGpMhar5KxewhfDusTHr
 fJ3o6OTOJ2zDOfyb9r4H9UCUw88aBR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-HeAPDgsNMJamG9XQRAH8AA-1; Mon, 15 Feb 2021 17:04:30 -0500
X-MC-Unique: HeAPDgsNMJamG9XQRAH8AA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293B5107ACE3;
 Mon, 15 Feb 2021 22:04:29 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8B9F10023AD;
 Mon, 15 Feb 2021 22:04:24 +0000 (UTC)
Subject: Re: [PATCH 1/6] Python: close the log file kept by QEMUMachine before
 reading it
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-2-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a6356c56-8652-e810-0f04-b0658912e8f6@redhat.com>
Date: Mon, 15 Feb 2021 17:04:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220146.2525771-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 5:01 PM, Cleber Rosa wrote:
> Closing a file that is open for writing, and then reading from it
> sounds like a better idea than the opposite, given that the content
> will be flushed.
> 
> Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   python/qemu/machine.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 7a40f4604b..6e44bda337 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -337,12 +337,12 @@ class QEMUMachine:

Is there a way to improve context for python functions? What method is 
this in? etc.

>               self._qmp.close()
>               self._qmp_connection = None
>   
> -        self._load_io_log()
> -
>           if self._qemu_log_file is not None:
>               self._qemu_log_file.close()
>               self._qemu_log_file = None
>   
> +        self._load_io_log()
> +
>           self._qemu_log_path = None
>   
>           if self._temp_dir is not None:
> 

Yeh, seems fine, though as wainer points out the interdependencies 
between _load_io_log, _qemu_log_file and _qemu_log_path are not all 
strictly clear, so it seems fragile.

But, this is more correct than it was, so:

Reviewed-by: John Snow <jsnow@redhat.com>


