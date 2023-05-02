Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D886F4BB2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:58:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptx4z-0005zM-8P; Tue, 02 May 2023 16:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx4w-0005z0-KJ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptx4u-0005Ic-S9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683061108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KW7X3V68q1bznLhfBmW7ugoTPi9PgjxARvDncdsRAA8=;
 b=XgUTsI3jb+tIltxGaNUyFlnnsx6HrM7Qo2mefb8eq59LAQJKfdiLM8Sgju79WegXxoPWRi
 yzwD/2Bn8M2c5EdODuvACMldabpjxnCFm99FivPxulkzQvWklKhc68b1kOGFWg8Lg6v49d
 dcEDUCdSPnOzCLEvytVKIggeW3mtIY4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-e2leoMY-MzqnfJaNuEHPcg-1; Tue, 02 May 2023 16:58:26 -0400
X-MC-Unique: e2leoMY-MzqnfJaNuEHPcg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-61b6f717b6eso788416d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683061106; x=1685653106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KW7X3V68q1bznLhfBmW7ugoTPi9PgjxARvDncdsRAA8=;
 b=Y5oKLpJEGi3knarBa7Gky9tCIzyhk9T1iajr0TK2KlCvM9Zjx8r2VpmYF8ihMXUBwb
 9sdh2Kudur1bok7VOlmBirKGNtrrY57oi1PRzQ2ObLAEwRqqtzv46DX5Z5879wXVrkrg
 01gtIV4t/yqVqgZI7vIbwafboPb3BSNEz5IpD+ZosvXg9hoTjuLiih3Ex+wUnXEAY2u7
 DA/08Ly76GAuPiwT1b6QNj9rCMfcvnLPFsRXb57OvT5XprK/rxflFFp0qUYYxrG41yxz
 LivLXyWRT/fdIbxxTdxj2VDIuxMLrKEX1eKN14BzOX/DLEBp4HhLuu/vlYPVpPUZ4QsH
 b7FQ==
X-Gm-Message-State: AC+VfDz5KDpYdZMrOYnTciJrm1tEhkhhG+yVbT1990Wo7FWCz2f5UMFE
 +AUnRU8g7rnOPbANgk52LSsUtT4i6PywwkD0noLmKn4uIZ7fyuXE5X3dEOW6O3DZPrUQKRrKJBP
 dHbWNwVPPZHZk3zI=
X-Received: by 2002:a05:6214:518e:b0:5f1:31eb:1f0e with SMTP id
 kl14-20020a056214518e00b005f131eb1f0emr5758503qvb.4.1683061106473; 
 Tue, 02 May 2023 13:58:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6E5ajTnj7mD2/uqyUlkkGSI1U8yul7agXLg823kTErvpC4GBpL2F7Yc2Zci5B1gS26/3bQgg==
X-Received: by 2002:a05:6214:518e:b0:5f1:31eb:1f0e with SMTP id
 kl14-20020a056214518e00b005f131eb1f0emr5758492qvb.4.1683061106255; 
 Tue, 02 May 2023 13:58:26 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 t18-20020a0cea32000000b0061b71220644sm251844qvp.19.2023.05.02.13.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:58:25 -0700 (PDT)
Date: Tue, 2 May 2023 16:58:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, quintela@redhat.com,
 chen.zhang@intel.com, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and
 provide simpler API
Message-ID: <ZFF5cMvMbDr9uS5c@x1n>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230428194928.1426370-3-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 10:49:20PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> colo_checkpoint_notify() is mostly used in colo.c. Outside we use it
> once when x-checkpoint-delay migration parameter is set. So, let's
> simplify the external API to only that function - notify COLO that
> parameter was set. This make external API more robust and hides
> implementation details from external callers. Also this helps us to
> make COLO module optional in further patch (i.e. we are going to add
> possibility not build the COLO module).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


