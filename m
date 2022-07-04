Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FECF5658EC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:50:07 +0200 (CEST)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NOo-000754-BL
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8MxM-0008CP-JG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8MxJ-00059X-GZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656944498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnTA7O/QS0SGLGUqrBvs/T1SyF2OkuTch8Jxj9rixX0=;
 b=ilcEKhsL1LLfCKc7EPXZUgvUpnKDMQJ7bOzWLrAUbBEkqLQXGC8IYHf8sXvrqM20WvPF4M
 ifjGHpJAlrIVuNC+Tf3a5FaLp1xzeFcr2xoWsALHEMsi7FnP8o0nxC8f7sERRDh/UHSsac
 qFaKRJDWuiL6/B38g31Sr50ymR1Q4U0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-L4ek3abNMYqczwGjCmQolg-1; Mon, 04 Jul 2022 10:21:36 -0400
X-MC-Unique: L4ek3abNMYqczwGjCmQolg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v8-20020a05600c214800b003a1819451b1so5413796wml.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vnTA7O/QS0SGLGUqrBvs/T1SyF2OkuTch8Jxj9rixX0=;
 b=zw83lHTIueTXV42zZvP9a0CyaBLlDwbweZFksSjaoHhkooYBnpfRrUsDYxoEfH2vpN
 VMIxIdI98FFWa9+SODpv5Xg9IFU/6lRK0L0LKfTPu3MXUb3NV7O4wEu1pK+v4uEolbbq
 RbwppZv28exDzwbQcWchhLCgDVI+ImGVViornjUe0DP4z+J4sRG2BMd56IcdqUwOYFge
 Z5rmvKpQHkouQsx3C4uJqmJg7jXIFtOzXyBzUWuuA9sfo4h1Yl81vQockZDZ7d2BHqoP
 o/5fDQXJgDC2eIFshVJ6W5PssqIvMX1ImgQC+K2D3qvSdaCw4BtckuSt/dxbOMuZLiXd
 yJYQ==
X-Gm-Message-State: AJIora8/EFoYklbDzXaXtn2GfFia1yQG0p4YdS16BvjvEu/esNZhewH3
 QPXEzO1DW8W90+iebACvxnR3DnkM5lGlwfXCdO1cpy3dp2WSI65+bMP5X31g/my8KL/JspxjSTD
 75wjoDPf1zlZYbcM=
X-Received: by 2002:a5d:4302:0:b0:21b:a641:9a36 with SMTP id
 h2-20020a5d4302000000b0021ba6419a36mr26195820wrq.87.1656944495587; 
 Mon, 04 Jul 2022 07:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDuWiBHDpydjdMOO9C7WWsLFaQ0NXbclLjHZPb97l8m/3OMacO5UXFq8yQ9WJGeNhQCn1wZQ==
X-Received: by 2002:a5d:4302:0:b0:21b:a641:9a36 with SMTP id
 h2-20020a5d4302000000b0021ba6419a36mr26195799wrq.87.1656944495390; 
 Mon, 04 Jul 2022 07:21:35 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 m12-20020adfe0cc000000b0021d4155cd6fsm11806915wri.53.2022.07.04.07.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:21:35 -0700 (PDT)
Message-ID: <b277f225-c1bb-af7b-40d4-387a55b2edbd@redhat.com>
Date: Mon, 4 Jul 2022 16:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] gitlab: stopp edk2/opensbi jobs running in forks by
 default
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220629170638.520630-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220629170638.520630-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 29/06/2022 19.06, Daniel P. Berrangé wrote:
> When we introducd the QEMU_CI variable to control running of pipelines
> in gitlab forks, we didn't include the ekd2/opensbi jobs in the rules.
> This caused pipelines to be unexpectedly created in some cases. This
> addresses that oversight.
> 
> Daniel P. Berrangé (3):
>    gitlab: normalize indentation in edk2/opensbi rules
>    gitlab: tweak comments in edk2/opensbi jobs
>    gitlab: honour QEMU_CI variable in edk2/opensbi jobs
> 
>   .gitlab-ci.d/edk2.yml    | 133 ++++++++++++++++++++++----------------
>   .gitlab-ci.d/opensbi.yml | 134 +++++++++++++++++++++++----------------
>   2 files changed, 158 insertions(+), 109 deletions(-)

Thanks, queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

(with the "on_success" changed to "manual" in the last patch)

  Thomas


