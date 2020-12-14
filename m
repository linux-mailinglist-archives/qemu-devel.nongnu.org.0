Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7062D9B79
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:52:21 +0100 (CET)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koq96-0003G4-70
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1koq79-0001tL-40; Mon, 14 Dec 2020 10:50:20 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:41365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1koq72-0000H4-Vo; Mon, 14 Dec 2020 10:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=NEqchjnxA3GvJx6Q8bWZb3rYsCm3xflGVF5Kuf8aA8I=; 
 b=WF0cVq2vYUCzkGSp7mK0U7A6cQJz0Jlg5OXhhULoiDBz/oRFzYHLcZEyKReDTAgOLBn/pzw6IYNIetx5Rl2g9uliZHxO5NYQqRuq6KpN/Y4l5K/IaC0TvcXWDhuJeUyVf5BgylE1+6TUQzZkR2XK8VmAGoYZCSiu8vYoHzI6nvB5eyAu9jqZHVNwOOlcwiV4H8TEYtXL9pvkOZanqWhhR+hBnIhM9xrGO16uUtbHdwWgfvFT0ghEJW2i8DcJ4Ra2+4OVnK0ZvdVc/YNoYAQcdmucMKX7Lewg/Ivt+P1MtwZGVX3b9L42zPb+oIkxN9K+2oZ9t28vZSpf9iOjAT8f1g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1koq6f-0006h2-CM; Mon, 14 Dec 2020 16:49:49 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1koq6f-0003s9-30; Mon, 14 Dec 2020 16:49:49 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 04/36] block: bdrv_append(): return status
In-Reply-To: <20201127144522.29991-5-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 14 Dec 2020 16:49:49 +0100
Message-ID: <w51eejspeua.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 27 Nov 2020 03:44:50 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Return int status to avoid extra error propagation schemes.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

