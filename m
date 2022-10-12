Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D85FC349
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:50:52 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYO3-0008BN-14
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiYK8-0005P2-8r
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiYK3-0006x1-KA
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665568002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iLEWwn4KJRxSbOPSczpQjhzvSahA7lQkMROrWBQWA8=;
 b=TpG+fVKqFa611wA+pMdYwhyapGlXhTpzG8xq/4rO1auTABLPJ2hWI9VUd+oY01V+KGdkd4
 5CxoNty/831wdw2kqWat6bRi8HJC7WQ5LabGkbJat1skwOK1WmAXb6RNCvZzdiy71cBFp+
 CVAgxc2VA120+Ds1t9rbLPP53V4oYCQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-GWgBEoeFMMeoHiHSKDPyyA-1; Wed, 12 Oct 2022 05:46:41 -0400
X-MC-Unique: GWgBEoeFMMeoHiHSKDPyyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i133-20020a1c3b8b000000b003c6d18a7ee5so523330wma.6
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 02:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1iLEWwn4KJRxSbOPSczpQjhzvSahA7lQkMROrWBQWA8=;
 b=Ga0C7Ur8/XeeqN0gvbWifzBEm/hKaDqxAprHNr33yF4iNvr8eLVfkq+A9/NPHYvgVr
 wnYSKEWnYMN1/3r7iPmiAwJsEkOBVFLyJB1ghUKjMJcBht5sP21ahskYNOsdN3Y0d+f9
 apD2kHJlORij8qY6ex2KfhB1Kn58CuDb4rtdVhk5Bor+g6nTs9kUq9sHjaLVrGMpt6Vw
 aebTMY0weYEzb8xl/eXQieWeTuztS9XSl+J8SBihjGv2Ddzi36VrgLdrsOoEC3FA0Jxv
 31642AQx4AGxAuOYC7o40Axy6zpmQLSdu2RHoNPnQrG9kii+mCqbgYAuZwMbzVg8RhjE
 QZ9Q==
X-Gm-Message-State: ACrzQf0igkWjSOItDmUJHoUv6Ux9xnzbjXaFlGw4OoEV6vgAGG6lL2rp
 gDdd8wIDPuYWKkYcWLsfxYm5TN8x13KRiLo9WrX1mF0G22bnrD3R2En+Ydia0yygIzXVu4VZ9+Q
 PwAUD7Qkt2Pd7qaI=
X-Received: by 2002:a7b:cb92:0:b0:3c4:cf60:7a7 with SMTP id
 m18-20020a7bcb92000000b003c4cf6007a7mr2157385wmi.24.1665568000323; 
 Wed, 12 Oct 2022 02:46:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xWVFQbg6exVRj9+CTUiH/pPeUQt0xwde6Ae0Kod/DlQzAL08UmA4giTlAEWA9qETtv6Vi8g==
X-Received: by 2002:a7b:cb92:0:b0:3c4:cf60:7a7 with SMTP id
 m18-20020a7bcb92000000b003c4cf6007a7mr2157371wmi.24.1665568000067; 
 Wed, 12 Oct 2022 02:46:40 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b0022af865810esm13336008wri.75.2022.10.12.02.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 02:46:39 -0700 (PDT)
Message-ID: <1db96c1d-d54e-cf06-588d-9204dd31e55f@redhat.com>
Date: Wed, 12 Oct 2022 11:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/unit/test-image-locking: Fix handling of temporary
 files
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20221012085932.799221-1-thuth@redhat.com>
 <CAJ+F1C+ebT3se0QUNwUxiC_1TAnuDhTkW2jus3DmsgPOEKSypA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1C+ebT3se0QUNwUxiC_1TAnuDhTkW2jus3DmsgPOEKSypA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2022 11.21, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Oct 12, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     test-image-locking leaves some temporary files around - clean
>     them up. While we're at it, test-image-locking is a unit test,
>     so it should not use "qtest.*" for temporary file names. Give
>     them better names instead, so that it clear where the temporary
>     files come from.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>     ---
[...]
>     @@ -140,6 +140,8 @@ static void test_set_perm_abort(void)
>           check_locked_bytes(fd, perm, ~shared_perm);
>           blk_unref(blk1);
>           blk_unref(blk2);
>     +    close(fd);
>     +    unlink(img_path);
> 
> 
> Perhaps we should use g_unlink() instead for better portability? although 
> this is pre-existing.

I thought about that, too, but apparently you have to include an additional 
header file (gstdio.h) to get the prototype - so it seems to be more effort 
for no real gain (unless you want to use non-ASCII characters in the 
filename - which we are not doing here).

  Thomas


