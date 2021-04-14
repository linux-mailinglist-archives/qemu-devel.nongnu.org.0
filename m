Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6813A35F448
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:53:40 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWf1X-0001nA-Hr
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWemx-0004jH-Ug
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWemv-0008SW-Lr
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618403912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sXB4mmWKfdT/pgay3a/C20s9LhZL+8Q39JFroFFNtc=;
 b=gaNWxOJhPCP4FmQxO5Va8IkwjmRcpGgRSZld4OA5XGN/YX0bVlGmyA0nQvFK1AiMwPdAjl
 3vpiH4Dk2EskOdMQcNAyi7UmKRyoriBH9waQVp3vFvrUBgqCJaTBt81e+h9GCX+gytcOQy
 H4QfWbSAEFCXgn3LN15lAtmJRyfZcIM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-7BZI6hDkMP6KZUXImnvr1A-1; Wed, 14 Apr 2021 08:38:31 -0400
X-MC-Unique: 7BZI6hDkMP6KZUXImnvr1A-1
Received: by mail-wr1-f70.google.com with SMTP id
 h3-20020adfa4c30000b02901027da44a81so1011933wrb.19
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 05:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7sXB4mmWKfdT/pgay3a/C20s9LhZL+8Q39JFroFFNtc=;
 b=kprDU35DVaRKWho+3SLAS0aT05EQ8eINyVFdHiksYzYOU/EQKV8nPawvsI3vE74XmT
 Hl9Qtv58ZsPfW5/5Goi4IzJjEnmoGU+Rz8Mv2q4T0MvQgwtQ5WNjXE3Ih3RuKnHyZkRh
 49sRueNFHfLcYrln2vSn342wmdWWnMwb2MV9FxutYLg5mTpmWjKLGLldwY2wdXpov7cR
 fZRCyyWwAhoNENSSohlbPljmmQuQ4F1xHYqDQbZGbG5PPyJyAN0m2wTc7l+Uwao5X9yF
 ZSGbNXSZ2Kxj7CrIktrRUjrqNUII00s2KasWk3ztEPGNT+mqWAvfR1pxWzaQ9Tst55DS
 P7Zg==
X-Gm-Message-State: AOAM5313ThnNkPqzQ+KY2uNnAVkoM8LwrRtXktu4wNLtLh/Y6904HBNV
 5vFRsytEalLLt5YWmhYmh+d4uz1NCcgNyu9cTbm6hDiYah36x5JwR5JdOLXo+2STT/382HHY844
 4m3LD23BVSyI1BTg=
X-Received: by 2002:a1c:1d0d:: with SMTP id d13mr2773616wmd.90.1618403910041; 
 Wed, 14 Apr 2021 05:38:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJavVm8su7DRTZEQDgLOxlaikOhvX4zY+baTRkofPmvv0iNRHVLFJpFHAuigyRSgtdlNIJyA==
X-Received: by 2002:a1c:1d0d:: with SMTP id d13mr2773592wmd.90.1618403909789; 
 Wed, 14 Apr 2021 05:38:29 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm5216290wmf.28.2021.04.14.05.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 05:38:29 -0700 (PDT)
Subject: Re: [PATCH] hw/block/nvme: remove redundant invalid_lba_range trace
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org
References: <CGME20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6@epcas5p3.samsung.com>
 <20210414070435.3702-1-anaidu.gollu@samsung.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <262467e8-5d02-3425-3240-fbd99d995e2a@redhat.com>
Date: Wed, 14 Apr 2021 14:38:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414070435.3702-1-anaidu.gollu@samsung.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com,
 kbusch@kernel.org, stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 9:04 AM, Gollu Appalanaidu wrote:
> Currently pci_nvme_err_invalid_lba_range tace being called indvidually

Typos "trace", "individually".

> at each function, add this in nvme_check_bounds and remove redundant
> usage of it.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
>  hw/block/nvme.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


