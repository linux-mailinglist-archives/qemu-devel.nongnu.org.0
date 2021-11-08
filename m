Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F09447B81
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:02:55 +0100 (CET)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzcE-0001VX-Eh
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzZb-0008OL-DH
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:00:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzZY-00013T-Qr
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCW6AWbCXH+LgW0NKk+DP7GXYfdUJGReKQQPz0IvtQs=;
 b=aKbpTgAYc8yBJ4kt2lljF2AxOFyWj9JUBG5iAUGOgDi+7++yjHQ6blAFFRowpzIc0OO3JM
 kuW8sxxm9LjsP8qCxqiX5spT0wcDWrLpM21zevvD8jPlB5E8JBiCcFre/cy5sXIqb69+Q+
 1p86MBJXWeS+1gwHmlOpd28/4Rfn2sw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-yW28JFykPJqrdprFlrNGQQ-1; Mon, 08 Nov 2021 03:00:05 -0500
X-MC-Unique: yW28JFykPJqrdprFlrNGQQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so3780928wrc.22
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KCW6AWbCXH+LgW0NKk+DP7GXYfdUJGReKQQPz0IvtQs=;
 b=ZkPd7OWG91SH5QHFKfVj9Mf3Vum4sk90S8jWvUq2Jr+NISpWN3KpSMHwSvsdG+TDQo
 d2OVwkLsaM/ghdAn10XBVI/xfYgXn8slBb244dGbEyEmXBfzhhOTniyrv5Z2Cc1k8R2k
 6ZnxRcXye28AMvScBxE5yTfvXPq5Dq9TdZcdXdO2uojOQv5hvoJsU5Wp114i+LA1NRw6
 Mk4VdCLFpeNVP+aNE0lRCAC+Q88DTVR7GnZL3t7wVi33Y4zDu7rbj/pLdvkCxkZMO89X
 fSG3U1Gv/ZmfhTuradgqDrgI2tJDQtlIJmfWe5qO26rKoqBZVlsLSKR793/F6S/ogCVq
 3WLg==
X-Gm-Message-State: AOAM5337ibq1BC6aMi68CyeHG0F4XvPjrrjIXZCZ5bw1ktrF/3Mrl0zY
 x8PAC97edyBokHr17uU3kkPDssjIL45rSd7p2fLIAmyZLHL41p9nT1QZQp6KvNVA19wn0YJwogd
 DjEFvhAeQjPl1m8aq4dM1oOStxnBJVw5WK79TukSXaMXmxmEq7gI+LfX9EvlqRAWy
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr39790427wms.100.1636358403739; 
 Mon, 08 Nov 2021 00:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBfQrnqDw1LHtBb7dGp4YfDOFu5EjM04aiQyO6myib5IAHWKhYXaFW4f622uPUu7fBj4or8w==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr39790392wms.100.1636358403499; 
 Mon, 08 Nov 2021 00:00:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h16sm17735497wrm.27.2021.11.08.00.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 00:00:03 -0800 (PST)
Message-ID: <0113ec1b-26df-079b-fe5a-48f8de4837cc@redhat.com>
Date: Mon, 8 Nov 2021 09:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 0/6] tests/acceptance: Add bFLT loader linux-user test
To: qemu-devel@nongnu.org
References: <20211105143416.148332-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 15:34, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>   tests/acceptance: Extract QemuBaseTest from Test
>   tests/acceptance: Make pick_default_qemu_bin() more generic
>   tests/acceptance: Introduce QemuUserTest base class
>   tests/acceptance: Share useful helpers from virtiofs_submounts test
>   tests/acceptance: Add bFLT loader linux-user test
>   tests/acceptance: Rename avocado_qemu.Test -> QemuSystemTest

Thanks, series queued (changing acceptance -> avocado in subjects).


