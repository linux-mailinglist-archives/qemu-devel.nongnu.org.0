Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2A4C2B9C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:25:34 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDBd-000335-I9
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:25:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCv9-0007hm-3X
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:08:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNCv4-0001sf-N9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645704503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMQpiR3cmdruUSMO+rBoDbf2IqIqJgU5Iw5gchJWmno=;
 b=I6I4sUD/GFCZm3/7aXKweshezKlw0ouo0HIWL4TfVxFlPKKspaHmq6o1oXSo9iZD0v420S
 TSL5wnVCxGVz5q3FzIMnOyy0ztOCfhoOSDHynVDQvuTKmdENF9YKdkqT9C8HXkeoZQ5Cbj
 PIrcv15k5NDn9XClhSixLC5NwWrmmVg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-ZFLtffKJNdSQFPOA5kUTHA-1; Thu, 24 Feb 2022 07:08:20 -0500
X-MC-Unique: ZFLtffKJNdSQFPOA5kUTHA-1
Received: by mail-ej1-f69.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso1110722ejd.23
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WMQpiR3cmdruUSMO+rBoDbf2IqIqJgU5Iw5gchJWmno=;
 b=VjH7yEwDibzbx44/TeEfV2/iHRhlfBi4agfZxWFeuz/MyCx4LoGCGImOGG8lTNHgXx
 sbRwvKYgEdUMLsAaoD0nJ7JSiiHHDCSCcQGIhOn+qgtL4I3qOD9nFo1UQfo5tbQxeZOw
 6RRg6oAdrn6B64rV3DtDuuZMTMuSLEpAk8OJUFCKJz6aVa4c5MsEp9nfgUl3KOzBybA6
 TAmz87/YP8uiuvEEYqvwrkHf6KgQGrUw+8Hi4q4dB+XcXyUqt1KaOXusr9Wku3ZF3obq
 azUUB6Ax/XScmm2CfIcyL59IOuyugLUrit2fB6+wsNvrjxwI4cld8Z9LfsO1rgjA3h0b
 FApw==
X-Gm-Message-State: AOAM5309ToVagQpyzcWT8r+knYKmZ36jHxyMWdnJ7awHpT9SETXuHTtS
 cnW0zU12u0qwy68w01d7Ng0C2jwlsSv+Pd9vFq8hMPQUwKi4YzVuoXYQDO+yZboeXuS6u2l7YV7
 cPtV1XogWkkr3sgI=
X-Received: by 2002:a17:906:8557:b0:6cf:2730:b5cf with SMTP id
 h23-20020a170906855700b006cf2730b5cfmr2037920ejy.368.1645704499003; 
 Thu, 24 Feb 2022 04:08:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0yJUOGdAlfUMBSLh0QHT+ErvQUZIEWtM/5lfoDQgBAGhhtaVN9Qiu8mfYE8llvGkdTwUwKA==
X-Received: by 2002:a17:906:8557:b0:6cf:2730:b5cf with SMTP id
 h23-20020a170906855700b006cf2730b5cfmr2037900ejy.368.1645704498780; 
 Thu, 24 Feb 2022 04:08:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bt6sm1268453ejb.222.2022.02.24.04.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:08:18 -0800 (PST)
Message-ID: <60044973-30ee-e896-c2d5-bdea3eef9814@redhat.com>
Date: Thu, 24 Feb 2022 13:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 06/18] block: intoduce reqlist
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Split intersecting-requests functionality out of block-copy to be
> reused in copy-before-write filter.
>
> Note: while being here, fix tiny typo in MAINTAINERS.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/reqlist.h |  67 +++++++++++++++++++++++
>   block/block-copy.c      | 116 +++++++++++++---------------------------
>   block/reqlist.c         |  76 ++++++++++++++++++++++++++
>   MAINTAINERS             |   4 +-
>   block/meson.build       |   1 +
>   5 files changed, 184 insertions(+), 80 deletions(-)
>   create mode 100644 include/block/reqlist.h
>   create mode 100644 block/reqlist.c

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


