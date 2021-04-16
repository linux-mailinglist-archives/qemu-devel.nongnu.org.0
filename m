Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DA36205B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 14:57:56 +0200 (CEST)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXO2l-0003hA-2I
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 08:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXO1O-0003ER-BC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXO1M-0001Tt-R3
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618577788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1vR1DvI5UYsWlpytR5yQKnnmTm0DzW7RiALZTkI8tY=;
 b=d/ugbfH+POO7ZheUeWfX0Em0T/93P0T3exvFRXU7PsmMhR7HlWJZlP8C9/a1/wfPpFqi1k
 mDv+SWwhZJ7HmvfQTUXL+D0yFsoAYZ6iLjXEjfKL6+Iby1RpS+1qI0P161iId9vSfNY3Jp
 oGf5DnodWiopS/Vszl8h3HoxQC42mA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-n0c-nqthPWapMGfS2ya_mg-1; Fri, 16 Apr 2021 08:56:24 -0400
X-MC-Unique: n0c-nqthPWapMGfS2ya_mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DFF88030B5;
 Fri, 16 Apr 2021 12:56:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6448B19744;
 Fri, 16 Apr 2021 12:56:22 +0000 (UTC)
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210416074736.17409-1-mhartmay@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: don't try to read the next block if end
 of chunk is reached
Message-ID: <cc06adc9-1431-33dd-03f5-540e240e714b@redhat.com>
Date: Fri, 16 Apr 2021 14:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210416074736.17409-1-mhartmay@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 "Collin L. Walling" <walling@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/2021 09.47, Marc Hartmayer wrote:
> Don't read the block if a null block number is reached, because this means that
> the end of chunk is reached.
> 
> Reviewed-by: Collin Walling <walling@linux.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>   pc-bios/s390-ccw/bootmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
> index 44df7d16afca..b46997c0b7c1 100644
> --- a/pc-bios/s390-ccw/bootmap.c
> +++ b/pc-bios/s390-ccw/bootmap.c
> @@ -213,7 +213,7 @@ static int eckd_get_boot_menu_index(block_number_t s1b_block_nr)
>                   next_block_nr = eckd_block_num(&s1b->seek[i + 1].chs);
>               }
>   
> -            if (next_block_nr) {
> +            if (next_block_nr && !is_null_block_number(next_block_nr)) {
>                   read_block(next_block_nr, s2_next_blk,
>                              "Cannot read stage2 boot loader");
>               }

Commit 468184ec9024f4f7b5 was already a similar fix ... I wonder whether we 
have any more of those?

Anyway,
Acked-by: Thomas Huth <thuth@redhat.com>

and I'll queue it for my next pull request.


