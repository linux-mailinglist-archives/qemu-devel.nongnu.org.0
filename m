Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B96D034F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:37:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqZW-0002xR-AC; Thu, 30 Mar 2023 07:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqZV-0002xH-1N
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqZT-0000rw-03
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680176158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUnBzOgbQlh7B/O7SmDugyxv7WUFD/Sh0dt2babKSic=;
 b=AsxkguNpHsqoWIKATNRSDJkRq+ThRmvWCrVVvRcXsBEi0/ENodKodvfs3M6Pg3ynW4G7l6
 sOTqcWe+wmddAz5MdEjcbYk3/+NOIEkjiu5a5sO0IthzJv/JbLws2hdYn3BGjsCFjJcgnz
 pkSnn13rgvIs8DYarLqfHNxgeT+/22Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-91j8l-pFOdKaYRDgeQIROA-1; Thu, 30 Mar 2023 07:35:56 -0400
X-MC-Unique: 91j8l-pFOdKaYRDgeQIROA-1
Received: by mail-qk1-f199.google.com with SMTP id
 q143-20020a374395000000b0074690a17414so8768235qka.7
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680176156;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUnBzOgbQlh7B/O7SmDugyxv7WUFD/Sh0dt2babKSic=;
 b=vIJlQ9aZIBASImq9m5b/ixRpNJwKip2box1cKgxDz26rs08MV49rhPcYAUsuE1ssOA
 YqgqW9nmwFjxmKGhl9IM+1e6WUNdIxkkhmaYisVWmsq5jHx1p2VF/g/Tf4jhiwcrM3zG
 iscYbC/rXeYZYrbBqIW8a8QsGH/lboODWndqVsWmlHGjhSmLz/LR1/BMus4Yl6hYIa/M
 z+1GiiC8ufiwpm7ewkHpA/Np+tCuPiLmonKJGGckifhc/Fhu1KrlcCj0bCvciar3lrIb
 eE3bSZCOLRRmZ1HuHf1+3dGEGmpKbBEv97qGnwttY1JqZdAytZR+PqEUoRV+DRn4bJhT
 Bs5g==
X-Gm-Message-State: AAQBX9dxO0nophMt2/an1QYwAfcR+jxXqcuKUxPkR+CKbEKjGSX7T4IF
 fWJpP7tSkRgcZEQY7XUe7lpyezyJ+9cvfb7cHXbSwIttblN610W8n1NiwLg5Kvm7Odyx/17sdVY
 JqVr3ukEMYHeKVY0=
X-Received: by 2002:a05:6214:5081:b0:56f:154:2517 with SMTP id
 kk1-20020a056214508100b0056f01542517mr30255652qvb.10.1680176156132; 
 Thu, 30 Mar 2023 04:35:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350a939TCemdtkbtsvGLmDe8UIHdR7+bzmkBevH/nH+/cUmd+KfaFL1bSLYvovI5LrwRZEJRofQ==
X-Received: by 2002:a05:6214:5081:b0:56f:154:2517 with SMTP id
 kk1-20020a056214508100b0056f01542517mr30255632qvb.10.1680176155883; 
 Thu, 30 Mar 2023 04:35:55 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 pz28-20020ad4551c000000b005dd8b9345e6sm5369345qvb.126.2023.03.30.04.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:35:55 -0700 (PDT)
Message-ID: <83978ff8-ded6-aeef-a49b-41bb9f8fe929@redhat.com>
Date: Thu, 30 Mar 2023 13:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/11] gitlab: fix typo
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/03/2023 12.11, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 0274228de8..2fbb58d2a3 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -75,5 +75,5 @@
>       - if: '$QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
>         when: manual
>   
> -    # Jobs can run if any jobs they depend on were successfull
> +    # Jobs can run if any jobs they depend on were successful
>       - when: on_success

Reviewed-by: Thomas Huth <thuth@redhat.com>


