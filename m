Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC56B7B77
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:05:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjiV-00084M-6F; Mon, 13 Mar 2023 11:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbjiS-000847-MS
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:04:00 -0400
Received: from madras.collabora.co.uk ([46.235.227.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbjiG-0006mB-FV
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:03:52 -0400
Received: from [192.168.2.203] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7922766020A4;
 Mon, 13 Mar 2023 15:03:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678719825;
 bh=bPsgS9MmWK5IwUAGPdghi8CmW+kUziRgj052hU7Sk60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IMJz66mrcic0O+NKn8yQqXUrONUtNP6QfZhdx1XMGqxQT8jTeeKdj2vV3q7Tg8Krj
 oDR0Yt91D3lGp7dtN/hn/i2NvAEwXKdfmdNt9I04Ysmk7DKSsLgKM5ndG6Cci3vWHH
 5LaPnsAOevI0eVnBPpt22b50HoZxWq4x0cCMaAIYMyjv9I8B8VB/3B0sadD9Upn2xB
 K+uG2keJ6tRRQDGrQoQlSSlR2AZfhotn7q+w3tY2hSTz5UZi9NsVttY2e0Hqgh43EC
 HBO5bu+Y1B15lQ9zxVqb9jXZ65Hem49CFLU61c/EkHkLb0EYiTmtfsn54vG9FJT7ki
 CxPw0i/I8fXlQ==
Message-ID: <bb5da587-ebbb-8d1f-c9e9-fc4f27c78a3a@collabora.com>
Date: Mon, 13 Mar 2023 18:03:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, gert.wollny@collabora.com,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
 <e912b13f-4306-88f2-1fd6-ca7481374cdf@collabora.com>
 <CAHDbmO3vjfS2goZFyhja9YvV1xMor20_73=LXhR-y+CBcgGmqQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAHDbmO3vjfS2goZFyhja9YvV1xMor20_73=LXhR-y+CBcgGmqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/13/23 17:51, Alex Bennée wrote:
> If gfxstream is the android pipe based transport I think it's a legacy from
> before the switch to pure VirtIO for the new Cuttlefish models.

Right, so older Android versions will only work using gfxstream. Good
point, thanks.

-- 
Best regards,
Dmitry


