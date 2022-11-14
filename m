Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36133628D61
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinF-0007MI-VP; Mon, 14 Nov 2022 18:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif6-0003YX-NA
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oubEI-0002UL-Ol
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668439112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=u4K8/bPkByUgZyI+8fcU2Celd9LeuBXtg8lFOWsQXh0=;
 b=LbpZ19ZPt2mTikkEGvW+S4wMG8m0aZj2a6AcFCcUDyewTNU/G4sAoDQmWaNY0E5No9ED1t
 x7LUbgpz6Mf6TQ7MbjZN/C13WHoI8B69FeemjkvNHxv/6xPtnzJe+5N8Ic0OaippN40uk3
 cFpj/5IbbK4ewstvs14V4t2SNrjuvWI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-sqBzn8SUPv-Q6SiFen35uQ-1; Mon, 14 Nov 2022 10:18:31 -0500
X-MC-Unique: sqBzn8SUPv-Q6SiFen35uQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so2126332wra.23
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4K8/bPkByUgZyI+8fcU2Celd9LeuBXtg8lFOWsQXh0=;
 b=Psqg+0Nuuy8NiSXYtgUoYyH71yLd0ZJN97Uso2BFN+XXzeOjrz0x+OCxplJgdJeNzg
 pikMGIw+ORF7oF290WVZ7t5asaT4nHlmgEmMXylwMFWLxiy/lWblcZSG+Lzbo+cSLmgT
 +rC9qun9GPPIWGKb8Ey/6n3zr5Ry80y6ldDrPNKsjsmr+TLpxBiiPqdYUtIPo2gPq4Bl
 64UmsudI0+S2GP6mXyMe3iM7yVCfjBKiul/ujiDS9k13zO1hybTPfLAjhZD75tlZAPm5
 XVQWmEbRlAeTZSPzXVn9Z1AAGf3L92v2Z2TY3FmpUdd5UChe5x7VeCHKYcmUmFmB3Cj3
 iQDw==
X-Gm-Message-State: ANoB5pkv4s3zH+RYa/hURhLOvjElgQFkOaEDu/VQH5lbio8fziSOrIXa
 MrEBB1+/EoGSCYa2J2Dj3Q0bC8akVlbWmTusVI3ZhR7X4ljsfzg/AivWYemH/mStSo7fSgrb560
 e/usg6q/4ZtbPpkI=
X-Received: by 2002:a05:600c:2e48:b0:3cf:b091:e5a1 with SMTP id
 q8-20020a05600c2e4800b003cfb091e5a1mr8188850wmf.44.1668439110214; 
 Mon, 14 Nov 2022 07:18:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5emZzsyz/XVh7CLxtTIghBVsCXJSSyos+lCJolelRegQbL7feH5twvQNDy3nLHVO9+JY1gJA==
X-Received: by 2002:a05:600c:2e48:b0:3cf:b091:e5a1 with SMTP id
 q8-20020a05600c2e4800b003cfb091e5a1mr8188825wmf.44.1668439110002; 
 Mon, 14 Nov 2022 07:18:30 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003b4fdbb6319sm19007028wmq.21.2022.11.14.07.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:18:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 15/15] migration: Drop rs->f
In-Reply-To: <20221011215559.602584-16-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:59 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-16-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:18:28 +0100
Message-ID: <87leoda7jv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Peter Xu <peterx@redhat.com> wrote:
> Now with rs->pss we can already cache channels in pss->pss_channels.  That
> pss_channel contains more infromation than rs->f because it's per-channel.
> So rs->f could be replaced by rss->pss[RAM_CHANNEL_PRECOPY].pss_channel,
> while rs->f itself is a bit vague now.
>
> Note that vanilla postcopy still send pages via pss[RAM_CHANNEL_PRECOPY],
> that's slightly confusing but it reflects the reality.
>
> Then, after the replacement we can safely drop rs->f.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


