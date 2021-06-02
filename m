Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7284399673
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 01:44:49 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loaXY-0000X7-GB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 19:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaWQ-0008H1-Oh
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaWO-0001q4-Oa
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622677415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zV/KeTpFGNgUlw1AkpZBHfXaHoURd5sHtoyHnzluBPk=;
 b=JcXKItH74qPAwRyFgvNzYz4L1FoLFL+MLVhTL06d59TdxB1ZeOkTHY1khL0F4tegmQLpYO
 xVSq0jrcCvk1gGLzmadW9WlRZ6g1D2Ls1BTVnXJ1xukBO0J1ynR0bdomjPylm3JZFowrD8
 hGq1yk8hNCeaZDoVzUMX+6lfPGB+CL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-S2wiPODmP5OxgquScaHq5Q-1; Wed, 02 Jun 2021 19:43:34 -0400
X-MC-Unique: S2wiPODmP5OxgquScaHq5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32395803621;
 Wed,  2 Jun 2021 23:43:33 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA8C60C16;
 Wed,  2 Jun 2021 23:43:31 +0000 (UTC)
Subject: Re: [PATCH v4 26/35] python/qemu/machine: QEMUMachine: improve qmp()
 method
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
 <20210602131108.74979-27-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <8795df19-c215-c6c1-365c-4aa914f45704@redhat.com>
Date: Wed, 2 Jun 2021 19:43:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602131108.74979-27-vsementsov@virtuozzo.com>
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
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 9:10 AM, Vladimir Sementsov-Ogievskiy wrote:
> We often call qmp() with unpacking dict, like qmp('foo', **{...}).
> mypy don't really like it, it thinks that passed unpacked dict is a
> positional argument and complains that it type should be bool (because
> second argument of qmp() is conv_keys: bool).
> 
> Allow passing dict directly, simplifying interface, and giving a way to
> satisfy mypy.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   python/qemu/machine.py | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index ff35f2cd6c..7a14605040 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -549,11 +549,21 @@ def _qmp_args(cls, conv_keys: bool,
>               return args
>   
>       def qmp(self, cmd: str,
> -            conv_keys: bool = True,
> +            args_dict: Optional[Dict[str, Any]] = None,

try using object here, too.

> +            conv_keys: Optional[bool] = None,
>               **args: Any) -> QMPMessage:
>           """
>           Invoke a QMP command and return the response dict
>           """
> +        if args_dict is not None:
> +            assert not args
> +            assert conv_keys is None
> +            args = args_dict
> +            conv_keys = False
> +
> +        if conv_keys is None:
> +            conv_keys = True
> +
>           qmp_args = self._qmp_args(conv_keys, args)
>           return self._qmp.cmd(cmd, args=qmp_args)
>   
> 

With the comment addressed:

Reviewed-by: John Snow <jsnow@redhat.com>

Thanks,
--js


