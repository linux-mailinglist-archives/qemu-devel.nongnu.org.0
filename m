Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED674646F8F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Fwj-0007nr-Rt; Thu, 08 Dec 2022 07:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p3Fwh-0007n5-Da
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p3Fwf-0004T7-Eh
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670502247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdXNmNdByBCjTaJVXABvuZJ/5cL1aLDfIzpDB8xh+OQ=;
 b=jItJe21jzXhThXeit9QrMSgylQYz9dGmZfl/FztppKkAoT2VbirSbhpyTCN4a6BqH28o+9
 bDP0uvnHF+7K5UNH/3fHIe6rUbqCuAemsqirxAawPys6wyjfzAK74OpyUbPZrMQiwVx26J
 FHOGFbNzNFfhoknuAt90rXB7kZ+Ta1g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-BdvB_A97Ooy4NqPUPCgEyg-1; Thu, 08 Dec 2022 07:24:06 -0500
X-MC-Unique: BdvB_A97Ooy4NqPUPCgEyg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr21-20020a1709073f9500b007b29ccd1228so967252ejc.16
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 04:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KdXNmNdByBCjTaJVXABvuZJ/5cL1aLDfIzpDB8xh+OQ=;
 b=Ix8qWXff4RXtsgDsymqvWs5RjMM1t2Iu9JA2YqtxDWkijBFO9kjg8CySoAw0DuktD8
 MP/Cqm823OG/xG8pEonitFRzpS6uQEsPTbMjc55S9kAP1u5if6cfHB6yr6goXEe+pkqK
 TLyW/kHQ8dtzuxJu7clydOZzY8bmxOI0ih/QfYHVcWDnlm1R4vS9zqSnL+Zu4RkUYcP8
 Q/fzujRm4OWDJz4xEgM63QWTfSZUejzW4vZ+RU2AO4sZl9342DfQYi5ENvYL3CyZcfD7
 DpkCFjp1FjFRPy0bh0DkCF5/qiK4nLRfHUi2bfmuFsGEAi1c9MVMO+P2+C0CYyQBAZmh
 p3kQ==
X-Gm-Message-State: ANoB5pnzLQKy/5DmgJD9wU8KBEG2KI6SX+4d1qTs6juMH2gcOVVXPkFs
 oqeqY/KDKXQUsmheTUbC8CuTxVFkzee6n6lp03bEYy23TAZaMAfs9bJIbRWFc6Y7sGTA9o/Eozu
 yAp465Y8E4+1O5+E=
X-Received: by 2002:a05:6402:c1b:b0:46c:b7a3:c978 with SMTP id
 co27-20020a0564020c1b00b0046cb7a3c978mr14271053edb.120.1670502244462; 
 Thu, 08 Dec 2022 04:24:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Ev01ItcSTohiKtslBr1s+gPQp5gldq7th+rexsSYhwSnwuVEumiz7JL/8ITs9Pmwu0vFmMw==
X-Received: by 2002:a05:6402:c1b:b0:46c:b7a3:c978 with SMTP id
 co27-20020a0564020c1b00b0046cb7a3c978mr14271033edb.120.1670502244012; 
 Thu, 08 Dec 2022 04:24:04 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a1709064b1500b007c10bb5b4b8sm3047372eju.224.2022.12.08.04.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 04:24:03 -0800 (PST)
Message-ID: <7c2c9623-c865-91a3-01b7-0e7f90fde278@redhat.com>
Date: Thu, 8 Dec 2022 13:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/12] qemu-img info: Show protocol-level information
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20.06.22 18:26, Hanna Reitz wrote:
> Hi,
>
> This series is a v2 to:
>
> https://lists.nongnu.org/archive/html/qemu-block/2022-05/msg00042.html

Ping, it looks like this still applies (to the master branch and kevin’s 
block-next branch at least).

Hanna

> So the final state is that despite the QAPI changes, hopefully only the
> qemu-img info output changes, and it now prints every image node’s
> subgraph.  This results in an output like the following (for a qcow2
> image):
>
> image: test.qcow2
> file format: qcow2
> virtual size: 64 MiB (67108864 bytes)
> disk size: 196 KiB
> cluster_size: 65536
> Format specific information:
>      compat: 1.1
>      compression type: zlib
>      lazy refcounts: false
>      refcount bits: 16
>      corrupt: false
>      extended l2: false
> Child node '/file':
>      filename: test.qcow2
>      protocol type: file
>      file length: 192 KiB (197120 bytes)
>      disk size: 196 KiB
>      Format specific information:
>          extent size hint: 1048576


