Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D396E2A82C6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 16:56:34 +0100 (CET)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kahcn-0004d3-Un
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 10:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kahbQ-0003lv-72; Thu, 05 Nov 2020 10:55:08 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:46263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kahbN-000171-NI; Thu, 05 Nov 2020 10:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=C61s4P4wwADM3ce8CLQ94ohUNcYG6vfb2R3iJoYot9g=; 
 b=e8sCNx+GhCBS5VtxlWKeTVf/e2ni9mXhDHFPAPYv9+XmswYsM0Pwua/3oKbTi/7xWZ0qfPxL06v5PKhYIAE//mKqqCagirnN3WY64hj21DpMAuXbQWjgg9Ez68IZnli7bMuzS8WNHAnLkhw4JFr7cmoaktTINXKbH1R/+NLIuEU0he+yEI+sfvXPxSsSQvXTa4AQGGie533QYKlZ81eB4zlPApxKJO92YTYhfHh9spj6xyI1IgY4aYcJaqCTISQynGt3T8zlz9J2byqjBUQz5jXeUOgox8yxTPaHJ6D3NixoCPwAKGHbtjDoMkFHU+nna8wMMj+NTVNmEwRyvIJeMw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kahbG-0002z5-8f; Thu, 05 Nov 2020 16:54:58 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kahbF-000553-VX; Thu, 05 Nov 2020 16:54:57 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4] block: Fix integer promotion error in bdrv_getlength()
In-Reply-To: <20201105155122.60943-1-eblake@redhat.com>
References: <20201105155122.60943-1-eblake@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 05 Nov 2020 16:54:57 +0100
Message-ID: <w511rh7iysu.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 10:03:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, chengchiwen@h3c.com, tu.guoyi@h3c.com,
 "open list:Block layer core" <qemu-block@nongnu.org>, armbru@redhat.com,
 mreitz@redhat.com, wang.yongD@h3c.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 05 Nov 2020 04:51:22 PM CET, Eric Blake wrote:
> Back in 2015, we attempted to fix error reporting for images that
> claimed to have more than INT64_MAX/512 sectors, but due to the type
> promotions caused by BDRV_SECTOR_SIZE being unsigned, this
> inadvertently forces all negative ret values to be slammed into -EFBIG
> rather than the original error.  While we're at it, we can avoid the
> confusing ?: by spelling the logic more directly.
>
> Fixes: 4a9c9ea0d3
> Reported-by: Guoyi Tu <tu.guoyi@h3c.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

