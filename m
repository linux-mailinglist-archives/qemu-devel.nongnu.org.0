Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708D64F01D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 18:14:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6EG8-0000Ko-A2; Fri, 16 Dec 2022 12:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p6EFp-0000Ft-CC
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 12:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p6EFj-0004HG-BX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 12:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671210725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8MxK2SI3vrx+EWNF5zv6+26govUssyovvBpwuuHXKY=;
 b=cvcZqJ+m++tylQvxNnObD/BEQP+pzGyFG9zmNkvm/WUCcFoVJAF4tCZfa9oSLW2rQAbw6n
 RrToQjKiO5nV2ddkXMg8pFy2qgmjMoIf5M4fxq841Jzhp8EAFJ5SP9yfrhwy02NCcbaBOf
 hUc0lfLWtxMyK80XUUisNiAo1NBKyD8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-iYqIVSi4PLuJPmlsOCwlpw-1; Fri, 16 Dec 2022 12:12:00 -0500
X-MC-Unique: iYqIVSi4PLuJPmlsOCwlpw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bi42-20020a05620a31aa00b006faaa1664b9so2234738qkb.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 09:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8MxK2SI3vrx+EWNF5zv6+26govUssyovvBpwuuHXKY=;
 b=WWfooprwUwqZG18wpvf1KvEBgNUjNDEGMN0tufHK31Bgn72tV9X8+xOCWQ1gCMfKsN
 hHvKJf8ltXrMZFhGhVi0o+gadAk4aSDBz5AC3tJtZnpbiuwKl1kJofSW4nUYPwcPJxM9
 zPCTiu5C6qcsxUQtkphmt8Q+GjdmfYzv9p0WS+tNUpU14gxJUCE8mTxVOCtdiZLaVC6C
 Ud2WN7MAHRpQ9/3GIHYtZNFnnUrW8onIzD1q0jJybqQER17lN0kcIkijrFeMqVQ1vHzG
 1VtSjLMFfobuQRrsdM8JV8MPWGNDleLiNOFHaJYlMcEvmuj1xJGtSlS8x4faRGJVC9S4
 AsVA==
X-Gm-Message-State: ANoB5pn9nPlGcQxt3LzGRmeQK9xK9X6iEnX7o8EEQCwZs38KdpY3TL+U
 QaB2hR0yMf43Y1W5slCayyY0fMsGEfo1KE/OoycrTiFatMMM+isbhsS6vGBudntmZZJ5dB50Qps
 99v4y1cc7X0lkw7o=
X-Received: by 2002:a05:622a:4d0c:b0:3a5:1b30:9d1f with SMTP id
 fd12-20020a05622a4d0c00b003a51b309d1fmr48646363qtb.35.1671210719664; 
 Fri, 16 Dec 2022 09:11:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6RJ4a0K1un+Kv8O1dr+xw2lRVZokWsVa3Uha3o3yBFDxZ7MtVXGMBpYvHULctvSWcZtR2lDg==
X-Received: by 2002:a05:622a:4d0c:b0:3a5:1b30:9d1f with SMTP id
 fd12-20020a05622a4d0c00b003a51b309d1fmr48646346qtb.35.1671210719474; 
 Fri, 16 Dec 2022 09:11:59 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 cg6-20020a05622a408600b00343057845f7sm1610358qtb.20.2022.12.16.09.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 09:11:58 -0800 (PST)
Date: Fri, 16 Dec 2022 12:11:57 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, f4bug@amsat.org,
 mst@redhat.com, zhouyibo@bytedance.com
Subject: Re: [RFC v3 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y5ym3ayBoRNxzT5s@x1n>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Chuang,

On Tue, Dec 13, 2022 at 09:35:07PM +0800, Chuang Xu wrote:
> Here are the test results:
> test vm info:
> - 32 CPUs 128GB RAM
> - 8 16-queue vhost-net device
> - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate
> before		about 210 ms
> after		about 40 ms

It'll be also great if you can attach more information in the cover letter
in the next post.  For example:

  - Per your investigation, what's the major influential factor for the
    memory updates?  Besides the number of devices, does the number of
    queues also matter?  Is there anything else?

  - Total downtime comparison (only if above is only part of the downtime)

  - The nic used in the test.

Thanks,

-- 
Peter Xu


