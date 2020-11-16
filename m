Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F12B4399
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:24:45 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedYq-0001Kz-NJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kedXk-0000pk-Sv; Mon, 16 Nov 2020 07:23:36 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kedXN-0002j6-GA; Mon, 16 Nov 2020 07:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=WURHvFzqcLhhhLdqKTflSMKINzc+WtKkb/xb987DRAs=; 
 b=iB9igt2LP4GH2FmeA+Hz1qwymrwvqNXhFmawsieBx0ws0Qoq/h3xHfJeakYAl72hndVwW5ErXkLn+74VqpjE8X5iwkQoHVPCXN5sM195ZLNpYCQtFD37Rhw6p1sLlcKKYgOc0MjsC27PRVvBl1rEC6ggeQEoCV6zy5jnJMvZ7ohSEie5mvgP701kkGoADp4rbKVn1tFictZNoSkAp9ylQBJCt6R7w/L2JJIsbUcHELewMZv7gHZ5MR7FpHkn0RyCyYKnLMUydJV4/iFixCWsJEqZtgbye3pixS4lYxaC1veMisvYdNajuwGr1lJsE9lE9WrtRJYXB7ZYuTCgBZu0VA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kedX1-0002a4-8U; Mon, 16 Nov 2020 13:22:51 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kedX0-00081H-VJ; Mon, 16 Nov 2020 13:22:50 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/3] quorum: Require WRITE perm with rewrite-corrupted
In-Reply-To: <20201113211718.261671-2-mreitz@redhat.com>
References: <20201113211718.261671-1-mreitz@redhat.com>
 <20201113211718.261671-2-mreitz@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 16 Nov 2020 13:22:50 +0100
Message-ID: <w51d00dpk2t.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 07:22:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 13 Nov 2020 10:17:16 PM CET, Max Reitz wrote:
> Using rewrite-corrupted means quorum may issue writes to its children
> just from receiving read requests from its parents.  Thus, it must take
> the WRITE permission when rewrite-corrupted is used.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

