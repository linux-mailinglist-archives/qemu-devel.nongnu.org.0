Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11104E446A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:41:52 +0100 (CET)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhZv-0005zs-NF
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:41:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhXi-0003Dq-3A
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhXg-0000MA-Ki
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BkC2dB/xht1QV9JNV2oRgOqTb6OKQVNq6kLyStwaPw=;
 b=fkrPh52OtoXpCKahoSK/BuK+NgPLG+QPf0xwr4+SI83NWJpECfJNlI5g/eMf1MPIn/+X4f
 H2LR0IOl2qESb53oaH0Azb3Iokxq6xJNjLnH1ca50i/uIGh25fcXpAChfHRgeZkrr/v8EF
 hQm/Zp9GXo2vlu62q6EI+70ZGR/REfQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-ldTaqaCgNa6fxh18a13Wkg-1; Tue, 22 Mar 2022 12:39:30 -0400
X-MC-Unique: ldTaqaCgNa6fxh18a13Wkg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hz15-20020a1709072cef00b006dfeceff2d1so3696604ejc.17
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3BkC2dB/xht1QV9JNV2oRgOqTb6OKQVNq6kLyStwaPw=;
 b=wtO6nj5O6U0QiKx5dfXhKo9njlPoUoPgeGDqv2Yjf4TomOnT/HmCznX0b9DKdSrteG
 2oHtGvGabh8InPV1jiX4YNlxjRW1TlGQb7dyAhWKZ2uC+HsDIvGUebodIzSxoj8hAPXU
 0lSijzIwzqi9QoL92kh3y5G6JhtYxSDJEBW+TBbV2aSoBanmbGvb+2crUpC8gmRflBta
 t5/kBrlDjCDJcpI2u+46lxc7NnDchyP5Mx6l2KIvBPQuOxKTQN+zt3NikO/uVDs4rNEj
 VHQK0tTZDvOyCk/XCwN4EO7PTZDdkY9d2cHOewsSEcGBPccD3BVb7CEET2rbflNZ/yan
 TTxA==
X-Gm-Message-State: AOAM533LIrLYtMx8u9bH3haW0/8O5DMRsTXMpuVRN1s+M2fzdntOVdrO
 xksTGgCmgOey1nQnvdGML8BlH9+viMmp6/lBTKt3PQIyB2xFeHAD6arGecu3lUED3U2/cGqfXgb
 b75QyOEJ6MBfsZ7E=
X-Received: by 2002:a17:907:94d5:b0:6e0:2924:bd54 with SMTP id
 dn21-20020a17090794d500b006e02924bd54mr8003559ejc.170.1647967169480; 
 Tue, 22 Mar 2022 09:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUQn5f6K/jySZ/Zbkg7I0dFyEXPGIWEUCLw8cNmY+hgPERrkFjLZwt2MLGm+7IIfS7U6xipg==
X-Received: by 2002:a17:907:94d5:b0:6e0:2924:bd54 with SMTP id
 dn21-20020a17090794d500b006e02924bd54mr8003540ejc.170.1647967169255; 
 Tue, 22 Mar 2022 09:39:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402019000b00418ed60c332sm9506898edv.65.2022.03.22.09.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:39:28 -0700 (PDT)
Message-ID: <6ce9a930-3a89-dae0-4a43-c00af005fbbf@redhat.com>
Date: Tue, 22 Mar 2022 17:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/15] iotests: remove qemu_io_pipe_and_status()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-14-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> I know we just added it, sorry. This is done in favor of qemu_io() which
> *also* returns the console output and status, but with more robust error
> handling on failure.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py           |  3 ---
>   tests/qemu-iotests/tests/image-fleecing | 12 +++---------
>   2 files changed, 3 insertions(+), 12 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


