Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8245F6D7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 23:26:42 +0100 (CET)
Received: from localhost ([::1]:42496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqjg1-0001mU-0A
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 17:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqjeX-00016G-04
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 17:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqjeT-0005Fm-6f
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 17:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637965503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4EBiyuTgm6HDKDWrZDhmRLuzmTS4sveRfXtyNYkWPI=;
 b=Gs7uiBWkoc5JS8GuXQEYGr+XXezJUkv32KzpglZ13EK9li4PNIgEOQEctNfG/ZtHbulfOv
 tlGvu4Kuku47kTtoelTXVxEPyIliEgGed9GZFhl0GLQoW+GKKBoNSad/eEpXdU51Ti5jxC
 oFtmBXWa24QKvT1nqSR21E9gLrlNhlM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-485-bFD2FBdvNZuuP0s5rg7riQ-1; Fri, 26 Nov 2021 17:25:02 -0500
X-MC-Unique: bFD2FBdvNZuuP0s5rg7riQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so7586333wma.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 14:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E4EBiyuTgm6HDKDWrZDhmRLuzmTS4sveRfXtyNYkWPI=;
 b=4CWY2DvrCrndjDr7b5cnowTiOM9yP5wiSCtuUzF3Ann5xRmcHTMpq3Y/LZw2XSQgvt
 8/VhHiYzDf9QE0/uqPHtFehc7G7Slt9K4I2bS02DKizkaYxRqlXQ1L0haEa2rV9yYn46
 5ZHHbm0awpKDuXyE+EmQik2g8BS4nCptuqEmWumqwTS6n3J2ezgkp9cvnFlfHQikKLTH
 u2CE2sknz/5hdbrfbpUUKXClPROiF4oos/u7CSoiSebe9T/E6baD/c9QLOleHoMGebpL
 goeYth+r1hlnPP0WSIp0XQAGE7kW6Sj1Qkh24gsVWxEw30A1XjwqnjT7V3QJFxSbMOYl
 4s1A==
X-Gm-Message-State: AOAM5313dyKaeBuWd6ZRS/X7KycWybj2sdmrITO6+ihWvAtlp1MEDQi8
 PP4HTbXTLcvzeJP70jyoClY0gA9+L6rD/+ssfpSHLOqohDI0smDkQNtmUI6qU+aHCeOn645me8V
 DkrPLeWxESQdNM24=
X-Received: by 2002:adf:a404:: with SMTP id d4mr17273944wra.556.1637965501211; 
 Fri, 26 Nov 2021 14:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlDMN5wPeA9lZ0lh0pFnV2Fb8G5rFNx3ZHwyV2PWNZxIraA2o6OxmWidmfewvqfeN2dsJBPg==
X-Received: by 2002:adf:a404:: with SMTP id d4mr17273923wra.556.1637965501030; 
 Fri, 26 Nov 2021 14:25:01 -0800 (PST)
Received: from [192.168.1.36] (217.red-83-50-76.dynamicip.rima-tde.net.
 [83.50.76.217])
 by smtp.gmail.com with ESMTPSA id 9sm8743564wry.0.2021.11.26.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 14:25:00 -0800 (PST)
Message-ID: <11405d5b-3fd3-4e52-e4bc-bc2a353e36ae@redhat.com>
Date: Fri, 26 Nov 2021 23:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Add jobs that run the
 device-crash-test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211126162724.1162049-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211126162724.1162049-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.993, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 17:27, Thomas Huth wrote:
> The device-crash-test script has been quite neglected in the past,
> so that it bit-rot quite often. Let's add CI jobs that run this
> script for at least some targets, so that this script does not
> regress that easily anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


