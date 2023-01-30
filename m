Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23D680526
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM38-0002fr-NB; Sun, 29 Jan 2023 23:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM36-0002fZ-IW
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM34-0005yc-83
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnZsA1EFFDQZ4GA0eiKICktlxR6/RkD5vBWiSbFtjqc=;
 b=UgyFi1Ks/Zmi/7A9FbWuYJr6zZQXTRWg3AYh1vTRzj306OyMD7hdd8bbAFctkXvbH7Bokl
 RHTnA8CYh6R4A3lmn+TIz3wdhhfgCN51OiLGFlkI7XOSyEPK0bLoMaWPbQumLWunhu/ogq
 RP33gdbS4z5K0lNPrGdXPFhzbSQncl4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-XadHPsfOM0iTgjzV7sSx_A-1; Sun, 29 Jan 2023 23:45:40 -0500
X-MC-Unique: XadHPsfOM0iTgjzV7sSx_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1393699wmb.2
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnZsA1EFFDQZ4GA0eiKICktlxR6/RkD5vBWiSbFtjqc=;
 b=ysR7x9ej+gV8gPv7oRyBMj3aA3hhOz04W/rCFv1gSIO41jnu2uHM/p7XHIQZlSeFmY
 5ROQRLvvbvJaBSGGCpOcdy3F61+4HT/U0fEbqxkiRv86acZaIC3QqxtdgN3MstGo22wc
 JJhX/xBckRHcXg4Vcp5sh97Yvr5Kw3pfmBMZOpY3rELu+HnuNEIE0ZIUsqiamTba3AxB
 SCGjGYusSFpizhPkUVn/UpQR4/5CbDySVwoLQuRUIWCN0ks4oHmmeb58czUd8YKL6uqh
 oKgNz4glqwAOXdHfeBnNc+5BG9WVCxkhKuUcZJU2EiTfS6Z4neDD9dmVXX1xaa178Fkx
 FkKQ==
X-Gm-Message-State: AO0yUKX6gh2H/Bkzlm9CsKLWLaNEeBi2e5MOPM+m4Yz4rrWmUCjOOENN
 t4B4yRzSOnI9ybyh+FcG3sOFquN+2cv+K5OdLH2pPvuO4uIJOBUQBCSx6x31qsGg65tLFpo5o/9
 mP7Z2Aj4h05xinaE=
X-Received: by 2002:a05:600c:4f93:b0:3dc:2b62:ee9f with SMTP id
 n19-20020a05600c4f9300b003dc2b62ee9fmr14597259wmq.3.1675053939082; 
 Sun, 29 Jan 2023 20:45:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8E4fe3CdOFgFlIjibzLsgfF8d4KaRQegFkSzCTAuKCbiuTiHkN14w9P+or31Ey1HHmhA0TMg==
X-Received: by 2002:a05:600c:4f93:b0:3dc:2b62:ee9f with SMTP id
 n19-20020a05600c4f9300b003dc2b62ee9fmr14597253wmq.3.1675053938918; 
 Sun, 29 Jan 2023 20:45:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b003dc522dd25esm4047636wmn.30.2023.01.29.20.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:45:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
In-Reply-To: <20230120082341.59913-8-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:37
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-8-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:45:37 +0100
Message-ID: <875ycomxzi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 1/4: Convert memory & machine options.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Much nicer.

Reviewed-by: Juan Quintela <quintela@redhat.com>


