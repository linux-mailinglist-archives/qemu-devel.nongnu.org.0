Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F6F30FFDC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:07:37 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mmm-0002uS-Ac
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7mls-0002Ne-7Q
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1l7mlo-0003mC-GB
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612476395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3yx8IsWSODh+hCDXigblZRTwEOVJ7D20PLMZ0GoS8k=;
 b=gcDlSykXMi8fqmGASAQcMzKoiOLZX3vkaTiuTUtwyvIoISMtSA+AK3MARtcl7xvWLH2Zx/
 iJo59FYfHIj+d01LeQbF7tS6ZKy3esjkWu6to7MJ38XKSBH2BLikeKslgL30NXR7MzbtiW
 rw36b8VzxW7azz6hJgrmj4S58Qpr//s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-X29VRs4QPmmAgA5PiGCBFg-1; Thu, 04 Feb 2021 17:06:29 -0500
X-MC-Unique: X29VRs4QPmmAgA5PiGCBFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CED100C637;
 Thu,  4 Feb 2021 22:06:28 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8628722D9;
 Thu,  4 Feb 2021 22:06:24 +0000 (UTC)
Date: Thu, 4 Feb 2021 22:06:24 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tcg/s390: Fix compare instruction from
 extended-immediate facility
Message-ID: <20210204220623.GX30079@redhat.com>
References: <20210204182902.1742826-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210204182902.1742826-1-f4bug@amsat.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 07:29:02PM +0100, Philippe Mathieu-Daudé wrote:
> The code is currently comparing c2 to the type promotion of
> uint32_t and int32_t. That is, the conversion rules are as:
> 
>   (common_type) c2 == (common_type) (uint32_t)
>                         (is_unsigned
>                         ? (uint32_t)c2
>                         : (uint32_t)(int32_t)c2)
> 
> In the signed case we lose the desired sign extensions because
> of the argument promotion rules of the ternary operator.
> 
> Solve the problem by doing the round-trip parsing through the
> intermediate type and back to the desired common type (all at
> one expression).
> 
> Fixes: a534bb15f30 ("tcg/s390: Use constant pool for cmpi")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tcg/s390/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index b67470137c4..695d7ee6523 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1067,7 +1067,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
>                  op = (is_unsigned ? RIL_CLFI : RIL_CFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;
> -            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
> +            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
>                  op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;

I have tested this patch on an s390x host on top of 1ed9228f63e "Merge
remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-02-02-v2'
into staging" and I can confirm that it fixes both previously reported
problems.  Therefore you can add:

Tested-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


