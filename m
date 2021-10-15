Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33142EDE9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:44:04 +0200 (CEST)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJkx-00068L-4z
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbJYX-0003v1-0Z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mbJYQ-0005gA-LS
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634290263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XLkFmGAFtYnuBod0StXgt1draVq1i4yOsCKjEWwNmo=;
 b=a/RD7gioOzvajM/r1/AZfvOMPq+8FCxM/7OfQkcVQkIj73vDFnR5t4hm1zC9JX9GVZ4pKh
 3Ym5rBLNzMCOET2TefvKNmD7aqbrQ7zuQqC9Zf0x5wA1yfGt8NcALGbbhMdh063Ew4aeBN
 /ldEkZ+GK3Td4RtaFdL33J0dm+stWJ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-LOB19HX9NR2Dub0ofXE3iA-1; Fri, 15 Oct 2021 05:31:02 -0400
X-MC-Unique: LOB19HX9NR2Dub0ofXE3iA-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso473245wme.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+XLkFmGAFtYnuBod0StXgt1draVq1i4yOsCKjEWwNmo=;
 b=SRA8f8/exxYsV1OpVYMhZ24Qdlz4p8ghExTftMlwtWNkFa06Y/vqfsXkCMk9KQrhoR
 ggvnh+us/DBFdzt5b19RTJtnx6B6xwsrLqjbyEUMuYfDqdOYyCVIYPv8czKg7EgtpLjz
 3BoGtVo6ddPHbAWNMFsxN1aEYQJ0LiFV/L2zx5qFDu3fVb3w03a6nXcOdQUBqcmXeWkv
 XFjV496r2MSTSqGrbb+DAypHDnPwPwk+fbCz82EIYP4GYtxoWeAcioHXG9O+OYc7a3N7
 Q1ieFnRSA4rcbsn1/5dVPqUFhpHQKjkmOmpEt4HE3zTWj9iARLoQHZBcgou7cwbJ1p0J
 6JRA==
X-Gm-Message-State: AOAM532te0JydZO5I7vLJl8bDG1TjLYvGZ1LTipIdJ9eYrCexOR79y7x
 1+HLqqNev/NYGYPdgdDR0y81TM094ikLbvdbItTxVj2W7iU/iIOwkuWbRcJoe2EkzOwQkiWKJuq
 c3+WLsuFFfxlBxO8=
X-Received: by 2002:a1c:7302:: with SMTP id d2mr24932245wmb.92.1634290261074; 
 Fri, 15 Oct 2021 02:31:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlQEqhS24jCJxJnImgN5ilCZYV/nUH8Mcd/BRdzIqe2LncVsFIYYGUQnn20gMyvZBTP1yLuQ==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr24932216wmb.92.1634290260788; 
 Fri, 15 Oct 2021 02:31:00 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a01.dip0.t-ipconnect.de. [91.12.106.1])
 by smtp.gmail.com with ESMTPSA id
 g12sm10225792wme.3.2021.10.15.02.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 02:31:00 -0700 (PDT)
Message-ID: <ff0ce2fa-f2fd-b2fd-60f7-79ff7edbf489@redhat.com>
Date: Fri, 15 Oct 2021 11:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] softmmu/physmem.c: Fix typo in comment
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.10.21 11:29, Greg Kurz wrote:
> Fix the comment to match what the code is doing, as explained in
> the changelog of commit 86cf9e154632cb28d749db0ea47946fba8cf3f09
> that introduced the change:
> 
>     Commit 9458a9a1df1a4c719e24512394d548c1fc7abd22 added synchronization
>     of vCPU and migration operations through calling run_on_cpu operation.
>     However, in replay mode this synchronization is unneeded, because
>     I/O and vCPU threads are already synchronized.
>     This patch disables such synchronization for record/replay mode.
> 
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  softmmu/physmem.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index f67ad2998121..555c907f6743 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2633,7 +2633,7 @@ static void tcg_log_global_after_sync(MemoryListener *listener)
>           * In record/replay mode this causes a deadlock, because
>           * run_on_cpu waits for rr mutex. Therefore no races are possible
>           * in this case and no need for making run_on_cpu when
> -         * record/replay is not enabled.
> +         * record/replay is enabled.
>           */
>          cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
>          run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);
> 
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


