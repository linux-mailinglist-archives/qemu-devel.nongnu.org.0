Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91DB1EF1C8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 09:08:07 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh6SU-0005aL-9R
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 03:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jh6Rl-0004wW-Ex
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:07:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54942
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jh6RW-0007Kl-32
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591340824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=gJGNonsER5Lc+XDMfBA88Kpky4XS0QMVVjzLAyTbf3I=;
 b=LubXnEXEi6BDFzdp9jv4MoJm3kV4qhUle4IsXd0DryUsh3ahHOFPVAok0iUdbe6ufIunvt
 FiEXy1Ce3NB7p/Y5MSebWr9ANeZwpjgRGEwrExDXrD/Nh8AcwlLCY2G3j7m7qvJL8lcy1X
 DdCSRbHkNwjWcInRgNLliqYYDfzZNMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-kRGweNB7MnW8gqP__d_mxw-1; Fri, 05 Jun 2020 03:07:01 -0400
X-MC-Unique: kRGweNB7MnW8gqP__d_mxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D2D835B41;
 Fri,  5 Jun 2020 07:06:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91334600F7;
 Fri,  5 Jun 2020 07:06:58 +0000 (UTC)
Subject: Re: [RFC] hw: nios2: update interrupt_request when STATUS_PIE disabled
To: "Wu, Wentong" <wentong.wu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <DM5PR11MB18339389B4BD1BB2B4B5AB7A8D860@DM5PR11MB1833.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <e816a581-2bca-a1d3-a5d3-512200298623@redhat.com>
Date: Fri, 5 Jun 2020 09:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM5PR11MB18339389B4BD1BB2B4B5AB7A8D860@DM5PR11MB1833.namprd11.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2020 07.59, Wu, Wentong wrote:
> Hi all,
> 
> I’m running icount mode on qemu_nios2 with customized  platform(almost
> same with 10m50_devboard),
> 
> but cpu abort happened(qemu: fatal: Raised interrupt while not in I/O
> function) when guest code changes
> 
> state register with wrctl instruction, add some debug code finding that
> it’s caused by the interrupt_request
> 
> mismatch, so I made a patch as below, not sure if it’s right, hope I can
> have some discussion with maintainers

 Hi,

please have a look at the MAINTAINERS file in the main directory of the
sources, you can find the corresponding maintainers there. Thus if you
have questions related to nios2, please make sure to put Chris and Marek
into CC: so that your patch gets the right attention!

 Thanks,
  Thomas



> commit efdb3da4e145a7a34ba8b3ab1cdcfc346ae20a11 (HEAD -> master)
> 
> Author: Wentong Wu <wentong.wu@intel.com>
> 
> Date:   Fri Jun 5 09:29:43 2020 -0400
> 
>  
> 
>     hw: nios2: update interrupt_request when CR_STATUS_PIE disabled
> 
>  
> 
>     Update interrupt_request when external interupt pends for STATUS_PIE
> 
>     disabled. Otherwise on icount enabled nios2 target there will be cpu
> 
>     abort when guest code changes state register with wrctl instruction.
> 
>  
> 
>     Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> 
>  
> 
> diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c
> 
> index 1c1989d5..b04db4d7 100644
> 
> --- a/hw/nios2/cpu_pic.c
> 
> +++ b/hw/nios2/cpu_pic.c
> 
> @@ -42,7 +42,9 @@ static void nios2_pic_cpu_handler(void *opaque, int
> irq, int level)
> 
>          } else if (!level) {
> 
>              env->irq_pending = 0;
> 
>              cpu_reset_interrupt(cs, type);
> 
> -        }
> 
> +        } else {
> 
> +            cs->interrupt_request |= type;
> 
> +       }
> 
>      } else {
> 
>          if (level) {
> 
>              cpu_interrupt(cs, type);
> 


