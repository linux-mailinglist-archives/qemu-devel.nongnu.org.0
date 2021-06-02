Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D539966C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 01:40:24 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loaTH-0005h6-2P
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 19:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaRR-0004fn-4E
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loaRM-0007CL-PI
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622677104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pACcass5TPhj8fXo4C596TqN6mpXOOHDCQvliZ7jF9A=;
 b=JHyN6pODbkUM5/iYB+rgRwl+JZcYL3WE4SVJ6c4Sn7yfeX3fGTN3dQ/4fqZGa/vTzfVSlb
 aLFoAKPa9+AFirjljJA8Oy/ab5/5ZPG+MSv6IHiPt0qC/lY+3i0TXOn0r3WqoptXDlmrqa
 BugWXwzKzLIZVlmXrRgc6i1lHQgW2vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-P3Fl_uXiOUy5Le0E7DcX8Q-1; Wed, 02 Jun 2021 19:38:21 -0400
X-MC-Unique: P3Fl_uXiOUy5Le0E7DcX8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9E3107ACF4;
 Wed,  2 Jun 2021 23:38:20 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975E6131E7;
 Wed,  2 Jun 2021 23:38:18 +0000 (UTC)
Subject: Re: [PATCH v4 25/35] python/qemu/machine.py: refactor _qemu_args()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
 <20210602131108.74979-26-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e3d89875-2d78-10eb-a531-d53ce460c562@redhat.com>
Date: Wed, 2 Jun 2021 19:38:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602131108.74979-26-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
>   - use shorter construction
>   - don't create new dict if not needed
>   - drop extra unpacking key-val arguments
>   - drop extra default values
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>

Sorry, I shuffled around the Python stuff and this doesn't apply 
anymore. I have applied it myself for review, though.

(I don't anticipate any more major shake-ups from this point forward. 
Thanks for your help on reviews for that series.)

> ---
>   python/qemu/machine.py | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6e44bda337..ff35f2cd6c 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -541,14 +541,12 @@ def _qmp(self) -> qmp.QEMUMonitorProtocol:
>           return self._qmp_connection
>   
>       @classmethod
> -    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
> -        qmp_args = dict()
> -        for key, value in args.items():
> -            if _conv_keys:
> -                qmp_args[key.replace('_', '-')] = value
> -            else:
> -                qmp_args[key] = value
> -        return qmp_args
> +    def _qmp_args(cls, conv_keys: bool,
> +                  args: Dict[str, Any]) -> Dict[str, Any]:
> +        if conv_keys:
> +            return {k.replace('_', '-'): v for k, v in args.items()}
> +        else:
> +            return args

qemu/machine/machine.py:558:8: R1705: Unnecessary "else" after "return" 
(no-else-return)

Also, can you try using Dict[str, object] instead? This keeps stricter 
type checking enabled for callers trying to utilize the return value. On 
my review branch (based on master, not kwolf's staging branch) it passes 
Python linting and iotests 297, so it should hopefully not be a hassle.

>   
>       def qmp(self, cmd: str,
>               conv_keys: bool = True,
> @@ -556,7 +554,7 @@ def qmp(self, cmd: str,
>           """
>           Invoke a QMP command and return the response dict
>           """
> -        qmp_args = self._qmp_args(conv_keys, **args)
> +        qmp_args = self._qmp_args(conv_keys, args)
>           return self._qmp.cmd(cmd, args=qmp_args)
>   
>       def command(self, cmd: str,
> @@ -567,7 +565,7 @@ def command(self, cmd: str,
>           On success return the response dict.
>           On failure raise an exception.
>           """
> -        qmp_args = self._qmp_args(conv_keys, **args)
> +        qmp_args = self._qmp_args(conv_keys, args)
>           return self._qmp.command(cmd, **qmp_args)
>   
>       def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
> 

With those items addressed:

Reviewed-by: John Snow <jsnow@redhat.com>


