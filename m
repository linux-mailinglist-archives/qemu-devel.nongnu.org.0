Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF36F7161
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:44:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpz-0002T1-D1; Thu, 04 May 2023 13:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZx0-00061P-4m
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZwy-0005Cw-Rh
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683210532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9m3z1Ik9wgFlglX5k1rMYsVsnclcnXCzbVoP8eHoC1c=;
 b=dTFDXTjpzgwcXx/u7xSFO9bABQxCnrFxwLp7xeoMa9TB0wOxjCubQBC6hdZuIbvrYW1D8m
 hw2fdK+JHE9fYxpGPdYaJM13ac3DrZkjCyDe38IxEspjOQwFftujyWl+tx110ONZXtxi4S
 USNZfO5g3+Iv6pGDkNoD8K0rVf6bwsY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-9KAtlp2RPdiq8csDo5RN7w-1; Thu, 04 May 2023 10:28:50 -0400
X-MC-Unique: 9KAtlp2RPdiq8csDo5RN7w-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-5ef4d54d84cso1764726d6.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683210530; x=1685802530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9m3z1Ik9wgFlglX5k1rMYsVsnclcnXCzbVoP8eHoC1c=;
 b=WWC4ssDX5cd3mT1XIUKCYnxaNjaQrTLwCYtM/3psv/kTD5845LdkYqa5oFnog6a2Gz
 CeBNcqjfPz3vzN0leaR0X5kzkhn+Qe7jGzBe04m/qUl61nXwn0ugXGiYv3HJnDzPD4sI
 suG5NLCtzFnP+s3LoUNdcCVV7tX7z4YbQtkeNp4d6JkA8pv7EZVEz+3EzB0qpVCAGxAU
 AfjCxqpIQrkiPYWd73WleI/6Jqk1ApN1hIy1tyFW0I6clLRjKtFCz/rWVkd38Oif4x2v
 mH8C9cAjrUXLU3uaoAoBKBHserfxzBGLg5AcBXvkqPzXsGZqAj9ngaOu14p+p3jzsIm2
 SwiA==
X-Gm-Message-State: AC+VfDyI5JquvGPNREeMDfWL7Of8nCEyRoyRDFwPjjk2gaalydG8+Sd1
 0WoW5WqGOpXbALY6uJgB/kDAUCwE6ri7zx2tQyQVwwNbexYNWM27IxCajnMO/6mhTMMy5V8ZQ6y
 hZCQWxFanaMtLCCA=
X-Received: by 2002:a05:622a:1aa4:b0:3ef:59e8:511f with SMTP id
 s36-20020a05622a1aa400b003ef59e8511fmr15265165qtc.0.1683210530242; 
 Thu, 04 May 2023 07:28:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bigbNAl6RGBnZ9Vt/es5/8TPFDyOufZ03nKHMdHss/jY9u2K3gZstLO6kurs/hMrnvebcbQ==
X-Received: by 2002:a05:622a:1aa4:b0:3ef:59e8:511f with SMTP id
 s36-20020a05622a1aa400b003ef59e8511fmr15265138qtc.0.1683210530014; 
 Thu, 04 May 2023 07:28:50 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05622a148a00b003eec85171d6sm12412973qtx.61.2023.05.04.07.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:28:49 -0700 (PDT)
Date: Thu, 4 May 2023 10:28:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 8/9] qemu-file: Make ram_control_save_page() use
 accessors for rate_limit
Message-ID: <ZFPBH8m1JnWHyGGj@x1n>
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-9-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504113841.23130-9-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 04, 2023 at 01:38:40PM +0200, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


