Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE43A1403
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:16:00 +0200 (CEST)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqx7n-00037k-F0
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx5z-0001PA-C0
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx5w-0006PN-N2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f67ZeAX2mhM4lIfDbVD53hgb4J+GlLzqblAoKPvfFSE=;
 b=LefNIuvuR+nFgkZc5m5nK33Jrvm3+1Zdf9AcGBoIykPpNsXKS9BVtjcJXun0vCTnf9NmOg
 DywI6ic+v1NSe5cXHY73KniYwWbx55vfA7gJ2D2gRBKtZiN20x//ZnLKinC8A/ldjq+kpL
 a7TGUXStuJQlBUMJ88TkOXNU8wL8vM0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-Fj7U2dJAMvWuAAyV3Xe9uQ-1; Wed, 09 Jun 2021 08:14:01 -0400
X-MC-Unique: Fj7U2dJAMvWuAAyV3Xe9uQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e9-20020a5d6d090000b0290119e91be97dso2461251wrq.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f67ZeAX2mhM4lIfDbVD53hgb4J+GlLzqblAoKPvfFSE=;
 b=mWBNmlVlR7iOZiDxUQW72Yka8qFAocRM2B10uEQIpxJwbBzup65tL+W4dDLWZ4wopn
 Klfxa2OLTQ5+u3+gxiWYhkmqFQTpXA2ffKlM1ABShxIjKoEvuxv29TM9/2O7F9vwUGdL
 thSRsp7FqS1M/L8KLIxaLaTd1t0/WOq54WDQxxZka6NARO9vu9dTTyBw+7YaqTip6lkP
 tIgK2QTPU8yxMNNkOB8YXuo4+U54uFckRAXxPRuz+ZEBLhzLdKmwQunMWTonqOgGHDm1
 4QscMAG/RCXsBCHEHLkTHEct8lQNY2OnuBxVTIHkR5+06UNkxqaykjwr/cqFTlfRo0YQ
 kwiA==
X-Gm-Message-State: AOAM530LAnDCmwVjbNhUIs4oPJCRwH3KWvldHsAT0HoH4NWyqeDWr13T
 1xgjuO8S8DJnVg0XgX8MvlBrFTGlX4bSIemgnKfxLiyKOYlBM3TidOzzzagWdXpYNG5/AAONHHY
 yONkd6e32kgDcRO0=
X-Received: by 2002:a5d:698e:: with SMTP id g14mr28039980wru.212.1623240840549; 
 Wed, 09 Jun 2021 05:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweOQMsoUGMl3tKw8RvbF/lvB29ZFXugsS9EajwYX1gdMu/keTRte5ME0Rg36DBN3xxZHEnzA==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr28039962wru.212.1623240840399; 
 Wed, 09 Jun 2021 05:14:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v18sm25835413wrb.10.2021.06.09.05.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:13:59 -0700 (PDT)
Subject: Re: [PATCH 0/2] esp: minor fixes for older Linux versions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, fam@euphon.net, laurent@vivier.eu
References: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <64ae35af-d19c-8139-83f1-2c1b7915fe68@redhat.com>
Date: Wed, 9 Jun 2021 14:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 23:25, Mark Cave-Ayland wrote:
> Following on from the ESP changes in QEMU 6.0 someone pointed out that the old
> Linux 2.6 ESP driver as used in Aurelian's SPARC image at
> https://people.debian.org/~aurel32/qemu/sparc/ emits a constant stream of
> "esp0: STEP_ASEL for tgt 0" messages to the console during boot.
> 
> These patches solve the issue so that the older image is able to boot cleanly
> once again. The first patch is a genuine bug fix for the QEMU 6.0 changes whilst
> the second works around the delayed bus phase change when deferring IO transfers
> from the end of the command phase to the start of the information transfer
> phase.
> 
> I've tested this using the extended suite of images used for the QEMU 6.0 changes
> and confirmed that there are no other regressions.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (2):
>    esp: only assert INTR_DC interrupt flag if selection fails
>    esp: only set ESP_RSEQ at the start of the select sequence
> 
>   hw/scsi/esp.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 

Queued, thanks.

Paolo


