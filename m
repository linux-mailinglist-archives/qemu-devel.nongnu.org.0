Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF6243C1CA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:41:52 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfal6-0005dz-29
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfajr-0004ut-01
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mfajo-00060F-7A
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635309630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umNHLK22isz46d0CPlxEp9fKVa33A7WuYaWv/7Tl3LE=;
 b=SXfjnf37wV93TNj5Pgp2PT69c+HjKYqfJgR3PEHlSBuGVoNz8ce8cbXPP4092J0UYv3/P2
 YT88NaNtyMlNDiCjQNpbb88fhqKRcbA0gUPvQZTcQwdNQWHq00aV7jdyrRCV6bOZczPc7H
 a9TNJEfxv67qcFnuvwCV+o1qAfzdlS0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-umEhtPr3OX-EPpcUUtrZsQ-1; Wed, 27 Oct 2021 00:40:28 -0400
X-MC-Unique: umEhtPr3OX-EPpcUUtrZsQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 hg3-20020a17090b300300b001a3fd07578aso296155pjb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=umNHLK22isz46d0CPlxEp9fKVa33A7WuYaWv/7Tl3LE=;
 b=Cjv+9r5E97Lai8LRXk9r4SvW0tMt/6yV9duBF41KLzBZzBnvGkZAY2wutNvUQxRgDF
 dyjmo1TuR5tg7KNnlv2Jxkrnv3i4SILMrtdSF1HGt5b51cB2yZI8uXS5qvh8BhuHmP7p
 bg9xsOh6cj+2ps+gv8QnZBGJFi4joJ/mbAdjQWGePhFykkpm1dsvjo/cB5o7HjdhV2oT
 WMjikJ8cTT4fG0OYA2TKSxFOnItdUYDq4PnJRhpRibCk7T45b2zIzT250ACe1yUQBvs1
 oIuQaOH0rqkUcGKK85TSdzGl+S1LJys+OPGk5u6uNNbI0DYcXNLutljivKqW5A+Tr9cS
 /p6Q==
X-Gm-Message-State: AOAM530QgoqQCYXodUyLEW8Mam0N/8fJLmkxJ+fUZhPHT0HSbeui6r6g
 9uUJ5SsVKwm4VVxQqe+vTWcf1uELR6OKaBTsa+47MZH+9onrC6rT9a4siQJGzdX99WAQKNwbW3T
 jHClKSZR8YuI7wpQJWn+4ot4yoEQQHoZWmKeDPi7eHkzbpp6D73yUEAkU645EGOphF5E=
X-Received: by 2002:a17:90b:4f8c:: with SMTP id
 qe12mr3287896pjb.237.1635309627587; 
 Tue, 26 Oct 2021 21:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAdYKVzxDH4WYp7bhic7VnhqYC1aIhehe/LqYZ7/3acisj/8kM8gyaY8dHpFWmZv+UAH2DPQ==
X-Received: by 2002:a17:90b:4f8c:: with SMTP id
 qe12mr3287862pjb.237.1635309627202; 
 Tue, 26 Oct 2021 21:40:27 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id l11sm26299563pfu.55.2021.10.26.21.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:40:26 -0700 (PDT)
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org
References: <20211021161047.578751-1-jmaloy@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e4005dba-3e44-71ac-a1bc-edffdf503f8a@redhat.com>
Date: Wed, 27 Oct 2021 12:40:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211021161047.578751-1-jmaloy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/10/22 ÉÏÎç12:10, Jon Maloy Ð´µÀ:
> The fact that the MMIO handler is not re-entrant causes an infinite
> loop under certain conditions:
>
> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
>
> We now eliminate the effect of this problem locally in e1000, by adding
> a boolean in struct E1000State indicating when the TX side is busy. This
> will cause any entering new call to return early instead of interfering
> with the ongoing work, and eliminates any risk of looping.
>
> This is intended to address CVE-2021-20257.
>
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>


Applied.

Thanks


> ---
>   hw/net/e1000.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index a30546c5d5..f5bc81296d 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -107,6 +107,7 @@ struct E1000State_st {
>           e1000x_txd_props props;
>           e1000x_txd_props tso_props;
>           uint16_t tso_frames;
> +        bool busy;
>       } tx;
>   
>       struct {
> @@ -763,6 +764,11 @@ start_xmit(E1000State *s)
>           return;
>       }
>   
> +    if (s->tx.busy) {
> +        return;
> +    }
> +    s->tx.busy = true;
> +
>       while (s->mac_reg[TDH] != s->mac_reg[TDT]) {
>           base = tx_desc_base(s) +
>                  sizeof(struct e1000_tx_desc) * s->mac_reg[TDH];
> @@ -789,6 +795,7 @@ start_xmit(E1000State *s)
>               break;
>           }
>       }
> +    s->tx.busy = false;
>       set_ics(s, 0, cause);
>   }
>   


