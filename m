Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2848356A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:17:01 +0100 (CET)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4QxA-0007EE-WF
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4Qw3-0006NX-Vx
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4Qw1-0004KQ-3U
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641230147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEumu4clpyMcVYcCrmM37JgW1UnePyjeV43ml5RJOkI=;
 b=D9r0W8HC6N9TPslUZlUe+DDg8IEtx1RLdXAc6Po43jhOYGvVXGZiIrHYK+o9QGf7XqdsGs
 DWxZkGeHZnSfxvbg1irM5qwlA4tLk+bNsrc4/k9/fmJNP6r2x1QqLd7CwObJX1CBi8kfCw
 KWbLRNJNvTFlw0oKUdxODND+Fcou4ok=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-dP_RMFLkNKOLekBTYkJz7g-1; Mon, 03 Jan 2022 12:15:46 -0500
X-MC-Unique: dP_RMFLkNKOLekBTYkJz7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so16794154wms.7
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cEumu4clpyMcVYcCrmM37JgW1UnePyjeV43ml5RJOkI=;
 b=TsgmWjwlRirkomcmb7pMRwRM7VYNfefW63FDB4CVkWBq9vqIio5bqYCpxfMxEBc8xg
 AV7x8phWjH69mxL8TuaHQ433Cd5tgFDpk7emt9Zb5IsB5EJ7Q07XAYEVqR/s1qFNwL/M
 SuHZhzR809sykLJGJeGCsWKUanvzbdqt7Rm8EToD3thpPg55XVbn2PEEv85Eo5QsZJAf
 LF80wYj6zA7U5h9UsItLSJukjVgiHbPMzPEyjKmiAu3N5iCUmED8a3UQo2/xitpKC9Vb
 DjcuZCBHr/hgmdATqMLoUEAgCQrPS67FtZB7S3TAWookEIoaEMQwR0209OsUKnWHShZF
 ppjg==
X-Gm-Message-State: AOAM531dwTxpbLipKJaVsugxT62CypZZpycjpIwG6R4DK/nxMpgVSfoT
 AyuCKfVEcJuN7oVK5NxpRBPKehL6Dgm7C0y4GNN4zA8mt5JCYcpM0g5aHJYoEbDifa3UHUhi6NF
 O8Qb8mWqmjgn2id0=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr38848238wrx.357.1641230145741; 
 Mon, 03 Jan 2022 09:15:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/5TOYrvh6LvHew991Ab84Ha66ACwAWoEE7gu+sxSY8NDHDbr9ViopKSOamRRg4SGIykh9LQ==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr38848222wrx.357.1641230145465; 
 Mon, 03 Jan 2022 09:15:45 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b19sm40443637wmb.38.2022.01.03.09.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:15:45 -0800 (PST)
Message-ID: <5918a7a8-059c-381f-b124-d99cf456a138@redhat.com>
Date: Mon, 3 Jan 2022 18:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] qsd: Add --daemonize
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-3-hreitz@redhat.com>
 <cd049715-f17c-d605-00db-1bdc75944fb5@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <cd049715-f17c-d605-00db-1bdc75944fb5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.12.21 17:12, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2021 14:41, Hanna Reitz wrote:
>> This option does basically the same as --fork does for qemu-nbd:
>
> Can we share the code?
>
> Before this patch we already have --fork code-path of qemu-nbd and 
> -daemonize code-path of QEMU.. Now we have one more. Did you consider 
> improving and sharing the old code instead?

I didn’t really, to be honest.  I disliked sharing code with qemu-nbd, 
because, well, that would mean touching qemu-nbd (which I’d rather 
avoid).  Then again, I suppose we could theoretically just drop the 
daemonizing code from qemu-nbd, and replace it by calls to daemonize() 
and daemon_detach().  The only problem with that would be that we need 
some file into which to put it, that is linked into both qemu-nbd and 
the QSD.

QEMU proper already has os_daemonize() and os_setup_post(), but they’re 
quite different from what qemu-nbd does, for example, it doesn’t call 
qemu_daemon(), and it chdir()s to / (which we probably don’t want?).

I preferred to go with what qemu-nbd does, because I thought if it works 
for qemu-nbd, it should work for QSD, too.  Maybe I’m wrong, though, 
maybe we should just use os_daemonize() and os_setup_post().

Hanna


