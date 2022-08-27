Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ECB5A34DE
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:44:15 +0200 (CEST)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRocA-0001q1-7F
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoWx-0007mf-Sk
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoWu-0003VB-MR
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661578728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4FdzTT6k945iu5F8RxNilvf0MlRwjx8CVnA0O6i/6Q=;
 b=LYpkx7WS4Ic5/dEPJleZgGj0xOC+JbYglxlmaRjzewe+X+AwW7cWzb2rtUKJpKlADe8twb
 PKFR3VeyxkzQZy4wOn4+B8nC5SFtPSZpRl6ddRI8OugEkAxd/bC+L9xoYS+P0BNbVYPKWJ
 TWxyBwhbL0J/Ji3hd+JiaRninwqsaRE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-a5fRPOztMKi4CB4ZTewmlA-1; Sat, 27 Aug 2022 01:38:46 -0400
X-MC-Unique: a5fRPOztMKi4CB4ZTewmlA-1
Received: by mail-wm1-f70.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso5070612wmq.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Q4FdzTT6k945iu5F8RxNilvf0MlRwjx8CVnA0O6i/6Q=;
 b=Iq9Mm8RKxyuuryyxJaHL0CqmnXMRl6sgtqd5+J6ZIENDHhb1Hos6eIYyqtqOjuHG7v
 uwfn9J5xVA7f4h4sr3vJkOKv6ynwqC6h5ditrmN++CPVxXBkDMEQZ0idnJG0WXrpQu4t
 d5p4SKj22DHUREu1yeLGkhHwzVcTcAYoz5MX93t6Q/4jmN8cMK+DQCZe51BMB63en9tY
 Oy6nz0PSn0hSv7xmcnoNv7wUVm10TSMFsbXVyBJa0OZ9V+S3813YGh5jb4nyeWSHZZdt
 HUjo2i/Qd4JE3HL3GcmtNSLerp6uK690i88RE/SdErkUVj7rGAAF4orSQsae1JWxbwXv
 E5Qw==
X-Gm-Message-State: ACgBeo0ihn+7Tf0DpM7QxKACaGh40+TF++OOy/pqaNx4wXIv/Dpj3uTU
 0oylZUbBue9/uFgwhlXbqsN4K7pYHy0igr4OgIMPKhp2BAZfUxCuu7KWGjcwpxPPIiGe6i03MK/
 EtIYjENn6aDNLaqs=
X-Received: by 2002:a5d:6d04:0:b0:225:5a6e:7607 with SMTP id
 e4-20020a5d6d04000000b002255a6e7607mr1449080wrq.336.1661578725749; 
 Fri, 26 Aug 2022 22:38:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56hBrKYW6qYR7atg714M1Ve+gyfTOEPyAzIscbdEAnvhZKtJbVaHAxIYwUIZoE8VMZgQnNlw==
X-Received: by 2002:a5d:6d04:0:b0:225:5a6e:7607 with SMTP id
 e4-20020a5d6d04000000b002255a6e7607mr1449067wrq.336.1661578725545; 
 Fri, 26 Aug 2022 22:38:45 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b003a5c244fc13sm1625824wmb.2.2022.08.26.22.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:38:45 -0700 (PDT)
Message-ID: <30149d8a-3dba-2cb1-52d5-6ef264fab453@redhat.com>
Date: Sat, 27 Aug 2022 07:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 19/25] tests/docker: update and flatten
 debian-amd64-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Now lcitool has support for building a x86_64 cross image we can use
> it for this.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml              |   1 -
>   tests/docker/Makefile.include                 |   1 -
>   .../dockerfiles/debian-amd64-cross.docker     | 178 ++++++++++++++++--
>   tests/lcitool/refresh                         |   7 +
>   4 files changed, 169 insertions(+), 18 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


