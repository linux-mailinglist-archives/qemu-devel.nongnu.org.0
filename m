Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B463577CCA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:48:50 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDLUn-0003kX-G9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLSm-0001kf-Jd
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLSk-0001m0-90
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658130401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysCrbDoOnir1Ru8yqyQtcarCpkRB34Hu1Z2Qc2CH4Rg=;
 b=NWJ5HdOvbaW/bM3nm4ukYA/SXPOtxCSBpxfZFpQYvo0MSgPf4w7yzu4xtjepHxdanTiOlw
 h9Gh7HOaQLkIv4rgexxCr9oRl3Sb3KJTm6V5JjUB2s/k5NJ0FWFg66v4Yu0plaNF2wWOjy
 46HmDsUfQuqR4kfbT+KHXw5TTNzaxsg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-_uQCPVLBNyaDNmH_oyfGWQ-1; Mon, 18 Jul 2022 03:46:40 -0400
X-MC-Unique: _uQCPVLBNyaDNmH_oyfGWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a6-20020a05600c348600b003a2d72b7a15so8293880wmq.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 00:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ysCrbDoOnir1Ru8yqyQtcarCpkRB34Hu1Z2Qc2CH4Rg=;
 b=kCBdi5Az3nqYszN4mMq56DUy1bE8ZDiWkbEd8gq8TuoEJeaAwybLR5MmQRJNzrfGSs
 iGfQdCNIlVbNgub/Icm/bmXX9VKYSyaRQJai6DPz9Xj9NDn/+P/gh67p+DwYV0qB5RT2
 Kg30QaTpRfSq4VbDZsEAr4w1FPGlwoyQtVYhiY2k0k3hElJ1wypKu2LCddM1BKQ6abcF
 RCy+QsmBjVfiJH2XGUcHciP1E1zN6j2ebcvczmfGiUeBxa0XELTX1oJfccKLQfyij7A0
 J73QR+eZ3pXQDuLfwUbwCdnicheUjWVUdwxHjKHwV94/BrOE1MFWnFI1w+3m20KeH91W
 J9RQ==
X-Gm-Message-State: AJIora+FqN9alBl8UpukAMaT+dKUGTIqO0ofz6p9VrnjavNoNFB33Div
 G//HdUpThUPwo6wIIqYdRx5K0etK1xEjiGlGpsp0GPiVA8dnvWEqt38nmMpX1oHh/QmxxIpTxYm
 +v+rraOli3AFMWNs=
X-Received: by 2002:a5d:5268:0:b0:21d:6c45:fe6 with SMTP id
 l8-20020a5d5268000000b0021d6c450fe6mr22198297wrc.380.1658130399245; 
 Mon, 18 Jul 2022 00:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXrU7STLnRiuMjb2OouAldVmKQfWBdyjwBvkd71XICKk4jdxzSav0EBZcSCyl86IxCZLJ4PQ==
X-Received: by 2002:a5d:5268:0:b0:21d:6c45:fe6 with SMTP id
 l8-20020a5d5268000000b0021d6c450fe6mr22198274wrc.380.1658130399013; 
 Mon, 18 Jul 2022 00:46:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 o3-20020adfeac3000000b0021d6ac977fasm10031023wrn.69.2022.07.18.00.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 00:46:38 -0700 (PDT)
Message-ID: <6da8eefd-c0c5-2f5e-f40b-434718004a08@redhat.com>
Date: Mon, 18 Jul 2022 09:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <CAFn=p-aYePW6GKPqTgPYUR-b3__uoSa=dLqX3wbQu3jp3Jdd=A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 00/12] Improve reliability of VM tests
In-Reply-To: <CAFn=p-aYePW6GKPqTgPYUR-b3__uoSa=dLqX3wbQu3jp3Jdd=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 12/07/2022 20.34, John Snow wrote:
> On Fri, Jul 8, 2022 at 11:35 AM John Snow <jsnow@redhat.com> wrote:
>>
>> Note: patches 10-12 are included for testing simplicity, they shouldn't
>> be merged. They will be included in a forthcoming block PR.
> 
> Patches 1-9 are fully reviewed. Whose tree should this go in?

I can take them - unless Alex beats me with his next testing pull request ;-)

Queued to my testing-next now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas


