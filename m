Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B04BBCF9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 17:04:15 +0100 (CET)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL5jx-0004r9-Pm
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 11:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5j2-0004CV-IE
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:03:16 -0500
Received: from [2a00:1450:4864:20::32a] (port=37726
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5iz-00017S-Ub
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:03:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8927501wmj.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdEBdEgMAGoMMquMfCuquQI2IgK+7lsvGYCzg23q+pY=;
 b=HIbM9GEcPAdWel1GPQAYNkLrGCZXGJVyam9WRq5/TQ1aWf33WZGroJW9qfZcJtxp9X
 cv6B0kg0SgPunT8uUkpNMGGVDOkuJiMSaTGijjkbC2Aqh6l+UmLm8DmfZeBiJuO5fJNv
 bighsVOGhEoYFgW/n2hOZwZ0lYiyqJm+ShpTcr3fsNalw00g5ALeTdrFBpDPIotm7pxq
 ceNT4uZtUsYDChPAjzpaWvGLqLANbckwESIp9fA1N5zROZ2iGNyW87rue+z2bq3U/6mw
 D8/4rZG1M+44XOrfbReHp+bYXyK2u/G4a0/DNcKy06QGTA2rXSkJDTO2SJENeyZskPsk
 TZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdEBdEgMAGoMMquMfCuquQI2IgK+7lsvGYCzg23q+pY=;
 b=TlETNYlZCnXDRbY4KZwhcwNZksMC+plK+ZbKDex7SANvJNF6spsPv6QPLK8F8NiklQ
 llPT2t94Fa9t/vwQAaUMAmbMX7AcZQKFNs2h4qLLv0SpzQaFZh6UZvxfpaC7jHdv3l7Q
 gTXr2wkNQiWi+rOaD3PkjVlllRGmDdDCAxO8YmelcSf340Evv/43qQa71O/iuu3fP5fP
 sXg3lj8LYl97vZ+QFGe1SFtKwq7NfPs27iVN4vo2Mvz2emn8VSzdFauA9VxEJ7XNcR/X
 q36QlkTs61R53Q5r8UbTIoq13TLopyilB961DjxSC7UmfThkWxmKILLhuHZIguSPsc1j
 1kzg==
X-Gm-Message-State: AOAM533YaT94LK/pzSgdnOMea45SViQ2eu576mHuzETNWDq3tx+y8a26
 PP0/pYVaAX0vuOSoPq5kPfc=
X-Google-Smtp-Source: ABdhPJwYk6wfmchLYpV2XOs1LZaJURYhlU3B+hmIdXZBD8/54KTr4qo/6KZ5BqIN9+dIxA6D2k1v4g==
X-Received: by 2002:a1c:e915:0:b0:37b:d847:e127 with SMTP id
 q21-20020a1ce915000000b0037bd847e127mr7758594wmc.180.1645200187157; 
 Fri, 18 Feb 2022 08:03:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id u15sm49790633wrs.18.2022.02.18.08.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 08:03:06 -0800 (PST)
Message-ID: <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
Date: Fri, 18 Feb 2022 17:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>, "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2/18/22 12:39, Michal Prívozník wrote:
> On 2/17/22 18:52, Paolo Bonzini wrote:
>> I would like to co-mentor one or more projects about adding more
>> statistics to Mark Kanda's newly-born introspectable statistics
>> subsystem in QEMU
>> (https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.com/),
>> for example integrating "info blockstats"; and/or, to add matching
>> functionality to libvirt.
>>
>> However, I will only be available for co-mentoring unfortunately.
> 
> I'm happy to offer my helping hand in this. I mean the libvirt part,
> since I am a libvirt developer.
> 
> I believe this will be listed in QEMU's ideas list, right?

Does Libvirt participate to GSoC as an independent organization this 
year?  If not, I'll add it as a Libvirt project on the QEMU ideas list.

Paolo

