Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D154CF2DE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:47:17 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR85M-0003at-Ln
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR83N-0001wG-KF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR83M-0006vi-13
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaMCDmM6R8K0J4ces3vArbHrt6nNkd6MaTsFClU7ZmM=;
 b=Y/VMzHVLK/8jf9fLGTDjgnk9DcWE/f4UyVQ1T5dggs1XAw3/FBO6KiSprIyG0wPT8Uliof
 p0AdXmzVsxXunAuzKruofNmy6ZuA5LGcKkFR1XWcH/InAZbX2X+nbPkysahzAXSN+B3dkw
 21hJHCY9Eq0piV/HhlQ7gDgDMbIExIo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-d80Ms8NyMLi1cASvJKDiBA-1; Mon, 07 Mar 2022 02:45:09 -0500
X-MC-Unique: d80Ms8NyMLi1cASvJKDiBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so4219606wra.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QaMCDmM6R8K0J4ces3vArbHrt6nNkd6MaTsFClU7ZmM=;
 b=Tzej/pJyfaZY9gHNtJ+S5IN0DgScrwlSbJXoxNbeZJqoigkEJyATwK8KJtEi6r6YZT
 rPHEhP3MxN7jRMafNSmO7V1Z/TQKLPbETz/A17Yw7uhPATU0iR3VC6iavuNoOVXDwoPD
 vSI13UY6MDQ3c1ZPqNAMFvTNeM4aT6fnaBzBTzc3WePokoouCl1RxkquHqpUcZ4pllCx
 R0DbdBtLeM7Fz8PzBsUwXdf0gHizRid/0IwbihwtTU74zk5vD2WTdCvXZ5QwePlBqDdR
 QLz/qPj6SKQuh7TV5ElcSS/hkXs2PcHI02My9Z25Y7uO6GNoNejPgreAg3xPvp4VDO32
 cW4g==
X-Gm-Message-State: AOAM530j7RxvHixKELSRdSDJxHjFYFi87s91GIftNBqYlCioE3J8LTXN
 CVQIV8ls3dA246nU57VM53o0Or6O6okBxyjlDqlkfrDPY+DcOUIGB0D3gI3qNdGmaQn+RWilUnJ
 4691jR11i0y/KAaM=
X-Received: by 2002:adf:ea85:0:b0:1f0:1251:1eb9 with SMTP id
 s5-20020adfea85000000b001f012511eb9mr7268868wrm.455.1646639108352; 
 Sun, 06 Mar 2022 23:45:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzXIPyMApna2cdWXpFvLXOtlHJcFTQreyzhwP1QkfM5wGp916B3diNGCQrz5c9xj4ngVBFCA==
X-Received: by 2002:adf:ea85:0:b0:1f0:1251:1eb9 with SMTP id
 s5-20020adfea85000000b001f012511eb9mr7268838wrm.455.1646639108062; 
 Sun, 06 Mar 2022 23:45:08 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056000128100b001f04a47762dsm10337523wrx.109.2022.03.06.23.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 23:45:07 -0800 (PST)
Message-ID: <673b8beb-352a-df7e-27af-7f81022d5adc@redhat.com>
Date: Mon, 7 Mar 2022 08:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 2/5] qtest: replace gettimeofday with GTimer
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220307070401.171986-1-marcandre.lureau@redhat.com>
 <20220307070401.171986-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220307070401.171986-3-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 08.03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> glib provides a convenience helper to measure elapsed time. It isn't
> subject to wall-clock time changes.
> 
> Note that this changes the initial OPENED time, which used to print the
> current time.
[...]
> @@ -846,21 +828,20 @@ static void qtest_event(void *opaque, QEMUChrEvent event)
>           for (i = 0; i < ARRAY_SIZE(irq_levels); i++) {
>               irq_levels[i] = 0;
>           }
> -        qemu_gettimeofday(&start_time);
> +
> +        g_clear_pointer(&timer, g_timer_destroy);
> +        timer = g_timer_new();
>           qtest_opened = true;
>           if (qtest_log_fp) {
> -            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
> -                    (long) start_time.tv_sec, (long) start_time.tv_usec);
> +            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n", g_timer_elapsed(timer, NULL));
>           }
>           break;

The new timestamp here is quite unuseful now, of course ... could you 
replace it with g_get_current_time()  instead?

  Thomas


