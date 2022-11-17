Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04562D5A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaiV-0003sH-Kk; Thu, 17 Nov 2022 03:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovai5-0003nv-Ny
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovai1-000893-Nu
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668675436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeO/8tdIBQ9QtMQ5s68wg1+JlxTY+umcwgCaEzEuJSE=;
 b=R5k59XepBqYRQDrOCWVn9CxKWl24TlVgWV9JxkI6DI+8c9yhAencVBaAAEnqFtXNpsinvw
 m6vV22L+cvb0JhwOC5/hzylef8L9wgzslrtlSW8IFbN82IUFF/fEy2yFB1dPmRJKlcf/Au
 G9dnWT0sDUUUcm3fo7ZqS2nliMJ7Syk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-cFbeSSg_N7u7HSdTr3r1XQ-1; Thu, 17 Nov 2022 03:57:14 -0500
X-MC-Unique: cFbeSSg_N7u7HSdTr3r1XQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so423543wra.15
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OeO/8tdIBQ9QtMQ5s68wg1+JlxTY+umcwgCaEzEuJSE=;
 b=dkyaUYiJLzKx7ShS16RuaE2Vn2swuX4SLXOZoY3wDJgHBlS6vsTCu+8rDABYpPeyUP
 STcCRu+EU/NgC1sbBHhoLKjnnljgPZILohU46c3OEft+MyHcssPEZKnLLZ5O6iRD6CiB
 mXNa7YXQD2j3mbrmEajcTg/v+g77nuBHZUMr1iZHO/AFshYKeUZe6ZpP0uNnlKg/TVtP
 VRHrktNzGn6onH1p2R5UJZc5hS2JPfXuczplim0BcgHiwoASYVRFMpXeQ7S0vaTalaQr
 I/yyiDZMJRXM74Y0Xx1Nw8cuyWk6Z2mV72chkfG4TJGvTu2Mes7czHHkow8O+GhnYTTQ
 YO2A==
X-Gm-Message-State: ANoB5pnUVqpa9SJlPMoNyGm6XEUkiQbsUqezZo32XRpwtrmVMWDb9MOV
 /TWrQYKi7fzHYA7k+65gE0pXAFcocIKf2pURKiWXlqs0vjxzSGOOUj/DpYJAafGTaC1o+Y2OF7e
 Tztq4vf/ztICBLlY=
X-Received: by 2002:adf:fe51:0:b0:22e:362e:570a with SMTP id
 m17-20020adffe51000000b0022e362e570amr809248wrs.127.1668675433415; 
 Thu, 17 Nov 2022 00:57:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4SxmlP4i+5TSW+15CJ2b/aReW3v5W1VXgltZZb9yBl6B19s6/Cs0iBWh2kfNnrBQWK9IwbUg==
X-Received: by 2002:adf:fe51:0:b0:22e:362e:570a with SMTP id
 m17-20020adffe51000000b0022e362e570amr809235wrs.127.1668675433204; 
 Thu, 17 Nov 2022 00:57:13 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b003cf9bf5208esm5433604wmb.19.2022.11.17.00.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:57:12 -0800 (PST)
Message-ID: <4baeb599-43df-34cd-0ae1-5f2454b7069d@redhat.com>
Date: Thu, 17 Nov 2022 09:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ci: replace x86_64 macos-11 with aarch64 macos-12
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20221116175023.80627-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221116175023.80627-1-berrange@redhat.com>
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

On 16/11/2022 18.50, Daniel P. Berrangé wrote:
> The Cirrus CI service has announced the intent to discontinue
> support for x86_64 macOS CI runners. They already have aarch64
> runners available and require all projects to switch to these
> images before Jan 1st 2023. The different architecture is
> merely determined by the image name requested.
> 
> For aarch64 they only support macOS 12 onwards. At the same
> time our support policy only guarantees the most recent 2
> major versions, so macOS 12 is already technically our min
> version.
> 
> https://cirrus-ci.org/blog/2022/11/08/sunsetting-intel-macos-instances/
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml                              | 12 ++++++------
>   .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} | 12 ++++++------
>   tests/lcitool/libvirt-ci                             |  2 +-
>   tests/lcitool/refresh                                |  2 +-
>   4 files changed, 14 insertions(+), 14 deletions(-)
>   rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)

Works for me:

https://gitlab.com/thuth/qemu/-/jobs/3336969845

Tested-by: Thomas Huth <thuth@redhat.com>

I can pick this up for my next pull request.



