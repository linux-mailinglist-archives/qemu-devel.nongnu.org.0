Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BA5787AC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:44:06 +0200 (CEST)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTqm-0001Q9-U1
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTe3-0001ve-Qb; Mon, 18 Jul 2022 12:30:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTe2-00022c-1i; Mon, 18 Jul 2022 12:30:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r6so16063503edd.7;
 Mon, 18 Jul 2022 09:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YBpSBaZDSeAeomV9S85iA5aHySSTaHu5vM0tSdX3iWY=;
 b=Nc5YUNOtQm65huqr95El2ENLhLUoS1OpQ0/yTSH5iIgqXzp+9NT/CdkM220D78h1R3
 3Tz+DwSexTwpATpg3M+dXVNlZnCZlTxnCSUsttk59++qbur06RqSDDbd+C40U9BSaPJS
 3uBMt+/CJVQkq5xydCTyMBL9QvQQ5Ho0DX5nxPleuu+Or/l4mKEMJflvlUqWEI+BqXUj
 qU6BOhC3jrsPG1he8X7VsKdTR/+g52FFC5xk3sPvhSTlAiJ2zwwvVZgW5L5tYT3lcYTU
 quVvhKjgy9FpE8wlp8UZG/DyRxV4GgGumoo4gKm6Ez3txJRqRZWAkSsH13La2H5PoBxp
 2LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YBpSBaZDSeAeomV9S85iA5aHySSTaHu5vM0tSdX3iWY=;
 b=tCKAU6/t2aR2XU/E50dpEhInyDZ0OYmAd4xEYG6HtLWaIx6yotgitbt7YyrXFT4zmU
 CmCFNnAaGNi1nwsHRh9WYRN62m8H8v2PcCqgNXGXITJuDP1MNCUh5x/jv2TyIYtQJUU8
 M7fUiwyKtn4FFE1cIlaGu4B8RTTCw7n4KOfgV0RlEvxARM2/9+Jo13PVu3VVOdIMzefv
 DRtbDUCMIC8+gEyucbWpvN5g2636f6sAfuoKc63edLCsgr+fK30lljBLD9sch82O0dpH
 xZyu/bNk7hA3UXl9Ss03NdX2lIrJhTyyzmjLHSpCsvWvaZt2EP6pATSCwgCnBmAqLRkW
 5qtQ==
X-Gm-Message-State: AJIora+6dfJoLT/nZCd+buG6RGLQzHdPCODo3LL1f/ARZ9SuGBuXPpTA
 I+IBWrcsVXO5hdN7o7R57BQ=
X-Google-Smtp-Source: AGRyM1sltSmLam7gLeHrXyaWXLlCUZyHxrWkWZAygSJdFnLweHsfZnZ7A+I9X5eaFWzJ7X9si3nRww==
X-Received: by 2002:a05:6402:11cb:b0:43a:b592:efbb with SMTP id
 j11-20020a05640211cb00b0043ab592efbbmr37970355edw.157.1658161852228; 
 Mon, 18 Jul 2022 09:30:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 x10-20020a170906148a00b00705cdfec71esm5709864ejc.7.2022.07.18.09.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:30:51 -0700 (PDT)
Message-ID: <bdb43547-1d9f-a2d8-3dcd-a4326953c541@redhat.com>
Date: Mon, 18 Jul 2022 18:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220712211911.1302836-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/12/22 23:19, Emanuele Giuseppe Esposito wrote:
> +        /* No need to ignore `child`, because it has been detached already */
>           ignore = NULL;
> -        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
> +        ret = child->klass->change_aio_ctx(child, s->old_parent_ctx, &ignore,
> +                                           tran, &error_abort);
>           g_slist_free(ignore);
> +        tran_finalize(tran, ret ? ret : -1);

Should this instead assert that ret is true, and call tran_commit() 
directly?

Paolo

