Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9A628DCC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijg-0003yr-6J; Mon, 14 Nov 2022 18:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieW-0001o2-GG
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue7H-0006Zh-LK
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668450209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60h69kbBh6/0baY/wyEBWtKo6SJAk1J3vcnf7f8K+Q0=;
 b=DiN3X+YBEe+oqbPLC4dYvCG7IBJsH8iM+yXbZkYtTA7a2RjbVFeZLnXi+ogSbNhJbCAvET
 9F5RlD1r2wg+GiCJVst9OrEcywjcN+45MsgGTiAP6AnPX7v+VqZdNtw8ybEr6zf4vaK8Dq
 tq8edr+aKyhebGv+CPKnHVbonlaAuRI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-Ed2hphicPLyqIZkehO9QWg-1; Mon, 14 Nov 2022 13:23:28 -0500
X-MC-Unique: Ed2hphicPLyqIZkehO9QWg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z15-20020a05640240cf00b00461b253c220so8634878edb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=60h69kbBh6/0baY/wyEBWtKo6SJAk1J3vcnf7f8K+Q0=;
 b=r9Ak44otxDgAqVOxs1QQeO5+UyQalhvWz39lRZACOqGgLaufgkGLpC+hsZPvUpiv7x
 5xoDws+aOQZw3uLA/8NQSkFpKBYW+Weol0LHPjxxbW0bKx/nAdW97xuwvUVv6pAeqqt8
 nv96dh0X7sIiV6o/QkNE6FneqyYebTX7eFdzlJPW3adDTM8kwE36HVYeXDdEh02rNjmd
 P2UUYIHOwclGs5M1L94MsuM5a/xHT/QNCHQNwjCkFdTH8+YEmZKI9KW3g5wB4GU3NHRY
 mYtWyhBO0MBp02WG8QD3DBNPLNMVusQgCGyjNIet9iqpVgDVsiY+ohuB3QoAeS6Xg/Kd
 VuzQ==
X-Gm-Message-State: ANoB5pmCZLbSCiBiIvnBB8phuXBG0mo3WVqv6+reigRQIFbUpp23ZIcV
 iXTr341uwGy7fBgmgvxXBJsIKXYX8qeEiSkD5XptUfXlg6dmTBcv23FGDAx0f3LDojzw3hCsMKx
 QTi7jKZOtIahVE+Q=
X-Received: by 2002:aa7:c04a:0:b0:461:97fe:a331 with SMTP id
 k10-20020aa7c04a000000b0046197fea331mr11918123edo.238.1668450207191; 
 Mon, 14 Nov 2022 10:23:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JUAGNc+6KrxWfKjGwkU9asVOkqB2KzeY16j9KxlKQz+iX+pp7nhxzVSWWz+jRyjNk05iX7g==
X-Received: by 2002:aa7:c04a:0:b0:461:97fe:a331 with SMTP id
 k10-20020aa7c04a000000b0046197fea331mr11918109edo.238.1668450206968; 
 Mon, 14 Nov 2022 10:23:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a1709063ca100b007789e7b47besm4498162ejh.25.2022.11.14.10.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:23:26 -0800 (PST)
Message-ID: <e681724e-ef5c-3407-bcf7-950ca44583bd@redhat.com>
Date: Mon, 14 Nov 2022 19:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/13] block: Call drain callbacks only once
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-11-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-11-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08.11.22 13:37, Kevin Wolf wrote:
> We only need to call both the BlockDriver's callback and the parent
> callbacks when going from undrained to drained or vice versa. A second
> drain section doesn't make a difference for the driver or the parent,
> they weren't supposed to send new requests before and after the second
> drain.
>
> One thing that gets in the way is the 'ignore_bds_parents' parameter in
> bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): If it is true
> for the first drain, bs->quiesce_counter will be non-zero, but the
> parent callbacks still haven't been called, so a second drain where it
> is false would still have to call them.
>
> Instead of keeping track of this, let's just get rid of the parameter.
> It was introduced in commit 6cd5c9d7b2d as an optimisation so that
> during bdrv_drain_all(), we wouldn't recursively drain all parents up to
> the root for each node, resulting in quadratic complexity. As it happens,
> calling the callbacks only once solves the same problem, so as of this
> patch, we'll still have O(n) complexity and ignore_bds_parents is not
> needed any more.
>
> This patch only ignores the 'ignore_bds_parents' parameter. It will be
> removed in a separate patch.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c                      | 13 ++++++-------
>   block/io.c                   | 24 +++++++++++++-----------
>   tests/unit/test-bdrv-drain.c | 16 ++++++++++------
>   3 files changed, 29 insertions(+), 24 deletions(-)

I too would like parent_quiesce_counter to become `bool 
parent_quiesced`, but:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


