Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0B2FDF19
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:15:05 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PV2-0005BN-7G
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PU1-0004gT-BV
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PTy-0003zn-Is
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611195237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/TefsnjStvttCdWScnBYb7ExI9d8bpVIaW4oKvnhuYQ=;
 b=jL4XItdt7YyBi7q2gLkYCfuSqM/bTM8vyUwzejk8k44eO6AZsOkV2l3K4sgsTjbCtRnz7u
 C0VCBDJ3/BWjUbbZMmslPbEEyx6GOatamjId/xrMT/W6JqfAjmPxASB2gNsuhL1RXjYoOF
 PCy5Hcgt5iY2gMR5cXes29uHRhz7Q6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-WJHpbbVzPbe7YPboiPf-6w-1; Wed, 20 Jan 2021 21:13:55 -0500
X-MC-Unique: WJHpbbVzPbe7YPboiPf-6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B76C425C8;
 Thu, 21 Jan 2021 02:13:54 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7986870951;
 Thu, 21 Jan 2021 02:13:53 +0000 (UTC)
Subject: Re: [PATCH v2 4/8] iotests.py: qemu_io(): reuse
 qemu_tool_pipe_and_status()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
 <20201130134024.19212-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3be51794-d90d-eb4c-b06e-9ced04129aa2@redhat.com>
Date: Wed, 20 Jan 2021 20:13:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201130134024.19212-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:40 AM, Vladimir Sementsov-Ogievskiy wrote:
> Just drop code duplication.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/iotests.py | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5ebe25e063..6c9bcf9042 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -188,14 +188,7 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
>  def qemu_io(*args):
>      '''Run qemu-io and return the stdout data'''
>      args = qemu_io_args + list(args)
> -    subp = subprocess.Popen(args, stdout=subprocess.PIPE,
> -                            stderr=subprocess.STDOUT,
> -                            universal_newlines=True)
> -    output = subp.communicate()[0]
> -    if subp.returncode < 0:
> -        sys.stderr.write('qemu-io received signal %i: %s\n'
> -                         % (-subp.returncode, ' '.join(args)))
> -    return output
> +    return qemu_tool_pipe_and_status('qemu-io', args)[0]
>  
>  def qemu_io_log(*args):
>      result = qemu_io(*args)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


