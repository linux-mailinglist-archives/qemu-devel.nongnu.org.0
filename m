Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF64C2CAE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:08:33 +0100 (CET)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDrD-0003SV-NT
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDi6-00066E-U9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:59:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDho-0002g6-KA
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645707523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWyJ0YL82lkN5WkFaCtN36PBTMQmvdjSnmEOVMu1avE=;
 b=RRYHjrHszezJcrbzxVjF2OB8r8XGgzDGXduljAoRAuc5n4NHvuwanKEW+LXEY+IygeF6q8
 lM5W0b40DPz5eNEE7muLm6w7hblZ1Uf/6GkehwGHM3pnolMAqIpVECDfkZM5G84qEpEAGH
 Xgm8a9Jx0CStmNbUCen1IAwzggc1It8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-lsWagrKePUyW8HIVhzwfqg-1; Thu, 24 Feb 2022 07:58:42 -0500
X-MC-Unique: lsWagrKePUyW8HIVhzwfqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 j10-20020a05640211ca00b004090fd8a936so678431edw.23
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWyJ0YL82lkN5WkFaCtN36PBTMQmvdjSnmEOVMu1avE=;
 b=Mlf9H8Z0jESGQYcMma3/3WS/wxzKWkQFzjTBU08lOqIT66YPjnEWXCBqjbwwz0EGLR
 9w7i/LetKvQSmrVVl0h59o/bn5NOHMQ8NSFhhw2Ky0yMJ7VY2/Ps8wJ73ESyBOZQ3gWW
 plYSOg72KvaXUz2VnW+Wt8JAtK7kSvokljPjn5cXuOHLnhsd/lytA9Fz8GpizznOicOf
 GSmslZ3xi9jVNBvbDRb5F0t/SEvIr7xlfcbdDPDtRZu29S+P4IIkXGi8B/qo+scy8wq9
 n9kYr2+LybbWelFI92Z5qdAn1AybynwF9tBEkGCijguIhvmYaBGwR0lrPT4/Vd/DbySD
 xgaQ==
X-Gm-Message-State: AOAM533WCFA/TLTuzrGje6gJZZaenULh3YHy/elq9WczHVtt/SlHQyOk
 TmCBb6wB/kfw6w3E8tlk38/cQOv6kSQxe4U6oMReZdTi5W3wOWeR6o2V0/4QgLlYRIfP76eFgN2
 FlpyUPepZJOpdKVo=
X-Received: by 2002:a17:906:ae4a:b0:6d0:9eee:e951 with SMTP id
 lf10-20020a170906ae4a00b006d09eeee951mr2155161ejb.2.1645707520935; 
 Thu, 24 Feb 2022 04:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo6wmZ6wwSvBqDqT7oAGigSzTPxu5S6+yaiiKXTjiWA0Dj6OdhPXf3s/9QP3u6GmZ2JmnpGg==
X-Received: by 2002:a17:906:ae4a:b0:6d0:9eee:e951 with SMTP id
 lf10-20020a170906ae4a00b006d09eeee951mr2155139ejb.2.1645707520702; 
 Thu, 24 Feb 2022 04:58:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id m18sm1345870eje.145.2022.02.24.04.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:58:40 -0800 (PST)
Message-ID: <6526d98b-bbe4-b551-47dc-9929a3cdd828@redhat.com>
Date: Thu, 24 Feb 2022 13:58:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 15/18] iotests/image-fleecing: add test case with bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-16-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-16-vsementsov@virtuozzo.com>
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
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Note that reads zero areas (not dirty in the bitmap) fails, that's
> correct.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
>   tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
>   2 files changed, 108 insertions(+), 8 deletions(-)

Looks good, just one general usage question:

> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
> index 909fc0a7ad..33995612be 100755
> --- a/tests/qemu-iotests/tests/image-fleecing
> +++ b/tests/qemu-iotests/tests/image-fleecing
> @@ -23,7 +23,7 @@
>   # Creator/Owner: John Snow <jsnow@redhat.com>
>   
>   import iotests
> -from iotests import log, qemu_img, qemu_io, qemu_io_silent
> +from iotests import log, qemu_img, qemu_io, qemu_io_silent, qemu_io_pipe_and_status
>   
>   iotests.script_initialize(
>       supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
> @@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
>                ('0xcd', '0x3ff0000', '64k')] # patterns[3]
>   
>   def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
> -            fleece_img_path, nbd_sock_path, vm):
> +            fleece_img_path, nbd_sock_path, vm,
> +            bitmap=False):
>       log('--- Setting up images ---')
>       log('')
>   
>       assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
> +    if bitmap:
> +        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
> +
>       if use_snapshot_access_filter:
>           assert use_cbw
>           assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
> @@ -106,12 +110,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>   
>       # Establish CBW from source to fleecing node
>       if use_cbw:
> -        log(vm.qmp('blockdev-add', {
> +        fl_cbw = {
>               'driver': 'copy-before-write',
>               'node-name': 'fl-cbw',
>               'file': src_node,
>               'target': tmp_node
> -        }))
> +        }
> +
> +        if bitmap:
> +            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
> +
> +        log(vm.qmp('blockdev-add', fl_cbw))
>   
>           log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))

This makes me wonder how exactly the @bitmap parameter is to be used.  
In this case here, we use an active bitmap that tracks all writes, so it 
looks like a case of trying to copy the changes since some previous 
checkpoint (as a point-in-time state).  But if there are any writes 
between the blockdev-add and the qom-set, then they will not be included 
in the CBW bitmap.  Is that fine?  Or is it perhaps even intentional?

(Is the idea that one would use a transaction to disable the current 
bitmap (say “A”), and add a new one (say “B”) at the same time, then use 
bitmap A for the CBW filter, delete it after the backup, and then use B 
for the subsequent backup?)


