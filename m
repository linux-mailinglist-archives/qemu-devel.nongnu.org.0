Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511686A9236
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:15:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0Yi-0004f7-8F; Fri, 03 Mar 2023 03:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0YR-0004eO-14
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY0YO-0005jx-Ko
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677831251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6frg2DCatl6BLiKoU8m/zVc6kOK3FPuBhFbiyi8QxM=;
 b=hjA6//EOtEZvahsMvZB7gXes41VaurEuxWQaXXxsxYGfMJJYesMkNLAHa9LNRuK88fF+/K
 condqfpR5qWohaHSemE7zli6yAr5b6qKByfI7HfEEgsz7mNkTl7PXN/ct4/vE2xjYtd7zX
 UIP+wr7rN5kZYU9vXsw1Gywbmp4XGc4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-Kc-U8b6IO8midNm0XMAWwQ-1; Fri, 03 Mar 2023 03:14:10 -0500
X-MC-Unique: Kc-U8b6IO8midNm0XMAWwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so636968wmk.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j6frg2DCatl6BLiKoU8m/zVc6kOK3FPuBhFbiyi8QxM=;
 b=zstHjQ2T6HFj1T9lAeRLZ+KMroq8lGVo5i6aJcO8bn6bk/GPJ1BZDEKPjHWaMGmCOJ
 x3r5NaIaq+AaaQcDUDoFl3mHKRp4Y1VRuq4tRMsv0r8Z6qKF/MpJ53M0OA2YIILsRxTY
 XcPLcyXOk/DRLVeoKw4y91XVXh3yicOzBbCbFetkqCpUirM+ozRpXgfncieCzm5MxovM
 f1nsfo2v1EDQQe4XnqnynTDQZEADBtgtDhxnEPlpSzc0/jao9AvfHHtgZth9Rig7QyUA
 Ho6E5sfQEsnSPeRJooI9qL6y+CE7zVve2flgyW2+jnP6/f7Kmsg5XoYEis6u9yVRvCQf
 lKsQ==
X-Gm-Message-State: AO0yUKW26ElWgR0PtePlxoMQFtmo0FZIyB6bbVqZaR1mNYEJY9AcxXj8
 meRU9H2hTRQo8OOUUMUSbaJ9Wqcgpm59WUd+y/WkZ71FgJ+msFv/ljMei9z4XSPs7RPkMoJ0/XM
 bQwx/60n3UeNheUU=
X-Received: by 2002:a05:600c:4593:b0:3dc:4313:fd1e with SMTP id
 r19-20020a05600c459300b003dc4313fd1emr785322wmo.34.1677831249382; 
 Fri, 03 Mar 2023 00:14:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9BwJ1zuLjh3kTcUOgpjGqBaClgt16HkHNoEW9RljEw9GShI70Uf5Y01KY6Li4qqhqVGDoHtg==
X-Received: by 2002:a05:600c:4593:b0:3dc:4313:fd1e with SMTP id
 r19-20020a05600c459300b003dc4313fd1emr785298wmo.34.1677831249028; 
 Fri, 03 Mar 2023 00:14:09 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c41d100b003dc4fd6e624sm1653343wmh.19.2023.03.03.00.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 00:14:08 -0800 (PST)
Message-ID: <832618bf-1907-b85c-8403-dcf634fd0c5f@redhat.com>
Date: Fri, 3 Mar 2023 09:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/5] iotests: allow test discovery before building
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230302184606.418541-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> The 'check' script can be invoked in "dry run" mode, in which case it
> merely does test discovery and prints out all their names. Despite only
> doing test discovery it still validates that the various QEMU binaries
> can be found. This makes it impossible todo test discovery prior to
> building QEMU. This is a desirable feature to support, because it will
> let meson discover tests.
> 
> Fortunately the code in the TestEnv constructor is ordered in a way
> that makes this fairly trivial to achieve. We can just short circuit
> the constructor after the basic directory paths have been set.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qemu-iotests/check      | 1 +
>   tests/qemu-iotests/testenv.py | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 806abc21d6..7e287a79a3 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -129,6 +129,7 @@ if __name__ == '__main__':
>                     imgopts=args.imgopts, misalign=args.misalign,
>                     debug=args.debug, valgrind=args.valgrind,
>                     gdb=args.gdb, qprint=args.print,
> +                  dry_run=args.dry_run,
>                     source_dir=args.source_dir,
>                     build_dir=args.build_dir)
>   
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 9bf37cd381..952efa0e63 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -178,6 +178,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    valgrind: bool = False,
>                    gdb: bool = False,
>                    qprint: bool = False,
> +                 dry_run: bool = False,
>                    source_dir: Optional[str] = None,
>                    build_dir: Optional[str] = None) -> None:
>           self.imgfmt = imgfmt
> @@ -232,6 +233,10 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.build_root = os.path.join(self.build_iotests, '..', '..')
>   
>           self.init_directories()
> +
> +        if dry_run:
> +            return
> +
>           self.init_binaries()
>   
>           self.malloc_perturb_ = os.getenv('MALLOC_PERTURB_',

This gives me a feeling of Deja-Vu:

  https://lore.kernel.org/all/20220209101530.3442837-5-thuth@redhat.com/

... to bad that I never got that merged ;-)

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


