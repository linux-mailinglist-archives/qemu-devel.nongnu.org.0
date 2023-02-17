Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CBC69B2A7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 19:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT5r2-00067z-7k; Fri, 17 Feb 2023 13:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5r0-00066z-HU
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5qz-000773-69
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 13:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676659984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zcl86PmhB0FNxDkWkIGFOBkJRHcxrG0wbwem6jZgFc=;
 b=cw7u/SNQuxN3Sy98k5Ky7t2yp/XNy9L0Sw0pFKGfXccjHC0+bp//enu7nXa/1xlNgD9uOr
 bTbPB8qrFdZPGPBk+eoy/YV0c1UlM04IVo1Z3VbnZYcbqcoc4rjabrrFdNd2kak1Y37ERp
 IhDR80kyOJuWcugO4mT5oDL9IT1Qu8I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-BM5PxbWQPZa4cg0fWPKoDg-1; Fri, 17 Feb 2023 13:53:01 -0500
X-MC-Unique: BM5PxbWQPZa4cg0fWPKoDg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p42-20020a05600c1daa00b003e00be23a70so1129999wms.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 10:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Zcl86PmhB0FNxDkWkIGFOBkJRHcxrG0wbwem6jZgFc=;
 b=IwRM3op+S5gSJkbmQNpYfzmNMuWRq6xaKqizGHja0wy3vOnUKyD9dsnqEPO8v9eKW/
 w539Ulzi7QfhD+UhEwVMkSsgDiLnx9ezCPJB1XUkYpeNGfIKsO66AhkcmgGWVIVbvPCy
 O5RV8+XSaAXivi6+r1GCjQ9s3A5sSuEundnvew8QlDr/dNSNtqymfw82CDChjECsKNVD
 lRVJ/aUmZ7ymdkmBP8HlzQrR9eCp/lxEJXMl0tVvb6noTvQmQ/k9A0ztT5xI6WP/GdIy
 D2+tHoIdlQyfUtb3qaXtx2y6jdg5GlHM475IU/khedrIC+XyBt5SjZnJMVdP+Cl92N5I
 UXzA==
X-Gm-Message-State: AO0yUKUmco5brfgC8/9hWZ4yiHw4vA2xVfKB654djPjXDKrU3V7y9mOv
 QIdXF8zQW9Qa5wx0G71s+LBfeaLm8h1RFsRUQ9A7g7S6ls89EAq0r1XriOnEEdvAbIazsYZgbEi
 8IoULNdqA9RZTQhY=
X-Received: by 2002:adf:eac9:0:b0:2c5:5878:8fb7 with SMTP id
 o9-20020adfeac9000000b002c558788fb7mr763878wrn.13.1676659980600; 
 Fri, 17 Feb 2023 10:53:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8XfTyKD6f8E6ZV3ijzku+zmINzviJiiXk2oRzHV6EVAz0IBahqoZIGzhI12RHiJWk3hc/zZw==
X-Received: by 2002:adf:eac9:0:b0:2c5:5878:8fb7 with SMTP id
 o9-20020adfeac9000000b002c558788fb7mr763850wrn.13.1676659980303; 
 Fri, 17 Feb 2023 10:53:00 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b002c573a6216fsm5123870wrj.37.2023.02.17.10.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:52:59 -0800 (PST)
Message-ID: <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Date: Fri, 17 Feb 2023 19:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230217141832.24777-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/02/2023 15.18, Philippe Mathieu-Daudé wrote:
> "hw/ptimer.h" API is mostly used by timer / watchdog device
> models. Since the SoC / machines only access the ptimer via
> reference, they don't need its definition: the declartion is
> enough.
> 
> On order to reduce the inclusion on the source files,
> forward-declare 'ptimer_state' in "qemu/typedefs.h".
> Use the typedef in few place instead of the structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> "30 files changed"... but since this is trivial, there is
> no point in splitting per subsystem IMO.
> ---
...
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index df4b55ac65..effcba4bca 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -104,6 +104,7 @@ typedef struct PICCommonState PICCommonState;
>   typedef struct PostcopyDiscardState PostcopyDiscardState;
>   typedef struct Property Property;
>   typedef struct PropertyInfo PropertyInfo;
> +typedef struct ptimer_state ptimer_state;

Would it make sense to properly CamelCase the type while you're at it anyway?

  Thomas


