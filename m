Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5D5EB028
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:38:35 +0200 (CEST)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocszy-0003Vp-6k
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1ocsuR-0003v2-BF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 14:32:51 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1ocsuO-00023A-BO
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 14:32:50 -0400
Received: from [192.168.2.145] (unknown [109.252.124.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B47D9660036F;
 Mon, 26 Sep 2022 19:32:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664217164;
 bh=COIlK3XoxMzL90X5+Jk69G+Q1JKus93OW9r9uLntouo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RIQY4kIifcE97352IFCJM5zV1Cr6HsyBKtjPJF42YyZdPeBONu+QN2LzopjcydRsA
 TWLbWs0Jw7pDToRP8haWZlE4b80IA82Ph5bUYhMfCQn/fq0EPLXckqFpnM89aRk6j5
 mpEtCj9z8xhUXlPNzhY33jeZdizeo4+MrqECffYq3xgCoSlBKbBHYxHZFW12UqWIh5
 GeOyQNQQZgcFH1pQXKkLOAxhkWxgowOmdsJaNBhdHd7fstEriP2lXWsQMaPifrXG09
 F/t1A7rOyjrtWqq86eZVvjhZES04GYV3dAOCYq86wiX6bIZ2HOz9GuBCC962eIP3Py
 GrakcISqWewsg==
Message-ID: <6fe0d770-1a95-3d8f-6a75-a596f26aad54@collabora.com>
Date: Mon, 26 Sep 2022 21:32:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
To: Gerd Hoffmann <kraxel@redhat.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-5-antonio.caggiano@collabora.com>
 <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 15:32, Gerd Hoffmann wrote:
> On Tue, Sep 13, 2022 at 12:50:22PM +0200, Antonio Caggiano wrote:
>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Host blobs don't need udmabuf, it's only needed by guest blobs. The host
>> blobs are utilized by the Mesa virgl driver when persistent memory mapping
>> is needed by a GL buffer, otherwise virgl driver doesn't use blobs.
>> Persistent mapping support bumps GL version from 4.3 to 4.5 in guest.
>> Relax the udmabuf requirement.
> 
> What about blob=on,virgl=off?
> 
> In that case qemu manages the resources and continued to require
> udmabuf.

The udmabuf is used only by the blob resource-creation command in Qemu.
I couldn't find when we could hit that udmabuf code path in Qemu because
BLOB_MEM_GUEST resource type is used only by crosvm+Venus when crosvm
uses a dedicated render-server for virglrenderer.

Summarizing:

  - only BLOB_MEM_GUEST resources require udmabuf
  - /dev/udmabuf isn't accessible by normal user
  - udmabuf driver isn't shipped by all of the popular Linux distros,
for example Debian doesn't ship it

Because of all of the above, I don't think it makes sense to
hard-require udmabuf at the start of Qemu. It's much better to fail
resource creation dynamically.

-- 
Best regards,
Dmitry


