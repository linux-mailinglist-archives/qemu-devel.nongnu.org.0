Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E72566571
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:51:54 +0200 (CEST)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eHg-0004ir-NL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eEz-000304-ED
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eEw-0006eJ-KV
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657010942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLK6W1j5I45H4s+JYoLkfiLP/TzOKx4AoJQr8/Nyta0=;
 b=DKXNCeyNlKZuwargQpyxXgB4rb5jMMEiXEY1EVEWABOkdKm4IHGpFI/aNVpLB3RNLim6Mm
 OnTqU06djOi+EAPtJEfWCAtd++XKSPwp75v2xV3fQAZrCf1GCowPC6nxQMmNvjXJUqG4lu
 gduoM3mD5bBnUMMlooUK2QSwNE5m7dE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-WUETvGELONWncdWQbZ9Q_w-1; Tue, 05 Jul 2022 04:49:00 -0400
X-MC-Unique: WUETvGELONWncdWQbZ9Q_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so8903155edc.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YLK6W1j5I45H4s+JYoLkfiLP/TzOKx4AoJQr8/Nyta0=;
 b=VmtSOyNaNQtOrfqhIMnF7qADh7CWGESjmJqvJNU1gzD+rcI4gCliRyY5X56ZemluCa
 sZs2A10QTl+2K5o8kw7/bocg2cbZQOeTueArUUyn5hkKf0cwIEDiSGf5INVUpliOcleo
 x3ocUTkbiFvNoDBvaU7l/3683zKSqRkiIwa32OEvtjkKjt3MiwdNtyIEQD1wDIomzjId
 DQK1C0lBe+pUSVVK2vQTvK0AZZcq9Oawl3h+4n2MFDunyf7xgxEAbtUTv0rF2adxs341
 COC1AR204eTYrTSt0ND4bRzMXPElvKQ+WBOxwZnHD5ZrpD/u7m0YzChrtj16DuC6ivJz
 sxUQ==
X-Gm-Message-State: AJIora9W/mqL9uzACGLQaY82s18OCFvmuW2EvMmsTXq6vFzkjxYBGXek
 L61YOijNbXmFNuz9W+dHZjO+x2qynIYKbu0AGE/jrLC7w6qS9PgOGF4QJUr6RMpdyQrGII5tjr0
 C5yw8bmz11UOlQuw=
X-Received: by 2002:a17:906:31d9:b0:726:a68b:b666 with SMTP id
 f25-20020a17090631d900b00726a68bb666mr33017497ejf.159.1657010938952; 
 Tue, 05 Jul 2022 01:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1uIby89NUFekY9QxbICIz2vG66v3RcKP4k1h4tZJzNRfVwAg0moyeGAQgVnim/VYG7EaKYg==
X-Received: by 2002:a17:906:31d9:b0:726:a68b:b666 with SMTP id
 f25-20020a17090631d900b00726a68bb666mr33017485ejf.159.1657010938778; 
 Tue, 05 Jul 2022 01:48:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056402239400b00439645915a4sm9906778eda.49.2022.07.05.01.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:48:58 -0700 (PDT)
Message-ID: <56ce3a40-5f40-b280-f604-2b7d2ade22e0@redhat.com>
Date: Tue, 5 Jul 2022 10:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 12/18] block: Implement blk_pwrite_zeroes() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-1-afaria@redhat.com>
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

On 17.05.22 13:39, Alberto Faria wrote:
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             |  8 --------
>   include/sysemu/block-backend-io.h |  5 +++--
>   tests/unit/test-block-iothread.c  | 17 +++++++++++++++++
>   3 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


