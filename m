Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77B3219D2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:11:20 +0100 (CET)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBvj-0007XN-EJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBrN-00042Q-FI
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEBrM-00060C-2o
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614002807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuY9BHBUYQEWoQmrYGHVV9tyIaFbzXG6VMx77a3guvY=;
 b=Ztq3GOYozfI28hP9jxkroA+FBn/LTWL5V5Jttd91B+bLOkY+wJLVuJG3Jc07JbdIyPMS6e
 QPa3kF0M+YRrmoXk+uNLzOEIMMVNXi8aM7ec7NTO4y6TTc2h9RBZ72c0BOV7IPKWh4p4un
 +WemUFO2jFungC4wiFpW6jYgR4AHGlY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-Gwvv_wYiMlqjUSxgGLf2-A-1; Mon, 22 Feb 2021 09:06:38 -0500
X-MC-Unique: Gwvv_wYiMlqjUSxgGLf2-A-1
Received: by mail-ed1-f71.google.com with SMTP id g20so4476138edy.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:06:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuY9BHBUYQEWoQmrYGHVV9tyIaFbzXG6VMx77a3guvY=;
 b=ETpswMrVTOs/H5YfxcvIRCTOpazJKPKqj01Mfw3sHL7od2c35lanXdSWAJFyFKAec6
 9XUbv2SVTUbjRLUfozqRIJ65tZPGAig8sbqXzxVYIQJ8UdImAZiO2JxnU0DeplOJWh9x
 T3/aP4UHz4jRqogw2OwQK9B7zU25bjHOg6yUFUZzZ412ONaz5wUp4gsyJgh4qK2qlHB4
 KaxL/6dunlG4n1hUUInUA1vHkz8fiVT4+g8ppATnCDEkUVYf9YnOz8gdyYPFjaA9N4OU
 ye2rTxPsHwD8Skp7j+b6ZzNm9mvuyDgz/mm7pfkAS7ucuPD4mTEm6zjnRwcqLj2Bw6lr
 FT3Q==
X-Gm-Message-State: AOAM5303nqpfPmI8ZxEOhQhKZnUBin9csWP32Z9seNS603fi0iz1E4bG
 DFoda7nuwRUIVfUpVYLj0zl6KMzObexS4Uvd+gbP0/OIFq/cj9ITTX5ZmNxT4bjDWUjVRyFPb94
 N58RqDdF5rWlhmZs=
X-Received: by 2002:aa7:c542:: with SMTP id s2mr2688195edr.369.1614002796872; 
 Mon, 22 Feb 2021 06:06:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx93pY7gcwfcuhmC4Z/wVuQ2JzwwBxmvbm9PVP4dIrCe42sq1AhkJtUBny+nezlPRKWems9Cw==
X-Received: by 2002:aa7:c542:: with SMTP id s2mr2688175edr.369.1614002796663; 
 Mon, 22 Feb 2021 06:06:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d26sm12141262eds.71.2021.02.22.06.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:06:36 -0800 (PST)
Subject: Re: [RFC PATCH v2 3/3] hw/pflash_cfi01: Allow devices to have a
 smaller backing device
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
 <20210222090747.2310104-4-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <012fce58-9543-eb63-0358-a0b3f135f6c2@redhat.com>
Date: Mon, 22 Feb 2021 15:06:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222090747.2310104-4-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 2/22/21 10:07 AM, David Edmondson wrote:
> Allow the backing device to be smaller than the extent of the flash
> device by mapping it as a subregion of the flash device region.
> 
> Return zeroes for all reads of the flash device beyond the extent of
> the backing device.
> 
> For writes beyond the extent of the underlying device, fail on
> read-only devices and discard them for writable devices.

This looks much simpler now.

> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/pflash_cfi01.c | 108 ++++++++++++++++++++++++++++++----------
>  hw/block/trace-events   |   3 ++
>  2 files changed, 86 insertions(+), 25 deletions(-)

>      if (pfl->blk) {
>          uint64_t perm;
> +
>          pfl->ro = !blk_supports_write_perm(pfl->blk);
>          perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
>          ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
>          if (ret < 0) {
>              return;
>          }
> +
> +        inner_len = blk_getlength(pfl->blk);
> +
> +        if (inner_len > outer_len) {
> +            error_setg(errp,
> +                       "block backend provides %" HWADDR_PRIu " bytes, "
> +                       "device limited to %" PRIu64 " bytes",
> +                       inner_len, outer_len);
> +            return;
> +        }

Do you mind extracting this change in a previous patch?

Thanks,

Phil.


