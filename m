Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBDC1F7AF7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:34:36 +0200 (CEST)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlhT-0006KN-3d
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jjlf6-0003e8-2f
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 11:32:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21104
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jjlf4-0001cx-8d
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 11:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591975925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3osd5WlW7miNG8N8FWeXMnBZHNUKfbDc6xHPXlvH0Zg=;
 b=BYuJTnOFEdlrhUB6dSMcabp0vvNSsx+I+sobheelgzcDeafvN1pKznQxbUmA3If7csB7BN
 CJSvPDh2jVfoPipCgOJLPnn8R1UR7nkGdSi7LfrkqZEJkw+dgseuSlxrZa/aLMov+53IN6
 KU/vp6Pdpi8A/gAk7HiL4NDUViTs7zI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-2OrCyK1EOV-rXYZ1vG0ACg-1; Fri, 12 Jun 2020 11:31:58 -0400
X-MC-Unique: 2OrCyK1EOV-rXYZ1vG0ACg-1
Received: by mail-wr1-f70.google.com with SMTP id w16so4012520wru.18
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 08:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3osd5WlW7miNG8N8FWeXMnBZHNUKfbDc6xHPXlvH0Zg=;
 b=kG5g8w5ks1jjW2yZVMS+bOCmomEZq6mWHNwUg73KjMpzwifWJ5CmXspH3UNCw7Z97D
 UqjF2UktMj8mLToEcI1PK4jMSwmY1vtVAYpliY0ppBbjWArRWJBTXQKCTE5M8ZIhDbwU
 yhjPknMTKfa+f0AArOHzTL90konP9cIkJsetFTduPbdRIdGFJAKyB5xTu+hKWv4bf13F
 jzRhhMTm3+KDYxal6VIfYUXYMLX10hcuKgy9GRd5H4MlQpL6EBB7qKvzEh5qo08Triaj
 FZuszR4ScCNprgtclHfegpWm2YXjt0zN/T1/WLorRNMxkdZcPjD1tH5PEWkErvDWTJv9
 8isA==
X-Gm-Message-State: AOAM530Zyp2X50koO04I6l7JCRk8/dcSIyAj8Km4G2FGDGSqKOM/hqfi
 B8rX6Ob5+XVq4inX7cnWv5j1lKaLro9DD2M+MGyz2Cu8lB6aCWeka8A09+PBqlwsGsLeX200r4O
 mgaTDXjHhBt+6y40=
X-Received: by 2002:a5d:4841:: with SMTP id n1mr16266722wrs.64.1591975917829; 
 Fri, 12 Jun 2020 08:31:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxqh0+HGv3aEYe0ELqsW6SaB7z1dpbwxEhjXYd37Qy/f18i+s6qknINqd7XHEDYZx4c1zOYw==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr16266698wrs.64.1591975917558; 
 Fri, 12 Jun 2020 08:31:57 -0700 (PDT)
Received: from [192.168.1.40] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id x205sm9007342wmx.21.2020.06.12.08.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 08:31:57 -0700 (PDT)
Subject: Re: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE
 disabled
To: "Wu, Wentong" <wentong.wu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20200611081319.1864-1-wentong.wu@intel.com>
 <DM5PR11MB1833DA1D82CD4DEAF8DE514F8D810@DM5PR11MB1833.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <b1396e1a-ed01-2ea4-1ad1-359911d28a31@redhat.com>
Date: Fri, 12 Jun 2020 17:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM5PR11MB1833DA1D82CD4DEAF8DE514F8D810@DM5PR11MB1833.namprd11.prod.outlook.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:07:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "marex@denx.de" <marex@denx.de>, "thuth@redhat.com" <thuth@redhat.com>,
 "crwulff@gmail.com" <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/12/20 3:43 PM, Wu, Wentong wrote:
> Hi,
> Can any body help review this patch ? Thanks in advance!

You just sent this patch yesterday... Please give reviewers more time.

See:
https://wiki.qemu.org/Contribute/SubmitAPatch#Participating_in_Code_Review
In particular:
https://wiki.qemu.org/Contribute/SubmitAPatch#If_your_patch_seems_to_have_been_ignored

> 
> BR
> 
> -----Original Message-----
> From: Wu, Wentong <wentong.wu@intel.com> 
> Sent: Thursday, June 11, 2020 4:13 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org; crwulff@gmail.com; marex@denx.de; thuth@redhat.com; Wu, Wentong <wentong.wu@intel.com>
> Subject: [PATCH] hw/nios2: Update interrupt request when CR_STATUS_PIE disabled
> 
> Update interrupt request when external interupt pends for STATUS_PIE disabled. Otherwise on icount enabled nios2 target there will be cpu abort when guest code changes state register with wrctl instruction.

It'd help if you provide more information, what code where you testing,
how you ran QEMU, enough for reviewers to reproduce the issue you had
and test if your patch indeed resolves the issue you described.

Regards,

Phil.

> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  hw/nios2/cpu_pic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c index 1c1989d5..2abc8fa8 100644
> --- a/hw/nios2/cpu_pic.c
> +++ b/hw/nios2/cpu_pic.c
> @@ -42,6 +42,8 @@ static void nios2_pic_cpu_handler(void *opaque, int irq, int level)
>          } else if (!level) {
>              env->irq_pending = 0;
>              cpu_reset_interrupt(cs, type);
> +        } else {
> +            cs->interrupt_request |= type;
>          }
>      } else {
>          if (level) {
> --
> 2.21.3
> 
> 


