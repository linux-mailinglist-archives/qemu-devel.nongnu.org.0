Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0058628D89
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinw-0008Fk-Ep; Mon, 14 Nov 2022 18:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifP-0004Ov-EU
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouZQA-00032w-Dv
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668432161;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ggU7ROD3uze+obD6Evc+BZ9Q8vSRZwQSlBWi3YzJ5Uc=;
 b=JjNPRxZRWB5CgF4FjvrsXmIy42u4o0LuuKlZs7fAKnW55Z5JwaS6NBkiI1ENxizt8t89GD
 wWBN1b1YFOkrF57FxMd2UKwjMs1fcLj6HSYfqVl1rQvnBxmOlYBtQDhATvRutm484O+VZl
 sDm2JIT6aLlapS7loZG7soqqVmT4D/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-iiYHfjTXMEqzq40KBZTw4Q-1; Mon, 14 Nov 2022 08:22:39 -0500
X-MC-Unique: iiYHfjTXMEqzq40KBZTw4Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so1998196wrb.20
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggU7ROD3uze+obD6Evc+BZ9Q8vSRZwQSlBWi3YzJ5Uc=;
 b=DT5A1K9p2OOVUv+xG/U2OaagknjsASxmNyE+RKkk5g6JQukwNT/+PKLDDdJNF3yjEq
 FjcbLAwSkxY29Ris6lTolZWKE16ArJYutsXLNNK3CnaBvN88o4Vazlk3vmDwHx6Prq5b
 aLp+dThJd0I7PNv1yS6G6rM26iE9EQnijWtwGEPVJ80KejYMh0P7XA5teNJQImsXeKi+
 u3BqRvcNNhPW00eJ2aN67uGeqkxfESp29RCF7rkeO3C+pQdVK0/f41/GHyNfJME6RDcM
 Dpi9jiiNIlD/cjfrDVPQkLluiYNnULM/TYkJcerN5v8CLHyNld3y/A41buZeOd1kn8Mt
 NdYA==
X-Gm-Message-State: ANoB5pmPPhBb7nwLS2TfZQJL6z/sqzNAQlIapzGBTKHO0Iq+DjXU6+9P
 oO7p4XM6ZCQL6hujCmZPkcPU/Y6ELr524mDy3/TZk8Azh5erb3SQotx8WM+L9U0Wb9+/QgstgeG
 wFX74BSdDZXJkjfs=
X-Received: by 2002:adf:dcd1:0:b0:236:9bad:405f with SMTP id
 x17-20020adfdcd1000000b002369bad405fmr7469343wrm.533.1668432158678; 
 Mon, 14 Nov 2022 05:22:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5stXfG2VC1TOxqzAyruXKkvFkxrgjWVZo2QQs/4DMfgfy47vHlLfkXVRh2Yna4fbv2HoAslg==
X-Received: by 2002:adf:dcd1:0:b0:236:9bad:405f with SMTP id
 x17-20020adfdcd1000000b002369bad405fmr7469315wrm.533.1668432158389; 
 Mon, 14 Nov 2022 05:22:38 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfebcb000000b00241968f757esm1102097wrn.80.2022.11.14.05.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 05:22:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v6 1/2] Update AVX512 support for xbzrle_encode_buffer
In-Reply-To: <20220826095719.2887535-2-ling1.xu@intel.com> (ling xu's message
 of "Fri, 26 Aug 2022 17:57:18 +0800")
References: <20220826095719.2887535-1-ling1.xu@intel.com>
 <20220826095719.2887535-2-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 14:22:25 +0100
Message-ID: <87mt8t4qni.fsf@secure.mitica>
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

ling xu <ling1.xu@intel.com> wrote:
> This commit updates code of avx512 support for xbzrle_encode_buffer
> function to accelerate xbzrle encoding speed. Runtime check of avx512
> support and benchmark for this feature are added. Compared with C
> version of xbzrle_encode_buffer function, avx512 version can achieve
> 50%-70% performance improvement on benchmarking. In addition, if dirty
> data is randomly located in 4K page, the avx512 version can achieve
> almost 140% performance gain.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


