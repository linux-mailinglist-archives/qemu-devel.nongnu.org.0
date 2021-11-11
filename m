Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360544D53A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:44:16 +0100 (CET)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7Z0-0000GE-Md
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ml7Xt-0007vt-Kw
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:43:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ml7Xr-0006ZE-3e
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636627381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fz33hs9m6JWErZ9H+ZXpOwggdjOL8O3FzsNVWQQFVUo=;
 b=i5olHwFRXu38EFTu6esKNuXaSUtC7Q+mGMhsSK/S8zNtSXMoQf0eCofkCv5kQic4BiXFSu
 +Ud+/Tv0/GAmK94s3QHVi1a9W3G7yy8ny3MaMcqqWJAbrJKq6gHBVnOwMqOHTCZjOHAomj
 xH/isd5lx0ssQm/yEKbt4WwDqJwCr/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Pisl9bk9M9Cm-t2PPOyawQ-1; Thu, 11 Nov 2021 05:43:00 -0500
X-MC-Unique: Pisl9bk9M9Cm-t2PPOyawQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 014B48042E6;
 Thu, 11 Nov 2021 10:42:59 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EDCD10074E0;
 Thu, 11 Nov 2021 10:42:22 +0000 (UTC)
Message-ID: <b570034b-3e21-382e-0085-5d00560d8156@redhat.com>
Date: Thu, 11 Nov 2021 11:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Fix tcg_out_vec_op argument type
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
References: <20211027085629.240704-1-mrezanin@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211027085629.240704-1-mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/10/2021 10.56, Miroslav Rezanina wrote:
> Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
> for s390x uses pointer argument definition.
> This fails on gcc 11 as original declaration uses array argument:
> 
> In file included from ../tcg/tcg.c:430:
> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>   2702 |                            const TCGArg *args, const int *const_args)
>        |                            ~~~~~~~~~~~~~~^~~~
> ../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
>    121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
>        |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> In file included from ../tcg/tcg.c:430:
> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
>   2702 |                            const TCGArg *args, const int *const_args)
>        |                                                ~~~~~~~~~~~^~~~~~~~~~
> ../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
>    122 |                            const int const_args[TCG_MAX_OP_ARGS]);
>        |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixing argument type to pass build.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   tcg/s390x/tcg-target.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 8938c446c8..57e803e339 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -2699,7 +2699,8 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
>   
>   static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>                              unsigned vecl, unsigned vece,
> -                           const TCGArg *args, const int *const_args)
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS])
>   {
>       TCGType type = vecl + TCG_TYPE_V64;
>       TCGArg a0 = args[0], a1 = args[1], a2 = args[2];

Reviewed-by: Thomas Huth <thuth@redhat.com>

Richard, do you still have a pull request planned for rc1 ? If not, I could 
also take it through the s390x tree if you like.

  Thomas


