Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176063CBA9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 00:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09rt-0004U9-C5; Tue, 29 Nov 2022 18:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09rH-0004GN-Dk
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09rF-0005gn-K1
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 18:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669763864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RpJWKNPLVDA22c/WFC5YaRUoeklIX4AQup8GnRgu5jM=;
 b=KgB+vaxBM93+4/DdCyzOR2//urPNz8IuoeC8pMPNjFh0i4tLKTuX4wacCslaHafLwF9eBO
 5LNRT1P0fiA6mJdxrfyUZA71ER5SIbUUhXs3Q2piMiI7G0BPwFaXk6l9y92A8Ne35yAz0i
 eFI9I/Y/GVROdb180ZjWRMJig3FoLq0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-viGuAlWHNgupn6cVDSdjwQ-1; Tue, 29 Nov 2022 18:17:42 -0500
X-MC-Unique: viGuAlWHNgupn6cVDSdjwQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso33270018qkb.17
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 15:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RpJWKNPLVDA22c/WFC5YaRUoeklIX4AQup8GnRgu5jM=;
 b=PZiGOaHw9CgIlObWZzd+YsQjIk3rzSSgBav9b6k7LDSrz6Oxaxhj780GHKmpyaXbh9
 Ch1aHd7BrqDWpAwQRhLz+eSrld4EYwYhzSgJm769DuwXCE4QH5pGbi0A3GJ+1yDihRq4
 j6BsCRbwlp0RpU9mgrD1SKhcSvnyJb9naR4Sr6QU+e2OuWHpr4LGuqBUqLJiYQy5Zgjr
 bhpq7I3H7K6/9fGHLj9oWtULoPlGyGc9sCIVeZJmBYHQN9PTm1xGWnaHehYkjhDnKnOe
 NPjTP8j16QhROH3qCtBd0qyGlaTNxlZcdH0FY01s3n77u2xXABwswHDNa91iMFcLY/kE
 CARA==
X-Gm-Message-State: ANoB5pnsFN6sr4/Ls8tWYEzQIa+yC687/Jgkax7H/TxHQiWXmhPgIirN
 AcQXv6NoKtzmj8K9FI1UtcHSRS398uksp2tHSC9RudhgNzB7Aw5jJnW2yEzKUqOULw+ZKF1dAa9
 gYv9pUYOGvoZIpeE=
X-Received: by 2002:ac8:4906:0:b0:399:7cda:9ad2 with SMTP id
 e6-20020ac84906000000b003997cda9ad2mr55401755qtq.485.1669763862180; 
 Tue, 29 Nov 2022 15:17:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lUIBAhEuPsjqIt+G2oic2tfuGvZ/ig5RaIk3KsQw995gMbbudj8+3oRN4ruVQVIFC/VLrHA==
X-Received: by 2002:ac8:4906:0:b0:399:7cda:9ad2 with SMTP id
 e6-20020ac84906000000b003997cda9ad2mr55401733qtq.485.1669763861919; 
 Tue, 29 Nov 2022 15:17:41 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a254600b006cbc6e1478csm11567907qko.57.2022.11.29.15.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 15:17:41 -0800 (PST)
Date: Tue, 29 Nov 2022 18:17:40 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/11] dirtylimit: Fix overflow when computing MB
Message-ID: <Y4aTFFMjDcwv7CnZ@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <73f83b1c55119851e5ac96ebe1d6b6c318e25771.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73f83b1c55119851e5ac96ebe1d6b6c318e25771.1669047366.git.huangy81@chinatelecom.cn>
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

        On Mon, Nov 21, 2022 at 11:26:33AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> overity points out a overflow problem when computing MB,
> dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
> multiplication will be done as a 32-bit operation, which
> could overflow. Simplify the formula.
> 
> Meanwhile, fix spelling mistake of variable name.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


