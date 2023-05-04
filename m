Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09F6F7113
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucod-0007BQ-6f; Thu, 04 May 2023 13:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZmZ-0003a4-5z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZmW-00027a-T2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683209882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHCuhbcsef0EIQj5zxv416mJDrA6eJp2gfKqLUnD9oY=;
 b=bDJo6/APs3UixweaT4fzaNp8ScbY0HFINb4is8e+eYSfo6bTtFIa4K0IHNySUTveGQuTMi
 0kTsDrua2C+QaZOJMjFLjrK/wJ2+E+Tea6QQoSva3RObROF6vZ/Z7Lhcxn/6SkQjh50Cit
 vXWy11zqnDAPIGN1dYnZmEt4/fxrKB4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-Tw4e8JcxOjeT0beY9Lngnw-1; Thu, 04 May 2023 10:18:00 -0400
X-MC-Unique: Tw4e8JcxOjeT0beY9Lngnw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ed767b30easo758791cf.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683209880; x=1685801880;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uHCuhbcsef0EIQj5zxv416mJDrA6eJp2gfKqLUnD9oY=;
 b=ieW3LyM2VQJIZE8sti3nH9hnIMskQ/xrKT5ye0hyvKNAnS9LQ4lHBJyfgrPYDn/EvK
 gj0oWMdqFBqLLRZ245TI10uUcH21KZ9e6haGNjCxUAFduSo4b4/b+WQJg3gkTu/yi4rj
 BV54n3gDJ/7ilO0QZ8wum5q9XtLaXs7poDi6r1rqx0qNf4Yv6qNcJCP7hk0xan5P9ARh
 gDdS2beBlsYYtv1StAztGpjhcSfp+mwibAps0DAcRGpZipnabLSdk24p9oeIwRihZtvL
 6gLTgSVA7naCQSw+6T5vGZQtKiRMWSGTLwoKuJ0qGaiQLcB5RrzLnzDB8C3hPPcQnczM
 42+w==
X-Gm-Message-State: AC+VfDyjvLIhYCJKA10XBfgS1m4IhGUpPK/f9mkV4X/t4L3LsIhb1kfy
 iIFJNFxMM1mPmeA4D9Rtjxmr9BSBbqvu4tu6m3/JnJtK6I1ZYx4Ag6/5BKLMuBNlnCBpWRJiDbn
 ZXoGuPn0R4CBXTg0=
X-Received: by 2002:a05:6214:29ee:b0:5ef:5af7:a274 with SMTP id
 jv14-20020a05621429ee00b005ef5af7a274mr13585585qvb.3.1683209880015; 
 Thu, 04 May 2023 07:18:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EvOrfW9hgr8CtVwYlFVY/e7MGEpmnvCGFR5D70+mKScvKAFhjC3kEwihoNgVYpjWHeLaWOQ==
X-Received: by 2002:a05:6214:29ee:b0:5ef:5af7:a274 with SMTP id
 jv14-20020a05621429ee00b005ef5af7a274mr13585536qvb.3.1683209879696; 
 Thu, 04 May 2023 07:17:59 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 c10-20020a0cf2ca000000b00619adb4b66asm4436453qvm.95.2023.05.04.07.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:17:58 -0700 (PDT)
Date: Thu, 4 May 2023 10:17:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] migration: Rename xbzrle_enabled xbzrle_started
Message-ID: <ZFO+lJoYweoLkkPw@x1n>
References: <20230504115323.24407-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504115323.24407-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

On Thu, May 04, 2023 at 01:53:23PM +0200, Juan Quintela wrote:
> Otherwise it is confusing with the function xbzrle_enabled().
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 43338e1f5b..06015eeb0b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -388,8 +388,8 @@ struct RAMState {
>      uint64_t xbzrle_pages_prev;
>      /* Amount of xbzrle encoded bytes since the beginning of the period */
>      uint64_t xbzrle_bytes_prev;
> -    /* Start using XBZRLE (e.g., after the first round). */
> -    bool xbzrle_enabled;
> +    /* Are we really  using XBZRLE (e.g., after the first round). */

double spaces

> +    bool xbzrle_started;

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


