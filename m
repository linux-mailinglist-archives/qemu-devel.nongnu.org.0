Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888437F5A4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:33:57 +0200 (CEST)
Received: from localhost ([::1]:42492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8fE-0005Gm-Cb
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh8MS-0000ns-EK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh8MM-00007f-6M
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620900864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRW+0W/eyzVzsmifZT/3t5UN2lrP8mMGhUs2cHI+zw8=;
 b=LHC12FriEoUnBh1X3MqmczqaqWGn3MBlIxqMFOo/FJYTGKQDd3HoNe1b6ZmZ5bmdFRy461
 CUd8miE9WR2lQudI7hcxdObdCbiTA3n/n4OoCjCU+cvgX/zCOHS9+NTHdhOx/hpkmgkizB
 2lFJilBJkoGXeYbagH4yL72JvKUXMSw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-3Cv-rkfvOBy5HVrgTE3I4w-1; Thu, 13 May 2021 06:14:22 -0400
X-MC-Unique: 3Cv-rkfvOBy5HVrgTE3I4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so721314wmg.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MRW+0W/eyzVzsmifZT/3t5UN2lrP8mMGhUs2cHI+zw8=;
 b=p0sVMOnvkkSyltcfvq8gzv6Gj+xmaET03dwMO59Wjuj0Tz9164gkYv2oCrf2SaLA0N
 LAPkt1NjwzrdsDvrul0SGrzMoEF/R0+7ukEER+MwmlxvgZQ/gv057qawhw6ehiaHS1Xc
 2CMB6l6IR77dOLDXKh8EG5N7WOG56+GsCJVrjkzpK1yMUalNHVcTJBfIh+DEusIyPY12
 Apwy3HWwe2bYZ8ojujhe08+CZ69ql8B0PCOxKtbWqVcH7z+KUbNMUvMWN7HhpvQtFrvT
 zpOudDCr0OX5COy1SKIt0qPhWZUvXPXAQprlWA5nCADQmkWUmHx+he3Iz/A1M6+fD1Rp
 9FvA==
X-Gm-Message-State: AOAM530lsF1gFxbgpeUOo047gunJJglu9Y90XosLKSIcPYqb12j0O3h7
 Ufsb/KFonEmZDUVUOMf8ABMiO0SSLwVAntJ3MW4m4kYK4BN84FvDpb6I+WVVGQliyUbBHgmO9ER
 wlW+RdlGTe/okmhA=
X-Received: by 2002:a7b:c052:: with SMTP id u18mr3045104wmc.105.1620900861546; 
 Thu, 13 May 2021 03:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/qWr5bX7q3UnnnaYYMBCh/BExmO+pXEjW83zehHZPNePF+o4NNA7SVW8PDIAVJNNc9HFfsw==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr3045087wmc.105.1620900861381; 
 Thu, 13 May 2021 03:14:21 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b81sm856827wmd.18.2021.05.13.03.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:14:20 -0700 (PDT)
Subject: Re: [PATCH v3 07/22] tests/docker: fix mistakes in centos package
 lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210513095519.1213675-1-berrange@redhat.com>
 <20210513095519.1213675-8-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68e7c6d5-8fe6-ad68-6911-af40a8addd4e@redhat.com>
Date: Thu, 13 May 2021 12:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513095519.1213675-8-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 11:55 AM, Daniel P. Berrangé wrote:
> mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.
> 
> spice-glib-devel is not use in QEMU at all, but spice-protocol is.
> We also need the -devel package for spice-server, not the runtime.
> 
> There is no need to specifically refer to python36, we can just
> use python3 as in other distros.
> 
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


