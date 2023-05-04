Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CA6F70ED
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucog-0007CC-6a; Thu, 04 May 2023 13:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1puaeZ-00080t-H6; Thu, 04 May 2023 11:13:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1puaeX-0001XS-Qp; Thu, 04 May 2023 11:13:55 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaf70676b6so4430615ad.3; 
 Thu, 04 May 2023 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683213232; x=1685805232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NutIhzJDNxMTIFS9t7wC7dYAQ4J8605wnEL53vTTKq8=;
 b=InyQIdeyMf9NDPULaNrnY4h/3RV6BZAfT7Chvhj1AvDjHhxWCE/OqKywvE38DuEMjY
 lXELf/oB4gEwANpaOTSaJ++Wvj+n1SrDPczCwlpYFqglLzXx1KS64ZXFgItlLR6BJPpz
 jdHWXUIwF1uttGY6on4L5XuWIqvvwnHkercb0LtJLhKaMnC+vKQuQ7gOVxRwDyH2mQS6
 Yc1yfPH4pHCmsAPJm6+mOcf3GZv7Xmb0B7PLLpPDFCgIVU8+KPt7AWZEN5tpgujsQOwz
 eOH3cjRAHyinEbJlGx8+JVfcNn2ghIQyoM5nQgLKAtx/AdI/FS8r/8ZXepYvTyQFEkyg
 1Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683213232; x=1685805232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NutIhzJDNxMTIFS9t7wC7dYAQ4J8605wnEL53vTTKq8=;
 b=L098+wzUE95vpMBxXr3rlzxysqxkJe/1DpjKF4C4hqFAbsUBbDivEEjIzaXzWCDxDW
 Tkco7OlcaGzwlRDD5r5Zm8EZgzX0BPWf0fQE3AQOx2G8RiHG12/N3evfMS+5ko6DwsYC
 wv9R0RJgSveW3llzac58fHuUteDImLx06zE+lt7V/JKg+j/1NMOlojDDks5SWcbnEmiI
 F1O/HxvROJ4z0dbmi4KcNBdeapDKbmzmFYHMtlqXtzllDUICDW0XBP/UpKpyQ3VV9pqI
 hSur5o1TW3teO0jciMFF+tkAjXilW1NrjkmaapMr3399r/CtA9e8qnU6WFSoGT3p6fkq
 Z1sA==
X-Gm-Message-State: AC+VfDwQ2OM47MSiTqWQ0S9pbUQ0RVrRJI92sR3SYMvy3H/S7/DE9cAB
 67Os5EObpuI3+uhq8yhd5Oo=
X-Google-Smtp-Source: ACHHUZ7C+6O5YFyhAbK1LCzUqJ9aWM+Ol4ot/HEt1yLuEDAWRNI6/o+dixSqGGIkjMiTJprBO/ZBIg==
X-Received: by 2002:a17:902:b198:b0:1a1:b174:836c with SMTP id
 s24-20020a170902b19800b001a1b174836cmr3826967plr.16.1683213231657; 
 Thu, 04 May 2023 08:13:51 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a17090332c100b001a3d041ca71sm2322354plr.275.2023.05.04.08.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 08:13:51 -0700 (PDT)
Message-ID: <8373e1c9-8b4a-c5e1-cafd-cec7f19dbb7d@gmail.com>
Date: Fri, 5 May 2023 00:13:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] include/qemu/osdep.h: Bump _WIN32_WINNT to the Windows 8
 API
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>
References: <20230504081351.125140-1-thuth@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230504081351.125140-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/05/04 17:13, Thomas Huth wrote:
> Commit cf60ccc330 ("cutils: Introduce bundle mechanism") abandoned
> compatibility with Windows older than 8 - we should reflect this
> in our _WIN32_WINNT and set it to the value that corresponds to
> Windows 8.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

