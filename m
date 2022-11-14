Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74729628F59
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinL-0007UX-31; Mon, 14 Nov 2022 18:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif7-00025D-Qs
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oub4G-0005us-W0
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=02cW1j40zMidMANC8sJqfqdpprGVmyUomfTbTUlD5CU=;
 b=fGQjJaYkDrT3p/Ah7Le0xvFEh4VCGE65XUAkj/x2oDIZtJ+Tm5d6UecEohzY98F51+1+0K
 5RR/pPAQu0G+Vm04hk9HoV4AVXDMif9edHkquF8+FE/tyARS95qgfbIa5KvsXtjp9capYX
 ravc+XpVmTTOT+0G1a6ir5tNbmzn/2Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-sSysN1CUMO6CIRTrwouEdg-1; Mon, 14 Nov 2022 10:08:10 -0500
X-MC-Unique: sSysN1CUMO6CIRTrwouEdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m14-20020a7bcb8e000000b003cfcff0057eso1975977wmi.9
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02cW1j40zMidMANC8sJqfqdpprGVmyUomfTbTUlD5CU=;
 b=Yh4iA5p5YVjjXDdalJKSKKaS6lzNGHU8XqS3wbsrhvjgLR7tTdR3YK0Q+ZtUBYULoZ
 veZmetZMcjujTi8ocOlcuGKWTv6+RLYOCQBUAga8ZU6VSkSkPtrJmA/uTeP8z9UPUUUQ
 XEoIV2PsgLnn5RXRLHUxHG3b8TOCpQtxFNyCfFZYcnTy++ux6VXVxhvhxRGXRVEaRPx1
 fPMIHioHXEgNoPTDRA18DNsHlWuqgYqjQpHJZKmn1wFZA5VFWCVRoGAMd0FBDOlFHlex
 +rlEcQ1uGOYcUmueIMdg7IKChwh9m6+VMMN+o1+m5H5a7NBko02UAPDztip9fd+ZwZVJ
 LS/Q==
X-Gm-Message-State: ANoB5pmk9Nn/BnxcO4M/LbanWMM+sfP6HHtrSSGt0+naxwojz0iEO6ZN
 fzgP+aTMb3wAM5P0Riti8PIMblYlbI4sVRsZjsiEpaT2bDo/4yVLQmixZbRt1aWB9f21j6iqTsl
 0mTSBaTC5EpDMMpg=
X-Received: by 2002:a5d:690f:0:b0:235:1b3a:8d34 with SMTP id
 t15-20020a5d690f000000b002351b3a8d34mr8140316wru.113.1668438489541; 
 Mon, 14 Nov 2022 07:08:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6uTUSVJ9q1L4aUv1osxRrXH+R+8nBcIFHBrv7UcXg1whNVBzm1EKiEMY7tEXYCAuphTC08uw==
X-Received: by 2002:a5d:690f:0:b0:235:1b3a:8d34 with SMTP id
 t15-20020a5d690f000000b002351b3a8d34mr8140302wru.113.1668438489345; 
 Mon, 14 Nov 2022 07:08:09 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003c70191f267sm19856916wmn.39.2022.11.14.07.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:08:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 03/15] migration: Cleanup xbzrle zero page cache
 update logic
In-Reply-To: <20221011215559.602584-4-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:47 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:08:07 +0100
Message-ID: <875yfhbmlk.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> The major change is to replace "!save_page_use_compression()" with
> "xbzrle_enabled" to make it clear.
>
> Reasonings:
>
> (1) When compression enabled, "!save_page_use_compression()" is exactly the
>     same as checking "xbzrle_enabled".
>
> (2) When compression disabled, "!save_page_use_compression()" always return
>     true.  We used to try calling the xbzrle code, but after this change we
>     won't, and we shouldn't need to.
>
> Since at it, drop the xbzrle_enabled check in xbzrle_cache_zero_page()
> because with this change it's not needed anymore.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


