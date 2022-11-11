Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92127625926
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:15:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRzi-00062P-UY; Fri, 11 Nov 2022 06:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzh-00061p-3g
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otRzf-0000FN-4r
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1H01AGnJv0RWC5zzDGBMdzNbvJcNwzXhWUVetTk3qs=;
 b=cjezV2wBqkKhsWof2WHkKRHGeR2srjbBXzGiDr+cR71TduQyfQDQJNp4C3omTUztR4Y2na
 zuMIrwir+jGFY0fojI6OKTgVrJoSqTH5/qB8OeIgUQESFZGMckDsDpnqUXWJlh6QtozJ0g
 OvfFMc0tTVWdXdcliHmKfqX1XuaTKOQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-3U-sQY6_Ngawtr5Rg-_fLg-1; Fri, 11 Nov 2022 06:14:40 -0500
X-MC-Unique: 3U-sQY6_Ngawtr5Rg-_fLg-1
Received: by mail-qt1-f197.google.com with SMTP id
 ff5-20020a05622a4d8500b003a526107477so3387033qtb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D1H01AGnJv0RWC5zzDGBMdzNbvJcNwzXhWUVetTk3qs=;
 b=2HdcHbX4KI6mE5fvpG5RbUlSYEFDXaz/CBRIAcamHMFgGwJ4e2qkxT5cyhhFBQ3h+7
 /IeMMhFGZMkp8TvTVoVCfLFxiYKHHY2GFmeGIWTiX7uadhZmfxbQGXZ0X6D7LMlvd3Tn
 AimmqLta2TBQ7z6LuEVz6P+oCaQLsLcnPm8dU29jRzJnm/VPcZM4KcU9KHd9SDssDRAf
 T565qoeJMGdJTSYPu+zOylluHWGa7we5rzfhngqy88vfEMUCRunU/R+VkjvNA0o9Ehtx
 AeYEiu6wtEGMShM2/0R9pzQObqaPl38XrvVBQeOanNJuPgCO2e8vd/HHMDIToXcQ3QVP
 5Hbg==
X-Gm-Message-State: ANoB5pnjU6vLIJ3s5yYaiKKyNosPur03X4wXqWsLiuuV3NgI9TIvkXkS
 aYZhjsDwHF5AseGH0+RIEcp7gLOgEw4ZnWJxCo1fA8EuBLdtdNYZb2khVcwyRgKhRMR+lWfJdhM
 MI/xyns8vyAQ4swM=
X-Received: by 2002:a37:9402:0:b0:6fa:67fb:4448 with SMTP id
 w2-20020a379402000000b006fa67fb4448mr590370qkd.351.1668165278945; 
 Fri, 11 Nov 2022 03:14:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jx1m+hQBQhVPmF94EcK/BrGwou9NII7GRIGBPxDGlZ0xcMK43rEexxikiIgMRuLdKCV+eyg==
X-Received: by 2002:a37:9402:0:b0:6fa:67fb:4448 with SMTP id
 w2-20020a379402000000b006fa67fb4448mr590353qkd.351.1668165278730; 
 Fri, 11 Nov 2022 03:14:38 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b006f3e6933bacsm1191252qkb.113.2022.11.11.03.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:14:38 -0800 (PST)
Message-ID: <e14a25be-544b-6c50-13e0-2b66c24bf3a5@redhat.com>
Date: Fri, 11 Nov 2022 12:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 02/13] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-3-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
> callbacks, so in preparation, avoid yielding in their implementation.
>
> This does almost the same as the existing logic in bdrv_drain_invoke(),
> by creating and entering coroutines internally. However, since the test
> case is by far the heaviest user of coroutine code in drain callbacks,
> it is preferable to have the complexity in the test case rather than the
> drain core, which is already complicated enough without this.
>
> The behaviour for bdrv_drain_begin() is unchanged because we increase
> bs->in_flight and this is still polled. However, bdrv_drain_end()
> doesn't wait for the spawned coroutine to complete any more. This is
> fine, we don't rely on bdrv_drain_end() restarting all operations
> immediately before the next aio_poll().
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


