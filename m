Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE543712D4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:06:58 +0200 (CEST)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUXZ-00012N-AJ
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldULk-00041B-Oi
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ldULi-0001qf-3e
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620032080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGcbiWRYfksXhZrWuVVoWVAXfmeCjNSIvE38ElqsTYQ=;
 b=ArOZmV83vgaV3sG0RoNQu9oPyDPCBnIp1YB9x08bJPn3XEgY5d20+6RWovrjpUWaoVEzxW
 ruPPU01ucWAsvTas9dG7H7k9v6UX+WGfMS0BKu+TEYj4O7E4iJoV1NCVKCVCajM14BmVdq
 DvYkS1dhIMw0bqSCYVl3Egs5Pkz/FJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-uFKqGAX3NCSqijjNNsAtSg-1; Mon, 03 May 2021 04:54:39 -0400
X-MC-Unique: uFKqGAX3NCSqijjNNsAtSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AC7564083;
 Mon,  3 May 2021 08:54:38 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-109.ams2.redhat.com
 [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FA795C241;
 Mon,  3 May 2021 08:54:37 +0000 (UTC)
Date: Mon, 3 May 2021 10:54:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by
 marking panic() as noreturn
Message-ID: <20210503105434.7168764d.cohuck@redhat.com>
In-Reply-To: <20210502174836.838816-2-thuth@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-2-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  2 May 2021 19:48:33 +0200
Thomas Huth <thuth@redhat.com> wrote:

> When compiling the s390-ccw bios with Clang, the compiler emits a warning:
> 
>  pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used uninitialized
>   whenever switch default is taken [-Wsometimes-uninitialized]
>      default:
>      ^~~~~~~
>  pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
>      IPL_assert(found, "Boot device not found\n");
>                 ^~~~~
> 
> It's a false positive, it only happens because Clang is not smart enough
> to see that the panic() function in the "default:" case can never return.
> 
> Anyway, let's explicitely mark panic() with "noreturn" to shut up the
> warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/s390-ccw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
> index 6cd92669e9..79db69ff54 100644
> --- a/pc-bios/s390-ccw/s390-ccw.h
> +++ b/pc-bios/s390-ccw/s390-ccw.h
> @@ -89,6 +89,7 @@ bool menu_is_enabled_enum(void);
>  
>  #define MAX_BOOT_ENTRIES  31
>  
> +__attribute__ ((__noreturn__))
>  static inline void panic(const char *string)
>  {
>      sclp_print(string);

I'm surprised that the noreturn annotation of disabled_wait (called
right after the sclp_print()) is not enough. Anyway,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


