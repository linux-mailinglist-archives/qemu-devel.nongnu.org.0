Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC04D4816
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:32:55 +0100 (CET)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIuU-0007J3-O9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nSIVe-0004iE-P1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nSIVa-0000bb-Tg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646917629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5dkK1CSNrEirYWMoWyT9UZ8Vm/UeDycPzmqHwpDv4o=;
 b=iNiH218SNVNPu+Kp4gsMm8ISdARysoRYeZGxwJ2APux17QiFWe22vLa++F9fytjOdCniFP
 /tZrgzOYNe51wFPDr3qPmVWZIgP+D4SPMESlhpKLC2IAgzxyMxrEN17sUuqPIOEJEo7KCa
 wNow6sHCqvqnFvFJx8rhor8pIklJGIA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-7_oied1SMCGf-K12OxVdVA-1; Thu, 10 Mar 2022 08:07:07 -0500
X-MC-Unique: 7_oied1SMCGf-K12OxVdVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso1668186wrm.18
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/5dkK1CSNrEirYWMoWyT9UZ8Vm/UeDycPzmqHwpDv4o=;
 b=YGPuMkT5d+udnEPUmM1qt8hdxbmv/jn5VBZs98ov9rGUISUZruA3rMVgDFPjfY8AZT
 axe/tskSlkRwnw74Zk/2sUsXaPFeM84av79HN/xZvB2fpD2Nt4RMxXt2Il+bL1tAiyjl
 Yyc0kh1pY3MRQ+7Bg/H6H9xa1zl6tDcIz4wa01qsRG0ys4NVbuTHCDtgUl7GQuuLdxBN
 CEm6sKN0XjXY9ua8eM89AXpnBl1BObIcNtotBH+tzW+C4lZaPu/ar7fgZKonx6PzrGzh
 oTSVxNJfDEE9gjHGxanTictpCR00TzcY+13fmoZHdVPwgLr2EfZSf7/g/GuU3spopG9K
 LkfQ==
X-Gm-Message-State: AOAM532Jk9q+s5f+1RZNbzbd9AMWLbrvM6OHo+7KwGGsvbKhkzlLO1r0
 DVHkrcjNSVPFcjo8GpZTCgdm+L0rMq902iGLx+COl72jjW/iKSE4W5QkUoJlzkIwci5whjNQuuK
 vPqPbU1K4sXTSRUo=
X-Received: by 2002:a05:6000:1888:b0:203:75c0:c438 with SMTP id
 a8-20020a056000188800b0020375c0c438mr3405988wri.469.1646917626459; 
 Thu, 10 Mar 2022 05:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysb/htCRTtczZGvHhkpRa/8QEbhPKKUMKMAYjrtnC4aqKaw+z9nug1DQmha0s+quyjHeF7tw==
X-Received: by 2002:a05:6000:1888:b0:203:75c0:c438 with SMTP id
 a8-20020a056000188800b0020375c0c438mr3405967wri.469.1646917626168; 
 Thu, 10 Mar 2022 05:07:06 -0800 (PST)
Received: from redhat.com ([2.53.27.107]) by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm4506659wri.110.2022.03.10.05.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 05:07:05 -0800 (PST)
Date: Thu, 10 Mar 2022 08:07:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of
 common x86 base machine type
Message-ID: <20220310080630-mutt-send-email-mst@kernel.org>
References: <20220310122811.807794-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220310122811.807794-1-xiaoyao.li@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 08:28:09PM +0800, Xiaoyao Li wrote:
> For PIT, it's straightforward to merge microvm::pit and
> pc_machine::pit_enabled into x86ms::pit
> 
> For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
> ability to dis-/en-able PIC and it's the preparation for future TDX
> support.


Looks ok but we are in freeze. I will tag this but pls do ping me
after the release to make sure it's not lost. Thanks!
> ---
> Resend:
>  - collect Reviewed-by;
>  - rebase to 2048c4eba2b4 ("Merge remote-tracking branch 'remotes/philmd/tags/pmbus-20220308' into staging")
> 
> Xiaoyao Li (2):
>   hw/i386: Make pit a property of common x86 base machine type
>   hw/i386: Make pic a property of common x86 base machine type
> 
>  hw/i386/microvm.c         | 54 ++-------------------------------------
>  hw/i386/pc.c              | 24 +++--------------
>  hw/i386/pc_piix.c         |  4 ++-
>  hw/i386/pc_q35.c          |  4 ++-
>  hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
>  include/hw/i386/microvm.h |  4 ---
>  include/hw/i386/pc.h      |  2 --
>  include/hw/i386/x86.h     |  4 +++
>  8 files changed, 65 insertions(+), 81 deletions(-)
> 
> -- 
> 2.27.0


