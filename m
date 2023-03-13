Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A806B78FD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:29:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbiDQ-00006c-IU; Mon, 13 Mar 2023 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbiDO-00006Q-ER
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:27:50 -0400
Received: from madras.collabora.co.uk ([46.235.227.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbiDM-0006x7-NM
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:27:50 -0400
Received: from [192.168.2.203] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 57F5566003B0;
 Mon, 13 Mar 2023 13:27:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678714064;
 bh=P0Z5k+0VFwG/rF0RDhA5qLB3sfg5Xs8pfsUQDO5f340=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jR9S6jAfibcl/27K8AGwOPpahInyk+YIc1p6OKy7ZOdQpEk6lq4+oG8fseRdR4YUr
 +WCYNz91iON5wQ5S+fImZMhm0t2nR4YdkNVkdDw0Zg/GZO1z1ATjMqzHUJQgqfE/0p
 naG7bekWwSjaivNamhPj9wyhVrYfZhhE1k8rgh0l8oxh4CzDMpXRsA4VGYjhBQdTzg
 o8pBFUsZHQD1uNz472/4OFWkqM/GBbZcboXmrRzopmGI1z9cXYP7qi0TTJYlnGcbGA
 oVGgJChxnb/shcJW0uim8f1nf3fNESH5DfgTVfUuK7ei/n59QdE5yhTJqMjQFLb2PZ
 jwpxyaM7RFszg==
Message-ID: <e912b13f-4306-88f2-1fd6-ca7481374cdf@collabora.com>
Date: Mon, 13 Mar 2023 16:27:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 gert.wollny@collabora.com, qemu-devel@nongnu.org
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
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

On 3/13/23 15:58, Marc-André Lureau wrote:
...
>> 2) Additional context type: gfxstream [i]?
>>
>> One of the major motivations for adding context types in the
>> virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
>> Android Studio emulator (a variant of QEMU) [ii], among other places.
>> That would move the Android emulator closer to the goal of using
>> upstream QEMU for everything.
> 
> What is the advantage of using gfxstream over virgl? or zink+venus?
> 
> Only AOSP can run with virgl perhaps? I am not familiar with Android
> development.. I guess it doesn't make use of Mesa, and thus no virgl
> at all?

+1 I'm also very interested in getting an overview of gfxstream
advantages over virgl and why Android emulator can't move to use
virgl+venus (shouldn't it just work out-of-the-box already?). Thanks!

-- 
Best regards,
Dmitry


