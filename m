Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDE31C706
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:55:18 +0100 (CET)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBvCX-0002EV-OM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBvBE-0001oA-KK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:53:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBvBC-0004Qc-U0
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613462034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2epUNgUKFXXf/WkQydvQpPBCPqOVb/ITJWd0srB/i6k=;
 b=G9LOBnz7xcEV9nHiN1qFqJQ+Yu89phHPcStVpLt1bXICkLrmBTByGDmcg5pa34RSPRC8np
 nX0LUaxggRm0BiJmA5d2f5+MuFkxJpwng18pa0jKSV5x8md/4eagrOkXe1cY6EX408D9to
 NjvDhgblYZnEG5vFkDDa650P9cIIpig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-tk3PzUKNMeSfjNdzwETTOQ-1; Tue, 16 Feb 2021 02:53:52 -0500
X-MC-Unique: tk3PzUKNMeSfjNdzwETTOQ-1
Received: by mail-wm1-f72.google.com with SMTP id l21so9567458wmj.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2epUNgUKFXXf/WkQydvQpPBCPqOVb/ITJWd0srB/i6k=;
 b=ANJUBUvHnesUneN8FP6qKi1DGkrlymOFgHiFioUCxxyaLSQywoAXvDm5E3IW/pE4m+
 7CVaHPhRusfEa4o/WhHgWZracCk4nqr1NehW1iISlNZTj7wG9gwncAcRP9ixcXhAYoxX
 SB27o/YbZM3o+7YtBEW6yyLQGfuWspYHvfkusURqK7f5eika95EyxQ6ue8gZE1DJHEKx
 3mzrgKVP5SPjkreS2TneFXwK7q3y+hGF8SFNoqrVZdMRuern0PQbUJKbUzhbOrryTwip
 Xdpugk4e8RA6rAoMxGZefNq0UlSJzAuVP5vmz3pR7Zy4PSgEP/TE2hq1ZGp6aBqlmCsp
 bRdg==
X-Gm-Message-State: AOAM530fw9OZHBZCTr6b21C78PaH/BiT7diMnPjXf4qr5seXCCpNHj7u
 96ccUHcOgyc4iQeHGN9jV4o37Z7HTg7FqR1jZZXzxYeiHoKNk7TBV7x5F82obj/PY1X11A0dl95
 NH+yXVbavlGK+u/g=
X-Received: by 2002:a7b:c055:: with SMTP id u21mr2175101wmc.68.1613462031489; 
 Mon, 15 Feb 2021 23:53:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU6+LqWqrIkoytZyv4fR9m2jLGm4uxVvxAATHjRscloe7rJCIBkiXgVEsytNrpXC/Qp1kOBw==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr2175076wmc.68.1613462031315; 
 Mon, 15 Feb 2021 23:53:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y1sm17508323wrr.41.2021.02.15.23.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:53:50 -0800 (PST)
Subject: Re: [RFC PATCH 01/23] target/i386: Expose
 x86_cpu_get_supported_feature_word() for TDX
To: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, alistair@alistair23.me, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, cohuck@redhat.com,
 mtosatti@redhat.com, xiaoyao.li@intel.com, seanjc@google.com
References: <cover.1613188118.git.isaku.yamahata@intel.com>
 <c77664a9e03d53ed870635064551caa663b3dfc4.1613188118.git.isaku.yamahata@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee62127e-3cf9-9da4-d248-7809324a8879@redhat.com>
Date: Tue, 16 Feb 2021 08:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c77664a9e03d53ed870635064551caa663b3dfc4.1613188118.git.isaku.yamahata@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: isaku.yamahata@gmail.com,
 Sean Christopherson <sean.j.christopherson@intel.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 3:12 AM, Isaku Yamahata wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Expose x86_cpu_get_supported_feature_word() outside of cpu.c so that it
> can be used by TDX to setup the VM-wide CPUID configuration.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
>  target/i386/cpu.c | 4 ++--
>  target/i386/cpu.h | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


