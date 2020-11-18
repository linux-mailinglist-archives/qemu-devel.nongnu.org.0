Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0C2B81D9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:27:31 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQIt-0003X0-0H
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQHD-0002Oe-5U
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:25:47 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:60538 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQHB-0002o6-9J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:25:46 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 36E56412DE;
 Wed, 18 Nov 2020 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605716742;
 x=1607531143; bh=MrzOPFILwwlYl4+UiRNOnshkLDy+VgW5nE1RurNqZkY=; b=
 Dg2xIYxveWcjbpchUR5UXiN0c2SU9blCFyL27oJ76DOaTs3JWxF0IWvZBjq8+ajZ
 HKG0SGhFmCz9nlKn2/Rcm/9PRKBHxrwoLWIKPJKukDBDLYVVFocBTsGmKMKVM6Xd
 sJPQi9ZAlHMt9vM4DwlICbkmTn22L1i9eyRXHDgTvG0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuvE2vRUyENq; Wed, 18 Nov 2020 19:25:42 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DA66A41243;
 Wed, 18 Nov 2020 19:25:41 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 19:25:41 +0300
Date: Wed, 18 Nov 2020 19:25:40 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] hvf: Fix segment selector format
Message-ID: <20201118162540.GD81070@SPB-NB-133.local>
References: <20201116200414.28286-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201116200414.28286-1-jrtc27@jrtc27.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:09:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 08:04:14PM +0000, Jessica Clarke wrote:
> The Requested Privilege Level field is 2 bits, the Table Indicator field
> is 1 bit and the Index field is the remaining 15 bits, with TI=0 meaning
> GDT and TI=1 meaning LDT.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  target/i386/hvf/x86.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
> index bacade7b65..ea3e1b86b3 100644
> --- a/target/i386/hvf/x86.h
> +++ b/target/i386/hvf/x86.h
> @@ -214,16 +214,16 @@ static inline uint32_t x86_call_gate_offset(x86_call_gate *gate)
>      return (uint32_t)((gate->offset1 << 16) | gate->offset0);
>  }
>  
> -#define LDT_SEL     0
> -#define GDT_SEL     1
> +#define GDT_SEL     0
> +#define LDT_SEL     1
>  
>  typedef struct x68_segment_selector {
>      union {
>          uint16_t sel;
>          struct {
> -            uint16_t rpl:3;
> +            uint16_t rpl:2;
>              uint16_t ti:1;
> -            uint16_t index:12;
> +            uint16_t index:13;
>          };
>      };
>  } __attribute__ ((__packed__)) x68_segment_selector;
> -- 
> 2.28.0
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

