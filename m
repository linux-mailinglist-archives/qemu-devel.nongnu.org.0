Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5924D46A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:47:38 +0200 (CEST)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95WD-0002Vu-55
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1k95E4-0001jB-3t
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:28:52 -0400
Received: from mail1.hostfission.com ([139.99.139.48]:44010)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1k95E2-00011g-4s
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:28:51 -0400
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id D7883405E8;
 Fri, 21 Aug 2020 21:28:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1598009324;
 bh=2pTHj+PCws8Rq30Y9j4PZL3rmeVtYANvCBCqBgWcCSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ROhp0wa9RRaKGx29IDXOa5gDd/4dbVk4+zOia4Kmk+RxOONK5H6WGRhFpoBY2ut/q
 y350JE35zmZrgjBWrdyAlu2p3xThQQ1es7bJtVdTkEjNAiFR/rpv0JWmdin8BKnoxb
 n8UFAxrIQTyqmXJIRLoFGj4paTXgty7BU08WAWjg=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id C5E5087E5A;
 Fri, 21 Aug 2020 21:28:44 +1000 (AEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 21 Aug 2020 21:28:44 +1000
From: Geoffrey McRae <geoff@hostfission.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 1/1] audio/jack: fix use after free segfault
In-Reply-To: <c84d95de-c71d-3272-6b41-95753634482a@redhat.com>
References: <20200819062940.52774-1-geoff@hostfission.com>
 <5029913.bOW1W81TKx@silver>
 <20200820053728.kv7pngxqzp32uky3@sirius.home.kraxel.org>
 <3140676.b1PlGooJ8z@silver>
 <c84d95de-c71d-3272-6b41-95753634482a@redhat.com>
Message-ID: <a165417b4d27c7fbce404e81f6c38cda@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.8
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 07:28:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> My suggestion is to work towards protecting the audio code with its own
> mutex(es) and ignore the existence of the BQL for subsystems that can 
> do
> so (audio is a prime candidate).  Also please add comments to
> audio_int.h about which functions are called from other threads than 
> the
> QEMU main thread.

Ok, so to get back on topic, what exactly is the best way forward to fix 
this issue in this patchset? Should I be managing a local mutex instead?

> 
> Thanks,
> 
> Paolo
> 
> [1] https://lamport.azurewebsites.net/pubs/teaching-concurrency.pdf

