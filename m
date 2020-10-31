Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058642A17FB
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Oct 2020 14:53:43 +0100 (CET)
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYrK9-00054g-Q6
	for lists+qemu-devel@lfdr.de; Sat, 31 Oct 2020 09:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYrIh-0004dV-9l
 for qemu-devel@nongnu.org; Sat, 31 Oct 2020 09:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYrId-000625-MY
 for qemu-devel@nongnu.org; Sat, 31 Oct 2020 09:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604152324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thYapU0QlsvrErmpDP/4CDTi2xqR+en8+HMPensDJ1k=;
 b=cIlJ8LkCKPFzOCoWC1Y8AqOmi7Fy1y7N8vCslzl58IMfZmFmpZgvuQtmaALeg2iHs8YAmC
 NlxMiEPr68Q7ceuT7QZL+SZjCPfFAKqoGgJPfwbSpP23HNTL1jq9gixBoIhtFlpY5JmNwp
 MI4IC0wu0PA9CVXK74iWnKjALLeWRwQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-z4wuLkIrPGeXGEJWHtRF3g-1; Sat, 31 Oct 2020 09:52:02 -0400
X-MC-Unique: z4wuLkIrPGeXGEJWHtRF3g-1
Received: by mail-wr1-f70.google.com with SMTP id t14so4064372wrs.2
 for <qemu-devel@nongnu.org>; Sat, 31 Oct 2020 06:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=thYapU0QlsvrErmpDP/4CDTi2xqR+en8+HMPensDJ1k=;
 b=pi8GqkivbCzqi8DtcxM+TL+Beaqf3Mfh4LlEX6njMUMgs0sGpHf5P7xxZhKKumzySL
 08Iq5rb9i8Cwwd3ygm80rycu6zji9RLRaBZUF3uCBywpZI8HaEF7KPGdXQUmMJzkmwDx
 f3BfKf8un4DmSh9/KFZj9hap+q7BgNNlJ4GpmeRNpSoIDK87m2/Z0yk19rbeXdzesFOv
 HlrmpV21N6O9JuFOShQeCZydTQzz3bAG7Oa6mGOReL2ioFv0dSTVkE6E9IoxGlF8BIhB
 ushJxtNOF54E5s/qWYqz01Gf9x5yLQVHCj57pUxeaNaHyv07jz6N1k2ls5/uyLW5R+np
 Rlug==
X-Gm-Message-State: AOAM530J7/HFwA1v6DRTe8xCBjC5h7HRx9v32p8j+yCYPvv11LK8tIak
 NduePikag50IRiHBRLm0fe4wzvcoQC8CRRxAtTiSuOt3/yh08lRo0oaX4tC0EjUZJlr81VVLiwV
 2oDtYRlDa4mrE4Ik=
X-Received: by 2002:adf:f212:: with SMTP id p18mr9775888wro.386.1604152320305; 
 Sat, 31 Oct 2020 06:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1fosnM4lVD4dsJs+grw20qEr5bGW84ITJSPOrzlBxNeH3isjTnFbkC4dVUENe5BBIb2HHSg==
X-Received: by 2002:adf:f212:: with SMTP id p18mr9775878wro.386.1604152320124; 
 Sat, 31 Oct 2020 06:52:00 -0700 (PDT)
Received: from [192.168.178.64] ([151.20.250.56])
 by smtp.gmail.com with ESMTPSA id v24sm15154411wrv.80.2020.10.31.06.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 06:51:59 -0700 (PDT)
Subject: Re: [RFC PATCH-for-5.2] exec: Remove dead code (CID 1432876)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201030153752.1557776-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cbf56456-2884-0ebd-b076-b2bdd4567d3c@redhat.com>
Date: Sat, 31 Oct 2020 14:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030153752.1557776-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/31 09:28:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/20 16:37, Philippe Mathieu-Daudé wrote:
> We removed the global_locking field in commit 4174495408a,
> leaving dead code around the 'unlocked' variable. Remove it
> to fix the DEADCODE issue reported by Coverity (CID 1432876).
> 
> Fixes: 4174495408a ("exec: Remove MemoryRegion::global_locking field")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index a9adedb9f82..0b31be29282 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2723,22 +2723,14 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
>  
>  static bool prepare_mmio_access(MemoryRegion *mr)
>  {
> -    bool unlocked = !qemu_mutex_iothread_locked();
>      bool release_lock = false;
>  
> -    if (unlocked) {
> +    if (!qemu_mutex_iothread_locked()) {
>          qemu_mutex_lock_iothread();
> -        unlocked = false;
>          release_lock = true;
>      }
>      if (mr->flush_coalesced_mmio) {
> -        if (unlocked) {
> -            qemu_mutex_lock_iothread();
> -        }
>          qemu_flush_coalesced_mmio_buffer();
> -        if (unlocked) {
> -            qemu_mutex_unlock_iothread();
> -        }
>      }
>  
>      return release_lock;
> 

Queued, thanks.

Paolo


