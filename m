Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECAB2DE1DF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:20:14 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDnx-000804-OI
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDPB-0001dH-J9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:54:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqDP9-0000OM-5m
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amFYfQorLV1MuFxWzu91eoHQ0WN/58KdN5muabt+Ge0=;
 b=gkEnc3LeaxYt9AJeZcoUKD+aUrKM8Plcx4y+gzOpUH8aD7ZTmDLek9Y0JuM7luTBJKwcDV
 lHPGDW/AMT1+crYuS8RjIM4C7b9dDKbDrYNzMqIbGeuFeXHm1556zRU02VBqyp0PLvIRrq
 WIU6evQHtf9STo0ES86z8v9Ti4HgUiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-elZLL7aEMg2AmE4qBxxOFA-1; Fri, 18 Dec 2020 05:54:32 -0500
X-MC-Unique: elZLL7aEMg2AmE4qBxxOFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 534A98049C0;
 Fri, 18 Dec 2020 10:54:31 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EAFF18226;
 Fri, 18 Dec 2020 10:54:29 +0000 (UTC)
Subject: Re: [PATCH 4/9] block/vpc: Make vpc_checksum() take void *
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-5-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6a870072-bccc-d7b9-5da5-acd9ecea62c7@redhat.com>
Date: Fri, 18 Dec 2020 11:54:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-5-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:19, Markus Armbruster wrote:
> Some of the next commits will checksum structs.  Change vpc_checksum()
> to take void * instead of uint8_t, to save us pointless casts to
> uint8_t *.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/vpc.c b/block/vpc.c
> index 34186640ee..5af9837806 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -172,8 +172,9 @@ static QemuOptsList vpc_runtime_opts = {
>   
>   static QemuOptsList vpc_create_opts;
>   
> -static uint32_t vpc_checksum(uint8_t *buf, size_t size)
> +static uint32_t vpc_checksum(void *p, size_t size)
>   {
> +    uint8_t *buf = p;
>       uint32_t res = 0;
>       int i;

Using this opportunity to add consts would be nice, but not necessary:

Reviewed-by: Max Reitz <mreitz@redhat.com>


