Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4D6881F5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbTd-00082W-I4; Thu, 02 Feb 2023 10:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbTZ-00082F-8o
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNbTV-0004U8-Fz
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675351568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DXz1dpif3F1M4Op5sMlqVlwvMK6ovy+IKh/wFDCuEeY=;
 b=UuucJF9Jya/8e3jBZEJJqN9F9PjHZn+Ol64NdnOiPJVwMF1nmo4FlkhWnh8a2Yp3h7TPQz
 j5Q9r+SZXfsBqe7dvXoj2KJOVt+pkdj/X7fBzmR3kqRGeyDfK9r+V1TceZ5/xZEBPfAyj/
 j5GbIj/NurFBPSh13S7IOsJXJKBdg4E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-9GqxYxmMMdSYb3wUfS1ciQ-1; Thu, 02 Feb 2023 10:26:01 -0500
X-MC-Unique: 9GqxYxmMMdSYb3wUfS1ciQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so1098343wms.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 07:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXz1dpif3F1M4Op5sMlqVlwvMK6ovy+IKh/wFDCuEeY=;
 b=Oc7NefiXdQZW/EuaiOqvLV1xpOCZef/19dtN/r0x26Irwiyoj2JbkN4qybbnHsWbQM
 kTpGh3ScPBIklRCw6kDt8ZWf0xk0BfiAIDlsNqO0wt4sleH0emuSWpLDW2qt8n+X/E/F
 DtNe/uf/5ydW0T5CN4OBssD+LiaYsZtRP182UmGafiX3ahLM1qWX+eVsNhZQa2CCer3C
 Z59ADTY4Aan4m/dTlra8NtUzG9WJzWf3OF06ixkc3UrhfKI1W866+Un1ocDkzcX9pajS
 O1/rZhorlS+YeeD8saqvEf2A4+hGpQ4XSVj1CPjd/KlFCdpVBLOoovuRSrFJDvXH412K
 Wjfg==
X-Gm-Message-State: AO0yUKV0WfLdN18ugD4BJel9sHGzdFh+zarCNlMKAaUJ69JJ8gVBLytP
 CYO6ftwNTfIc+QwOAUshcMvLRNX9471rYKNAXbub86G/kCqw8K//XbesuKvQAxYF5Q8G8EWt1vb
 dHRObLSu7eVZIbpc=
X-Received: by 2002:a05:600c:350a:b0:3dc:2af8:83c0 with SMTP id
 h10-20020a05600c350a00b003dc2af883c0mr6219880wmq.31.1675351560834; 
 Thu, 02 Feb 2023 07:26:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+89wQDcduKBi9rfx/sQ15PjlWQ/MPFPVgvd/CqNDhr198KRWX1MkSJ3EcQMV5g0N8LA+nVPQ==
X-Received: by 2002:a05:600c:350a:b0:3dc:2af8:83c0 with SMTP id
 h10-20020a05600c350a00b003dc2af883c0mr6219858wmq.31.1675351560584; 
 Thu, 02 Feb 2023 07:26:00 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b003db0ee277b2sm5162111wmb.5.2023.02.02.07.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:25:59 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  peterx@redhat.com,
 zhengchuan@huawei.com,  huangy81@chinatelecom.cn
Subject: Re: [PATCH] migration/dirtyrate: Show sample pages only in
 page-sampling mode
In-Reply-To: <20221129040404.4151126-1-zhenzhong.duan@intel.com> (Zhenzhong
 Duan's message of "Tue, 29 Nov 2022 12:04:04 +0800")
References: <20221129040404.4151126-1-zhenzhong.duan@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 16:25:59 +0100
Message-ID: <87ilgknl6g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
> The value of "Sample Pages" is confusing in mode other than page-sampling.
> See below:
>
> (qemu) calc_dirty_rate -b 10 520
> (qemu) info dirty_rate
> Status: measuring
> Start Time: 11646834 (ms)
> Sample Pages: 520 (per GB)
> Period: 10 (sec)
> Mode: dirty-bitmap
> Dirty rate: (not ready)
>
> (qemu) info dirty_rate
> Status: measured
> Start Time: 11646834 (ms)
> Sample Pages: 0 (per GB)
> Period: 10 (sec)
> Mode: dirty-bitmap
> Dirty rate: 2 (MB/s)
>
> While it's totally useless in dirty-ring and dirty-bitmap mode, fix to
> show it only in page-sampling mode.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


