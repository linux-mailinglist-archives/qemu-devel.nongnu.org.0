Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675601D1190
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:39:26 +0200 (CEST)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpjR-0003gH-GY
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jYpiW-0002th-19; Wed, 13 May 2020 07:38:28 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:34703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jYpiU-0001uj-IN; Wed, 13 May 2020 07:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=V6xCV5TRMjn+7C/vRKIH5P2PpifFljHR1X+7DWhHBRI=; 
 b=P+gDpVbDPYZJ4i4vbDivgmNYOMBFHQ238OkybkDeLK3kzec77T/RbiFsCfnpEu6vHh66El8uI1skbv69KIId6I+x+j5k35qWGz5JIvDtNN+dmYyw9/TsmBhrUSz8Lzn1FTfc1ELeb1d4ASUiZqVVkR4+pRxGTC3eJOGuef1MwJqe9oFF0VoEDt1hGNe0o+9S6BW3GBuQRgZ6I9glqYtJJF44zf1n54tJP5Jlu3nap0QCh2sVXnjfVNK+xPdE9ALIhA8ewOKA4OrxHHo9A4g3sJdLCUAxyfy5GuGzQRjuuGdG4qwvrty5bWJo+EoYYvuwpUVzFiOd+roGRLOgN6jqJw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jYpi7-00056t-Sa; Wed, 13 May 2020 13:38:03 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jYpi7-0003DR-JH; Wed, 13 May 2020 13:38:03 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] iotests/030: Reduce run time by unthrottling job earlier
In-Reply-To: <20200513100025.33543-1-kwolf@redhat.com>
References: <20200513100025.33543-1-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 13 May 2020 13:38:03 +0200
Message-ID: <w51k11gt690.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 07:38:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 13 May 2020 12:00:25 PM CEST, Kevin Wolf wrote:
> test_overlapping_3() throttles its active commit job so it can be sure
> the job is still busy when it checks that you can't start a conflicting
> streaming job.
>
> However, it only sets the commit job back to full speed when it is
> ready, which takes a few seconds while it's throttled. We can already
> reset the limit after having checked that block-stream returns an error
> and save these seconds.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

