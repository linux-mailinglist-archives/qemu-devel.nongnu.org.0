Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6D387714
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:05:30 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixXV-0000UX-R0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lix0X-0001xi-P0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lix0W-0004BF-0i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLIBdnmlv3jlGO2q5j5FtBFVWJISVClnPVyp5yKrMVc=;
 b=Ozs9Ux1IcyNvxeXZTRsWTVZbTKVidwA//3eGBZ2FO0cmxw+2mXRys/+YY2piI2rue4koIF
 7+gZn+r0Qf7zvkEy7ZQx6gIfFxJgDdPwV8UHdSc6QLG6vGJq47/Nr1+v1SWSVyiKBeuBOE
 R6lh9s+FDXa4ged3EbZe0lbityuC3E8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-wx0M-886MkuuAvBBmtXMVA-1; Tue, 18 May 2021 06:31:21 -0400
X-MC-Unique: wx0M-886MkuuAvBBmtXMVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a9-20020adfc4490000b0290112095ca785so161918wrg.14
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RLIBdnmlv3jlGO2q5j5FtBFVWJISVClnPVyp5yKrMVc=;
 b=G0PvtBRmq3/2J/NOByaaBFCHyBe9qCp96kHj8DS01XVFoE625Bl92lPNNeHJR0DADR
 Rh1fPeNzf484cg05EXCbZ1F3BY/5oBDLPh579JDq0SnqTaVpZsbJ5xQGeVTyqAswAseH
 KOdiw37LrNmppmkTxIPwKvoZguMJ0ZcdlBREYSytBaP/2VSbgsE5K3Ykvlml3Smi7yyj
 +HHxTH0AHbcVGOZeBKEyF4RDZy9R24elrBncCDSEU/T0mu/rlJEvKEkbnolOnm43MfPh
 AD5l6m9o9Ge3GCRRTpNJdc9sl3Q/yKfbWAdAOjUBKtg1Nfhom08aLdPmaglnl832Q9iR
 Jaqg==
X-Gm-Message-State: AOAM5335YqdKZ4k4x3XcO5CCLQBNmrtvizYW8CCqm0AwbPxJCViCMuaw
 NOqh3LI4Q3rvxOIJSP1Z8BPFwMK6gAt1rZTnAWeDa/WudzrH8eRjdwiku2PcgGmBxLyAwhA+JcV
 3pEYBgSESL2zkq3o=
X-Received: by 2002:a7b:c778:: with SMTP id x24mr4103285wmk.23.1621333880863; 
 Tue, 18 May 2021 03:31:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYjH/4ric8Emfn8HAYCYHxeSSZ+j2QGLVRZNnZuDj6UP/LzICOa24C+elFb8VVVzDtFnzzyA==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr4103264wmk.23.1621333880655; 
 Tue, 18 May 2021 03:31:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f12sm14645483wre.88.2021.05.18.03.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:31:20 -0700 (PDT)
Subject: Re: [PATCH v2 00/50] target/i386 translate cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <81278bdc-ba3f-4902-f8b5-0b75ff423318@redhat.com>
Date: Tue, 18 May 2021 12:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:12, Richard Henderson wrote:
> Supercedes: 20210228232321.322053-1-richard.henderson@linaro.org
> ("i386 cleanup part 3")
> 
> Claudio's prerequite patch set ("i386 cleanup part 2"), is now merged.
> Version 2 here fixes some minor rebase conflicts that crept in.
> Only 4 of the 50 patches have been reviewed.
> 
> Blurb from v1:
> This started out to address a fixme in Claudio's patch set, then
> wandered a bit, with cleanups and bug fixes in the code that I was
> touching.  I stopped when I reached my original goal of removing
> target/i386/tcg/user/*_stubs.c.
> 
> There are a lot of patches, but hopefully they're all small
> enough to be obvious.

Nice, thanks.  I only left minor comments on 27 and 30, feel free to do 
a pull request without v3.

Paolo


