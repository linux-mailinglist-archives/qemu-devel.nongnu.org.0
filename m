Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB106FF057
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:02:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px42B-0000Kx-Od; Thu, 11 May 2023 07:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px428-0000KS-BW
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:00:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px426-0004Y0-8b
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683802822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1AE3oQLZQWDeCimzCsZRSQ4VxiIR5VmZQv/egwXhN8=;
 b=bkbcKFr3nG5Fb8KfdVKb2z9GS5xS5SS4rrXL34ba2Af9gUvaJ9ke06rm6PfOl23NiNgEHl
 +JrMYU8Pgf4S4+QBgOFgnj8PUBMueMHF0B80UfGXyIAPRS354X1Qrr7MpEUtIHdArOn0n6
 PmYVLG+T6irWaSsxzpPLsBefS5oz9A8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-GbAg0u_hNKKtKFzakHsDuA-1; Thu, 11 May 2023 07:00:17 -0400
X-MC-Unique: GbAg0u_hNKKtKFzakHsDuA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a355cf318so989804566b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802816; x=1686394816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l1AE3oQLZQWDeCimzCsZRSQ4VxiIR5VmZQv/egwXhN8=;
 b=GiHqOL+CEMzTXzgfc3W0Tc9YO73mHhdk6VdL8+Yzsr/SIhPPdhIiBaEMkBpCriGJ6Y
 rJiIO93wR6VDxFQ6t8GpYIaZu4icJ0Z7Jg+ZCBu5MsAUU+B/K+btMbaFwjutDev9COpe
 z2XqoMRi6oBlprBFexKA1aSFVGS9CzAVPdZLG5xMfrf11qRZvPou3Shbu9DgITRmwqQF
 O2At05qQHJfq9DgO/NPcVmvAEU4/ycvqaKScwZWGlw64r4TadrOmdSECoLrWjziQypri
 ZilDjmMQnDq2qZn9dvdg8iO+71vkVuQyu+u90OeNMvn7yXHryktVHHWzEHPG+vOc95N7
 7ZMQ==
X-Gm-Message-State: AC+VfDwJWi0VcNGdEEKF7NuRhl6DSULoeLG6qUWrXlVnpoPw/z/WzA/a
 A9R9SHoZa+nA4mK/ilkWa7zh54IfUjb/SvAdri2BhwsK2yF1ftuSI1QzOPlLDBP4wxC4gQn5FCc
 BrXaq2a3eSXupANI=
X-Received: by 2002:a17:906:6a22:b0:966:3de0:8998 with SMTP id
 qw34-20020a1709066a2200b009663de08998mr15258893ejc.73.1683802816697; 
 Thu, 11 May 2023 04:00:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54y2fQYMRWSOUNhJUvaSKUfFqS90P//jB5FZkkvFH/b5iUCjY8+Oa2cv5LIEhXlLKSQ77s6w==
X-Received: by 2002:a17:906:6a22:b0:966:3de0:8998 with SMTP id
 qw34-20020a1709066a2200b009663de08998mr15258862ejc.73.1683802816288; 
 Thu, 11 May 2023 04:00:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 my37-20020a1709065a6500b0094f44bdf7acsm3853275ejc.57.2023.05.11.04.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 04:00:15 -0700 (PDT)
Message-ID: <22a98a39-ab70-01f4-712a-3fd358d1af57@redhat.com>
Date: Thu, 11 May 2023 13:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
To: =?UTF-8?Q?Th=c3=a9o_Maillart?= <tmaillart@freebox.fr>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20230426133747.403945-1-tmaillart@freebox.fr>
 <62e34905-91fc-6498-d228-faa37b26fd60@redhat.com>
 <CANDNypxOsD_HLC1Ad_MrGqUizsHgDmBv+zH3yEU6X=BXfNRi=w@mail.gmail.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CANDNypxOsD_HLC1Ad_MrGqUizsHgDmBv+zH3yEU6X=BXfNRi=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/11/23 12:37, Théo Maillart wrote:
> On Wed, May 10, 2023 at 6:11 PM Paolo Bonzini <pbonzini@redhat.com 
> <mailto:pbonzini@redhat.com>> wrote:
> 
>     On 4/26/23 15:37, Théo Maillart wrote:
>      > --- a/hw/scsi/scsi-generic.c
>      > +++ b/hw/scsi/scsi-generic.c
>      > @@ -191,7 +191,7 @@ static int
>     scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
>      >       if ((s->type == TYPE_DISK || s->type == TYPE_ZBC) &&
>      >           (r->req.cmd.buf[1] & 0x01)) {
>      >           page = r->req.cmd.buf[2];
>      > -        if (page == 0xb0) {
>      > +        if (page == 0xb0 && r->buflen >= 12) {
>      >               uint64_t max_transfer = calculate_max_transfer(s);
>      >               stl_be_p(&r->buf[8], max_transfer);
>      >               /* Also take care of the opt xfer len. */
>      > --
> 
>     This is not enough because right below there is a store of bytes 12..15.
> 
> 
> I agree with you, I was wrong, the test should be r->buflen >= 16

This would let the guest see the wrong maximum transfer length, if it 
uses a buffer length of 12.

>     The best thing to do is to:
> 
>     1) do the stores in an "uint8_t buf[8]" on the stack, followed by a
>     memcpy to r->buf + 8.
> 
>     2) add "&& r->buflen > 8" to the condition similar to what you've done
>     above.
> 
> 
> But I don't think this suggestion is necessary, it would basically do
>  the same thing that is done in the current version adding an extra
> memcpy on the stack.

The memcpy can be limited to the actual size of the buffer, i.e. 
memcpy(r->buf + 8, buf, r->buflen - 8).

In fact you need to memcpy both before and after, so that the ldl_be_p 
is done on a large-enough buffer.

> In my opinion the only problem highlighted by this crash is that of 
> writing byte 8 to 15 while the buffer size is 4.
Right, but the bytes that _can_ be written should not change before and 
after the patch.

Paolo


