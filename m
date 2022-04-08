Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B54F923E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 11:49:35 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nclFF-0001tS-I5
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 05:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nclCb-0001Co-JW
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 05:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nclCY-000437-BZ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 05:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649411205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRYi3jS578x/MKdJKZ0eACSIMUK1Ah2VKZOw953iwPA=;
 b=P1CAiyH+wZ//QZa3bBnaW4+aIFSazZCENxrSlv8tXQukGx8qG298lOe++cgzeMp0Ox/xf8
 27LKNpvVVys+qO8AfkAHnaJQ2N8bRf7DKzgOCfMoGYX1gr4s0bIaLa3blTEMc7u3mce/xt
 PPln/IB+qVUV8gnPmdjtlJgXYhbuHyg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-YwDwMyqcP1ygaihteDs1iA-1; Fri, 08 Apr 2022 05:46:43 -0400
X-MC-Unique: YwDwMyqcP1ygaihteDs1iA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o35-20020a05600c512300b0038e83a52c71so2144219wms.7
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 02:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TRYi3jS578x/MKdJKZ0eACSIMUK1Ah2VKZOw953iwPA=;
 b=JaYyeqr+YvT3Msx2LPsr5r1KKbiX9LLCBmnj3dOg8mn3dfW+LiJ60NhpKvHju9U9ua
 9xBM0gTtdCb/S0Sz5O4tDfQ/2ogsS3M1+DyGxU0jUDk1YIsxL2b2Zd/aqLoGTQtWzq7c
 GG6P6r4AGg+Euoye7Z4TsjkeaUy3aTjNNMQS1s0TDPiB50CiLP/nAwAfHdvaGI/KhzXr
 Rz002TO/v+GgbHGDh3laVfwR9cfH4jRvQYuhTyp7GUbecceqXGqY+lSIyeQQ/kEW60qY
 9tSin2qfzdakTJT3yrjiYLfBTXZjjLi0HR53h7GR/egNeCMjCpa/OcpGAwpmdp8psnJ3
 p6zw==
X-Gm-Message-State: AOAM532WtUYGIkgsulchd2vI6h2CIX2sSiCwbBEJM1t+nkhDq1wjrer0
 TbLVC0nXNMZaj1cZDYb4wHuiDdr1nqVLD1v19eJspd+PyFrsoyTnySIakXep8wekLaQsm+QTfN5
 yRwSapLPy0WfQAmQ=
X-Received: by 2002:adf:e848:0:b0:206:19e1:fa07 with SMTP id
 d8-20020adfe848000000b0020619e1fa07mr14694159wrn.32.1649411202771; 
 Fri, 08 Apr 2022 02:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOFKHKlQUuInSFVBIhQbyF/EsSem6afibDQX6BG3VjMpANR0nG8brtlDRbT6L6qdnEqAxiKw==
X-Received: by 2002:adf:e848:0:b0:206:19e1:fa07 with SMTP id
 d8-20020adfe848000000b0020619e1fa07mr14694149wrn.32.1649411202568; 
 Fri, 08 Apr 2022 02:46:42 -0700 (PDT)
Received: from [192.168.197.94]
 (dynamic-046-114-149-171.46.114.pool.telefonica.de. [46.114.149.171])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm9877830wmr.24.2022.04.08.02.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 02:46:41 -0700 (PDT)
Message-ID: <e79c6283-468e-0682-3dc4-9f4d6449eeb4@redhat.com>
Date: Fri, 8 Apr 2022 11:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Wiki: Update package name in build instructions
To: Lucas Hecht <lucas.hecht@cyberus-technology.de>, qemu-devel@nongnu.org
References: <6e8852b0-7320-ef7d-18c6-512cabeb71b4@cyberus-technology.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6e8852b0-7320-ef7d-18c6-512cabeb71b4@cyberus-technology.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2022 18.10, Lucas Hecht wrote:
> Hi there,
> 
> could someone please give me a wiki account or make this minor change themself:
> 
> In the wiki article "Host/Linux" under "Recommended additional packages" 
> libvte-2.90-dev should be changed to libvte-2.91-dev since the former is not 
> available anymore.

Thanks, finally updated!

  Thomas



