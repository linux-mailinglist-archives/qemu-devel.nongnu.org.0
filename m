Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022157CAE5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:45 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVZk-0007Uv-DJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEVVA-00008y-69
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:42:00 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oEVV6-00072d-SM
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:41:59 -0400
Received: by mail-ed1-x52e.google.com with SMTP id x91so2014788ede.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ba5Oe+9LIjEz9ZqBveibnO5ljCbQJfD+G2aDNHIQvhU=;
 b=IaV1SugKh+tFVHhbNb7UIPfGeAOt1zFt7RGiD2vXWsnkJwMiK0G0BSnBWIyoPYQZxg
 W5PFxGuvyDyJu1uE2erEduMOBMkTMuIqcgfHK4PUgr3iHlVVgUDUBmzsK+tqCCCY62fe
 LE92wqk1dc78q3rBLXMuijN1QqJtqZkyySVPa7di+XSOFqN3XVi/Bxvx3ja6KSwA5VV5
 lRTrYWL+LJSRv1chSUcd4EpigpL11MLINcU8aKxKXKjDHWxDALcuPkWSG9yEq4iIJ+1/
 3KKbPval6NwNIvqNlC5AyJ83xuLVe8NafQXfD5Ypv/gbaCgcxZvZIWF+UJDUeI17RXHy
 A3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ba5Oe+9LIjEz9ZqBveibnO5ljCbQJfD+G2aDNHIQvhU=;
 b=nS6XS78BMtNe2YPeyJP4/n6RMYeQ8/XF2xOfnNXxWf+gcdwznj/ydFz708Vsm1PENL
 SyPiNTFD97y9Y9QDuyarY7v5QgObAw4xhHsVhzCFpjW0eaRJl98A+/TRFta9+CN2iWzL
 VAay6VjMtNiYEcTJ+cG8Stm2cJ4l/pHu/BVT+UxSHtJwrwdDgr4F5fMyGbU517i62f51
 /MUSJJPwuCjOKrGn7a3DWQaJbEdlAfJAsApraQhHPB0m+eVS41fCZBXBYJHVWy6mGK5T
 v0Enteb1gyAWl17Hkg3vNM0UaYRjbsFK4IM+2P6/L1mZ2C0g/sObWxqFiotn7gsIM3Yq
 ILjA==
X-Gm-Message-State: AJIora+X076shHG3I58Hc80XLmUb1h6ToJaPLrMildOhmhIfn45EtcVG
 ZAI7/P2IZQzIF29PcbTs0rY=
X-Google-Smtp-Source: AGRyM1uP8TOMzuFCduyI7NbLOIlTPH6n8d8AHVkpPV/ufXVDDK4R5Bz/dLpEmf22f48/+Wp6SiR8GA==
X-Received: by 2002:a05:6402:1e94:b0:43a:9e92:bf2 with SMTP id
 f20-20020a0564021e9400b0043a9e920bf2mr56606513edf.248.1658407313307; 
 Thu, 21 Jul 2022 05:41:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b25-20020a17090630d900b00722fadc4279sm819518ejb.124.2022.07.21.05.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 05:41:52 -0700 (PDT)
Message-ID: <8329bd5c-a0aa-5d91-657a-204fb6d789b0@redhat.com>
Date: Thu, 21 Jul 2022 14:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
 <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
 <YtlDtSlRel1UUd71@zx2c4.com> <YtlGPy+C9ksQQXzO@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YtlGPy+C9ksQQXzO@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

On 7/21/22 14:27, Daniel P. Berrangé wrote:
> 
> Pre-existing guests which have merely upgraded their QEMU instance
> won't get the feature, because they'll be fixed on the old machine
> type to guarantee no guest ABI change. This isn't a problem, as
> such pre-existing guests likely won't have the new Linux code to
> consume the seed anyway.

In fact this isn't a given either and depends on how these pre-existing 
guests are managed.  People that do not use Libvirt, or that just start 
their guests with "virsh create" and some on-disk XML file, _will_ get 
the new feature.

The way QEMU does things is that fw_cfg is part of guest ABI, and this 
is _not_ up for discussion.  You're not the first one to be confused[1] 
and you probably will not be the last, so this means that the whole 
concept of guest ABI should be documented better.

(By the way, even though I agree that the failure is completely 
theoretical apart from the record-replay case, it can actually be 
reproduced easily by sticking a long-enough sleep in 
pc-bios/optionrom/linuxboot_dma.c).

Paolo

