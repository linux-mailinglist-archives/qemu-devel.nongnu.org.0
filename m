Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFE4E5851
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:22:59 +0100 (CET)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5dK-00005a-5W
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:22:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nX5ac-00061D-Li
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nX5aX-0001Eg-So
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648059604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBKZAvECGUFkMeG5wM0Jly6UeGm3B5V9H7bsrwXsao8=;
 b=eAIiPTatkywDpTssbJsv5mLCNDb7RtQrB3EwvYw0zF2JWRJg5alr9mcnmUpojolD/4Zdoa
 aEJb/L/39JxjzyZXpruJ21oEYIHw9cWrAysAWUtBoHjP0elA3vkwTcFZRXqj4uu266BSWO
 XdtACCL+tEYGIM9REXJgbkz0GHdR0Sg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-6kdNEdmgMOaHl2XbRxEpFg-1; Wed, 23 Mar 2022 14:20:02 -0400
X-MC-Unique: 6kdNEdmgMOaHl2XbRxEpFg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b10-20020a50e38a000000b00418cd24fd27so1532547edm.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wBKZAvECGUFkMeG5wM0Jly6UeGm3B5V9H7bsrwXsao8=;
 b=mgfI3YLbVtsQup7i0HaoF4FEXCFZcOJ7ypTRGDya7JviTgQQK7NNzdOTXIQCR64A5p
 Xz6fszW4ltWasmQDZcZOB2Z93y+ydnMKG3dDT5eZZoCKtjUTjedr7fHTJw62wHD4D5Ul
 RmsiiQhf3gAcd2xMSFArlWfiYIoudzyzbZRVfH+cH47mS0c2gvouTAbCcdmKXAvOeTun
 GwW+AoMFgj0Zxd+mGafZ5WqZh7M13YB9j9UOIp8G/+ylOezMdJ5KfAW4Z6ygqAum/674
 DR+F67H4VOkAnyCzi1JKirhfzon1UtqyxHJJSBQZEPOdK1CqhFPSZbipAFWbLIZPLzEp
 bXhQ==
X-Gm-Message-State: AOAM533z3guWMBB77uFhQo377BEP9ogMQgsiw/fKNQJt+TCWfW2t1feY
 +MGv7WnhSxWiDuQyALfb3FJWYQRa5P2e0X3BZBxJRqksGcUx3VZDChVujJGvI+l2ECwXntl11uB
 ozU2KsKcqlx6AjuA=
X-Received: by 2002:a17:907:7f0a:b0:6e0:3aec:345a with SMTP id
 qf10-20020a1709077f0a00b006e03aec345amr1425279ejc.313.1648059600816; 
 Wed, 23 Mar 2022 11:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0mS6U9LK3O5FkgmODxczrqRTRFaqUiCsCRQGAXj6GQlldPjnGRO5pPAwDcqVIUgaLJlLnLA==
X-Received: by 2002:a17:907:7f0a:b0:6e0:3aec:345a with SMTP id
 qf10-20020a1709077f0a00b006e03aec345amr1425233ejc.313.1648059600405; 
 Wed, 23 Mar 2022 11:20:00 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170906738400b006df8b6787afsm244875ejl.13.2022.03.23.11.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:19:59 -0700 (PDT)
Message-ID: <072109ff-8c30-e1cf-d979-d75c682d5385@redhat.com>
Date: Wed, 23 Mar 2022 19:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/10] python: rename qemu.aqmp to qemu.qmp
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-10-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220321210847.914787-10-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.03.22 22:08, John Snow wrote:
> Now that we are fully switched over to the new QMP library, move it back
> over the old namespace. This is being done primarily so that we may
> upload this package simply as "qemu.qmp" without introducing confusion
> over whether or not "aqmp" is a new protocol or not.
>
> The trade-off is increased confusion inside the QEMU developer
> tree. Sorry!
>
> Note: the 'private' member "_aqmp" in legacy.py also changes to "_qmp";
> not out of necessity, but just to remove any traces of the "aqmp"
> name.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---

I guess this is the one for which I’m CC-ed?

[...]

> diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
> index b33fb70d5e..8f731a5cfe 100755
> --- a/scripts/render_block_graph.py
> +++ b/scripts/render_block_graph.py
> @@ -25,8 +25,8 @@
>   from graphviz import Digraph
>   
>   sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
> -from qemu.aqmp import QMPError
> -from qemu.aqmp.legacy import QEMUMonitorProtocol
> +from qemu.qmp import QMPError
> +from qemu.qmp.legacy import QEMUMonitorProtocol
>   
>   
>   def perm(arr):
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index af9d1646a4..56191db44b 100755
> --- a/scripts/simplebench/bench_block_job.py
> +++ b/scripts/simplebench/bench_block_job.py
> @@ -27,7 +27,7 @@
>   
>   sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>   from qemu.machine import QEMUMachine
> -from qemu.aqmp import ConnectError
> +from qemu.qmp import ConnectError
>   
>   
>   def bench_block_job(cmd, cmd_args, qemu_args):
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 8760e2c310..9563749709 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -38,7 +38,7 @@
>   from contextlib import contextmanager
>   
>   from qemu.machine import qtest
> -from qemu.aqmp.legacy import QMPMessage, QEMUMonitorProtocol
> +from qemu.qmp.legacy import QMPMessage, QEMUMonitorProtocol

(Rebasing will change the order of imports; you fixed the (alphabetic) 
ordering in 2882ccf86a9, now you’re going to have to restore the 
original ordering here :))

>   # Use this logger for logging messages directly from the iotests module
>   logger = logging.getLogger('qemu.iotests')
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 223f3c1620..d538579961 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -99,7 +99,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>           self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
>           try:
>               # Silence AQMP logging errors temporarily.

Probably should just be “QMP” now, too.  Anyway:

Acked-by: Hanna Reitz <hreitz@redhat.com>

> -            with change_log_level('qemu.aqmp'):
> +            with change_log_level('qemu.qmp'):
>                   self.vm_b.launch()
>                   print('ERROR: VM B launched successfully, '
>                         'this should not have happened')


