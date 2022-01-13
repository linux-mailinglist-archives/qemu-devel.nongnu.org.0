Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A325348DB79
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:16:17 +0100 (CET)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82lr-0007Ig-Km
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:16:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n82gd-0004YU-Nc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n82ga-0006R9-CJ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgfUBKlaJyAwdOK3UfsCcQ17N07xfU47IxcPhdnvnKY=;
 b=ZEHfPtBa/49/ytMWMaWMqxtIvyT500grTz+Db9W5LHn5x1BOVVx9Lrkx0r8TBG+QFeGwSd
 8cH1sQaBne7ITB9U1c2bwBQzPoaEtMJIM+KXCF7UmjyAroGDkSAFbJ6jBLb3MZnop1pQE1
 qUxR/Bvr/XJs+NBHGaqi4C/BWBJWfXI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-CEqp4Q1QN3-1zkneOVGDXA-1; Thu, 13 Jan 2022 11:10:44 -0500
X-MC-Unique: CEqp4Q1QN3-1zkneOVGDXA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so3856522wmp.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YgfUBKlaJyAwdOK3UfsCcQ17N07xfU47IxcPhdnvnKY=;
 b=se7pjU6UjrjKuGNe9pfz4AnDNarnPrJDbzBTC9eHP/aULrp7byyoYpnVDoUwlQ/DHe
 8UklPtjRyWr59wP5ZfV8ZVcI7bLzkL04C0UAZI2ZC0H1GTVu61WQDNny5Rlleitcci0Y
 OU+PqcCh76jIhRZGmS02j5RzJfwjQV1ndECTSWI95Ni8W5viQ+njPWdc35EEQSLYWlD6
 ZajD0dxT/wxoCIgrjGDbDZkmV12vlueOwtY5aN+QpBvZlvoi73C5IroL0cyZU+RFPYl9
 OodkM+srtV3ho/bjF7Oliw9ibpEv80Ok1zrwDS5J0CSvXcqGaYB8VcC/qWz+rCYlFXKy
 gGHQ==
X-Gm-Message-State: AOAM530FS9W4TYfsye06hjCS+219ahHu13mCH/Hap2aFGpYk3reHGiF9
 QiRDYhWD9m5J0MyIiKl/hXlX7o2hdNa1JKE2K9oQqhD6AtSabrtQbPJPrD0hGM3llNUZDlvvxR9
 X732wItOvYHmZrG8=
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr4812863wrw.224.1642090242870; 
 Thu, 13 Jan 2022 08:10:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXZ5iTCNyVDE5hc8wLQBRv9jm10ysqrgPIcu8UmSV6CSe2hmjCgz8ttISvJh0jI0yG4ogBAA==
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr4812850wrw.224.1642090242662; 
 Thu, 13 Jan 2022 08:10:42 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k10sm2997403wrz.113.2022.01.13.08.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:10:42 -0800 (PST)
Message-ID: <0bdee587-49fe-7bfd-21f8-1c846e676ba8@redhat.com>
Date: Thu, 13 Jan 2022 17:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] iotests/MRCE: Write data to source
To: qemu-block@nongnu.org
References: <20211223165308.103793-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211223165308.103793-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23.12.21 17:53, Hanna Reitz wrote:
> This test assumes that mirror flushes the source when entering the READY
> state, and that the format level will pass that flush on to the protocol
> level (where we intercept it with blkdebug).
>
> However, apparently that does not happen when using a VMDK image with
> zeroed_grain=on, which actually is the default set by testenv.py.  Right
> now, Python tests ignore IMGOPTS, though, so this has no effect; but
> Vladimir has a series that will change this, so we need to fix this test
> before that series lands.
>
> We can fix it by writing data to the source before we start the mirror
> job; apparently that makes the (VMDK) format layer change its mind and
> pass on the pre-READY flush to the protocol level, so the test passes
> again.  (I presume, without any data written, mirror just does a 64M
> zero write on the target, which VMDK with zeroed_grain=on basically just
> ignores.)
>
> Without this, we do not get a flush, and so blkdebug only sees a single
> flush at the end of the job instead of two, and therefore does not
> inject an error, which makes the block job complete instead of raising
> an error.
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> As hinted at above, I think this should be merged before Vladimir's
> "iotests: support zstd" series, or said test fails for me with VMDK.
> (At least on one system, not the other...  Would be too easy otherwise,
> obviously.)
> ---
>   tests/qemu-iotests/tests/mirror-ready-cancel-error | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Applied to my block branch.

Hanna


