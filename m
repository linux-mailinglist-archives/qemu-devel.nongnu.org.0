Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14F56554B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:29:03 +0200 (CEST)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LCI-0008SP-AI
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8L1j-0004qB-9T
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8L1h-0008EO-Bi
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656937084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Ka4w8nB6ZZn1NzADqt3W/pTYrdrssKaFEOXn7spiQ=;
 b=YF1zRLp9nTNhQqU8V+C4wh0X1J6KdvIMNc28C2fU8R6C+IH80WWZNjKGYhS7+h1SuQiN8z
 uQ4SXAmkQlNT1HaCSWIrnhixZrGothbNyxHv69GDbSXxjBJ5YuakkhEsIE7DGqiQfS9kW2
 pG+7Rr1vka1m9HWgrXzP682An1Rp2pM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-sqM3_yMUNhS5erq2dmxDMw-1; Mon, 04 Jul 2022 08:18:03 -0400
X-MC-Unique: sqM3_yMUNhS5erq2dmxDMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w22-20020a05640234d600b00435ba41dbaaso7099909edc.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5Ka4w8nB6ZZn1NzADqt3W/pTYrdrssKaFEOXn7spiQ=;
 b=ufLCCsSIux1sNbJeFwo4+p3GzNbl2g1jNAJsT3N9ODxLFaWHryxCA2v62z5C76bKJT
 aIOvEewe5Fted3FjGlk03VDX5CnichSyfaCR4G4glOA9AqYjQNN8lKQcQ1IAPexV9W+O
 6cXdRMatfIG9KHTaIl09N8gfTrDeAiZAeq2LRXbAbl4hMYI87qXRE8ENy6njb2LLMHzE
 efbx4B/fEDDOwm1RL+R6yMQnZHT1xNXtVTVuqZk1NB6voacIdxUwwsYUcyC47615nQX/
 MfdgQTnqIYKP2PsRVPk2zXkw6h7vdrEoULsn46H4CmT8/lAKJ7DXDmXZOwOE1kBIC9Oy
 Xbrw==
X-Gm-Message-State: AJIora+e1xqiBC5OrjMEZMVQQDdOJLSTQKnAx5Xmgix/Rb/dlgt73Seq
 Q5HJFf6aU2s3MxByJLaUoA9jT9ZNuLs5H/K11Gjm7lXEeInANQXUX7kEyfh7HrqXHuYePyOaif6
 k1KXCXP1SIylWCi4=
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr13275718eda.134.1656937082525; 
 Mon, 04 Jul 2022 05:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shEC3TCT65fmxO3GG6DYMvYVohaEW2/uxgWwS7IcszPhg2XS6HE5/nH5qs4T9JlfzYmN/1SA==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr13275687eda.134.1656937082343; 
 Mon, 04 Jul 2022 05:18:02 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a1709067fd500b007025015599bsm14054312ejs.214.2022.07.04.05.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:18:01 -0700 (PDT)
Message-ID: <c9c275da-2edd-8996-c6f1-a90629f650a6@redhat.com>
Date: Mon, 4 Jul 2022 14:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-11-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-11-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 17:27, Alberto Faria wrote:
> Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
> separately.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/qcow2.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


