Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304F63684C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 19:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxu7P-0004XH-4u; Wed, 23 Nov 2022 13:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxu7M-0004R2-Ek
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxu7K-0001nE-Uu
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 13:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669226702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKqH9EZlJplRmKzxQwDt99MsYOD/OXavxxZ4MJPbAvE=;
 b=GoDsL5SycdRqfEw08XdEM1voYU9m/i+tuNbfY2APKBXDNJ83dnLKyoW/rjPI/Hm/mLyZS0
 skywpVPeh4wLz4Douf8X8I6o3/NYsAkzKGhcGUnXeV8X908GQe/s0FlppeSFfQDvQNHUsu
 oL92mYE8/b28pq/0r4EUutdCfyY0RpI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-hlTY0sg5OFm8NETRBzafiQ-1; Wed, 23 Nov 2022 13:05:00 -0500
X-MC-Unique: hlTY0sg5OFm8NETRBzafiQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 on28-20020a056214449c00b004bbf12d7976so17091473qvb.18
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 10:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKqH9EZlJplRmKzxQwDt99MsYOD/OXavxxZ4MJPbAvE=;
 b=BVtRNxdJZUPq7T1DrlBUYLsSS6k8A2wce2bK7a5WhgNT8a1sIfyTXJsxrMGgwVAdDO
 Y9V6TmUwwCdQt969KZ6LsOUppsQ6JIlCRbAJeU1sptXP597fSqzLBckPMJ0sLJaN3USM
 4KPWwJwD7KOoAX1VTd/6mpndJez/AsSRdvAEh7XJ0rbuakPXQtjZcR4IFme08eXVKJLm
 iUxQVbp/PHjUyVXE+B+Qit5RIs+evArmI0Ol9quHSU8tz4z68vmBJBLPgoUFUdigEFue
 UH/dqpyGiOCm/Tmf4Ja5SVpq3m4O1eTexyzRG/uM9nKWSotIJ6aEIC1+JxC8xOv30xEL
 1bcA==
X-Gm-Message-State: ANoB5pnn7pmj+OB+PGGAJBWykMDf70XhTmSiSj7vf5s7S5Hx/ZX+RYqr
 8J2p0vpYQDdEEwS1Tjb3+XNsuGar9kVjZGM7BKnfrfH/Iv+mW+6Zpuo/nvLJXwQR+ta5zvnLyp4
 /MbUP0RXlIMedKHE=
X-Received: by 2002:ac8:683:0:b0:3a5:8b71:cca3 with SMTP id
 f3-20020ac80683000000b003a58b71cca3mr27712555qth.292.1669226700188; 
 Wed, 23 Nov 2022 10:05:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4cjaKm4hB8g7lecwmriTAUkG7UAT1AbxcWE5suc9+ShhS9tDRfdgwwdN1Aaf9bzU45sa574Q==
X-Received: by 2002:ac8:683:0:b0:3a5:8b71:cca3 with SMTP id
 f3-20020ac80683000000b003a58b71cca3mr27712530qth.292.1669226699919; 
 Wed, 23 Nov 2022 10:04:59 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bl6-20020a05620a1a8600b006ce9e880c6fsm12472292qkb.111.2022.11.23.10.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:04:59 -0800 (PST)
Date: Wed, 23 Nov 2022 13:04:58 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y35gyiCk/Kjdd1Lq@x1n>
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
 <20221123172735.25181-2-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221123172735.25181-2-manish.mishra@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 23, 2022 at 05:27:34PM +0000, manish.mishra wrote:
> MSG_PEEK reads from the peek of channel, The data is treated as
> unread and the next read shall still return this data. This
> support is currently added only for socket class. Extra parameter
> 'flags' is added to io_readv calls to pass extra read flags like
> MSG_PEEK.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


