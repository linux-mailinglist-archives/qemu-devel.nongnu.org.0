Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AF517112
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 15:58:26 +0200 (CEST)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlWZF-0006nw-J5
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 09:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <breno.debian@gmail.com>)
 id 1nlQxM-0003xU-8G
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:58:57 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <breno.debian@gmail.com>)
 id 1nlQxK-0000eU-Lx
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:58:55 -0400
Received: by mail-wr1-f53.google.com with SMTP id u3so18568991wrg.3
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 00:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HYfx0t6KY3VU7wUD5WQxOdqLzM2RDzPzPZZdaTls6Rw=;
 b=sOrVyUWeI9RTJ+mE6Gjq1fwulxi2EsjCIBaHfgYtRpb5frKquqaeAGqssmXY8nEm0c
 rEhOliqjthjOa8QNfo3dKKBwyBWn6xQpl7atQINdikt7TGnyxtjx4qq48fDKpJ627SnK
 QLvq9uZZnvxuBY7BtxMYkJInsUYjGxrBiHUzaMxt2stDx5y6T9kGKzgzMM+0ajY963tO
 l4msO5RoWe027O6SQNLWNFKzUBef16PptD1QhwmVkHvidkEPeWrwzWo5PAy1xBeU0ZBQ
 BDT+8Bki5pSCXgl5S/rfzP+PtWpgaywBBOJQfX8cxuBZBgvsG+Xu+SWFXSHBUdMLpiGe
 qeOg==
X-Gm-Message-State: AOAM5304P7CBNhjq9LO8nOwfgg8/fN0CopPE5VfXb+qUGlyVOEh99DUs
 Q/kuV87/jGzyNVyX+tIbGjI=
X-Google-Smtp-Source: ABdhPJxM0x/Sd5d+AulOExz64oDW6N6OOPyBdcD3sr9BfRQADtLNAo+llghDzHrLsft3UdXpaQ4F+g==
X-Received: by 2002:adf:f244:0:b0:20a:c3ab:d009 with SMTP id
 b4-20020adff244000000b0020ac3abd009mr8566225wrp.10.1651478332576; 
 Mon, 02 May 2022 00:58:52 -0700 (PDT)
Received: from [192.168.99.234] ([62.60.60.32])
 by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b0039429bfebebsm10156479wms.3.2022.05.02.00.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 00:58:52 -0700 (PDT)
Message-ID: <4a3bcaf8-4ea9-b0eb-a3b3-d76d040aa1fb@debian.org>
Date: Mon, 2 May 2022 08:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] net/slirp: Use newer slirp_*_hostxfwd API
Content-Language: en-US
To: Nicholas Ngai <nicholas@ngai.me>, qemu-devel@nongnu.org
References: <20210925214820.18078-1-nicholas@ngai.me>
From: Breno Leitao <leitao@debian.org>
In-Reply-To: <20210925214820.18078-1-nicholas@ngai.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.221.53;
 envelope-from=breno.debian@gmail.com; helo=mail-wr1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 02 May 2022 09:52:33 -0400
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 22:48, Nicholas Ngai wrote:
> libslirp provides a newer slirp_*_hostxfwd API meant for
> address-agnostic forwarding instead of the is_udp parameter which is
> limited to just TCP/UDP.
> 
> Signed-off-by: Nicholas Ngai <nicholas@ngai.me>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Tested-by: Breno Leitao <leitao@debian.org>


