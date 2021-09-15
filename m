Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30740C454
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:21:39 +0200 (CEST)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSyv-0006P8-DP
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQSwz-0004l5-Cu
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQSwV-0002r1-Rj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631704745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKGtrpLJ2wfwNcCmbGtULxPlANU3kncZIOHFXXe0m8w=;
 b=Vp/j8uM9nwXhLk51pu8Fhm54tGlg06QuWYT6Yl8bvkGpIncJXww3X/10lMvTZwOFJ1Bq2D
 xsopVBqYXGi6A+fI3vu8jXJDGWNbRBj8QhKz/XUPMKKJMps7gBVMBVSOk15W5QUf/0cdF6
 mZmhBLIuacrgZ8cO91f9uyP1RXIRYQA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-ybI5ZqRTMWGIaxw0_Zg0mg-1; Wed, 15 Sep 2021 07:19:04 -0400
X-MC-Unique: ybI5ZqRTMWGIaxw0_Zg0mg-1
Received: by mail-wr1-f70.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so895170wrv.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 04:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sKGtrpLJ2wfwNcCmbGtULxPlANU3kncZIOHFXXe0m8w=;
 b=rlorprqHkUgEkil3EwuxQwaFJ6yqDdv+x2CcaYfURgcvjid+F+5Q79hT5kMR3ImErw
 DiysJ05+q9IqFFrGkWTWuqGp7Rf6+Oomm5Eq8BAt1xePZJcxNFzUqAZHZgZK6VvwbK/E
 3a2KG0rX/mNZV+UkSHlILQqfWdX9IBCEbUmtGYK/MoIIZr9ixmqNMZhQWzBIckosFAJC
 /lAnHWc+83txLpbgKuFcDFErX0SWjsTKWMos21uXFY2Ht9IgDQ/wWHslYXwUlqaeCvUO
 rlmlTEPcpbkD/2xM2WC0oxd3XTq+LCsuGI1IKTCwHU01C3VPZQSfis/xgyn/wwGcxt3a
 olaw==
X-Gm-Message-State: AOAM531uCjpnvoZrMRbV/SFsPyK6uzA+WEvnUZJjXsp7HZn8ygObwTeK
 WvZD3GO57lmq1aZSNiTHuumWl8Knpy0fEbYQGUL8ZAWKtrjdMOQYFD68j5t3TPZ7jwTwb9wc/5N
 Zx9ll9vgSEF9W1Hc=
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr4378549wrv.154.1631704742890; 
 Wed, 15 Sep 2021 04:19:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSGTHH8fH/8RVIq43rsLyM0t4XNg5vywAFjrYW1sJFiil/xIB13SrzSUEf0pbIpuwP7v2ZBw==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr4378532wrv.154.1631704742721; 
 Wed, 15 Sep 2021 04:19:02 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id e8sm13559224wrj.48.2021.09.15.04.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 04:19:02 -0700 (PDT)
Subject: Re: [PATCH] qemu-img: Add -F shorthand to convert
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210913131735.1948339-1-eblake@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <d6cc5017-319c-5349-5bf1-677580d590f9@redhat.com>
Date: Wed, 15 Sep 2021 13:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131735.1948339-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, berrange@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.09.21 15:17, Eric Blake wrote:
> Although we have long supported 'qemu-img convert -o
> backing_file=foo,backing_fmt=bar', the fact that we have a shortcut -B
> for backing_file but none for backing_fmt has made it more likely that
> users accidentally run into:
>
> qemu-img: warning: Deprecated use of backing file without explicit backing format
>
> when using -B instead of -o.  For similarity with other qemu-img
> commands, such as create and compare, add '-F $fmt' as the shorthand
> for '-o backing_fmt=$fmt'.  Update iotest 122 for coverage of both
> spellings.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> This stemmed from an IRC conversation; I'd add a Reported-by: line if
> I can figure out how to credit more than just the nick bparker_.

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block/

Hanna


