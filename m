Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE14590A7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:57:32 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAl8-00036D-8P
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpAiy-0000an-5K
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpAiv-0006wk-IH
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfmUHQY8GaR5ZzrGyDF3to1LagJK8Yu1dCFFPL7b5IA=;
 b=fjFdjqMhiwwJcYRx5pDOvat6QM8dariCug7K9YJa9uzGZIFBB+NB0pyAELJKVqEZS74akl
 kaMqGTjlqCWou01JJsrDebP2AbxgE85WISjYJ3OYUjyzHpS8HkzV99J4oGEwD0oE2v8Hct
 UGOPhfVwLSDUSpCSG8sLlZKSLxglDnY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-JMAJLM0lNXmotoMpKDxAXw-1; Mon, 22 Nov 2021 09:55:11 -0500
X-MC-Unique: JMAJLM0lNXmotoMpKDxAXw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so3174096wrp.8
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NfmUHQY8GaR5ZzrGyDF3to1LagJK8Yu1dCFFPL7b5IA=;
 b=vKjlFf4KdZ1ig/zO59rbqZ7GYtamiQjLv/LpcsAW90DOwu78OLKfUwG1Y22o/gsN54
 K2Hv9xUvzpX01uYPCxwVJ+DsdC9HOPdOEU1t9yYyD6kwH6meaJyYiU1hBNwYDaRNuCZx
 Hguuoszn9z8XhTcs7o246wj/2WPUuLkQ+qhtrZOSBImcdZgzPHubIQR9HUGUpqpG6w90
 kME8ka8/SbBO7DKSOwygAiec3DnH/IYPoelimCUtNZo5O3Zddykpc46ZF+67PudhD6sP
 NFHj6SzBeIyqqZyayo40E8/LeGxPZM+/Mpe2MNcTlMg+tu9r3aW31emnTAKpCFlHKb9z
 /12Q==
X-Gm-Message-State: AOAM5304QgqmtbnXtwik2vh2FOxmiMkFNCUYwhQ0hKXTpBaBmBdo88xR
 EyKMCxaqqYVIPZUBlSgVrgvqtOqSKrBvK77U295sNiSdW2d6l9n+cUzQke17qehp99ELx3tYCqM
 6kM/hTTtFefZQMGgx4/Oij6xN1K9EFfgjFk+R3EVdnrmsloFNkVXJzPT3syLe8ji4
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr26046115wmc.137.1637592910027; 
 Mon, 22 Nov 2021 06:55:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycZHPAK6P31ytWpUqlKsrcbIi7kdixESWqE0Rpf4ryuXFnpVFHGOoF+aE8WOgvfBZ60bQuNA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr26046055wmc.137.1637592909615; 
 Mon, 22 Nov 2021 06:55:09 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e12sm11029657wrq.20.2021.11.22.06.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 06:55:09 -0800 (PST)
Message-ID: <7e776ddd-4f2e-99e4-e234-c5b6a3e2bd1c@redhat.com>
Date: Mon, 22 Nov 2021 15:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v3 0/2] hw/block/fdc: Fix CVE-2021-20196
To: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211118120635.4043197-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211118120635.4043197-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping for 6.2?

> Alexander Bulekov (1):
>   tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
> 
> Philippe Mathieu-Daudé (1):
>   hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
> 
>  hw/block/fdc.c         | 14 +++++++++++++-
>  tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 


