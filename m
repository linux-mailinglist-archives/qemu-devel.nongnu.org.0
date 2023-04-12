Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2956DFC0C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 18:59:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmdoA-0004zq-KC; Wed, 12 Apr 2023 12:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pmdo8-0004zV-NS
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:58:56 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1pmdo6-0003iX-F3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:58:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5050491cb04so533339a12.0
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamhpc-com.20210112.gappssmtp.com; s=20210112; t=1681318732; x=1683910732;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=woWjgYVl+QCkvSCOgGex5jlX7Qoim5HG7711ISJajKY=;
 b=FYbegRlD1gB6QzZYoyLyAqHC+8RDmnyIbd67++jI9sCYGqXh6WPJOGjqRtJNfh9IGS
 iMt3kY54Q0KvlPda0mutfqPXBM3LwL/e1Pv6Zruz1eEcD2iTAh7NeMtpCPp+2WsrRpp0
 NqHlrucqqC16xYXV2uDIg92Psq6NMOkO4u2sNKvZIpSrc7juy6ZBpQPlhLkAIKgfMIao
 yC2lLWghKXlqCew4nJKZvEijXbMRQL86AMRcbJn9duA3OUmYRvmeU1o0k1lyjmCarbhF
 d1ZeMw1btf1jyBXHm1lB6Ot21fxp5UnyIs4bWVgzHBU9FW5CXslJ3Tzt4tWctO1v1tNZ
 ulXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681318732; x=1683910732;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=woWjgYVl+QCkvSCOgGex5jlX7Qoim5HG7711ISJajKY=;
 b=fsbXvf0WdVS5v+GMmd5cEHewEYq1pXiyu/uqW9xm6lgeTh3D+wuaYHBbfdF90mjoO/
 Mtg9NyYNSV8uXBMbCxbzTRbblLIHbRc7irsQ+Z/8HVcfIV4hCEPYVOIJfeCyr6pn+T3a
 xdVNvdMrj1eweUIAZfpbR5OVW+1JAk6ceIgOdBWn8Y5+jGIHUCRlk+xzB2c5sh9DoxoZ
 rj+IfpF+R+1rTSbPvT8sUnOI4wuPGrDp9ORjwJiBqjRe2RbbAnQJUAV9xbwJhFMl22Y4
 PdoBXNbRaWULk6jxe4DBF32LvYO5n5fYVm2EWEQyCsvSjNElBXrL24pwjmeM4UCKrDHx
 c65Q==
X-Gm-Message-State: AAQBX9caVWnkd0KQCc0Ab8DVhRfoAA6OHYbxpcNP/yXQHTpjebqWH3pV
 xxY5FMvWzEfn4pX73VGzN8FoEQ==
X-Google-Smtp-Source: AKy350Yc1iARkkGMDHZaWUHrl+GooRYj10h28zanC4n7bAZLaHDndZFy1fSxMabHjyXb8Gu1t80IeA==
X-Received: by 2002:aa7:cd6e:0:b0:501:c839:cf91 with SMTP id
 ca14-20020aa7cd6e000000b00501c839cf91mr2697494edb.6.1681318731844; 
 Wed, 12 Apr 2023 09:58:51 -0700 (PDT)
Received: from [192.168.178.121] (dhcp-077-251-030-138.chello.nl.
 [77.251.30.138]) by smtp.gmail.com with ESMTPSA id
 p13-20020a50cd8d000000b005048c04751fsm4692620edi.33.2023.04.12.09.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 09:58:51 -0700 (PDT)
Message-ID: <74c117e4-5a2a-2759-1dfe-5dc63b53eb75@streamhpc.com>
Date: Wed, 12 Apr 2023 18:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Robin Voetter <robin@streamhpc.com>
Subject: Re: PCIe atomics in pcie-root-port
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org
References: <b30370f5-0b52-d2de-6e47-8f288a219a43@streamhpc.com>
 <20230406124009.4a5e7307.alex.williamson@redhat.com>
Content-Language: en-US
In-Reply-To: <20230406124009.4a5e7307.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=robin@streamhpc.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 4/6/23 20:40, Alex Williamson wrote:

> I think the typical approach for QEMU would be expose options in the
> downstream ports that would then need to be enabled by the user or
> management tool, but that's where the complication begins.  At some
> point we would want management tools to "do the right thing"
> themselves.  Is support for PCIe atomics pervasive enough to default to
> enabling support?

Apparently this is supported from Haswell or newer on Intel, and 
Ryzen/Threadripper/Epyc on AMD hardware. I don't have any official data 
for this, though.

> How do we handle hotplugged endpoints where the
> interconnects do not expose atomics support, or perhaps when they
> expose support that doesn't exist?  At some point in the future when we
> have migration of devices with atomics, do we need to test all endpoint
> to endpoint paths for equivalent atomic support on the migration target?
> Are there capabilities on the endpoint that we can virtualize to
> disable use of atomics if the host and guest topologies are out of sync?
It seems automatic detection is a lot of added complication for this 
feature. For the time being, I think its best to allow enabling PCIe 
atomics using a device property for the pcie-root-port that is disabled 
by default. If general hardware support is good enough, it can be 
enabled by default. Compatibility with older QEMU versions can then be 
added using a newer hw compat in hw/core/machine.c.

Kind regards,

Robin

