Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9C565515
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:24:55 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8L8G-0002st-RD
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8L0D-0003AL-J5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8L0C-000825-7S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656936991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWzMq1Ht2Ziu5cAMacleb3dXuDMQhIMpm2eNO8N5JxY=;
 b=BnqDX1IlxJqni1pn6kVJxtiQl2hgL9DJvq57TSmDiUIV1LOnEsZj7mMv3FWl3sQKQo65av
 JAF315le0+daNTVXUdUrJ/K3oIoomFpyQhN+oJMhbUCt2fxPnjBEJNUGmCjbcatSzL5GsV
 iZvQFr0dgMfIkJUlhXJS7PUAHG8E/co=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-F-SKKBDBP4-O0b23flvmPA-1; Mon, 04 Jul 2022 08:16:30 -0400
X-MC-Unique: F-SKKBDBP4-O0b23flvmPA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a056402519200b004358ce90d97so7001959edd.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OWzMq1Ht2Ziu5cAMacleb3dXuDMQhIMpm2eNO8N5JxY=;
 b=d/SQxFdzyrz8TvRXmKqjHkGCeaUIm9JriKoJdyAdxoNaoud12WltL19Y9+I9XyhGL3
 7FxAGl19ncjn33959izfnVVL09eZiCVnXInZGDZIsCOOtNMZyoWZnntVeb2Qn/OUqxKe
 mv0HaxX01y4Ti2NI9doOFjCjjbGncPaNRKUGYA0meW1xPkfk6WM2q4NiVzxNiRjvSGLH
 WocCAeEIIZTeKg9UTfJ7adRoPfu83lshOeITSDUrsFRFHrtvj8gwRi576jq45FNTM5VI
 phpyncNymrBMWBSFG18ZjGtcSLaWOhb5DbmIAHAUiZR57WU/CO5f8fQHf72CPO47EHlq
 NZNQ==
X-Gm-Message-State: AJIora+xiTFUMMgXwUrW0iDu5qyk1MtCsknde6L/MI6A4QvojVYUz2c7
 guv182vsB79TWLihGIiv8Od5jyoD2dZbcraErWpjVUh3Ok0sgZ+tfaxtxJvWFi97lib/4v1OYe1
 FSJ1q8o0P0ouanoI=
X-Received: by 2002:a17:907:2d09:b0:722:f0bf:ac26 with SMTP id
 gs9-20020a1709072d0900b00722f0bfac26mr28792731ejc.77.1656936989560; 
 Mon, 04 Jul 2022 05:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUuWftiNt527WoakheQ/YWzUEajelmTElNilkwBTKF6bjOyq+/xMbiqlLfRjH2PIiCSsQS+g==
X-Received: by 2002:a17:907:2d09:b0:722:f0bf:ac26 with SMTP id
 gs9-20020a1709072d0900b00722f0bfac26mr28792711ejc.77.1656936989420; 
 Mon, 04 Jul 2022 05:16:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ml22-20020a170906cc1600b006febce7081bsm14196364ejb.163.2022.07.04.05.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:16:29 -0700 (PDT)
Message-ID: <2aad5834-b006-487d-11ae-8bee7cd7d197@redhat.com>
Date: Mon, 4 Jul 2022 14:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 09/10] block: Use bdrv_co_pwrite_sync() when caller is
 coroutine_fn
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
 <20220609152744.3891847-10-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-10-afaria@redhat.com>
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
> Convert uses of bdrv_pwrite_sync() into bdrv_co_pwrite_sync() when the
> callers are already coroutine_fn.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/parallels.c      | 2 +-
>   block/qcow2-snapshot.c | 6 +++---
>   block/qcow2.c          | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


