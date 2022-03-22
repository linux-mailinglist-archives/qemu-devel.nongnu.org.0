Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959124E4257
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:51:35 +0100 (CET)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfrB-0002xk-CS
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:51:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfpR-0001iJ-IL
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWfpO-0000jw-8a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647960581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NkPHLYNPbZK7Sl9mF3LfsCifM89/txqlN94NqwGW0NI=;
 b=QNgbdUONnbuoUo4zJlSMp3MCKg2i9RP+d14sgCfGM8RA+bxccxBz1YnXuM8ZI5wQ7DeraP
 FwWjOCM5s0ZrtR52f3usxrODQTCadphbpFpe9u6X2yhVeIEUuVeMYrlR9av3LONPMiemYd
 OD9arbMaoKnxazLExmZyzmOELvVq7YU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-LlzpWnHZP6Sh0822yXxvbA-1; Tue, 22 Mar 2022 10:49:40 -0400
X-MC-Unique: LlzpWnHZP6Sh0822yXxvbA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z22-20020a50cd16000000b0041960ea8555so717206edi.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NkPHLYNPbZK7Sl9mF3LfsCifM89/txqlN94NqwGW0NI=;
 b=A8Dsj4zWEDAzzBHsNHH6hSFgUN7RyAjmyyJ6AeyaW/ampHWIyrM7HR9cjbDdAUv8c8
 BAQ/QAbOAzuHqXWDf+QB4Ql1+ojMpIhS2krWHLGquYjiRu/JiPZETYONsNR9+f0InJ4Y
 xBmjd0imSdO+PvuV57E3qOZJziNJPGd2VYwQcTAAoj3IrbRAGXzWizRUBwDcx7oywTKE
 9K/bNZ0trv9hDZePr1+ZilpH/2uF1m7aAjVQb/7LS9BgCfpQMJ79ETeh6kN/RDFwPh8i
 ETS9mRK+xQRBYRuQ6wJ7I0I7RKMLIi9Gv2MhNR/cgoQLADZwI+FNcPXAGZaGSPg4ugFK
 KaWw==
X-Gm-Message-State: AOAM531NYbwyycx9XuEj6lXOfP8wAOwoDzA0MPopGRVh9MUnSYUgPYpm
 WVx1Eq5iQDwdOHZ7F6tdG5xfyccb3NjwtCFQeXLe8KsG85Tntk1PwzjQRrZQf3T+Mweaps8hSH/
 9J25gi/6tUaTD7Yo=
X-Received: by 2002:a17:907:7f10:b0:6e0:4f1d:7ab5 with SMTP id
 qf16-20020a1709077f1000b006e04f1d7ab5mr2200299ejc.162.1647960578898; 
 Tue, 22 Mar 2022 07:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDj3abDS1TpuXIqEkU0k6tbY+4YLdalNydPGBFwpWM7RR+jscJDQYAA4u4lmUEt8MrV9hDGA==
X-Received: by 2002:a17:907:7f10:b0:6e0:4f1d:7ab5 with SMTP id
 qf16-20020a1709077f1000b006e04f1d7ab5mr2200278ejc.162.1647960578678; 
 Tue, 22 Mar 2022 07:49:38 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170906738400b006df8b6787afsm7661065ejl.13.2022.03.22.07.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:49:38 -0700 (PDT)
Message-ID: <62d645b5-31e8-4889-c87c-83e0fac18d10@redhat.com>
Date: Tue, 22 Mar 2022 15:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/15] iotests: create generic qemu_tool() function
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-6-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> reimplement qemu_img() in terms of qemu_tool() in preparation for doing
> the same with qemu_io().
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 6cd8374c81..974a2b0c8d 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>   
>       return result
>   
> -def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
> +
> +def qemu_tool(*args: str, check: bool = True, combine_stdio: bool = True
>                ) -> subprocess.CompletedProcess[str]:
>       """
> -    Run qemu_img and return the status code and console output.
> +    Run a qemu tool and return its status code and console output.
>   
> -    This function always prepends QEMU_IMG_OPTIONS and may further alter
> -    the args for 'create' commands.
> -
> -    :param args: command-line arguments to qemu-img.
> +    :param args: command-line arguments to a QEMU cli tool.

This makes me ask how I am to specify which tool to use.  Perhaps it 
should just be “full command line to run” or something.

Might be nice™, but:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


