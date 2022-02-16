Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE54B84FA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:56:13 +0100 (CET)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH2i-000864-BW
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKH0R-0005T2-3i
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKH0P-0006fq-KK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645005228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7TzWL2PaBI5wiGbsKo3+61wk0hHz7orFJAmSejs4PI=;
 b=hw/3OtRDZCgRhI5TN0Th/vwbCfp/la8yTyiUTTBYMNDY786G++J7ajsIVdbtv1nECDPm61
 o6TJ9ImeY5nCDdnI+tQzwEDtngBrBbV5LhKN5U/1eB0HAUTREFjDOlwZVLVymmnIIrtbDn
 r2xUAfxY4qFq7g1YPUulwnO427cz1Dw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-JV0gl97gOku4AOsBtDevtg-1; Wed, 16 Feb 2022 04:53:47 -0500
X-MC-Unique: JV0gl97gOku4AOsBtDevtg-1
Received: by mail-ed1-f71.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso1236185edh.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g7TzWL2PaBI5wiGbsKo3+61wk0hHz7orFJAmSejs4PI=;
 b=Tz1qoCxedNDCgTrVOv4GfVSx8Y5vwpHSzIj5029v6gjZMjkENrTS64uk82P65u36yM
 i4TPeKebxiFlQNDuF2aZZNhv6gsuFnmzs5NAHvnNe/7S2kcOqnb7jAR844LsgsU3LWUz
 aMoe3Z2YOmey/PXixcMbYowNStWZIAYrmKnNTWRcTrMcO3twBqnfFjORrEYlUEPfK6c/
 +/3AEqV42N1HtFvFSzMI0JRt/W/qqvP2Ev14r7NeEtXaG/m6lbplUW2lT7+AK7SRNwZO
 XtT0eo9c3b82lX949CKjcT0k4AbWcmN/MCvpYyeWpLlmeWpCifVvYfAx1GWG0cLStEr5
 blHg==
X-Gm-Message-State: AOAM533QFrc9ow8sM6sN02oYyPYXe/ZxL3oI0kOY2H/jfkJJN3Q3uQx2
 7HOS4EI74uxDWPuhbbyO48wqxINbBBrLs+UWpjRthMw2EsM808jMI+iu1T04z0TapLMRHsI3+sS
 IVHQ6HrHyiSUaQv4=
X-Received: by 2002:a17:906:c214:b0:6b3:d0d6:9fe6 with SMTP id
 d20-20020a170906c21400b006b3d0d69fe6mr1586952ejz.150.1645005226685; 
 Wed, 16 Feb 2022 01:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIgZNd9o49yG+uKF5GKehY5mgGpMLEiW4ehjfQa/x/EaL0aXpZO5C8AUFPqgIpif39vzzPOA==
X-Received: by 2002:a17:906:c214:b0:6b3:d0d6:9fe6 with SMTP id
 d20-20020a170906c21400b006b3d0d69fe6mr1586938ejz.150.1645005226486; 
 Wed, 16 Feb 2022 01:53:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id i27sm3396208ejo.214.2022.02.16.01.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:53:46 -0800 (PST)
Message-ID: <3cdf9d19-3b02-10bf-e713-16087e0962fa@redhat.com>
Date: Wed, 16 Feb 2022 10:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] iotests/graph-changes-while-io: New test
To: Eric Blake <eblake@redhat.com>
References: <20220215135727.28521-1-hreitz@redhat.com>
 <20220215135727.28521-4-hreitz@redhat.com>
 <20220215222204.5f7rfyzh6plwvkij@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220215222204.5f7rfyzh6plwvkij@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 23:22, Eric Blake wrote:
> On Tue, Feb 15, 2022 at 02:57:27PM +0100, Hanna Reitz wrote:
>> Test the following scenario:
>> 1. Some block node (null-co) attached to a user (here: NBD server) that
>>     performs I/O and keeps the node in an I/O thread
>> 2. Repeatedly run blockdev-add/blockdev-del to add/remove an overlay
>>     to/from that node
>>
>> Each blockdev-add triggers bdrv_refresh_limits(), and because
>> blockdev-add runs in the main thread, it does not stop the I/O requests.
>> I/O can thus happen while the limits are refreshed, and when such a
>> request sees a temporarily invalid block limit (e.g. alignment is 0),
>> this may easily crash qemu (or the storage daemon in this case).
>>
>> The block layer needs to ensure that I/O requests to a node are paused
>> while that node's BlockLimits are refreshed.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
>>   .../tests/graph-changes-while-io.out          |  5 +
>>   2 files changed, 96 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
>>   create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> Since we found this with the help of NBD, should I be considering this
> series for my NBD queue, or is there a better block-related maintainer
> queue that it should go through?

Well, we found it by using a guest, it’s just that using a guest in the 
iotests is not quite that great, so we need some other way to induce I/O 
(concurrently to monitor commands).  I could’ve used FUSE, too, but NBD 
is always compiled in, so. :)

In any case, of course I don’t mind who takes this series.  If you want 
to take it, go ahead (and thanks!) – I’ll be sending a v2 to split the 
`try` block in patch 2, though.

Hanna


