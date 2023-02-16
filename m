Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D41698E27
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:56:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZ7Q-0006KP-Tk; Thu, 16 Feb 2023 02:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZ7H-000686-SR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSZ7F-0001d7-U6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676534140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XP5lTNS9M/3hu499TdM2vrS4F1Z+ZwVJAD2BS995kX0=;
 b=HstIW1dC+dsCnd3JmkJhKCo7tC0BDcQuU5ze1nO09FitU5QUhCtV17qSxZlQ78ihY80c0b
 T6j5g847vQwKIAGFkJH99c8qvE1l+9Ky24hBEl11NtqGYKFLJTS2ZAo0gqSEiz6L+txTpH
 ZKAXLbvnNOQa7HM4ApA251lBDj4oblk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-LUZXgKdbPzeyrYgS8L926g-1; Thu, 16 Feb 2023 02:55:38 -0500
X-MC-Unique: LUZXgKdbPzeyrYgS8L926g-1
Received: by mail-qt1-f199.google.com with SMTP id
 t5-20020a05622a180500b003b9c03cd525so786901qtc.20
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XP5lTNS9M/3hu499TdM2vrS4F1Z+ZwVJAD2BS995kX0=;
 b=VKgvZJHAaFLLoAAI9KAdgM5Aeyx6fIoewIYm2UgIjArUsQKo2BrMj5XFE1veV75uB6
 A89QnHxhUsL73bl1QyehI09Bqv4ej/dqZRv87jp8d1Ls5i6PlZPs5j3JT+mRCEmlc/yg
 NlMwWH4o03xxwfwW6ROEtHgZvAA7vX8VywIRtB8is1Gspf8LIWu4M2dYfipCarR0KcCU
 jo/uyiwVxiN/mmf4OS9pXZE1kTU8h3ACD97B86AB62rA4dF5hXtiTrJmVRJBik2c+3Gs
 atsgTgxcdZ2ItwjU0CgtH0i8vH09HHQEe1CViTEOFYlBqmM09gOm5FwwbmV2RhmHsVKC
 /nqQ==
X-Gm-Message-State: AO0yUKUK/egOoDYH9OXg0MWCpyaf9BTWNo2g8LryZRJVXk/gUHcSXjjE
 9oPQsy3ctKK0wDIAR9jNy8wmsGNMlZm6CvT89vSo4PsNv566w3PUvSyw/J3q77Hux/C0NzmT97N
 qFKnJEOBsHRkXJr8=
X-Received: by 2002:a05:6214:d84:b0:56e:b13f:fea0 with SMTP id
 e4-20020a0562140d8400b0056eb13ffea0mr8532132qve.46.1676534138197; 
 Wed, 15 Feb 2023 23:55:38 -0800 (PST)
X-Google-Smtp-Source: AK7set912+fMOYcIv/y/bPazhJEAjzEdRn4WMjPTobuPBeQYRpNrCmtYcJFy+AMVP/l27GSJECbRww==
X-Received: by 2002:a05:6214:d84:b0:56e:b13f:fea0 with SMTP id
 e4-20020a0562140d8400b0056eb13ffea0mr8532112qve.46.1676534137946; 
 Wed, 15 Feb 2023 23:55:37 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 o185-20020a375ac2000000b007339c5114a9sm686881qkb.103.2023.02.15.23.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:55:37 -0800 (PST)
Message-ID: <3f0d1adf-369b-2ccb-b13f-e9e5670c8c32@redhat.com>
Date: Thu, 16 Feb 2023 08:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215192530.299263-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 20.25, Alex Bennée wrote:
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                        |  4 ++--
>   .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
>   .gitlab-ci.d/containers.yml                   |  4 ++--
>   .../{ubuntu2004.docker => ubuntu2204.docker}  | 16 +++++---------
>   tests/docker/test-tsan                        |  2 +-
>   tests/lcitool/refresh                         | 10 +--------
>   6 files changed, 23 insertions(+), 35 deletions(-)
>   rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


