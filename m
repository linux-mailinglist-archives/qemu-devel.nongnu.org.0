Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD90C3BC887
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:32:58 +0200 (CEST)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hRl-0006Zy-1q
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0hQ6-0004xr-2k
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m0hQ1-0006wR-1a
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625563864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJhsUMruIORDO6cncPrVFXuuJ7wMG24XxkXOCGFGVEE=;
 b=PqosJG9cDp7hPWIdm2EASZdEFDLk+sco+qQRKr9unK1QCAK4+fGIn0l3606QbNIARzYM4p
 11IU2YH+/tKW7AU9XhNJzREWkrCx9mXlyeblhoGvbTOv1pIo+E9mVziHSLB//X5w4PHjO0
 PBbpnUPNszYNBtyLD3FQlZJt7eZ94cw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-_86oDyb3OR-LA_uB2DkuaA-1; Tue, 06 Jul 2021 05:31:01 -0400
X-MC-Unique: _86oDyb3OR-LA_uB2DkuaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w4-20020a05600018c4b0290134e4f784e8so1824676wrq.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qJhsUMruIORDO6cncPrVFXuuJ7wMG24XxkXOCGFGVEE=;
 b=cf2QY3X5ty3dEKHVp7YSq+0vS0CgVOC4PhIpstGDLHy5HfnfMp3PdyWaLDxjNX0QVj
 w7BN1uGbIBMPIgMrYKeVzY3w6byIyH1plYPv9yDPyuHVKBM3QrMm7N+gfequPTnTIH8s
 mx4zbCnNW96cfIIVE5zZj9UFCMylYxs/1ydurzyGwNnjV9EPg2cBgA2w8BJ531ixfIDK
 abghPZk7p7ADtQDbfpOb2Vz9CwBr8wJgTRKzKO3aoYhA5RKSejXUTIt2m64QNHZ6CI6s
 CKS7GfMDimGPXZQ8Cv2RxKezrC40JGzVIxkLygstvTkbLZkZYryeh4vT/3YBJ5gYMI8/
 wCNw==
X-Gm-Message-State: AOAM5307/Yxqm8K8OazKkSqijtRn0vECEbxMM+puAtQiYpBupFcDngbp
 VXexdd8GU3xLTtidNCwYhIHofNQqsApFo4eYwlQUpteVXKzBfcfoX1JcQT1WCMNP6QJlojAZDRt
 uEK1yX11EXYZOpRk=
X-Received: by 2002:a5d:4482:: with SMTP id j2mr20287522wrq.117.1625563859905; 
 Tue, 06 Jul 2021 02:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwugeN/0YEQkF8v7Vnj44j5OxZWJiG4BGpAHy3qLzhgd39GOaLIky6y4fsgjStmCBKsyJo0jQ==
X-Received: by 2002:a5d:4482:: with SMTP id j2mr20287512wrq.117.1625563859745; 
 Tue, 06 Jul 2021 02:30:59 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id c16sm15969289wru.24.2021.07.06.02.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:30:59 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] target/s390x: Fix SIGILL and SIGFPE psw.addr
 reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
 <20210705210434.45824-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <43367f9f-596b-6c2e-9e9a-fb25bca9e57d@redhat.com>
Date: Tue, 6 Jul 2021 11:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705210434.45824-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 23:04, Ilya Leoshkevich wrote:
> For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
> instruction, and at the instruction for other signals. Currently under
> qemu-user for SIGFILL and SIGFPE it points at the instruction.
> 
> Fix by advancing psw.addr for these signals.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> ---
>   linux-user/s390x/cpu_loop.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index 30568139df..6e7dfb290a 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
>           case EXCP_DEBUG:
>               sig = TARGET_SIGTRAP;
>               n = TARGET_TRAP_BRKPT;
> -            goto do_signal_pc;
> +            /*
> +             * For SIGTRAP the PSW must point after the instruction, which it
> +             * already does thanks to s390x_tr_tb_stop(). si_addr doesn't need
> +             * to be filled.
> +             */
> +            addr = 0;
> +            goto do_signal;
>           case EXCP_PGM:
>               n = env->int_pgm_code;
>               switch (n) {
> @@ -133,6 +139,10 @@ void cpu_loop(CPUS390XState *env)
>   
>           do_signal_pc:
>               addr = env->psw.addr;
> +            /*
> +             * For SIGILL and SIGFPE the PSW must point after the instruction.
> +             */
> +            env->psw.addr += env->int_pgm_ilen;
>           do_signal:
>               info.si_signo = sig;
>               info.si_errno = 0;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


