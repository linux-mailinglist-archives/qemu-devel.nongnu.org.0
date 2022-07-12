Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E7571B22
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:26:15 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFu2-0000M1-E4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oBFZW-0006sY-70
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 09:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1oBFZT-0001en-A2
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 09:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657631097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ztsBSLvwUmy5CUHrmmM3/evsdF1iKVZ/h/KFmiFg1k=;
 b=cnvqyvbNU9/7l2aZxTYUj2cgzGK+WJ5iRmb7DFQUOtmR6k/lo0iKnZO/l4S6CWxBaMTQ2E
 DdU8TqcjPviGUkpaDMrkekcp7KF0REDyDJFjt5PVwTBr28WwOtgtvBrYaUD+DOiO6gxNm3
 e1vsMSp6PuDfE1FREM6buk8bZih0JtY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-HDg1IQscNFab4_HkERG3Sw-1; Tue, 12 Jul 2022 09:04:56 -0400
X-MC-Unique: HDg1IQscNFab4_HkERG3Sw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z24-20020a1c4c18000000b003a2e963c399so1862808wmf.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 06:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7ztsBSLvwUmy5CUHrmmM3/evsdF1iKVZ/h/KFmiFg1k=;
 b=suQjzKguFVNkC9QxAdex0V6iTQNlT31sko8cDxJ5B8ILGHXUcCX7gMtyIZZoK7nRxC
 obxicJ2ouaSxZrTlxcDwk7CFU+b3jwLQCo+moNjfjVA6x+jpPgf/zNRxV7EHTueDaWcz
 ozqt3BpRxyNMQuKoQvz8EsvaaySygavxhuo8EOwEtN2HS5fXEQM/JyG3aMG/fd19D/2r
 nqCLEKZJpBB1ddeE8J+sTKATXpGgxMHgovgZrfXwLmfGGu7OqFfJR+QOq3UuUCfZXYOU
 NoQ25kmR5rkWggpI65D9RlcMo8e7AXng/jMLreZF2sRtq/n8KhfSqJA4ERpHDtU6YKgm
 Q6VA==
X-Gm-Message-State: AJIora+AroGnGSdAZj9oIbQF/AbqJEW9JwJtCdvMBt9SAXPExrSlp+cI
 1AMgNe5yGbXXhE3fck7bOc7qFP37QyqN/+Hz/K42huvEtzVCEJdoc0S47OGEi2NUgvVnjBfTO3z
 Ty20cfs8k1LDTqbg=
X-Received: by 2002:a1c:f716:0:b0:3a1:8f0e:66b4 with SMTP id
 v22-20020a1cf716000000b003a18f0e66b4mr3726740wmh.140.1657631094958; 
 Tue, 12 Jul 2022 06:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vjrXQl34gnBr3h4z0mYqOC02gYZwpCssyyWZdiBsAAcXtjPEMEo8uh8/1MVCIBANsmYsk79w==
X-Received: by 2002:a1c:f716:0:b0:3a1:8f0e:66b4 with SMTP id
 v22-20020a1cf716000000b003a18f0e66b4mr3726723wmh.140.1657631094759; 
 Tue, 12 Jul 2022 06:04:54 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfea45000000b0021d6a23fdf3sm8187313wrn.15.2022.07.12.06.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 06:04:54 -0700 (PDT)
Message-ID: <3ffdc334-62c9-8d7d-c50d-516b416ef13f@redhat.com>
Date: Tue, 12 Jul 2022 15:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] usb: document guest-reset and guest-reset-all
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220711094437.3995927-1-kraxel@redhat.com>
 <20220711094437.3995927-2-kraxel@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220711094437.3995927-2-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 7/11/22 11:44, Gerd Hoffmann wrote:
> Suggested-by: Michal Prívozník <mprivozn@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/system/devices/usb.rst | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Thank you!

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


