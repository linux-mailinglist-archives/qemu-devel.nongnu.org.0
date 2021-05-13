Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E044D37FCC7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:48:58 +0200 (CEST)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFSD-0004bp-VX
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFMy-0003wT-Bh
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFMu-0003rs-71
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ay3/lXYH/Bnbz1LdHWeLos1Ycj1BCznwF4Vykp2EpA=;
 b=TP6UgluVcGmZuZCSbgjse0tEieTTyje4Pb7USrgxZxkfITvlMG8MJ25CR0TeLK1q7ILlKb
 NcUGzh/NDAuHQeqhPq+Ec1iG0oSdM9J/qcUENNCGkQUP24Iwm9L5p3w3elvCmTDc8+l0Wh
 w7Xm4BHUm0ZYIU4HEOSTTHHj87XFTX4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-P_4A7VfoOjmJMS0YrP-geg-1; Thu, 13 May 2021 13:43:25 -0400
X-MC-Unique: P_4A7VfoOjmJMS0YrP-geg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso14998010edd.19
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Ay3/lXYH/Bnbz1LdHWeLos1Ycj1BCznwF4Vykp2EpA=;
 b=QqLi1gRnFfq29JZJ4nqcXAiEg5ZHELrJJ3f5ILOU739Ou/WRonOvdOQ6nznPyf4+wu
 OdETn9c2Ymu+CY54+ogTZZlBqXHOIZyEBSOgYu20Xui2Y/SBDXDxC5ouNFG3YdgBJ6wT
 LZwhn/ZnZSvhhJwF6QcgcBgz0lyjzqNV/flcnQliqvPeW0a+nzHNk1RpbbjKYRToT5Zb
 bKyVFpkkaH5t/3tko47iL5Mwwe0IRWqr/7M+FLSzn0YVUC+OjxBq66eYp4OCCjboHOX2
 vSwMceVdRyhpNC20MLjoIXFNpQmmoGjyxLZVewZhPt14/p4UTzz8fLluHoPyLW7ICLAp
 AKkQ==
X-Gm-Message-State: AOAM531JVftb4D817xLYbBrp6TJfCjkZLI4kBkfs1MfpldP5dHqIXICG
 NlNdhBemumh+mJm8vUu4H5u8/R6Q5jU0ULM6dTjgg5E8cy/1tE0Y3xRDRlk8/PVaMjEKjM1xdQp
 4gp2WIMg4MQTzra0=
X-Received: by 2002:a17:906:2a46:: with SMTP id
 k6mr43287461eje.406.1620927804570; 
 Thu, 13 May 2021 10:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqq9hjJ7gdksU5pBfdVNz7jiZXeYbSZYj+FHpyqPWjtVs73MGGyZTAC8LBl8ZgvtPYJV5Ang==
X-Received: by 2002:a17:906:2a46:: with SMTP id
 k6mr43287443eje.406.1620927804392; 
 Thu, 13 May 2021 10:43:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o3sm2828443edr.84.2021.05.13.10.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:43:23 -0700 (PDT)
Subject: Re: [RFC PATCH 7/9] qdev-monitor: Restructure and fix the check for
 command availability
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-8-mirela.grujic@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f8d01067-b0ab-afb6-2e54-b7e8c8a9b0e8@redhat.com>
Date: Thu, 13 May 2021 19:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513082549.114275-8-mirela.grujic@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 10:25, Mirela Grujic wrote:
> The existing code had to be restructured to make room for adding
> checks that are specific to the machine phases.
> 
> The fix is related to the way that commands with the 'allow-preconfig'
> option are treated.
> 
> Commands labelled with the 'allow-preconfig' option were meant to be allowed
> during the 'preconfig' state, i.e. before the machine is initialized.
> The equivalent of 'preconfig' state (after its removal) is machine init
> phase MACHINE_INIT_PHASE_ACCEL_CREATED. Therefore, commands with
> 'allow-preconfig' option should be allowed to run while the machine is
> in MACHINE_INIT_PHASE_ACCEL_CREATED phase.
> Before this patch, those commands were allowed to run if the machine is
> not ready, which includes three more phases besides the accel-created
> phase. Since there were no means to enter other phases via QMP, the
> implementation was fine. However, with the introduction of
> 'next-machine-phase' and 'advance-machine-phase' commands, one could
> enter machine 'initialized' phase and still have available 'preconfig'
> commands, which is incorrect.
> 
> This patch makes available 'allow-preconfig' commands only when they're
> needed - before the machine is initialized, in the accel-created phase.
> To enable a command after the machine gets initialized and before it
> becomes ready, one should use 'allow-init-config' option that will be
> introduced in the following patch.

There aren't many commands that are valid only for the accel created or 
machine initialized phase.  I think adding allow-init-config is more 
churn than keeping only allow-preconfig, and calling phase_check in the 
individual commands.  (Or even better, in the internal APIs that they 
call, so that QMP is completely oblivious to phases and just gets the 
Error* back).

In other words, allow-preconfig is there because there are many commands 
that are allowed only after the machine-ready phase, but anything in the 
middle can be handled just fine from C code.

Paolo


