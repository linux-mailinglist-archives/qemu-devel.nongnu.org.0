Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077B3EEE7C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:26:50 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG03E-0005YE-SQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG026-0004oM-Ib
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mG023-0003Rk-Kz
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629210333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=on4hC28HI1XK1nYVLijzX771t/+PNFEBBqtykqjYzsE=;
 b=i+xMiH15KLC4soEMdu9jaOSzo+0Taklgv833Z1HLjsNOwcQyvDWPkac4MtzLJDFegMy6B8
 j0XZdH33pB3PPvnlQSxAX1L8OPjJotzXgOO5v54UHsUybPTpe4R80X6Kt74WKBXqZQtXDe
 VzEuL+iTL3Pfp0vdiLsiIP73aUVFRms=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-vbS8g2MrMuqe5BSiaAoGjQ-1; Tue, 17 Aug 2021 10:25:32 -0400
X-MC-Unique: vbS8g2MrMuqe5BSiaAoGjQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 m8-20020a05622a0548b029028e6910f18aso11202329qtx.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=on4hC28HI1XK1nYVLijzX771t/+PNFEBBqtykqjYzsE=;
 b=b6Y20VHWPXR4mn9dRtWWHNQpLz2BeAj8aKighvtMT9Z4D6l617jkaAEWZmSzMy3GIt
 6CheYecaU8OnrjXSKps2v4QKBZ7jOw+xrZpFNL41Q+3W6/YtHwujjNEzpkhF2rcwcPMG
 IEmwJz1QG9afs+Jgn8CHHkMX3svUG3FKvT2vsEvO2OiYyemFc5r9MwVqhK+nC5YM2JWV
 rqvpXxVoLbRTAiOEIo713YDz7Whu9er5IbwFavLAx+kWtGsJBZX8HDDOcldIX9m729oG
 0nXFWPCVP7Qx6wFaV4Bo4vNXA3boFduV06HiWXwSQoZS4BylWETpM1tI74afTa/tDeZY
 OhEw==
X-Gm-Message-State: AOAM5321L1qz9rUpAejRt16G8ZzppYKKzd/mHpFhiw6nL2/5/15c/wI+
 Na+3Q1LMhHL53kahKeVOaDzs/MpGJPFVsnPZKHAIVdMaZsVh0K3my86OPXZg1oJCzbGjUsOx8Ut
 9ZOGN5U6w2g9vOmA=
X-Received: by 2002:a05:622a:188d:: with SMTP id
 v13mr3439712qtc.192.1629210331818; 
 Tue, 17 Aug 2021 07:25:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHU0gk+/AO6rsF3MLYnbQeUPGgVsDj3d8hGtzTb0+8twWs5yM+8EAo2IKePRVvsxBnvLHAcA==
X-Received: by 2002:a05:622a:188d:: with SMTP id
 v13mr3439686qtc.192.1629210331562; 
 Tue, 17 Aug 2021 07:25:31 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id v19sm1111117qta.60.2021.08.17.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 07:25:31 -0700 (PDT)
Date: Tue, 17 Aug 2021 10:25:29 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
Message-ID: <YRvG2US6lY6v8QFy@t490s>
References: <20210805092350.31195-1-david@redhat.com> <YRrP+tDsIyL3MaWO@t490s>
 <8812f9e2-3b3e-1bc9-2953-107e4c82880b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8812f9e2-3b3e-1bc9-2953-107e4c82880b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 09:14:32AM +0200, David Hildenbrand wrote:
> Libvirt does not support virtio-mem yet and consequently doesn't support
> reserve=off yet. (there are use cases without virtio-mem, but I don't think
> anybody is using it yet)
> 
> It's an easy way to crash QEMU, but we could also fix in the -stable tree
> instead.

I hit this when trying with some extreme bitmap tests then I remembered this
patch, but that shouldn't really be used by any real customer for sure.

Sounds good then, thanks.

-- 
Peter Xu


