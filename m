Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE1275019
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 06:53:39 +0200 (CEST)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKwmg-0001jY-Rv
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 00:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kKwlc-0001Ii-OE
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 00:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kKwlb-00048b-8i
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 00:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600836750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tP25w0ZzVCfUJ7XvdgOzAXe1DuNsp1VyHmJALx98LOE=;
 b=CwjCLw/mBjRQsobZEfb3OQA9IQw3b0NbRIHCAuZi2wsxUtuNWYucChDxex6zZ8jpsmpa5K
 YO4MU2tX4Ppp9VtSMdojiGsMvod7I51wzd3bfYtii7DkaFLGJ6tpaE88D2uARmyI4TkXs+
 RAvVaOFXB05Pn0oyIgjg9coMl8Y5PLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-hZ4Q6w-MPdWhOtCjsBABAQ-1; Wed, 23 Sep 2020 00:52:28 -0400
X-MC-Unique: hZ4Q6w-MPdWhOtCjsBABAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72408801AEB;
 Wed, 23 Sep 2020 04:52:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0528473689;
 Wed, 23 Sep 2020 04:52:22 +0000 (UTC)
Subject: Re: [PATCH v1 2/8] s390x/tcg: Implement SUBTRACT HALFWORD (SGH)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200922103129.12824-1-david@redhat.com>
 <20200922103129.12824-3-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5cbd9940-ac62-1873-3949-52742e999750@redhat.com>
Date: Wed, 23 Sep 2020 06:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200922103129.12824-3-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2020 12.31, David Hildenbrand wrote:
> Easy to wire up.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
> index 8dbeaf8c49..e851e9df5e 100644
> --- a/target/s390x/insn-data.def
> +++ b/target/s390x/insn-data.def
> @@ -883,6 +883,7 @@
>  /* SUBTRACT HALFWORD */
>      C(0x4b00, SH,      RX_a,  Z,   r1, m2_16s, new, r1_32, sub, subs32)
>      C(0xe37b, SHY,     RXY_a, LD,  r1, m2_16s, new, r1_32, sub, subs32)
> +    C(0xe339, SGH,     RXY_a, MIE2,r1, m2_16s, r1, 0, sub, subs64)
>  /* SUBTRACT HIGH */
>      C(0xb9c9, SHHHR,   RRF_a, HW,  r2_sr32, r3_sr32, new, r1_32h, sub, subs32)
>      C(0xb9d9, SHHLR,   RRF_a, HW,  r2_sr32, r3, new, r1_32h, sub, subs32)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


