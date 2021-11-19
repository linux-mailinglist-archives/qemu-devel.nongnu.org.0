Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7F456896
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:21:39 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnuT4-0002hV-GL
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuQr-0008Tj-RJ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuQq-0005xI-04
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637291959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fUOqTObu5zGgJ4MhStyvZu9x8kai4SJE8j38O4ab1r4=;
 b=aN16a4pafHaAuUM6JypBkoc4ppZIa2BMq6rvOfygT2Gjb/CyMz3A2VHOKDLNhZ7HT5sYG+
 JBlp1KnEHusdCyaIdW62vuth/5RF6xAJH7rK9nJakqZngD1duMtC+M0Dcpp7tpTffmbMIv
 g4yJWhT6cGmLv5VhwKvgY2sBJdlNYFw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-293-zCNLppTnMySK_LAKzraBVQ-1; Thu, 18 Nov 2021 22:19:17 -0500
X-MC-Unique: zCNLppTnMySK_LAKzraBVQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 z19-20020a630a53000000b002dc2f4542faso3575288pgk.13
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUOqTObu5zGgJ4MhStyvZu9x8kai4SJE8j38O4ab1r4=;
 b=58I9OP8WDdr4tOG7XyNKaAdSBfzZ9WGfqD9G4uI/Y4l65gHNqmnqLVoNLvjaNQb4k+
 Ex38UFYfUfYHt8XuouaAPP+hdZUMerEVGG2rSuIZ7Z2K07EXs7QrX6dINp9G8PUryIVI
 E5vcTfkbrHQiFQnb8jLX4EvGy7gBje0B7uC4Ei0AfDQ4XU08FiRLFHBvZxUZP0S3wYza
 gy9pqjlg+czcjBEUUjC0VhxdxIIaeKXuLSyYl5Ng721BfMNS0m0TkZq+A7TYcjdEhspL
 NObK0IWBUD7r7I/w/vcH9CLwlb3Fw60sbosbo1mYsPZPAItNAdvHj7u0XWrHhojVsRL9
 Jrbw==
X-Gm-Message-State: AOAM531b0yy6mL8A3X1Eq8msPyz8VO2Yi7iAXY9/PV3GkYZLEKJDcdE9
 f2vvi6jrWfkE7EvzfiNc3dIgocizQEcOF/ylfm7JYRyvXqMVVnLtbGwChQAVWOv9cVYB5xfW7P3
 sfOE/fyXJsgLuIFY=
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr581869pjb.37.1637291956671; 
 Thu, 18 Nov 2021 19:19:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5IZxjf4KnCzmhfZyfmnUSCVtfr0o1B6Dm1APyTglVDVHbsa/Eaq4aYW2qFpoiqC574DLDkA==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr581823pjb.37.1637291956388; 
 Thu, 18 Nov 2021 19:19:16 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id mq14sm10490251pjb.54.2021.11.18.19.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 19:19:16 -0800 (PST)
Message-ID: <58b105ee-bc34-2bb2-9bc6-037721000f01@redhat.com>
Date: Fri, 19 Nov 2021 11:19:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] net/colo-compare.c: Fix ACK track reverse issue
To: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
References: <20211118032011.249517-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20211118032011.249517-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/18 上午11:20, Zhang Chen 写道:
> The TCP protocol ACK maybe bigger than uint32_t MAX.
> At this time, the ACK will reverse to 0. This patch
> fix the max_ack and min_ack track issue.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---


Applied.

Thanks


>   net/colo-compare.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b8876d7fd9..1225f40e41 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -209,7 +209,8 @@ static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
>   
>       pkt->tcp_seq = ntohl(tcphd->th_seq);
>       pkt->tcp_ack = ntohl(tcphd->th_ack);
> -    *max_ack = *max_ack > pkt->tcp_ack ? *max_ack : pkt->tcp_ack;
> +    /* Need to consider ACK will bigger than uint32_t MAX */
> +    *max_ack = pkt->tcp_ack - *max_ack > 0 ? pkt->tcp_ack : *max_ack;
>       pkt->header_size = pkt->transport_header - (uint8_t *)pkt->data
>                          + (tcphd->th_off << 2);
>       pkt->payload_size = pkt->size - pkt->header_size;
> @@ -413,7 +414,8 @@ static void colo_compare_tcp(CompareState *s, Connection *conn)
>        * can ensure that the packet's payload is acknowledged by
>        * primary and secondary.
>       */
> -    uint32_t min_ack = conn->pack > conn->sack ? conn->sack : conn->pack;
> +    uint32_t min_ack = conn->pack - conn->sack > 0 ?
> +                       conn->sack : conn->pack;
>   
>   pri:
>       if (g_queue_is_empty(&conn->primary_list)) {


