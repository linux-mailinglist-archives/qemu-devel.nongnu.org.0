Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A8314376
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:06:50 +0100 (CET)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FcI-0004mp-1U
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9BiY-0007tE-Kj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9BiU-0003F1-9C
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612810616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7ylG+4QEZaX5nK1N0z60ilKxTlAz/EHUZFZJZGjI5c=;
 b=WFHnOaEuVjvJ5QzbQcOsCZuz7P5DnYPbKo4hvrfVro/2q4wwydDztLTWDtSht9p1PK3nrQ
 rnPwuvFwqpM/JhShRamwYFcRzGY+7lgcp7yZIp3WwxsLc9epqfyjMAtzSsOLiAn+BXFm4t
 DoALWvM3xxjlQFXurGZqitcBJfHSDmA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-j9O9MwwVOT6rEW5AYzFAAw-1; Mon, 08 Feb 2021 13:56:55 -0500
X-MC-Unique: j9O9MwwVOT6rEW5AYzFAAw-1
Received: by mail-wr1-f71.google.com with SMTP id w16so1124101wrl.15
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J7ylG+4QEZaX5nK1N0z60ilKxTlAz/EHUZFZJZGjI5c=;
 b=lfaGqIYBtaCAy4GsH9klHDHbEpfzqVqL/DKIhF1riIDDs+0rQ0wqIVRS2PCgDblWrq
 e3U1Vh9VzeKTAQEz2TOQ30sgC25j6kS1Q+6mXxbJUWJLtVSOrmOJj3fLH+bSetCmxw6Z
 B44U+zmyxUGKvwYAfJKpzZ66YokhM6Yw1xtYiDw8brnMzwbmh4iw+9DirFKwqR+rvLLt
 sb7/yg33xyOAo6fKilKaGu0G9/GMxL6YTzdSU5vXASvKfmqrUEB5boMEo5bhBe81SJpe
 d0R5SM9fGj0a11a5bGmdYNMMebhPuE4dfFBRK5/MYY1CXKWEntqheB8pzInwLQWCEnyD
 4xkg==
X-Gm-Message-State: AOAM532BdnEkYWchmi+JYUhrEfK3c6XhY6bNODJRDNrhTG/50+X2yrJe
 ZCcejkENUYYXwb/YwQtUFNLPxG6KxGBT/PGMDbHgleW9v6zyFtkP/xqrS9z/jCMRTLFxvqp8knc
 gvmqH+x21Ljn9XFU=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr208660wml.100.1612810613805;
 Mon, 08 Feb 2021 10:56:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrhvIDS74Ygz9pKkVsPaTYEKbmJ35ff3OIhweUhtqSTkVS0dbbe7szogmtQ0kSbWvp3Wf94g==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr208640wml.100.1612810613605;
 Mon, 08 Feb 2021 10:56:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z18sm31738794wro.91.2021.02.08.10.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 10:56:52 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/block/nvme: use locally assigned QEMU IEEE OUI
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210208141012.377500-1-its@irrelevant.dk>
 <20210208141012.377500-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8538da5-ee8c-909c-bf1b-c8dc042bf243@redhat.com>
Date: Mon, 8 Feb 2021 19:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208141012.377500-2-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 3:10 PM, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
> the controller to use a Red Hat assigned PCI Device and Vendor ID, but
> did not change the IEEE OUI away from the Intel IEEE OUI.
> 
> Fix that and use the locally assigned QEMU IEEE OUI instead.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index c2f0c88fbf39..547a3073ef1b 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4686,8 +4686,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>  
>      id->rab = 6;
>      id->ieee[0] = 0x00;
> -    id->ieee[1] = 0x02;
> -    id->ieee[2] = 0xb3;
> +    id->ieee[1] = 0x54;
> +    id->ieee[2] = 0x52;

Shouldn't this be conditional on 'use-intel-id'?

>      id->mdts = n->params.mdts;
>      id->ver = cpu_to_le32(NVME_SPEC_VER);
>      id->oacs = cpu_to_le16(0);
> 


