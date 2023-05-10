Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109566FD77F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:55:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdj6-00060j-1M; Wed, 10 May 2023 02:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdiz-00060H-9J
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:54:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdix-0006bq-UL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683701695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76Wo81x0j95aRjZKNoNdPMA0OrZ/P/oqWBuJraE/sTI=;
 b=cZ7M6RjOvddwtLWT1mm45CPwhIfp90ivSOivIFVlgmOzezcdm6+5BUtN2e+y3tGAfe2PUT
 kcZ5XyHlj5jloci/vb018hC6VhxsJbXLFyW6DOL2qpnzUDkwoK2qkD7x9Zi+zoTubLQ+9a
 lIPiG+VSo3tynvumCyLi3gYKGjVr0Ig=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-5qFwr_4oMqSNyWy92tNieA-1; Wed, 10 May 2023 02:54:38 -0400
X-MC-Unique: 5qFwr_4oMqSNyWy92tNieA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso848486166b.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683701677; x=1686293677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76Wo81x0j95aRjZKNoNdPMA0OrZ/P/oqWBuJraE/sTI=;
 b=EEhEteLqhZO9+DrSju/9QvYq7nQfSp4aNbFhW0XuWrBCHJIoJn7a862/TG3ucDGUBH
 5djhnbBCYzLKDKNeN3hoIY2PP3mqCRJoep2tD8gp87718YHVPeJYhvgcRC9ofslk1p6X
 GwDdzDcxnwfAl7FgLHiZIDj8C/xmcFdMbXxBmTOFUvYiKmG8Ywgs1951F4UXL275+8oP
 5z/p+t2C+YQ4K5VfSzyxUa/EJYntbgz/7Zu792cIN1E1W0P7klESgJP8btHWXUVNL6dO
 AtGkuHpQmSbRTfxePpF8My+5lahtrBtTcPAlsGxNCKKjBbdKWqNQjaOF4QZ+3fp1QH1K
 qJEg==
X-Gm-Message-State: AC+VfDzHGeR3d2oKLNMTADfi7bR7ZpueVnn+AKTsf8vF2aTsiZyaxJ+a
 O3Jx8XSkAERPaZtrdeOQdnGZ0QHUOO3ErvgfRmaP0aXpfaVd0TNGLgxP7DsLxV/kd3OcTAVfOSO
 9ZxXYO2oMCRZf0ec=
X-Received: by 2002:a17:907:7e97:b0:968:4ce9:677a with SMTP id
 qb23-20020a1709077e9700b009684ce9677amr7656990ejc.38.1683701676955; 
 Tue, 09 May 2023 23:54:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ps7f8JJnzbnp/2vyA2CHwjcWphoL1hJ2yKek4WahMfc+JhTbVi55I6FMGGtIJH2J2Utj77A==
X-Received: by 2002:a17:907:7e97:b0:968:4ce9:677a with SMTP id
 qb23-20020a1709077e9700b009684ce9677amr7656982ejc.38.1683701676740; 
 Tue, 09 May 2023 23:54:36 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 n12-20020a1709065dac00b009663cf5dc2fsm2291813ejv.66.2023.05.09.23.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 23:54:36 -0700 (PDT)
Message-ID: <03e6ccb2-85a4-d1c8-7d3d-30ca277aad4c@redhat.com>
Date: Wed, 10 May 2023 08:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] Make the core disassembler functions
 target-independent
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, philmd@linaro.org
References: <20230509163326.121090-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230509163326.121090-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/05/2023 18.33, Richard Henderson wrote:
> Merges Thomas' RFC patch set with part of my "build-tcg-once" patch set.
> The only real change from Thomas' is to use uint64_t instead of hwaddr.

Thanks for integrating it!

There's a minor nit in patch 5, but apart from that, I think this series is 
fine now for getting merged.

  Thomas



