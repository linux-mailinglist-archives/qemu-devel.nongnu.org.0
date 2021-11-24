Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234F45CD99
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 21:03:29 +0100 (CET)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyUI-0000vx-Gv
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 15:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpy3S-0006l0-8g
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:35:44 -0500
Received: from [2a00:1450:4864:20::534] (port=45702
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpy3Q-0000Zq-PG
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:35:41 -0500
Received: by mail-ed1-x534.google.com with SMTP id y12so15123443eda.12
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OuPuzgSLwCqbFULsBM+YfwGGsxK4vnP+kqb8ZfusWl8=;
 b=oqT7LqLP1FNcT2seebtg0fjJlxUPj+nz0gMOFOs35s0pO5opNFJLjYrACnmKvVfzkx
 Ng/mrYe57Xm7LPowOGy3+uLSccL4jpiGOOjX0l5kfIut/7eaKRM86SbKatuMuvZzCZX+
 aHg5XWFXBHwrXjIhcut1rnFsZghxDX2empREVOqOsH7svCGg7fJmjmXLGmoRnbUHYIFR
 Qa3G8w8pLVUn2Tf1kpugrMtbz1Lt3J6CCGXqmEOHbewYEjOBhUeke+hm7sB/6N8IUsOi
 gaB9iTYwkey4+A9NUE9GC15UaMxYYAno73Z8qeRI/yh25DhlVxe6qZIVArJ7YuTqSSOy
 6b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OuPuzgSLwCqbFULsBM+YfwGGsxK4vnP+kqb8ZfusWl8=;
 b=bhYWIdMPWmNEhyPJxrPqWs6ptE55Kdkv40Nu0zpNHMLr58vXkgnATG75ddQFmEfIL5
 dmVQJP0TFVY7/Eo8U2QEWtWHNn+Ukjbq/HK8x1qEbIhdv5DLMNYmWnXKxgHBkJ/Pp99i
 6N44zuWIr9lv46h1cHbUN/wJZAjC6+eBgwMwmxtARinIKAofDzmraAFSqXMMs8UlRf9c
 AFUdMd2tNpvsWO/1JTRwwZ3WEj+DFKceLh8R+MascdIpVH+AWXAfQ1J3ncHjECMeCKYI
 ZejeojXjqwsaTcs+yJ+7Pl3qqMltSGUjkwL0TtksFy8VZfB560qdy00S7VIvsvMxEhKD
 Q2Pw==
X-Gm-Message-State: AOAM530a8j3vksi1e/LYat47SE7dj1fIScazkhaPt33+raYwu3jnUXBC
 JTSpGnJdwzoV5mtiucWB0i0=
X-Google-Smtp-Source: ABdhPJzZbsczM5DZRJPaqnE30cPQe4+55HyeUyRviAfEBhAxVyEkdDp3F8U5lCvtFqHPlGfR7t60AQ==
X-Received: by 2002:a05:6402:4301:: with SMTP id
 m1mr29096207edc.54.1637782537274; 
 Wed, 24 Nov 2021 11:35:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id qb28sm409935ejc.93.2021.11.24.11.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 11:35:36 -0800 (PST)
Message-ID: <bbc74dfc-0188-15cc-0483-f28b3caf075c@redhat.com>
Date: Wed, 24 Nov 2021 20:35:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Other pages for docs/devel/ [Was: Re: ... Update URLs of
 "SubmitAPatch" ...]
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20211118170028.820558-1-kchamart@redhat.com>
 <99a6b686-c2c4-dd5e-fe8c-9940311cdaca@redhat.com> <YZd5OLlyKegEphY9@paraplu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YZd5OLlyKegEphY9@paraplu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 11:15, Kashyap Chamarthy wrote:
> Noted; so these two pages:
> 
> -https://www.qemu.org/contribute/security-process/
> -https://www.qemu.org/contribute/report-a-bug/
> 
> What about these two other pages (which are also linked to from the
> "contribute"[1] part of the website)?  Do they belong to docs/devel?  If
> not, should they be part of 'qemu-web', instead of the wiki?
> 
>      -https://wiki.qemu.org/Contribute/FAQ
>      -https://wiki.qemu.org/Documentation/GettingStartedDevelopers

Yes, I suppose all of these can be moved to docs/devel.

Paolo

