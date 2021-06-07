Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281239DE7A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:17:23 +0200 (CEST)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqG4A-0006AW-4w
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqG2q-0004uY-RG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:16:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqG2p-0006J8-Ah
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:16:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id r9so1111151wrz.10
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25ZQXTGLNEfgWZ8Lr6YTHnWcLRUKUa3Q7cKBG9PQ0og=;
 b=r94EOIjAChMDAJ35ALRybyJqoCjlPR3tHNMcVbrxPeDwZr9xzNRl28gSwKh/9C7fxs
 CyAqOXNt2naMy/WTvpKqy1QCh8AbtKeCqUOVqS56KTjhP1XTBX9R+REg3nqTrvNYVPTK
 bG4ahiC72PiWvdigvdMTesRaBzQ+hWAfrENLKTa2tj+Y80m0izyCvf1IT0i51HwKNQhG
 EqCqFWl+XXJza1KhgcDwCgxxIsOH0BVXxe9jBLd+Zu/gHBqReQesTL2Vvc6S4RlXNtrv
 os0v1Egdnhv0ES8rqAXp3BMdqHrq+pNgdQwomsnmBbhxqyEG31YNiglpHjHqQlowrjAO
 pxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25ZQXTGLNEfgWZ8Lr6YTHnWcLRUKUa3Q7cKBG9PQ0og=;
 b=DoT7Byrf7KlX7ekBeIDIKKvzReKGhMJJo5GdzeMSUGD0TkZb/DEu5f93yVuc6MhyCj
 /6ukjtsNZVi/FGkiBC9z+B4+xGSpq86z3xYBkU/dR3P/1HOTWQ1KFDX3TWTyMW6+aEOB
 A+zq6PtGYmnrE8WS5FFvvsPdRd+DWDuUi8023bcY3wUpy/rnfax8w8JIcCfj2Pd7gEfd
 1oOiyZ3IvWsoQG4HzvxaoXr/RnxROXQ6NREFw3OM2mJPPhG21xxEMuw4jbMGJsJNpDUh
 2+lo4fySTBcX4n9ONs/w3DNRcgG06Zq/3RJ9Bi08N4yMcX9MD3P9cz7aQpEgSYuHnVut
 EuZA==
X-Gm-Message-State: AOAM533sITeaH5e90ALDXF6yOvFQIhvRDW9XY0WcquwE6XlXcXEbskLo
 ogR2u9o04GypXyFIdksCFTHUeU4mucmdXQ==
X-Google-Smtp-Source: ABdhPJw7e+hem9n/v5bbFFiKqVyZps+uBT6xmssBsp3c4WmCYYFV/ZOR7tVsCis4EBz+K+hQq1OqEA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr17339594wrn.337.1623075358031; 
 Mon, 07 Jun 2021 07:15:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id l31sm3034818wms.31.2021.06.07.07.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:15:57 -0700 (PDT)
Subject: Re: [PATCH] netdev: add more commands to preconfig mode
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20210511153955.506577-1-pbonzini@redhat.com>
Message-ID: <e8631e93-920b-00f2-a5f5-6d4ce854474f@redhat.com>
Date: Mon, 7 Jun 2021 16:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511153955.506577-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:39, Paolo Bonzini wrote:
> Creating and destroying network backend does not require a fully
> constructed machine.  Allow the related monitor commands to run before
> machine initialization has concluded.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hmp-commands.hx | 2 ++
>   qapi/net.json   | 6 ++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 901a50ebd1..1768bc5df0 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1276,6 +1276,7 @@ ERST
>           .help       = "add host network device",
>           .cmd        = hmp_netdev_add,
>           .command_completion = netdev_add_completion,
> +        .flags      = "p",
>       },
>   
>   SRST
> @@ -1290,6 +1291,7 @@ ERST
>           .help       = "remove host network device",
>           .cmd        = hmp_netdev_del,
>           .command_completion = netdev_del_completion,
> +        .flags      = "p",
>       },
>   
>   SRST
> diff --git a/qapi/net.json b/qapi/net.json
> index af3f5b0fda..7fab2e7cd8 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -55,7 +55,8 @@
>   # <- { "return": {} }
>   #
>   ##
> -{ 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true }
> +{ 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true,
> +  'allow-preconfig': true }
>   
>   ##
>   # @netdev_del:
> @@ -75,7 +76,8 @@
>   # <- { "return": {} }
>   #
>   ##
> -{ 'command': 'netdev_del', 'data': {'id': 'str'} }
> +{ 'command': 'netdev_del', 'data': {'id': 'str'},
> +  'allow-preconfig': true }
>   
>   ##
>   # @NetLegacyNicOptions:
> 

Ping.

