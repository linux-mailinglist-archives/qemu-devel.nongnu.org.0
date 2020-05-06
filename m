Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AD1C7CF6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 00:02:45 +0200 (CEST)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWS7o-0000w7-60
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 18:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWS6N-0008SY-Bd
 for qemu-devel@nongnu.org; Wed, 06 May 2020 18:01:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41081
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jWS6M-0007Cr-LF
 for qemu-devel@nongnu.org; Wed, 06 May 2020 18:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588802474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLXhrVlaWO8zJ4g2NDzQejkvjsQmk7icjMU26+hPGJI=;
 b=HBUUX5qThfwF3uxIXgn9GJl4gcMRWzi98VZnsWkUQMx++EnpEtzXkdrSPMgkijuW/+A1ag
 RNCTVomnP+DCgJ8Z4YzfvQ5gJWUonOdnIoT5rqS6yuGJVOZ/NLmiWZlBpR6yEAmdakBhIE
 zIz7qBsymeoVQSoMm0ZGASxZ6zw/fio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-290jgPn_PKik3l6uBpEe0Q-1; Wed, 06 May 2020 18:01:10 -0400
X-MC-Unique: 290jgPn_PKik3l6uBpEe0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04ADC106B263;
 Wed,  6 May 2020 22:01:09 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F68B5D9C5;
 Wed,  6 May 2020 22:01:08 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] qemu-img: validate image length in img_map
To: Eyal Moscovici <eyal.moscovici@oracle.com>
References: <59b0896d-85ad-08b5-fcc1-36adad7501a4@redhat.com>
 <20200506213459.44743-1-eyal.moscovici@oracle.com>
 <20200506213459.44743-4-eyal.moscovici@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <dbebe6c0-a347-d0f8-4af1-544287d77f67@redhat.com>
Date: Wed, 6 May 2020 17:01:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506213459.44743-4-eyal.moscovici@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 02:39:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, liran.alon@oracle.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/20 4:34 PM, Eyal Moscovici wrote:
> The code handles this case correctly we merely skip the loop. However it
> is probably best to return an explicit error.
> 
> Acked-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Eyal Moscovici <eyal.moscovici@oracle.com>
> ---
>   qemu-img.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 4a06ab7fe8..a1b507a0be 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3086,6 +3086,11 @@ static int img_map(int argc, char **argv)
>       }
>   
>       length = blk_getlength(blk);
> +    if (length < 0) {
> +        error_report("Failed to get size for '%s'", filename);
> +        return 1;
> +    }
> +
>       while (curr.start + curr.length < length) {
>           int64_t offset = curr.start + curr.length;
>           int64_t n;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


