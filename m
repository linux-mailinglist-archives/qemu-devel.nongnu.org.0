Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330163A61B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:30:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbON-0004uA-M9; Mon, 28 Nov 2022 05:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbOL-0004ty-8B
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:29:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbOJ-00070e-Gq
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669631374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yES4NrP3f3Xz56aCxi+06X1uJATR4yVh5tVHUpBC2JI=;
 b=AFEWynEwqrgBfD9Brb/LdTUVSRKMZeO3CkDRPC8s/Iz9cgCw1TFmGz381QaqOPSneeTGdr
 x28nBn5+42MNYAx2vmImulmcCAYxQeDfyWnzArLQBhKNR4I+1Klzjm3N9Vo2a7vvKCqEd7
 qqxl604LzU6LQuORvzcma+PAUCphRzA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-JqtFN2IsNEGijJn62lmjww-1; Mon, 28 Nov 2022 05:29:33 -0500
X-MC-Unique: JqtFN2IsNEGijJn62lmjww-1
Received: by mail-wm1-f71.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo5617277wmb.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yES4NrP3f3Xz56aCxi+06X1uJATR4yVh5tVHUpBC2JI=;
 b=tOAla4e1kSqSPV/pQV6tMwk1OdTBu2rVv9h+n2dJI3MPJXd1VpYBybAVq0H3AnSNgV
 X86r0z5pbi+DK7A3bepv9wEp1Yy/gCMRPSYEUjioKHevbEL6Mse3eI+RhCbIBGhd/X82
 sKlGRMYg1ZilrRdzOziC+HUobNAMe5k6Y6FIgiaNcwlRCTPgPAWzuckJJdi1uRZ6X2AZ
 LDTQZqFxPCIZ4xnfw6t4gKBwB5ZFeAcnZAyqp7ZjGwLqZVKvGGkua+hauwlXneOxhVDs
 vBzMZtSA8W1vNFDjy1nlBSZ1aYdAhiFKmXGU3R298mmeGRW8n1cn9l6W7FNecNZGjW8J
 TXuQ==
X-Gm-Message-State: ANoB5pkj7B4W1vCqAI1FTT341QLP+gBx42Af/qD73LPv7jLI19uCEdJQ
 AtbiuXyHEpytkStn95lq0HWrXB5MDawyDQLujhVcjnSnCyVSMlIFy6w4L1t0e0ThrmRJ4jok4mu
 KwL42CMz99rXyyws=
X-Received: by 2002:a05:6000:124d:b0:242:10a:6667 with SMTP id
 j13-20020a056000124d00b00242010a6667mr12285139wrx.39.1669631372012; 
 Mon, 28 Nov 2022 02:29:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5yASeO9uaPOg7pOMBTmKf7n02EZocKg9tYNMAN4peeISxen4mlXCYFFtTtni5n3aCX3hG5rA==
X-Received: by 2002:a05:6000:124d:b0:242:10a:6667 with SMTP id
 j13-20020a056000124d00b00242010a6667mr12285125wrx.39.1669631371857; 
 Mon, 28 Nov 2022 02:29:31 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1c790b000000b003b4a699ce8esm17850861wme.6.2022.11.28.02.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 02:29:31 -0800 (PST)
Date: Mon, 28 Nov 2022 05:29:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
Message-ID: <20221128052856-mutt-send-email-mst@kernel.org>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 26, 2022 at 04:25:01PM +0100, Stefan Weil wrote:
> v3:
> - Fix description for patch 3
> - Add patches 5 and 6
> 
> The patches 3 and 5 still need reviews!

Series:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Stefan you said you want to merge this?

> [PATCH v3 for-7.2 1/6] libvhost-user: Fix wrong type of argument to
> [PATCH v3 for-7.2 2/6] libvhost-user: Fix format strings
> [PATCH v3 for-7.2 3/6] libvhost-user: Fix two more format strings
> [PATCH v3 for-7.2 4/6] libvhost-user: Add format attribute to local
> [PATCH v3 for-7.2 5/6] MAINTAINERS: Add subprojects/libvhost-user to
> [PATCH v3 for-7.2 6/6] Add G_GNUC_PRINTF to function


