Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA153768B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:35:27 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvas1-000500-Oa
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvaoc-0004Al-On
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:31:55 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvaoa-0000dW-FF
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:31:53 -0400
Received: by mail-ej1-x631.google.com with SMTP id y13so19406328eje.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u9yrQM1nDurEC+lTasvKnVz1VzT0y/zXoKN6f8wkbcw=;
 b=UcPgg4gqlb3fBv+8IkpXcaUFdOrmKXAlmgq5AllRfa21Dt7yGg54dazyrIZEyhbqdb
 avZYtSUilKzKP8w3ROfzFjZrIQLOaZ2RJ6k1yhsqymLkoeptHq+ejrp2hsSm0O1FQfDX
 vc6kAR+3W1+r44QyrUmd7qhjf740G9I7QmQWXI903iyVGGNeArP+NhgHBQkqmnegPZjj
 cgHD54K0RtUqIAyFhFSbVkNaH3h1Rt3pCtPJZKO8P5aOBaJVoxICgaZHIFwHjVxS262P
 HyN23arVzPX2aKpsiFSY+fmCAOkILLVfO0yNgB92jillXu5jSnzeHcqM/YtZqiyZVbaR
 +/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u9yrQM1nDurEC+lTasvKnVz1VzT0y/zXoKN6f8wkbcw=;
 b=IQ7Ie9eGkhpd6QIGXmyAAfSkQ5PmoHP6HYAslzZgzmAm80unr2WHM0K4QB9y5aDwdj
 ZPEWhjv+45SapB79h+lMVknH321REK4+Ei/tq8hbZD7GBjxOy/skX62tbj80lcBDYTOz
 qVQC+tfxUDCel64Rf+YcpDH25BRIJRoiP8DkXiYENgz829UT7AA9pwxVgHdlYoWOcVuW
 AW1GGeIqQX2hx8LCrWgPKKYRYXyU2JvKeYYCEaet+8udh+FyxwxWsNSQDIMlv1hSl4GT
 V3Ltfk8pJrCkfUf/XYS3VTw5tryMt+ZMw/7EhyxN5++PO9JBg/28GUqG1vszM12005VP
 76og==
X-Gm-Message-State: AOAM533OvQgUV889Ca3QXqUH0ZdKuz4NSBqnKSWKrkItRO8MqRrIL+fl
 UqSNVxTX1Yudxk0brzk91k0=
X-Google-Smtp-Source: ABdhPJzWpoW5p5No75cheIjgj2Xlvr8jOI8p1QV+7BUy4a2c0C0X1jIEKGPL8suAB87b/eT7k8uI9w==
X-Received: by 2002:a17:906:9e83:b0:6fe:9f59:a4a4 with SMTP id
 fx3-20020a1709069e8300b006fe9f59a4a4mr44644563ejc.163.1653899509769; 
 Mon, 30 May 2022 01:31:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 z16-20020a50cd10000000b0042bac9df764sm6245714edi.27.2022.05.30.01.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:31:49 -0700 (PDT)
Message-ID: <e6d62fdd-9b16-51cd-6f45-9189d27f7ba3@redhat.com>
Date: Mon, 30 May 2022 10:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 23/33] configure: move symlink configuration earlier
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-24-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220527153603.887929-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/27/22 17:35, Alex Bennée wrote:
>   configure | 49 ++++++++++++++++++++++++-------------------------
>   1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/configure b/configure
> index b8c21e096c..82c2ddc79a 100755
> --- a/configure
> +++ b/configure
> @@ -2187,6 +2187,30 @@ fi
>   
>   QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
>   
> +# Set up build tree symlinks that point back into the source tree
> +# (these can be both files and directories).
> +# Caution: avoid adding files or directories here using wildcards. This

This now conflicts with master due to the QEMU_GA_MSI_MINGW_BIN_PATH 
being gone.  Fixing the conflict is just a matter of removing the line 
from the "======"....">>>>>>" section.

Paolo

