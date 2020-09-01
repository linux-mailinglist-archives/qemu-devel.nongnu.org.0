Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8F258CB8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:26:42 +0200 (CEST)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3Uv-0005lw-MR
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kD3TQ-00052O-76; Tue, 01 Sep 2020 06:25:08 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kD3TN-0007tZ-Ec; Tue, 01 Sep 2020 06:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=BaTKyeL9rxClpciauvyhKsmrggrel0olBPgRGUAPl4Y=; 
 b=mt2ajNJlu7azfmuRDf6MOHjZdPVxldxrsrOdpqZqQoxL8SdJSU0YdsCTJc2V8sPUdPQ9vlLq87pDTM4GC0CInZeEf43PfrzZM0LngTvpQrIPzVkwqlUogFQP71GhPagy3STmtaqsZCku4QjA90mp8iRcX6lBE7EcmN7IsAFKiN9GweoFwxC+PDXTlLapKwXPubbrUQY2qO++pXNZhqrgXLN11EBZ5+cnZtFXhNPqfoi3X+hQWXCo2uZLf6Cio+s9UwF+Jb34n07hx9gd6qNvlLQe8B0lctkjtjm3QdQTDyLZyzljbF3tbixh02srRm+t1wAEyU6uuIVMqZfIjNu5uA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kD3Sw-00006E-BA; Tue, 01 Sep 2020 12:24:38 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kD3Sw-0002Ra-1K; Tue, 01 Sep 2020 12:24:38 +0200
From: Alberto Garcia <berto@igalia.com>
To: Nir Soffer <nirsof@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] block: file-posix: Extract preallocate helpers
In-Reply-To: <20200831140127.657134-2-nsoffer@redhat.com>
References: <20200831140127.657134-1-nsoffer@redhat.com>
 <20200831140127.657134-2-nsoffer@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 01 Sep 2020 12:24:38 +0200
Message-ID: <w51d035okux.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 06:24:39
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 31 Aug 2020 04:01:26 PM CEST, Nir Soffer wrote:
> handle_aiocb_truncate() was too big and complex, implementing 3
> different preallocation modes. In a future patch I want to introduce a
> fallback from "falloc" to "full"; it will be too messy and error prone
> with the current code.
>
> Extract a helper for each of the preallocation modes (falloc, full, off)
> and leave only the common preparation and cleanup code in
> handle_aiocb_truncate().
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

