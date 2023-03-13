Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC236B82F7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:41:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboxj-0006hs-CJ; Mon, 13 Mar 2023 16:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pboxd-0006hM-Bb
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:40:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pboxb-0002FI-8h
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:40:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id h14so12518880wru.4
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678739997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8AWBbf22zSF/IFORwDUirLGCdhgIk8aaKpsxf0JEjCw=;
 b=HqDn4ERDUPt/7FoxSGTKR+TkKT5qYp6mbGo4o02Fj0AFk6QkwX5RYiUoidNvY1osZ4
 uskaAKqBCqh+W/Rn0rFi+4a84pZmMmQXNg0x4pxiuv+zSRXukZJi7FsP1f+YiUrSPur0
 Id90vSGSFsLzCy+QRzoaE7rju1rm+gki1eZG+9wXrqvOudw/KHPrz2k4PQkTEuHpBTfM
 NH+IPjwDJFWXMyfevbLBDy5mY7Tc6uTHqTVv1Fn/1cNU877QNBEG66XRS9lW+LtY9fuM
 f8jvBmHCxxrEbcb0hpFKUFQhNYbOkz3WFAtciz9p/QwYpRIhYgTglUMBCBJlmNdpb12C
 OLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678739997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AWBbf22zSF/IFORwDUirLGCdhgIk8aaKpsxf0JEjCw=;
 b=zIK3YpgiJ378VshM+ZQtRMuCx/7C3vVxzJsWA5dfu51atUDZCwXrafg0/iAsd7tQ2e
 GgEkang3nUC5NePASEph+8lqv1qYrl8qu/U6LhJR+zmU/XMrh55NlJgQ5RsUnpa2Wily
 bF7TCtDg01/4kLUOC92PeORU0xyasRaJdu6UTOf7OsKWcuTKZ+r36tXDnz9fqdLBCStv
 6eAPRE/BRQ9VSj2lC1u5uGXu7ZKI0A6RQ0fHOZRc6K+dl4q1abPjDuLmTSIuGVJSy7fK
 TLFlq3AuVjlIzsvwNOahX7svagXuHIuHlM3jvZQj+6w0cY7hF7EHfRhWMmBEdgGLWkqF
 E0fA==
X-Gm-Message-State: AO0yUKVd9mk4c5Z/0ncSGNTrOb3Y/bRmrVvJ2EzI34y2BfGjruwLduvK
 G25QJAPywei5HjYyfBv03vNe/w==
X-Google-Smtp-Source: AK7set/xNfCKSZXdLQ6OKXa/D0bbN2aakNdB51oVHoWXbLIKlC3HfBka7Gw67NdqNLIOjcHWb56yJg==
X-Received: by 2002:adf:e9c7:0:b0:2cf:9889:4979 with SMTP id
 l7-20020adfe9c7000000b002cf98894979mr2745262wrn.58.1678739997653; 
 Mon, 13 Mar 2023 13:39:57 -0700 (PDT)
Received: from [192.168.1.115] (36.red-88-29-189.dynamicip.rima-tde.net.
 [88.29.189.36]) by smtp.gmail.com with ESMTPSA id
 u9-20020adfeb49000000b002c703d59fa7sm386084wrn.12.2023.03.13.13.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 13:39:57 -0700 (PDT)
Message-ID: <1ba017de-ebc3-f48f-8790-8e332230a327@linaro.org>
Date: Mon, 13 Mar 2023 21:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
 <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
 <58b400ee-bc9a-d762-5b34-b564e8edd6d5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <58b400ee-bc9a-d762-5b34-b564e8edd6d5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/3/23 17:18, Thomas Huth wrote:

>   https://gitlab.com/thuth/qemu/-/jobs/3920337136#L307
> 
> ... but I think that was pre-existing and was caused by one of 
> Philippe's reworks, hopefully to be fixed soon ... Phillipe?

Jiaxun fixed this on little-endian hosts, but this is still
failing on big-endian ones so I was a bit reluctant until figuring
out the full fix but since this helps CI...

