Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D615665D4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:07:52 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eX9-0000TG-8q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8eT5-0005I9-3G
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8eSv-0000Nf-6g
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657011808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yc1/5yMIpaU2coy/SOPCQomRRd2ZHjliHGdHQg1rfKo=;
 b=Bb9ImZJ+jKrvZ1XN1fCfF4On5OhpqckzdoM2BjcV3NszNW9mgS2W9oYb1+r0M/MkvNRDTk
 hPrKwfua+d334ANh3hlIRZm+FAK4nwL1UpY/o6DBMOba//gOovzgqm5QABPQkS3yzkVR0d
 bpAmsJmyt3uLHdqF/B+UV44AsH1LEpY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-AmN9ov3mNmagvHhHFcb_6Q-1; Tue, 05 Jul 2022 05:03:25 -0400
X-MC-Unique: AmN9ov3mNmagvHhHFcb_6Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1745393wra.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yc1/5yMIpaU2coy/SOPCQomRRd2ZHjliHGdHQg1rfKo=;
 b=ouu+vg2GXbf7QS6NdcRIu31oVNdV7+Ad9yI5N3lxbBz0faJENMGDbhvl64rBc+uN1A
 PzAdsmQfeq/YWZGIEmxnKnMTlRbmVwekIr+v9cdCjzN/U2aXYEaW2DmxKH15st4gjJvK
 emRdYuoYbYUFrzWeyMJ5dIEgg29eBJqmrNZwYVV6vgVatlzUWWb/hAmkMLbW9V3kmzuS
 j+3950SbEomknfYV51MSAcQYq2BwdmuuiIYqV19sEb5hIR7M7YPk9wfcwEJuC2mFRrvh
 mbo3ejEyEiydwUrCaSRRYGlfBo88Kc0khzFa2VDvsEBItI2IXy5xvhKhSQOmt4PXhXcC
 efBw==
X-Gm-Message-State: AJIora8HMTeX9g4u2FWyFxoNpKpAJlq+TKeXjBdqbU8X4htHznTgq9so
 ox9+ImWen+6KEH2wlZtoL0jJu4HmdW0VH+b4LTlSILZfZg0pHR/zdtMtS09V4b5QqIGWSYRoZjK
 AznR05yWCk19Lodk=
X-Received: by 2002:a5d:5703:0:b0:21d:6c55:4986 with SMTP id
 a3-20020a5d5703000000b0021d6c554986mr7663404wrv.455.1657011804746; 
 Tue, 05 Jul 2022 02:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqm5/6Rsm9dL4933EttrYxAtcPbBEvpbA3x2J15pZEaQ0hmwDe+94SRkegjxNxq/fT5bbLKg==
X-Received: by 2002:a5d:5703:0:b0:21d:6c55:4986 with SMTP id
 a3-20020a5d5703000000b0021d6c554986mr7663385wrv.455.1657011804577; 
 Tue, 05 Jul 2022 02:03:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 v3-20020adfedc3000000b0021d76a1b0e3sm408436wro.6.2022.07.05.02.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:03:24 -0700 (PDT)
Message-ID: <6201a201-24fd-3906-4d9d-06f8c6d94d84@redhat.com>
Date: Tue, 5 Jul 2022 11:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: copy-before-write test failing (was: Re: [PULL 07/10] iotests:
 copy-before-write: add cases for cbw-timeout option)
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
 <20220614102910.1431380-8-vsementsov@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220614102910.1431380-8-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/2022 12.29, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> Add two simple test-cases: timeout failure with
> break-snapshot-on-cbw-error behavior and similar with
> break-guest-write-on-cbw-error behavior.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>   2 files changed, 83 insertions(+), 2 deletions(-)

  Hi!

Seems like this test is failing in the CI on FreeBSD and macOS:

  https://gitlab.com/qemu-project/qemu/-/jobs/2670729995#L5763
  https://gitlab.com/qemu-project/qemu/-/jobs/2670729993#L3247

Could you please have a look?

  Thanks,
   Thomas


