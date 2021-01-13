Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A92F4C4B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:38:32 +0100 (CET)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgM3-0006Ez-Q3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgJW-0005Ug-T7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:35:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgJV-0007Nj-Bb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610544951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHZhw38SmLnyuvvOoj/Z4pLPH4tk1EDUrf8Y73Ntvwk=;
 b=Hp1HfwxIRTZmbje0+FH2Oni8jlmgtEzV6PKolFVNs4dNVL53UqdHVDhzRaj16NCpSX7MmP
 QR2jwjpyer11nXpZzavkSa9Z72bXCAPk1561ySksi4aKMJ5Fi1E3UME0wG/qHB8tgtCxmH
 uZ/pImuZMxlDKjUGQb80i42IP0w7aZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-TrCWLLXJMXyD43kpB1vCGw-1; Wed, 13 Jan 2021 08:35:49 -0500
X-MC-Unique: TrCWLLXJMXyD43kpB1vCGw-1
Received: by mail-wr1-f71.google.com with SMTP id o12so961469wrq.13
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHZhw38SmLnyuvvOoj/Z4pLPH4tk1EDUrf8Y73Ntvwk=;
 b=Utgj6GGM/fIs6Ok30avgYw3O/+CdNtQl1nQZqhZwLdPhtmqEYy7RKAzjkvP7Q4UZ6v
 xRKT1Y70zBvWrqrtquHxPjrmM1r9PwkBBQZIAMNMrpIrPY+rBrUfInDfHXMsV7e0qk8y
 4xBv09HDOKEtKSqVsNfb9tlRagjj+cbAQibXMT7ZqLlqfErcO87eASLKy7K6iE5RhT1z
 1u0JT50h6H0OXs2kxc6jUGaXqU2u2oLAKmlDDo9LXCpekS4dePed3L9EvQz4lajIREDm
 5Y+/SVfRHVd6jNSNXWGZ4xUZNUW9NTsEtfeN6z6us8Xrd0TEIAYkjj/x0MBGk94MoNog
 iIuw==
X-Gm-Message-State: AOAM532jc5KBEFw6r0Dv2FFqTctsRFBjGRAshPDqq+1HPXBFZpGcgowT
 MLorF8kb8/AFe6jbxD+KJoueakO97lUn0dGv091ZzKH73UlmCFiHaGdcxoswr18+1OBckbw+H4b
 oLv7nuuqmV+95OB0=
X-Received: by 2002:a7b:c208:: with SMTP id x8mr2247909wmi.179.1610544948216; 
 Wed, 13 Jan 2021 05:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYnJZyqiN+0xLKfGdoCxJmvJ6ScJo4ic6QKfJfvxfGYGHkdV167sG5Y2y6Mor9nsOg152Jrw==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr2247886wmi.179.1610544948000; 
 Wed, 13 Jan 2021 05:35:48 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id y2sm2972736wma.6.2021.01.13.05.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:35:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 02/11] hw/ssi: imx_spi: Remove pointless variable
 initialization
In-Reply-To: <20210112183529.2011863-3-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:20
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-3-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:35:46 +0100
Message-ID: <87r1mpgdsd.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> 'burst_length' is cleared in imx_spi_reset(), which is called
> after imx_spi_realize(). Remove the initialization to simplify.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


