Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615B37B693
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:08:14 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgiyb-0001dG-JP
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgixK-0000Bc-UK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgixH-0002zl-Ry
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ls2Ewyn1WlCpL1g7Aod452c/DWrSE1zqr3Iq/Gcrl6I=;
 b=g65jSxQ2sThCd4/GirdhVUY0var7h1sZwsJu1CTB9ljjyZJcXJiyOmeWPO4mZDfXSPMk0m
 iPKH2PpNS1S4YQb8/Qg75OxTVoWVRX52E47CgGJGDJUgaDc0ctdA7GR7ftmp2c7gr14sUA
 2Fr3PUyZLfv+o91Kwcsrd4VdgVyXB8I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-W3c7LPRiO3ik_YNkF5Y9Gg-1; Wed, 12 May 2021 03:06:48 -0400
X-MC-Unique: W3c7LPRiO3ik_YNkF5Y9Gg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so12328966edu.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ls2Ewyn1WlCpL1g7Aod452c/DWrSE1zqr3Iq/Gcrl6I=;
 b=fZijCd/U1dqDA3QOrZzPDTQ6jrZ6OwxRc4rHKSAtFfKwTkSarcp5eOVeKzUAUNbZXJ
 u8JbLFMJT3XqqOlKuQM2BcX3OBGX21YIJLoLks36z2KXPZaEfQ1x0agLwaHt3n+ViNxN
 8FxxrGPL31asVhy+KMpisNV6Gi5Rm5ARzFL0+l4zNGlh4C5sF2yQ2/dV6UkMxFaZgzYR
 VZuP+8SZB1DlHOoOy3W5A/L2irCUd9UyIwPWOK+xoRFhokgZ8j/iZnIJprOIdYE+AGUa
 p+XB4jE0F2Hynj1FQWpaNRuKNV35kTgbkKkgTwVBhjpaoJp92i8A7U2+uX3+HZsUZoI1
 tFVA==
X-Gm-Message-State: AOAM532hMdwEOWewdQKuySVzO+V7nVuN07po4cdPF9v+M+u2TuAfLK6o
 xZMCAPOq0ylh/yVucjFu02GWIcy9xa52PYDKuSvxSEPa53AsxrNHXHNliNmolswjL1+dMRlw0MS
 0fMu9lC0gJAxS0LE=
X-Received: by 2002:a17:906:248e:: with SMTP id
 e14mr34935074ejb.249.1620803207686; 
 Wed, 12 May 2021 00:06:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMkDw14oOqFdFLCW4y/FTIQmHbb4FJ7WE0q9XTvviRAGrDMJhNWsOPTMJ9R9EsdDVeikBUYg==
X-Received: by 2002:a17:906:248e:: with SMTP id
 e14mr34935043ejb.249.1620803207362; 
 Wed, 12 May 2021 00:06:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id g11sm13278489eje.7.2021.05.12.00.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:06:46 -0700 (PDT)
Subject: Re: [PATCH v3 31/33] block/nbd: add nbd_clinent_connected() helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-32-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ebc87b7-d76a-6cca-b389-3965b97002b4@redhat.com>
Date: Wed, 12 May 2021 09:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-32-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/21 10:09, Vladimir Sementsov-Ogievskiy wrote:
> We already have two similar helpers for other state. Let's add another
> one for convenience.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

The whole usage of load-acquire for the connected state is completely 
meaningless, but that's not your fault. :)  For now let's keep it as is, 
and we'll clean it up later.

Paolo


