Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6B674742
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 00:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIePY-00089K-B0; Thu, 19 Jan 2023 18:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIePV-00088s-Ru
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 18:33:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIePT-0008Pj-7H
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 18:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674171209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM06HIpGOHOvV75p5cdXqHGuRUCNkMKEjQFaR0seGDE=;
 b=RNy4LQyscet5NjNocUtRmVXhSUHpkrvNmFqevj4syixYX0CROqIlCzxJLtCH7pKgQKvr/1
 +4sf9CPqNak8g9Jr8atKuqbovahLK1Zjag/Lqtrd4UKjslWl2wiKWIiY3Mmo8wSaZWXWV1
 sTEgCMMis2nFyHfdjB2qqGRxfCI+YBo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-Ge4elK6qNVCbcYKGn3DCHA-1; Thu, 19 Jan 2023 18:33:27 -0500
X-MC-Unique: Ge4elK6qNVCbcYKGn3DCHA-1
Received: by mail-ed1-f69.google.com with SMTP id
 q20-20020a056402519400b0049e5b8c71b3so2617892edd.17
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 15:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pM06HIpGOHOvV75p5cdXqHGuRUCNkMKEjQFaR0seGDE=;
 b=dD90IroG1KduwDHrdOMU+9p0A3yKVqvZEMR9M4HIFm+RxKw3HdH237uyjLZLsEeNP4
 fz7pxCsj4fx2+LSQyx5D69Pcyrwlx9fOpGhE6yh5S26cXObWtT0uxB8sCtlgL/4f4O0n
 kJ1kC1zH1pl30tecb2y34YqLZ7Xl4UG4RbDStn1jlwCz/XChH1Bf6cMYGD0LpYJ+Q+HK
 kSK1GDON0Qsb4uhPKnttJVjdrOyRZtIZNKt/62qU6veJalEGGsnnwTPpO+HFIU2ZdyA5
 TiPIm3dZCHOqlfLJOPB7nUdqHUQm00Hh+pX+V1fXf9ewYREBqzbnQh0TfkSd6j/AzUlL
 IsNw==
X-Gm-Message-State: AFqh2krYFTXJa1WdWY/MEHVapO3RuMpf3H0eRr5GQ/5A4zQukZrf6S78
 9sFywXKDsmvApHSh9mlhfTFnndzYPXPB91R1MksYHoFDx+7nl4I18TRQghjINOfnPf9DioICDvu
 2p1RhqreFPw9ougs=
X-Received: by 2002:a05:6402:c84:b0:475:c640:ddd2 with SMTP id
 cm4-20020a0564020c8400b00475c640ddd2mr12304828edb.26.1674171206814; 
 Thu, 19 Jan 2023 15:33:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsmF3Wte8T69Cj86JaXDlcVxUbQGDE54L4SKfJYhaiyM/UOwM/KWNMMcjdA74GSJX66S9yybA==
X-Received: by 2002:a05:6402:c84:b0:475:c640:ddd2 with SMTP id
 cm4-20020a0564020c8400b00475c640ddd2mr12304798edb.26.1674171206523; 
 Thu, 19 Jan 2023 15:33:26 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm7537987edz.42.2023.01.19.15.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 15:33:25 -0800 (PST)
Message-ID: <9ae0faf8-da47-a86f-5365-0798914db6fb@redhat.com>
Date: Fri, 20 Jan 2023 00:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 10/18] Update lcitool and fedora to 37
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-11-alex.bennee@linaro.org>
 <e0203997-0161-8abc-de76-ebd88f117545@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e0203997-0161-8abc-de76-ebd88f117545@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/19/23 20:35, Philippe Mathieu-Daudé wrote:
> On 19/1/23 19:04, Alex Bennée wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Fedora 35 is EOL.
>>
>> Update to upstream lcitool, that dropped f35 and added f37.

If you also have time to update to commit 
40589eed1c56f040d0f07fc354c242a0e0d83185 that would be nice (see 
https://patchew.org/QEMU/20230117091638.50523-1-pbonzini@redhat.com/ for 
more information).  Otherwise, no hurry.

Paolo

>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20230110132700.833690-7-marcandre.lureau@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
>>   tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
>>   tests/docker/dockerfiles/fedora.docker             | 4 ++--
>>   tests/lcitool/libvirt-ci                           | 2 +-
>>   tests/lcitool/refresh                              | 6 +++---
>>   5 files changed, 10 insertions(+), 10 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 


