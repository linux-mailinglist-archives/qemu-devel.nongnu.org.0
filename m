Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02B67B556
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 16:02:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKhI2-00044D-Lw; Wed, 25 Jan 2023 10:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKhHx-00041Y-GE
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKhHr-0006Fj-Ta
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 10:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674658926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuqyoRlBTKBw4Hxx24mQYrHIAYddMY3+RhhR3dZXymA=;
 b=U9HAVG9djuVf9C2QBNXnP4opSq35WxZuvQy6jp63rrE3OFMJTqEZ+ArLegKOCtx45Tgrjp
 ZcRRaIi+Tu/sZKaxvXG+QZHOtxHGu6gRXKQ5anACZyI92f/WVmfwOniOE+dqazyfps210O
 lOP0QeYE/7pOHGTXilU9CQFwI19i9Uc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-XNA7WrU_NKS82TS6hKO8rg-1; Wed, 25 Jan 2023 10:02:04 -0500
X-MC-Unique: XNA7WrU_NKS82TS6hKO8rg-1
Received: by mail-qt1-f199.google.com with SMTP id
 k8-20020ac84788000000b003b631e8cc4dso7706896qtq.16
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 07:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vuqyoRlBTKBw4Hxx24mQYrHIAYddMY3+RhhR3dZXymA=;
 b=c2j8eJLjsE/Gn34ItysMvG237i6t06njc261cfSqbT/On630DWZ1LNrEdtmX8dvJup
 PHeooqS/D6cLGEdg0ajsBbmqprPcy8qHjKMeB5OEvVP8VnkvGmbjihqtPc6Ad5/A7J6A
 LXv2/Ha97kD5GCmx2iOFz0InLwWuvS9sWEhOyk0BSl3CB9GSUt91wCmj+bFuiJ/nYrch
 vGKOsTKBY5CETmb0LQL76XCoLkPCPxSARdkmXsWQWL4P88QgpHlkU01PVdTjHHcf0CfB
 rruiGMWxG9d1E3yFCJXg7mGKoSPRM7L0gQ9axwmS0B+mQtWBerIwlXxfsA+G6vI51GXG
 /7Xw==
X-Gm-Message-State: AFqh2kp39a9/ywn+tVNQbb52bKkQV/uayg6sq2V02+VeY7jwrJ6jEuyY
 RX9lIaK2QdAd6yyt7Du3zlnIxochSJGzkrbjKrayS1cSQtgulPxfbHh3qlkvAdK+PQYqtQaYTX7
 G4LvvcZ/u9Eu1AlE=
X-Received: by 2002:a05:622a:5d9a:b0:3b6:2e27:390a with SMTP id
 fu26-20020a05622a5d9a00b003b62e27390amr46765309qtb.12.1674658924337; 
 Wed, 25 Jan 2023 07:02:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtVx2k1yhdLy9ejHo0yZLVPLXOIwcLMaoJSGHreSaO9BqKz5QfIO7j5EK7aoV+yHWmqaK9wZw==
X-Received: by 2002:a05:622a:5d9a:b0:3b6:2e27:390a with SMTP id
 fu26-20020a05622a5d9a00b003b62e27390amr46765282qtb.12.1674658923921; 
 Wed, 25 Jan 2023 07:02:03 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 z10-20020ac8430a000000b003b6325dfc4esm3425429qtm.67.2023.01.25.07.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 07:02:03 -0800 (PST)
Message-ID: <66026c02-9136-0fb2-396a-2dc13fb830bf@redhat.com>
Date: Wed, 25 Jan 2023 16:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Announcement of aborting HAXM maintenance
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Yuan, Hang" <hang.yuan@intel.com>
References: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
 <Y8kXhd2EcRU2QxVC@redhat.com>
 <DM6PR11MB40903B55C23D5140E5BEF17687C49@DM6PR11MB4090.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <DM6PR11MB40903B55C23D5140E5BEF17687C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/01/2023 13.40, Wang, Wenchao wrote:
> Hi, Daniel,
> 
> Thanks for your reply. Could you please help to merge below attached patch to update the status of HAXM in QEMU? Thanks a lot.

I can add the patch to my next pull request.
Thanks for your contribution!

  Thomas


> 
> ----------
>  From d88ba9ab3e32c991566443f3b52c45de67bf10c8 Mon Sep 17 00:00:00 2001
> From: Wenchao Wang <wenchao.wang@intel.com>
> Date: Thu, 19 Jan 2023 20:08:37 +0800
> Subject: [PATCH] MAINTAINERS: Abort HAXM maintenance
> 
> Abort the maintenance of Guest CPU Cores (HAXM).
> 
> * Clean up the maintainer list of X86 HAXM CPUs
> * Remove the web page URL and the mailing list
> * Change the status to Orphan
> 
> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
> Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
> ---
>   MAINTAINERS | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fe50d01e3..0950061dc4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -500,10 +500,7 @@ F: stubs/xen-hw-stub.c
>   Guest CPU Cores (HAXM)
>   ---------------------
>   X86 HAXM CPUs
> -M: Wenchao Wang <wenchao.wang@intel.com>
> -L: haxm-team@intel.com
> -W: https://github.com/intel/haxm/issues
> -S: Maintained
> +S: Orphan
>   F: accel/stubs/hax-stub.c
>   F: include/sysemu/hax.h
>   F: target/i386/hax/


