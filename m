Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40B64A5AA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mOJ-00017t-La; Mon, 12 Dec 2022 12:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mOB-00017X-HR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mOA-0007uH-4C
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670865289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/SXdD9U3r2zWMvPQz1wwFH01QctlJ5lyejgk93o45s=;
 b=UQUhwu9l9qmOncfyuLrdI1lVKvBjJYGI9gTZrSQLBdzXAPfUrma+LprJcAv0tASfuGyQ2p
 5/u+2ytr8oCKOImuMS6HKxRPYl46aGJIiXgXlFtpiO9+c8ec77KMzJ1CPZuaASpA4ygKoR
 tNRAgV02uIfI5uQ8jcUZWv37m02I5qo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-ugO3pyo-MlG5FtQ2cURk7g-1; Mon, 12 Dec 2022 12:14:47 -0500
X-MC-Unique: ugO3pyo-MlG5FtQ2cURk7g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i9-20020a1c3b09000000b003d21fa95c38so1650395wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/SXdD9U3r2zWMvPQz1wwFH01QctlJ5lyejgk93o45s=;
 b=cdd0XgApDJ3KAMxo6lFyeDmkQnOl5MXyGE1CSqM4oBOMRVc7CLqezmTRcwSxLtx/5O
 EYtv/Ydwn3xHgreIrFckp0KFSVsD+80ax9TKTtsgC8tgiC5C6R7hyNpUYtRUveXR561y
 NXxQL+E/7CSnvVcA/bt9dgSggarSxhuUMICLc+TMG3cVBbbviCuqQsc91S7s+UZz48Rq
 utkiACWghznPHB3jHxESdnN54B7ZCkI+yZoey1ZOnxLDkwOZMEl2unPty34Bv42TLs/S
 +VpkJu57zaCTG3x3+WkZY/VgqWrU/hqumkPaL6/ms8iUIQuIYZfqzbtpSWetXFGyqGro
 6zqw==
X-Gm-Message-State: ANoB5pl3JpM76EGTB0aOXK4NxkUSMaxQ+rpxV1FNODynDfZWpQlaSalq
 hVVQVVian+o5t1dqd/NWnezxxbiWXpxtSuEtW/B2mwpxARoPy+yVMilfIcmPfWLePLA7QyEqoWv
 JPKcpy+hHn1QnGgQ=
X-Received: by 2002:a5d:4747:0:b0:242:226e:f734 with SMTP id
 o7-20020a5d4747000000b00242226ef734mr9137709wrs.70.1670865286750; 
 Mon, 12 Dec 2022 09:14:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rY8g2rPQj8DMmD381oDn2MFbveCA820oIV2JwdGGMF/9q06bVzaziW/zBHZeSuE61go693g==
X-Received: by 2002:a5d:4747:0:b0:242:226e:f734 with SMTP id
 o7-20020a5d4747000000b00242226ef734mr9137690wrs.70.1670865286557; 
 Mon, 12 Dec 2022 09:14:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d6-20020a5d6446000000b002425504ae7dsm9369058wrw.80.2022.12.12.09.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:14:46 -0800 (PST)
Message-ID: <7e2234bf-acf7-a48c-5e7e-f8eba5496026@redhat.com>
Date: Mon, 12 Dec 2022 18:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 12/22] hw/xen: Add xen_overlay device for emulating
 shared xenheap pages
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-13-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221209095612.689243-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 10:56, David Woodhouse wrote:
> Expecting some heckling at the use of xen_overlay_singleton. What is
> the best way to do that? Using qemu_find_recursive() every time seemed
> a bit wrong. But I suppose mapping it into the*guest*  isn't a fast
> path, and if the actual grant table code is allowed to just stash the
> pointer it gets from xen_overlay_page_ptr() for later use then that
> isn't a fast path for device I/O either.

Nah, it's fine.  However I'll reply to patch 2 as to how to handle Xen 
vs. KVM mode.

Paolo


