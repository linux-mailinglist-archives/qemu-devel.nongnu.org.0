Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2C57B6C7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:50:35 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE99t-0006xf-K3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oE97N-0004Sn-SN
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:47:58 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oE97I-0001Ww-Sf
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 08:47:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id ez10so32815170ejc.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0mw50aSgNsRMgJJrzdCMDpcU5VMXEZFtMU83TwzMMTE=;
 b=NcPEdhNInh2j5ue5GwFwMY/CetG/oZykwt6DF/j1pvZ/KiN+ZhKDy+vo61MOcXI56V
 50PgxcUa0P2vr453VGd/7IRFNhVJesnPzBeEajGVnPp77Nmzh7++PDE51Z4acI7cqv8W
 gPYOvcZZykozbv1Emt0StMulu6LxRyJX3db/WsoLCGK1OVXxqeMP6OmSvQXt9cdkDr+X
 D6mJ41amamVaK+VVC/zrHTBPo/lTfLaUvM2j9qNEOSYjiql155mEZifhAugcNTOl/uco
 weyK4gcps8pR0UA64Tkqn10NbIWTj0dEwKmLoZyXU4QZ0u2LJih0o/GAJVHFH5mvlWxR
 dDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0mw50aSgNsRMgJJrzdCMDpcU5VMXEZFtMU83TwzMMTE=;
 b=bQmXtSxhSDvivrEp/XutfAL5CfLF/tiW5ujLbYzWGuIB47XU8ee8tHJ5UFvCa18qxB
 aV6pIKIo7HrdvmijFdyNWcG7Sn2C9gVoeBMTQ74F86oXXKc/1OL4N42qkx/URc15F47b
 f6qCaT9wZ9DyUWZ+KoWIvtI8QJNThFdZcqASZ3yeR0qTdbkzzo9Q43Lh7A+4F2SRnCT5
 2EBX46jYGoPoKh2oJLyaNU95eVwGJhTyNDyD6HsNLfLg6G2HlDhHab4juWKvN0+0R2Uo
 Ae64/EHJOFeuGqkhAUDFX5IpVOcsFRTISnQ7z1Qvm02936adVG1djoTwHGOcYRERgu8r
 /IzA==
X-Gm-Message-State: AJIora98PLITCEHkEc24flKZ1IgYF5TVGBuvN6IT3pz3yptuxTKAGhMY
 fMY+W3zWfMVHjW3/MCFJtUI=
X-Google-Smtp-Source: AGRyM1s+to7GzxxqU1xP/jPBR3m7n0KypqlYVqVUNmueRfddRxITbqglenFyGO8j3YklNnlKuZX/Fw==
X-Received: by 2002:a17:907:2889:b0:72b:50c8:c703 with SMTP id
 em9-20020a170907288900b0072b50c8c703mr34839693ejc.694.1658321269952; 
 Wed, 20 Jul 2022 05:47:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 ec21-20020a0564020d5500b0043ba24a26casm2216609edb.23.2022.07.20.05.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 05:47:49 -0700 (PDT)
Message-ID: <3b0175f0-50ab-48b9-e05b-d9ef81433532@redhat.com>
Date: Wed, 20 Jul 2022 14:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <20220719093439.528810-1-pbonzini@redhat.com>
 <YtalBPp+QKS0wKWs@zx2c4.com>
 <b768df3d-4c36-549e-8e33-a3ec50ab95e2@redhat.com>
 <CAHmME9qvWjdSVCLWyTrXDS34zbJ=NZ6QBsFb-DpNO3deJ6xEYQ@mail.gmail.com>
 <Ytfk+jNgPtTH3vl4@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ytfk+jNgPtTH3vl4@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/20/22 13:20, Jason A. Donenfeld wrote:
>>> Sure, no problem.  Unfortunately I was on vacation around the time you
>>> sent it first.
>> Excellent, thanks so much!
> Just wondering one thing: which tree did you put the patch in? I didn't
> see it on your gitlab, but it seems like QEMU development happens in
> many different places at once.

Well, I still had to review it (unless I screw up, you get a reply from 
me once a patch is queued).  I think there are some issues with 
migration compatibility of setup_data and they snowball a bit, so I'll 
reply there.

Paolo

