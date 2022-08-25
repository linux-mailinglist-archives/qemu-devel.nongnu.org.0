Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740805A0FA0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:54:12 +0200 (CEST)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBR5-0005ys-Hn
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBIp-0005HQ-Rh
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRBIl-0007Jy-QT
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661427910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hH7ljp+AvwB603kefKWWDFIqU2lkvS0JxGHkAiUygh8=;
 b=YtHBDeajrcXA7ez3+rxHD/Pbpcwo2SSCdXVAcWOAV0Gg4L343MIAHgt5X02y7AqdjTHWh7
 TObAuUqc8EgkhnnUj2BSG5vIw3SOm40DLdxXbN0no6T/jeJ1HJn4Z4Yj7FELpzuxSEy1vL
 BvoN7I9vBbYNUOHEynoEQduxwmX84e8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-J_3j5gXeORW_bT3nmMBz8g-1; Thu, 25 Aug 2022 07:45:09 -0400
X-MC-Unique: J_3j5gXeORW_bT3nmMBz8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so2352425wma.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=hH7ljp+AvwB603kefKWWDFIqU2lkvS0JxGHkAiUygh8=;
 b=n0NeTbsZ52YUJjXOKxUetJuNHvOvcsVLdD/yfKubJ1M0DcHaiUV5WpieQkk4rIioLH
 ChcAtbmlP0R3DMfBN6/hWp/atx8CwiBsd//x5AFvFMOTBk1TSBvl24fe2Fissag34K1p
 E0DqvcyE6XgcT4sasP1SS+QqdR20Gpb1zTUcXf/it2IgoL2/P5ORLVdW1YWmPM4EfEuo
 qX8neTSWzSik9vvGcNlo+uBSuDfJhXFrraOnGS68zFVAPmgHfJHnU9ICGx7BUK9dSgL9
 EyshNmDbxQp1yZZYqbrgVwjgtkEOs8iOM6DnA5bqT2e/91fQik4bPDpWbs1OyXVTBXTH
 oRTg==
X-Gm-Message-State: ACgBeo1de9m28/ozNOlmzJ8hAZ22r4jl0cOs49ImkB3MLyO3XoeK0Qse
 NVAkl8n0NrGiDuB9IogCSNEjy/awiDYulXAi8WiZrJ9h3hCgMrCWuQmDjCUlW+4BFG59MwZolyh
 3PFsqBAY8/uksioE=
X-Received: by 2002:a05:6000:1d98:b0:225:294:8150 with SMTP id
 bk24-20020a0560001d9800b0022502948150mr2001506wrb.169.1661427908329; 
 Thu, 25 Aug 2022 04:45:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6t1i40eGCrQJyaKtnKTnxsx9Rgpt5lGRsBeZt3qe3GfpShP8Av3O/Wv8YER6t8Zxc/VUu3XQ==
X-Received: by 2002:a05:6000:1d98:b0:225:294:8150 with SMTP id
 bk24-20020a0560001d9800b0022502948150mr2001490wrb.169.1661427908121; 
 Thu, 25 Aug 2022 04:45:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003a502c23f2asm5497279wmo.16.2022.08.25.04.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:45:07 -0700 (PDT)
Message-ID: <01f07e7f-dfbb-3c28-9481-f5c85fd42eb7@redhat.com>
Date: Thu, 25 Aug 2022 13:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 22/51] tests/qtest: qmp-test: Skip running test_qmp_oob
 for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-23-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-23-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The test_qmp_oob test case calls mkfifo() which does not exist on
> win32. Exclude it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/qmp-test.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


