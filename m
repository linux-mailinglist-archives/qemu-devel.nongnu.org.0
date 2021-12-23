Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA547E0D5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:25:57 +0100 (CET)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KMG-0003LA-Vc
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:25:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0KKb-0001xJ-5S
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n0KKY-0003Oj-Eb
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640251449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IR6b8jyyfY7mKOl6jSjrv1o4ap2cl20kuxvG37ZrmHA=;
 b=e+YocRRmfUEpgtCcmmRw5/LmNUNQsimhEvflKfNf8jyAqVZUXtEFvf1vXLYSDA7LfqKuzl
 bnSX79ySzPQWhciE4XZkI0ADg4AxzuwUmj3w5alxl7NVseGXDyPn+SY0RHPLehBPytvu7y
 QOkZc/qgBzDlluv/vsJdDRayxhY3XRk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-E2bDOAF_MLyI0XEnCgLWAA-1; Thu, 23 Dec 2021 04:24:08 -0500
X-MC-Unique: E2bDOAF_MLyI0XEnCgLWAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so4372056wms.7
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IR6b8jyyfY7mKOl6jSjrv1o4ap2cl20kuxvG37ZrmHA=;
 b=sNiKNkOJJwVj89/5qfJPvWUQrGxD5+ONoSV1MB3XXVY0rWpOiTrvpUN7go9BHfsEiR
 eQdbEYkcXAy6o61bTQ2jeQ6ZZb0nb3HR7WAuwrJg+fFD+Zdov3NpkrDwqBqINRTy88JI
 MOC/eLYc5rcMkHMZ/EmiprtFiktXn3ETKBe6xgL/dXm5fTrOE0bXemP6aR+RO+akPnU8
 tFgb7ClzMkTtkcc6xNPg46CjeCLySyh+IZP/MYxoh+y/eqTLMNtr63HHgSgY/ui+KEfh
 tg/YrL4CkT37qvYwpjSJOGkhputp+APlQ+djUPJwwdTv72AM5UuGt/MK8o2ZrPL0YBVR
 9uzQ==
X-Gm-Message-State: AOAM5320ndMyvrLm04Z3NETRVkzc2XyPrk6IeWhijXlaMLTu7e0hgrYV
 vfcEuvYBxa6z35GRkwIcuNsi1mj3QaWWw6bcmHRUY9meZJNRkINJ0MfZg6B08jtxKElVt+6PNtA
 ZX2lqOIYImoPQmsw=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr1162881wrp.500.1640251447533; 
 Thu, 23 Dec 2021 01:24:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVt17e/+iIe+UbbFYgkGfjollOaF3K/0WifbUslWMVkGtxv0LfkH1dqQHBLMUoVLpoNJWOyw==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr1162854wrp.500.1640251447276; 
 Thu, 23 Dec 2021 01:24:07 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 9sm5650523wrz.90.2021.12.23.01.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:24:06 -0800 (PST)
Message-ID: <127a757c-5af2-d4a7-8f8d-3edca1af27b8@redhat.com>
Date: Thu, 23 Dec 2021 10:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.1?] iotest: Further enhance qemu-img-bitmaps
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210721204616.652155-1-eblake@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20210721204616.652155-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.07.21 22:46, Eric Blake wrote:
> Add a regression test to make sure we detect attempts to use 'qemu-img
> bitmap' to modify an in-use local file.
>
> Suggested-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>
> Sadly, this missed my bitmaps pull request today.  If there's any
> reason to respin that pull request, I'm inclined to add this in, as it
> just touches the iotests; otherwise, if it slips to 6.2 it's not too
> bad.

(Going through my patches folder...)

Not sure if you’re still interested in this, but if so, we should skip 
this test case if OFD locks are not available (like 153 does).

Hanna


