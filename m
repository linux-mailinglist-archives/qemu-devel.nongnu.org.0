Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F1C5BEC8A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:09:51 +0200 (CEST)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahgr-0003xd-RO
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1oadbT-0000Nm-9G; Tue, 20 Sep 2022 09:47:59 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:45312
 helo=fanzine2.igalia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1oadbQ-00074b-PD; Tue, 20 Sep 2022 09:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zlNk8lkhcRTuX4rM3DLuKUUmF2qx5vs7ySqTzOLzqoE=; b=WPNct+E+JMAQ9ejSFShNKUSkMR
 Gk4JdLEYOh7bBlZqOtgOd4BIlu7jenWMBqNJuC4f67IxaumiytdOmkYc+sXFeSi8uR67OlqcdW2qY
 fR3Hapq374BdKEi1j0gDL49318eyTz6PlYLOHIInk+AT5zgEMh/hQ3rKvYOmrdggGsBlnogrHccRF
 Q09HZQ1XZhKGnAXbsRo+1MNi/g9ySePQ5IaNFdkZCD9FEDmsuhGfuN2dBeczYj2w7q+p2xCXSvFI9
 SnvTE4w2pLdWrKeWh5x59aWIkwbRfJqiDIp9fGfKi4C7IUTqA7m2+9pHD1eJCjxZPMHRGtFCbha0p
 7DqDcjLw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oad9O-00DZpZ-Nz; Tue, 20 Sep 2022 15:18:58 +0200
Received: from gate.service.igalia.com ([192.168.21.52])
 by mail.igalia.com with esmtp (Exim)
 id 1oad9L-00F35w-7S; Tue, 20 Sep 2022 15:18:58 +0200
Received: from berto by gate.service.igalia.com with local (Exim 4.94.2)
 (envelope-from <berto@igalia.com>)
 id 1oad9K-000rAJ-Kr; Tue, 20 Sep 2022 13:18:54 +0000
From: Alberto Garcia <berto@igalia.com>
To: wangliangzz@126.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 wangliangzz@126.com
Cc: pbonzini@redhat.com, stefanha@redhat.com, silbe@linux.vnet.ibm.com, Wang
 Liang <wangliangzz@inspur.com>
Subject: Re: [PATCH] ratelimit: restrict the delay time to a non-negative value
In-Reply-To: <20220920123350.205391-1-wangliangzz@126.com>
References: <20220920123350.205391-1-wangliangzz@126.com>
Date: Tue, 20 Sep 2022 13:18:54 +0000
Message-ID: <w51h712i3pd.fsf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine2.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 20 Sep 2022 08:33:50 PM +08, wangliangzz@126.com wrote:
> From: Wang Liang <wangliangzz@inspur.com>
>
> The delay time should never be a negative value.
>
> -    return limit->slice_end_time - now;
> +    return MAX(limit->slice_end_time - now, 0);

How can this be negative? slice_end_time is guaranteed to be larger than
now:

    if (limit->slice_end_time < now) {
        /* Previous, possibly extended, time slice finished; reset the
         * accounting. */
        limit->slice_start_time = now;
        limit->slice_end_time = now + limit->slice_ns;
        limit->dispatched = 0;
    }

Berto

