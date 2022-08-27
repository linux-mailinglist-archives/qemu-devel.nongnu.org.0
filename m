Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A85A3612
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:43:23 +0200 (CEST)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrPW-00072n-5Z
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrKN-0002Ke-Mi
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrKL-0002kh-Ia
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2eEcnP5MCTo3VTKaWlw4WHNRqQqejvtD/hDidGR8NA=;
 b=cqVQQCGFA5EUcG+TaFsP4/Rm6Xgh1Ael9w1OfVORP/e0ZIAXWKH6asn/cY5LVzvsPERnE6
 c+zofeMKjLxOFVYbAbyhVIAvKvPaUAgx/M+KPZjs53+UJeqqDNiGavWjd+IRs5fhslA7+A
 KPelS/sBwyU59YVYMm61zZdWbBQCVFA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-vd_A2Ww0MxC0aKtw18AgYA-1; Sat, 27 Aug 2022 04:37:59 -0400
X-MC-Unique: vd_A2Ww0MxC0aKtw18AgYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so5242884wma.7
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=o2eEcnP5MCTo3VTKaWlw4WHNRqQqejvtD/hDidGR8NA=;
 b=NqM87vyjiCiMCtQKfKOJFuHcoZ8rUF9h/Wp0SEdHfjFlxBSrrbFSB8xeISvsXhdlN1
 EYwH4ZpoheOEtBk/IwTvIG2NEw5V8HizCwXiYCBg3TrSm5Byg2uq2djRoZ6bgD75Rk47
 PNbDEAKb9OzWaGQJkKem8AJSE7Zgkn4HufWAchNOTqEVfBxVI6D/u3wXu5kqrvbIrByp
 xN75AWAClsA4TRd78663CMX//H6ZYnkP8AIxY2R5H54Neu6rTVerpnADU7nHmRhZtd72
 SqHaDWfzj8FDVcS/XOoqtLYlz2aybIt6xbJqpDPspaE/I+MybgbUW2fchWG621mbqd8i
 WqSg==
X-Gm-Message-State: ACgBeo3wD4mIwPI/tqaHLomAxYcSojzHNazNr/EG81lfwh/1ijhBoSHu
 KFGKD0RRW+jDmQgwJysKgsjfSss4TrG/jQqTKYxyMfsLbmYkmYuUaUZQcaaGTp5iz7OiT4aXLgF
 CwOGTnkp8Cd10G0o=
X-Received: by 2002:a1c:ac02:0:b0:3a6:6cd8:1cdd with SMTP id
 v2-20020a1cac02000000b003a66cd81cddmr1681338wme.143.1661589478210; 
 Sat, 27 Aug 2022 01:37:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5c/E7RWSHdwY9Le4uFAgUW1kYgfRODyE0RfryjQ6T48GeeigXHxzL59Yt4J0K4uUMx7YbyHA==
X-Received: by 2002:a1c:ac02:0:b0:3a6:6cd8:1cdd with SMTP id
 v2-20020a1cac02000000b003a66cd81cddmr1681330wme.143.1661589478052; 
 Sat, 27 Aug 2022 01:37:58 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 q8-20020adffec8000000b002257f1a227dsm1773364wrs.46.2022.08.27.01.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:37:57 -0700 (PDT)
Message-ID: <d29a828b-30e7-e8ed-d6a8-d5dc57493e0a@redhat.com>
Date: Sat, 27 Aug 2022 10:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 18/20] disas/nanomips: Add struct keyword
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-19-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-19-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Changed the type of the table parameter in Disassemble function:
> - from const Pool *
> - to const struct Pool *
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 7dfefdc5ed..e7d6bffe84 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -638,7 +638,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
>    *      disassembly string  - on error will constain error string
>    */
>   static int Disassemble(const uint16 *data, char *dis,
> -                       TABLE_ENTRY_TYPE *type, const Pool *table,
> +                       TABLE_ENTRY_TYPE *type, const struct Pool *table,
>                          int table_size)
>   {
>       for (int i = 0; i < table_size; i++) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


