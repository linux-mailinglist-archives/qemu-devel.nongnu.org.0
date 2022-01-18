Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D0492704
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:22:00 +0100 (CET)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oQv-0006a4-Hz
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9ndJ-0006As-Fp
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:30:41 -0500
Received: from [2a00:1450:4864:20::332] (port=41970
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9ndG-00027c-6t
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:30:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so7088549wme.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/jgBKl6541porzzwol3KCBPwD85bJnsXXVRPxroVxs=;
 b=LfWbeUP9E3uP2jz4B67Wl+QX9EGjJM3+5hQMgDgzY4cDXe0WjdNaD5tgWkd6wtoSrj
 /XbPcbx/HBt3C/kdWGpzX/Vnb79VPO/3LG2Zy3Eb4S2syAh0IUd+DhUPxC7uJfBifR0K
 jN4XUW+07HjMMjKs1eqiJmuR5WtUbmGZaOMxj3098MKCF9+LdZ2yLPiRxx8n4vOti7As
 GeQW1Jd2mQ5G3Vdto2igfKhiNDeKyO+NEvt3b2jswKyq5G1JYkW4ElQVwD0WtqfEBLIY
 U+g2B/9WKGwjOfbH4PPGb4LA5krCDSPQUELhupCRC0RK9IlqisWm2k4OMDg+iEsEnA1m
 HnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/jgBKl6541porzzwol3KCBPwD85bJnsXXVRPxroVxs=;
 b=2WIgLcxdusU4bUishkdqFkTEaKM2QQry1DgYw+TeZe10kpgllT5/BsizPmuFeHd5Q/
 pNHsPV/xuhWqMykqrTzv8TtyFBXJatVdzHzllGgtyd7rljBdSQwPN1+Fzev6AkLlVKBo
 O7pMmo3HaM539IZBUoyOfZalqjbTpYCt5PA9ohfrphP7A8jMAuLvnR62lod9O+J0kLOS
 8juSk+yHUlTOOaH0+fbvFFvR4+cSrvLjmEk9ywoI0ldzj3Yfq2fcKLhNnEwXLUoOmVUG
 xe6RUW0eJSUbgzcCVFPdjVa0Z4RHPjJfxaTz9DO5XjLO71yGbUAiNtSXBxDT50QMLrG1
 qMSA==
X-Gm-Message-State: AOAM531vEpJzQlxYS7ZKvf6yJthYeebDzka13i9Pm7bPdxaDCPVcp5fO
 /XTBtW4YTeqrkpuRPloEtAk=
X-Google-Smtp-Source: ABdhPJzoqEcNb11vb6Iah77tXmEp6xizHV8vEKHApDhy9uTRpbFHNGk9K4OX3X6gKrSdm3OFANdIUA==
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr22670261wrd.317.1642509036831; 
 Tue, 18 Jan 2022 04:30:36 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 1sm15550195wry.46.2022.01.18.04.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:30:35 -0800 (PST)
Message-ID: <d9c9de5c-7b33-ea60-4a14-634cdd8f66a2@redhat.com>
Date: Tue, 18 Jan 2022 13:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: /usr/shared/qemu binaries
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
 <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
 <CAFEAcA_qkUPjSz2PQTxtkTFuho=HusONxN56e9z89B8jHrOJag@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_qkUPjSz2PQTxtkTFuho=HusONxN56e9z89B8jHrOJag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Liviu Ionescu <ilg@livius.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 18:23, Peter Maydell wrote:
> On Thu, 13 Jan 2022 at 17:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 1/12/22 14:56, Peter Maydell wrote:
>>> Those are UEFI firmware images which are suitable for using with
>>> the arm/aarch64 "virt" board. They're only used if the user specifically
>>> asks to use them on the command line (eg with
>>> "-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
>>> similar).
>>
>> There must be lots of zeros in there. Maybe we should tell QEMU to
>> unpack firmware .gz or .lzo files?
> 
> Not hugely keen on adding more "do what I mean" behaviour...

Certainly no autodetection (with writable pflash there's the possibility 
of the guest causing real problems), but we already distribute firmware 
as compressed files so the zeroes _are_ causing problems for us as well. 
  We are just telling the users to deal with it.

Paolo


