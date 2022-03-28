Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD64E9126
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:23:25 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlau-0004lb-OD
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:23:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYlZN-0003IZ-VQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nYlZJ-00007F-RB
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648459304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOORtzxOLad3MH4iLOskKdiAEubzCTLphZcgXcwJ7kk=;
 b=TOPxEHf2O/Ht3Gff7lk9g9cS3a1RnxhAUR7/Z799STAVhg4XmmWeWPow7DBaKf/xRvB0mW
 8niyT3MFQpbRi91BUHAP+TsNy8Nu2XTBJe/sCSmh3j0bvxcQW2sXiUWYrxVKREKtwGLtyx
 kzb8PrQEQqItE4Fi3iScsdZe5bXCslU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-GZc1O5CdOniaU2X42Mqfbg-1; Mon, 28 Mar 2022 05:21:41 -0400
X-MC-Unique: GZc1O5CdOniaU2X42Mqfbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A3AA2A59564;
 Mon, 28 Mar 2022 09:21:41 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 913F7C4C7A0;
 Mon, 28 Mar 2022 09:21:39 +0000 (UTC)
Message-ID: <9152b9c2-62a1-781e-ef99-f30cf633e050@redhat.com>
Date: Mon, 28 Mar 2022 11:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5] arm/digic: fix format-truncation warning
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328084717.367993-3-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 10.47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../hw/arm/digic.c: In function ‘digic_init’:
> ../hw/arm/digic.c:45:54: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Werror=format-truncation=]
>     45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
>        |                                                      ^~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/digic.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 614232165cdc..6df554797734 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -39,10 +39,7 @@ static void digic_init(Object *obj)
>       object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
>   
>       for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
> -#define DIGIC_TIMER_NAME_MLEN    11
> -        char name[DIGIC_TIMER_NAME_MLEN];
> -
> -        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
> +        g_autofree char *name = g_strdup_printf("timer[%d]", i);
>           object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIMER);
>       }
>   

DIGIC4_NB_TIMERS is 3 ... so the compiler should also be able to see that 
the string fits fine into the name[] array here. That really sounds like 
your GCC 12.0 is buggy. Please open a compiler bug ticket.

  Thomas


