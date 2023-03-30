Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6296D0315
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:26:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqPq-0006TP-ND; Thu, 30 Mar 2023 07:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqPn-0006Sg-VL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqPm-0006yD-Ii
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680175555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXNgjgvLiHCQvdghjkfgOAphcCbc1BEWlQy+8chY9eE=;
 b=Ifp3N6BgXG7O6Qqrsoutw4z3if3pRoiQ8/xJ+1JmTg7QsIhzBidQ1wPQdYhGP8ScZbiXEM
 fC+9tX0db6FNA5MStCecVXXXbSJBemMzz0DNffwq1wMg6xlPBYmtemxaxiDZ6JWMv5H5Bv
 XE5mQS/qMHOSIMaHF7Y9QHNc+F+KKnc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-5SEz0FA2OGmmoKk5j2VV7w-1; Thu, 30 Mar 2023 07:25:54 -0400
X-MC-Unique: 5SEz0FA2OGmmoKk5j2VV7w-1
Received: by mail-qk1-f198.google.com with SMTP id
 s12-20020a37a90c000000b007468eaf866aso8723119qke.17
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HXNgjgvLiHCQvdghjkfgOAphcCbc1BEWlQy+8chY9eE=;
 b=wWIRbM5Wdg0x/72KyQV7dtdnepcfi85VITk7v7063lWNKjsGqjr7rAZyMNsbOMZTcT
 iQYathKxMsfLHr2+yNAtzb2bfY11Vbf1nkvfZshBIM9PeyzW3lFM5WptKFqsvoPAE2qA
 DGhbK/nb2rg1XHjPbbNw/NScP9/DFnn9Y/41ywGy+7yU+UzmG2p0RnQyLjXqWbr5kkUH
 XNvP7J6o5gD4StJdBVJCnF5YbYXc+PqI7Py5+ihz88xKYMvi0WXE9brq+EBnsihou/1P
 u9Bb9z+ZMVI6cHLulV709Da53pFYtJqyERxJ5Mc4st83JGC+/LUzW4pOkJY0+sRmbBWi
 dTvA==
X-Gm-Message-State: AAQBX9ctTW/5UpKFZl+EV2vFNmGwGCcS8LOe3J0VPuNYkjzFyOGZreNH
 PJHHB8WSY81ksndNqCRYCUmx2g8JX1ZXa4t/AI3zIxKBKFSybXlZAM307qlC59vIuLYwns0QuZ/
 u2tO08dnN+g6CvPAgIiZXcd9H0g==
X-Received: by 2002:ac8:578a:0:b0:3e4:d4b3:50cb with SMTP id
 v10-20020ac8578a000000b003e4d4b350cbmr36613121qta.19.1680175554193; 
 Thu, 30 Mar 2023 04:25:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350YWLlyckIIMlKAVlKia+JwhRbyOtbaoEGrCEnbT8d4MCl/85nW7G/OQKwinFF2STZtHmHgphA==
X-Received: by 2002:ac8:578a:0:b0:3e4:d4b3:50cb with SMTP id
 v10-20020ac8578a000000b003e4d4b350cbmr36613098qta.19.1680175553965; 
 Thu, 30 Mar 2023 04:25:53 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 fp42-20020a05622a50aa00b003a81eef14efsm16980571qtb.45.2023.03.30.04.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:25:53 -0700 (PDT)
Message-ID: <5b607e40-5f17-0825-c4fe-2e705b86438d@redhat.com>
Date: Thu, 30 Mar 2023 13:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/11] metadata: add .git-blame-ignore-revs
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
 <20230330101141.30199-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> Someone mentioned this on IRC so I thought I would try it out with a
> few commits that are pure code style fixes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230318115657.1345921-1-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   .git-blame-ignore-revs | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 .git-blame-ignore-revs
> 
> diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
> new file mode 100644
> index 0000000000..fa01e77a1e
> --- /dev/null
> +++ b/.git-blame-ignore-revs
> @@ -0,0 +1,21 @@
> +#
> +# List of code-formatting clean ups the git blame can ignore
> +#
> +#   git blame --ignore-revs-file .git-blame-ignore-revs
> +#
> +# or
> +#
> +#   git config blame.ignoreRevsFile .git-blame-ignore-revs
> +#
> +
> +# gdbstub: clean-up indents
> +ad9e4585b3c7425759d3eea697afbca71d2c2082
> +
> +# e1000e: fix code style
> +0eadd56bf53ab196a16d492d7dd31c62e1c24c32
> +
> +# target/riscv: coding style fixes
> +8c7feddddd9218b407792120bcfda0347ed16205
> +
> +# replace TABs with spaces
> ++48805df9c22a0700fba4b3b548fafaa21726ca68

Looks like there is a superfluous "+" at the beginning of the last line?

  Thomas


