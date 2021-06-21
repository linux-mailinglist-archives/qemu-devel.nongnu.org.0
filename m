Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC33AF50B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:26:50 +0200 (CEST)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOdE-0003Sx-Ue
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOc1-0002Hy-Ql
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvOc0-0004b6-7Z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624299931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJPntyn6DDZBu7fOqaWlt3U9RwF0Iu6JVF5+vBWE3yk=;
 b=UHt3W4r2vgnhwhudU9JcDN0y8tO8ci/XQxjP+eq0oZXvKmwzN2zSSn2Juk1UJsYuPthjwl
 LkRD94UQEgdLxI3Nf7v3niH55l4DKW43wjBrWh1ui/rysHdAGYdTKp3hDLOw8cGGcuhCaW
 zU6FY9H0yN5fo4QJFqizHYFaFapSn4I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-3yH_oaF_OyKG7D0zMH-J5g-1; Mon, 21 Jun 2021 14:25:28 -0400
X-MC-Unique: 3yH_oaF_OyKG7D0zMH-J5g-1
Received: by mail-wm1-f69.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so23653wms.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJPntyn6DDZBu7fOqaWlt3U9RwF0Iu6JVF5+vBWE3yk=;
 b=IUqug6s4fQieTJXh4MpuWdftmYyUCtKUm+jGcvAwqbtrdgjl+aZPNKX50c18Pq4WrM
 VNUMyHW9OA0ISxcxKJjn9SzPyVH4Lkb/7Rz19jHujKK0PkQaPY5oE7zLec4XRn5pM2G5
 32DIFjoVAoqOEkAY+V3oc5/l9vvn/BRmXL5kvZfV6hS5uf7rKQgavsubV1TOeYzk8x9C
 QOM2hMGNpK11GiPHRnaG5F457Zo53bB3PPMrWJmZ0Ja72rSWW1aeuc1f8MvilPV1U06o
 pRtjac0mbcZN+htLNXMuewO/sWJxipAE7kix5vmhc8s2RjcAddxKywXVcKrXXMRTR8Dd
 mZkw==
X-Gm-Message-State: AOAM530x7smq4z5lTJWsU7mGGeyrQjozGuXyDNEDLgQnoywBxTx8rUhi
 8/dzalITXnBDBVhit1UbTZ2xoy+i7g6T1vzUSIlX17XJe15dAdrDB9j/sYIF/5FQM8GgJKRaLVR
 j9OqIYfJIZnnoJNA=
X-Received: by 2002:a1c:7903:: with SMTP id l3mr15016938wme.128.1624299927591; 
 Mon, 21 Jun 2021 11:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw9apS8/1D56DHbBjIGYGhqsUGzSf0htV8KHVg5NJeNAH3cBry+2IRX2qlRh6qYDMRjTvLvA==
X-Received: by 2002:a1c:7903:: with SMTP id l3mr15016922wme.128.1624299927436; 
 Mon, 21 Jun 2021 11:25:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm18272666wrz.91.2021.06.21.11.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:25:27 -0700 (PDT)
Subject: Re: [PATCH 06/15] softmmu/memory: Inline memory_region_dispatch_read1
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
 <20210619172626.875885-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86ad0489-0182-4573-480b-8f535a5f16cf@redhat.com>
Date: Mon, 21 Jun 2021 20:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 7:26 PM, Richard Henderson wrote:
> Inline the body into the only caller of this function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  softmmu/memory.c | 38 ++++++++++++++------------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


