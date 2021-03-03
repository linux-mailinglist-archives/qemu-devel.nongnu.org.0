Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B232BB14
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:12:31 +0100 (CET)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYnG-0005Mt-DN
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHYm1-0004mS-K0
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHYlz-0000Cr-Pj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614805869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ehnuen2LxU5RAkKrM/ZxDSpCFFj9Iv9siQUXDaOcRe8=;
 b=WbCrUu+pxvzzsty/L/rGikk9LgDR8dS7lhRy0C79WbhlPqBLdcBj227zCFo3+2+feTSae2
 LjLc0dGxm1z+EhhHHc9BOGLz/fr3EYJQvcVs7FeYkhn9DmRkzVaxzrjZfd+wqCXEmXbMnz
 OKOjFiBg/7XOSI33tWKYpXe9yN6vt/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-RPB4w_CUMaWraMKk1ePXAQ-1; Wed, 03 Mar 2021 16:11:07 -0500
X-MC-Unique: RPB4w_CUMaWraMKk1ePXAQ-1
Received: by mail-wm1-f69.google.com with SMTP id p8so3519725wmq.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=bQxjcAHUmIXP4VtUiNAJGTNuCtgIFoFXplksXarPwNs=;
 b=iQiKFonY+MmzEVW8GLnzyAaCVZonnAR6wYkCrkJkPJDf827O3X5BiuGgvEuermo6uy
 BwqYxMlpyFtZvpXKk1OFj4KpM2sFIlzv3M+gY+d+wWyDfxaWxgHIb5dVbphdcBlikYx5
 7PmprdwT0vvp4/lOakqp9npTE3o/igOq59Rcz96+oePtvRtoUkF4lvS7HB8ZLnOfy7qB
 GUpKvvJktQxO1T7MkV/V7el33T8eK5RIA2jCfVKzqs5Qik3fj2URG0+UwUVMJCpEra17
 ENE4uoZ+231zsZhDHu3eWsl2y7iqdpU/4tTRs7Awo20+5dBFwP4YduLSVAHhaBfAt63y
 F93Q==
X-Gm-Message-State: AOAM5337lbWkEoHy1KvIoGoIW9R+/CGSA49gcgGq8+e0CqNIM/Fv0Y8d
 blRle9OPy4AN+Gup9q4N84NW7/Q8vPQja65DUVegEynnWH7VDiq+WdZRceZfYBzqJFytza5KavY
 F7WSLlUF8O24FVfc=
X-Received: by 2002:a1c:a504:: with SMTP id o4mr745614wme.174.1614805866298;
 Wed, 03 Mar 2021 13:11:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMWmlGDFB18IZjSKFtPWq8pitYO2SH27h9kpq2XDH45B6HIj0cUTKnMp6pZKhxU7z4/K7yZg==
X-Received: by 2002:a1c:a504:: with SMTP id o4mr745594wme.174.1614805866003;
 Wed, 03 Mar 2021 13:11:06 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6975.dip0.t-ipconnect.de. [91.12.105.117])
 by smtp.gmail.com with ESMTPSA id o124sm7005148wmo.41.2021.03.03.13.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 13:11:05 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Wed, 3 Mar 2021 22:11:04 +0100
Message-Id: <C79BA7F7-A6AD-4D5B-8683-9EFDF16ECB65@redhat.com>
References: <ae902e23-08e4-303f-3eee-9e196987aeea@linaro.org>
In-Reply-To: <ae902e23-08e4-303f-3eee-9e196987aeea@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 03.03.2021 um 22:05 schrieb Richard Henderson <richard.henderson@linar=
o.org>:
>=20
> =EF=BB=BFOn 3/3/21 11:39 AM, David Hildenbrand wrote:
>> Should we start wrapping that stuff into #ifdef CONFIG_TCG ?
>>> +    uint64_t tlb_fill_tec;   /* translation exception code during tlb_=
fill */
>>> +    int tlb_fill_exc;        /* exception number seen during tlb_fill =
*/
>=20
> Eh, probably not.  At least not until we elide the softmmu tlb, which is =
fantastically larger.
>=20
>>> +    if (unlikely(flags & TLB_INVALID_MASK)) {
>>> +        return false;
>> ^ I recall PAGE_WRITE_INV handling where we immediately set TLB_INVALID_=
MASK again on write access (to handle low-address protection cleanly). I su=
spect that TLB_INVALID_MASK will be set in that case (I could be wrong, tho=
ugh).
>> What certainly would work is checking for "haddr !=3D NULL".
>> /* Don't rely on TLB_INVALID_MASK - see PAGE_WRITE_INV handling. */
>> if (unlikely(!haddr1)) {
>>     return false;
>> }
>=20
> Ah, right.  I consider TLB_INVALID_MASK being set in the return from prob=
e_access_flags for PAGE_WRITE_INV a bug.  I'm not sure how to fix that righ=
t away.
>=20
> Well, !haddr1 is also false for TLB_MMIO, so you'd need to check for that=
 as well.

MMIO on s390x? :)


