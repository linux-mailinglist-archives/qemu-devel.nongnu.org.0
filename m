Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EC1DBF11
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 21:58:32 +0200 (CEST)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbUrH-0008AP-Db
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 15:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jbUqV-0007jw-7E
 for qemu-devel@nongnu.org; Wed, 20 May 2020 15:57:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29922
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jbUqU-0006mw-6r
 for qemu-devel@nongnu.org; Wed, 20 May 2020 15:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590004661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=w8haSdB3G2m9IhCWxxToOA/ZRKBwY2f73+Odt2UeGXM=;
 b=BUtIZ5S5jPeTWVmatWJ1wWvn43uU3Z+cS2bnNd4jwXh51DM7AG7UIB4y6Bu0vA3OLhce/b
 S9yIW5Lb4A1GdLaQpd9keC+2iKjamwilU+nAt8PrvuzqVBrCwPKGfVLezw4O2HJWkryILH
 s2TLVtDQOe6/1Crn/pR+6EON7MlgUBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-Uz2kmO3YMdaLjyENaFg0yA-1; Wed, 20 May 2020 15:57:39 -0400
X-MC-Unique: Uz2kmO3YMdaLjyENaFg0yA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D168005AA;
 Wed, 20 May 2020 19:57:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-114.ams2.redhat.com [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 021824739F;
 Wed, 20 May 2020 19:57:34 +0000 (UTC)
Subject: Re: [PATCH v2 3/9] pc-bios: s390x: Get rid of magic offsets into the
 lowcore
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200514123729.156283-1-frankja@linux.ibm.com>
 <20200514123729.156283-4-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5bc1c8d7-71dd-2172-5194-d33d47fd829e@redhat.com>
Date: Wed, 20 May 2020 21:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200514123729.156283-4-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 15:03:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2020 14.37, Janosch Frank wrote:
> If we have a lowcore struct that has members for offsets that we want
> to touch, why not use it?
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  pc-bios/s390-ccw/cio.h  | 17 +++++++++++------
>  pc-bios/s390-ccw/main.c |  8 +++-----
>  2 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/cio.h b/pc-bios/s390-ccw/cio.h
> index aaa432dedd..1ce5344b85 100644
> --- a/pc-bios/s390-ccw/cio.h
> +++ b/pc-bios/s390-ccw/cio.h
> @@ -122,12 +122,17 @@ typedef struct schib {
>  } __attribute__ ((packed, aligned(4))) Schib;
>  
>  typedef struct subchannel_id {
> -        __u32 cssid:8;
> -        __u32:4;
> -        __u32 m:1;
> -        __u32 ssid:2;
> -        __u32 one:1;
> -        __u32 sch_no:16;
> +    union {
> +        struct {
> +            __u16 cssid:8;
> +            __u16 reserved:4;
> +            __u16 m:1;
> +            __u16 ssid:2;
> +            __u16 one:1;
> +        };
> +        __u16 sch_id;
> +    };
> +        __u16 sch_no;

Wrong indentation for that sch_no line? Should only be 4 spaces,
shouldn't it?

>  } __attribute__ ((packed, aligned(4))) SubChannelId;

 Thomas


