Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1AE2C3058
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 20:01:47 +0100 (CET)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khdZR-0006cL-Vy
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 14:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khdXX-0005yV-Ll; Tue, 24 Nov 2020 13:59:48 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1khdXP-0007iD-9a; Tue, 24 Nov 2020 13:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=66ZFsb6jdaX3PcirZCRWP0eudLSU+JoDcAIZXyYZ3V0=; 
 b=C5KCS6UNRp98XBW5gQKC/q4vKP3aN6MUYXgvlGPHpt8/nRF7h262jh0KnLrGTv5KUit0R8u8ga8KAEojR+XOQPGyaOuU/eIbaF36hxJsxIGR/ACqpZqEnlxONezQWjkVi9EIr5/FLyU6IOt2TT88GNkzj5vBIrIef9LCl/e2ptyHv0MzF9Gmr4a8uRIDUnTpjtx2Y4/KV3EFS/tTk7x/sYqMJ19aPmlmXkzunNWi53hIrgudcxNkveiM86zHrzonb0Y29rjIYTmZPKYU9hRg1XNLyH0dC/GWJyrVJ0Fp8odbVDWDYrXf8FJ8ZmeK27tn5d8QhktKojwi/XUloPMLlA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1khdWq-0005aT-Ol; Tue, 24 Nov 2020 19:59:04 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1khdWq-000796-Eb; Tue, 24 Nov 2020 19:59:04 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 1/1] Fix qcow2 corruption on discard
In-Reply-To: <20201124091723.GA22385@merkur.fritz.box>
References: <20201123154929.330338-1-mlevitsk@redhat.com>
 <20201123154929.330338-2-mlevitsk@redhat.com>
 <20201123173853.GE5317@merkur.fritz.box>
 <776008a350e47a33adbe659aa4ba106b6a2daf5f.camel@redhat.com>
 <20201124091723.GA22385@merkur.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 24 Nov 2020 19:59:04 +0100
Message-ID: <w51lfeqzimf.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, zhang_youjia@126.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 andrey.shinkevich@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 24 Nov 2020 10:17:23 AM CET, Kevin Wolf wrote:
> We can then continue work to find a minimal reproducer and merge the
> test case in the early 6.0 cycle.

I haven't been able to reproduce the problem yet, do you have any
findings?

Berto

