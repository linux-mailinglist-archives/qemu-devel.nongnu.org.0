Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6124754C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:59:21 +0100 (CET)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQ88-0005DY-HZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxQ6K-00043A-15
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxQ6H-0004Xy-P4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 03:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639558645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yj/XZvMGTykLl8wi5cH9gGs3op99FuY6anvZIlfaQ5Q=;
 b=ND2coGhB6hMkq6a54W5+6x54nRLVKrQ3P11FpnsyXtjHxRqc7T65nugLtaq58CmI+mQ/0s
 Z3U/rPVhBTHqwskYR+XcLFvDp6TJy6zB+WwItV9MVhm10s3ql2C3zvmWotwCZgrPbWeZsp
 aSoCvfnLLVf9/MhIkhZmidKWFkfgXck=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ogCudbyfPOqfTmvtpHFtcA-1; Wed, 15 Dec 2021 03:57:18 -0500
X-MC-Unique: ogCudbyfPOqfTmvtpHFtcA-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo19445731edb.20
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 00:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yj/XZvMGTykLl8wi5cH9gGs3op99FuY6anvZIlfaQ5Q=;
 b=mkwySrFrpn97r1PRlai9g0DP+sgqmJRfDsJNavP/PcfWJx+PjKAwNIc6xbZhU17nT/
 z3mrtGIn5WjCywuU8aYK/9u4t2XRYi4U2milB2C4mB7Ed5NQdHsNjYSJvcV47k4utibD
 akgcMvBZ+oFcjK1M/FcghqCM3LjAtYhMWyWemHlP+0zcA3V+2KxUqFia5id94Xu0T6AZ
 HUCF/7Gpnq1ICSkFccSNcNfiR5eTHS9IFZ2Pw15GKgUgIlq8GFwUgm8HbPaeAvw++T/j
 3R6lYn6pA39LhsfVsAAVLaEyZwv3kqF+yUAWkSqMzt6o+lGtmow5PAsfSYGFoMyELqV8
 AEtQ==
X-Gm-Message-State: AOAM532xKk15W+YB8mwoNlmP/nDVo8rz98PezpcH6CMUbX8w5+RREm2v
 BpNyivKI+A3w2n+ROGaj0G3QXTyJ7DsgbY1ERrPHCyL4YzlpHnk6q0kIXeI4u45hKNzc7/UTSN5
 jUjQKTDFpqZPkEMg=
X-Received: by 2002:a17:907:7fa2:: with SMTP id
 qk34mr10075706ejc.691.1639558637283; 
 Wed, 15 Dec 2021 00:57:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSaCbVzklmj1kvMz6+krpDj3zqNuSTypY/DUeb7O1VHmL2ceW5bSNo0mduxu1oyJVnDNt/Dw==
X-Received: by 2002:a17:907:7fa2:: with SMTP id
 qk34mr10075671ejc.691.1639558636989; 
 Wed, 15 Dec 2021 00:57:16 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id 9sm438773ejd.199.2021.12.15.00.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 00:57:16 -0800 (PST)
Message-ID: <449921a0-4f53-f57a-a47b-a6707b551f67@redhat.com>
Date: Wed, 15 Dec 2021 09:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 05/31] block-backend: special comments for
 blk_set/get_perm due to fuse
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-6-eesposit@redhat.com>
 <2b924119-5bfd-d00d-169d-5cf1d7460116@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <2b924119-5bfd-d00d-169d-5cf1d7460116@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/12/2021 15:38, Hanna Reitz wrote:
> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>> Fuse logic can be classified as I/O, so there is no BQL held
>> during its execution. And yet, it uses blk_{get/set}_perm
>> functions, that are classified as BQL and clearly require
>> the BQL lock. Since there is no easy solution for this,
>> add a couple of TODOs and FIXME in the relevant sections of the
>> code.
> 
> Well, the problem goes deeper, because we still consider them GS 
> functions.  So it’s fine for the permission function 
> raw_handle_perm_lock() to call bdrv_get_flags(), which is a GS function, 
> and then you still get:
> 
> qemu-storage-daemon: ../block.c:6195: bdrv_get_flags: Assertion 
> `qemu_in_main_thread()' failed.
> 
> It looks like in this case making bdrv_get_flags() not a GS function 
> would be feasible and might solve the problem, but I guess we should 
> instead think about adding something like
> 
> if (!exp->growable && !qemu_in_main_thread()) {
>      /* Changing permissions like below only works in the main thread */
>      return -EPERM;
> }
> 
> to fuse_do_truncate().
> 
> Ideally, to make up for this, we should probably take the RESIZE 
> permission in fuse_export_create() for writable exports in iothreads.

I think I got it. I will send the RESIZE permission fix in a separate patch.

Thank you,
Emanuele


