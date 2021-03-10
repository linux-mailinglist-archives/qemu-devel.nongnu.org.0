Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D388333CBA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:39:40 +0100 (CET)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJy7n-0003aM-Mn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJy6G-00038M-6u
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJy6E-0002dq-BV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615379881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3iN8BX10Y1p1b59wHjKQeEYKPrF78zDC5ceZQ6LXUs=;
 b=iTnTzsyPuQELP3WFTXrUTatu5xNSfZNIOrLA4cIGRCorW/UHa6FMBLzWuw8v2EOO3UnvwF
 2TwG2LSuoU+Igwfq4sjtARHPfEN0GQD0zz0wMfoeQ/ujNQYYMRb9xd4Jw1uq8LdHnvfSA7
 Vm7udUIZsCymSx6Mn8t+x3G/po5FPIQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-pJsZVblwPmuJ1gfo8yCrwg-1; Wed, 10 Mar 2021 07:37:59 -0500
X-MC-Unique: pJsZVblwPmuJ1gfo8yCrwg-1
Received: by mail-ed1-f69.google.com with SMTP id q2so8244759edt.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 04:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z3iN8BX10Y1p1b59wHjKQeEYKPrF78zDC5ceZQ6LXUs=;
 b=VPxH0R9ovWJ3X8f67e6KWn9PSiV50395482O80jw9bTnt1H/J4PbEh/RvMzukO3IQ+
 OYUgQ5Dy+NTU2x+66mcrXIwXc47HBtSwnLMMTqkpyKctGmbjcIZzyTWZwovbSSiwGmGq
 bkH+kToJWwZLi6q1/eXo69g18VPDnwPVJQOMe35HCzl6rsrHo3CgAMB1VI5Bri7ItnIF
 oT9vFJRqePyA+nFoWPpBr7kVF13CI6WO/ST12vRr5wHEbYpdC0K9eudTK8obw1p7Gsf6
 vuAOdxVtbi3rizoT3bZDTSNOICLQmd232Vs9O5Y2QxfXuHRvw82gvnVgDNli69WJGyuO
 lJLw==
X-Gm-Message-State: AOAM533gtx5y6MyL74rfplNxIlvI3KY0UgYENup3/MOd7Nw82c85Ai02
 ih8WszRigTOH4fuyJP2J01rbc+Zig2ivcslsEPy+ELZo+rsyNTAOffpFeUpixrJWIPwfqh6ou5t
 OIaN7U5amlJUqW2s=
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr3570379ejt.74.1615379878312; 
 Wed, 10 Mar 2021 04:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiDKYvgifDWXtilndOnP6DpTohlQBRfLTCfoIWm+TF65z+bKnD3vABE1CEXxK9kWY8MbewHw==
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr3570366ejt.74.1615379878195; 
 Wed, 10 Mar 2021 04:37:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm9716784ejz.109.2021.03.10.04.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 04:37:57 -0800 (PST)
Subject: Re: [PATCH 0/3] block: Introduce the 'zeroes-co' driver to help
 security reports
To: Fam Zheng <fam@euphon.net>
References: <20210310114314.1068957-1-philmd@redhat.com>
 <CAGNx5+11ngxmX0CYKL3q_FRsZCQbT15-HfuuFgLd=MyEXo_h9g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a46d49ad-4bb7-e638-7124-2c259bb2ecda@redhat.com>
Date: Wed, 10 Mar 2021 13:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGNx5+11ngxmX0CYKL3q_FRsZCQbT15-HfuuFgLd=MyEXo_h9g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 1:32 PM, Fam Zheng wrote:
> On Wed, 10 Mar 2021 at 11:44, Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
> 
>     Hi,
> 
>     This is an alternative approach to changing null-co driver
>     default 'read-zeroes' option to true:
>     https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html
>     <https://www.mail-archive.com/qemu-block@nongnu.org/msg80873.html>
> 
>     Instead we introduce yet another block driver with an explicit
>     name: 'zeroes-co'. We then clarify in secure-coding-practices.rst
>     that security reports have to be sent using this new driver.
> 
>     The 2nd patch is RFC because I won't spend time converting the
>     tests until the first patch is discussed, as I already spent enough
>     time doing that in the previous mentioned series.
> 
>     Regards,
> 
>     Phil.
> 
>     Philippe Mathieu-Daudé (3):
>       block: Introduce the 'zeroes-co' driver
>       tests/test-blockjob: Use zeroes-co instead of null-co,read-zeroes=on
>       docs/secure-coding-practices: Describe null-co/zeroes-co block drivers
> 
>      docs/devel/secure-coding-practices.rst |   7 +
>      block/zeroes.c                         | 306 +++++++++++++++++++++++++
> 
> Why not add another BlockDriver struct to block/null.c and set the
> read_zeroes field in the .bdrv_file_open callback? It would make the
> patch much simpler.

This is the first patch I wrote but then realized you are listed as
null-co maintainer, so you might be uninterested in having this new
driver in the same file. And declaring the prototypes public to
reuse them seemed overkill.

Anyway I'll try to find a simpler outcome by simply improving
documentation.


