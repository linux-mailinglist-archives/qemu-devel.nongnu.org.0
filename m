Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1A6E419C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:52:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJdz-0001FB-JN; Mon, 17 Apr 2023 03:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poJdx-0001Ej-3m
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:51:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poJdu-0003fA-Um
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 03:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681717877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKLcBbI096/VepAlNJFkp9r7l0Q66hiPbWYFdDp65HI=;
 b=JtXJrbcrNvIB/cLAhXEyCoEHGHoU21vUv/HI73MltgYrYvDhNMqKBffZMem/bzqsKITQY+
 lMg4DGUH5T7RyA9WTgf14CvlHn702uXKHUQ23qWS866dMDuR7jiHnSYkVGnFoUMR1Pk0sl
 vC6sBFkIbxU4NhpHNFkChFbnjXiGTTY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-SmlC90v1NPWMvMcqCtGYAA-1; Mon, 17 Apr 2023 03:51:16 -0400
X-MC-Unique: SmlC90v1NPWMvMcqCtGYAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso7525992wmb.4
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 00:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681717875; x=1684309875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKLcBbI096/VepAlNJFkp9r7l0Q66hiPbWYFdDp65HI=;
 b=K3EY2FgXc/gOVSDSJjNUJ4fs1Q/DJ6i6ZYVXd1UnMl0gVvftWCOLCgOteQF/guqwwS
 /tQ2SGSuzZA4jezpmWUo85Dt39kooiB20Ct4u5hqYpNArcFGiadGXIJG3bjuAnVxLe4p
 QP1VBJmO7RMDlv2tK2IWp5KGyigGiWqwiPlfKU6onqCn5KFbonxIc0OaAJYyfslQy+aM
 xXPVpVWxYkLBxg59McAVjcnJvhXqN2U69ZnuLwFh3OdQph+U8nCDdn3MJre/sZH3b2i9
 lLJuP0WpbGS0IOsumwCdBVa1FGhdu0VUZSW8Jxp9QdHp/LHFOyddAvgmsV6kbIt8kJO1
 OEiA==
X-Gm-Message-State: AAQBX9cSe6C5vr5HHze6o1R745ZY8o4vWtmTsOHeyDahZsrRvrJrHB8F
 7nKacWOgH3sYhPmuiDHiKxVGfG0G8TrtuGgOJ8/7+uMHEPAbbYIJBrJru8yfMX2FDRKs/2WQJ/L
 6itHjTaqqRDB3GSk=
X-Received: by 2002:a05:600c:2205:b0:3f0:a094:9264 with SMTP id
 z5-20020a05600c220500b003f0a0949264mr10566561wml.36.1681717875468; 
 Mon, 17 Apr 2023 00:51:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350apued3aJ+i0P0y1+a1swpPG7co4MxZjsLWyZfJ2jIfPqG9Ks7BCYyyXhUM2e8nfCt8ZMCuVQ==
X-Received: by 2002:a05:600c:2205:b0:3f0:a094:9264 with SMTP id
 z5-20020a05600c220500b003f0a0949264mr10566549wml.36.1681717875219; 
 Mon, 17 Apr 2023 00:51:15 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-194.web.vodafone.de.
 [109.43.177.194]) by smtp.gmail.com with ESMTPSA id
 u30-20020a05600c4d1e00b003f16932fe7dsm5941092wmp.38.2023.04.17.00.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:51:14 -0700 (PDT)
Message-ID: <9ac8a8d1-fd78-e8bc-e4e1-92645738f34d@redhat.com>
Date: Mon, 17 Apr 2023 09:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] travis.yml: Add missing 'flex' package to 'GCC
 (user)' job
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
 <20230414210645.820204-2-vaibhav@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230414210645.820204-2-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.976, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/04/2023 23.06, Vaibhav Jain wrote:
> Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
> hexagon target uses 'flex' to generate idef-parser. However 'focal' may not have
> 'flex' pre-installed, consequently following error is seen with travis when
> trying to execute the 'GCC (user)' job that also tries to build hexagon user
> binary:
> 
> <snip>
> export CONFIG="--disable-containers --disable-system"
> <snip>
>   Program flex found: NO
> 
> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
> executable
> <snip>

This works for me also without adding the package:

  https://app.travis-ci.com/github/huth/qemu/jobs/600292739

Weird. Are you using a different Travis instance than I do?

> Fix this by explicitly add 'flex' to the list of addon apt-packages for the
> 'GCC (user)' job.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   .travis.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 11894eb810..8dc71c294d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -237,6 +237,7 @@ jobs:
>             - libglib2.0-dev
>             - libgnutls28-dev
>             - ninja-build
> +          - flex

I agree that adding this explicitely makes sense, but I think we should then 
also add "bison" here as well, since that's used by the hexagon target, too?

  Thomas


