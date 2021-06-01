Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4472E397D03
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:25:29 +0200 (CEST)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDlI-0005Lf-Cn
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loDg8-0004RO-1H
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loDg5-0006LN-7H
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622589603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxsHHoTk80ra37uWURN30H/nOhBanmqVqpOS4/rL0zo=;
 b=XKBG0sOf6zzLafEIBxUwucanlGXWUuriDvh6+jFbKitIX9zTtdkdemvl3breRE2vGLQ+Cd
 jFFWpmHhhKvTTIY2lkd2QQn2BKarNt3SeQbNp8DIfrYKzxB3+1pdtBS/ldWflqS9JZ+fj3
 RWvr5lz7ct+mwUrAHXotzI8BmT9L90c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-YN0aEhRNOBm07lubtZhEYg-1; Tue, 01 Jun 2021 19:20:02 -0400
X-MC-Unique: YN0aEhRNOBm07lubtZhEYg-1
Received: by mail-qt1-f198.google.com with SMTP id
 b19-20020ac84f130000b02901d543c52248so352581qte.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 16:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GxsHHoTk80ra37uWURN30H/nOhBanmqVqpOS4/rL0zo=;
 b=k5wZmgWraC6B1hVC8HIdpAH7CM4EqvI0rs/2FokHpJc/jHVByqfKvuVLDFRxObnelb
 En5c5m7N33dGeJy3t1rFi2ZtEh2SIuQ+ptL2MmJy4AtnTh4rCqxzejLPoiM5iKdg/jpP
 KiIeK/mizErnSW9lBoKuzigfX/MJfpmMg0QQvHOQ0A/Sy+9SfOkrk45yx7VyUtm6dSpr
 X+WP+Zr8P33RsYlfZf5HHzPJ57Fpn6OvlPKCNu4yUScqaNF3pxAdsDbUKLBqokvVDeKR
 Zl2PqGW+n+ABfPpNiMRGn7YJqT1NKUOvrpgXFCy8fZuO2Ov8790tBaxug1v/Zics3Z6m
 4Dcg==
X-Gm-Message-State: AOAM530MPu/znWFRw7UO2Tf4tMI7B/Z+UDsp1XS+fjLMuPuXR13JPK9L
 Zdf3lNM3owaVKxOF3tYZ+IILr3NPTg7a5tULvvdUhG60efnaNZm8Yc2ZyQ/bQ17TIiFvDWV7p6v
 kOGYQ/HrvoMAJ/PY=
X-Received: by 2002:a37:6f05:: with SMTP id k5mr18097456qkc.313.1622589602140; 
 Tue, 01 Jun 2021 16:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx85uMM/8lal6FIJBvU/Vwx7SFNkcGoQadjr8btCxPa6PjVNzBqxzT6QDoAgGUEfi/DQRYuSA==
X-Received: by 2002:a37:6f05:: with SMTP id k5mr18097442qkc.313.1622589601924; 
 Tue, 01 Jun 2021 16:20:01 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id a23sm12138420qkl.6.2021.06.01.16.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 16:20:01 -0700 (PDT)
Date: Tue, 1 Jun 2021 19:20:00 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v1 2/6] KVM: introduce dirty_pages into CPUState
Message-ID: <YLbAoEWOE+no+a7H@t490s>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
 <78cc154863754a93d88070d1fae9fed6a1ec5f01.1622479161.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <78cc154863754a93d88070d1fae9fed6a1ec5f01.1622479161.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 01:04:06AM +0800, huangy81@chinatelecom.cn wrote:
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 044f668a6e..973c193501 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -375,6 +375,8 @@ struct CPUState {
>      struct kvm_run *kvm_run;
>      struct kvm_dirty_gfn *kvm_dirty_gfns;
>      uint32_t kvm_fetch_index;
> +    uint64_t dirty_pages;
> +    bool stat_dirty_pages;

Shall we make this bool a global one?  As I don't think we'll be able to only
enable it on a subset of cpus?

-- 
Peter Xu


