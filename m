Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678323CB41
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 15:45:54 +0200 (CEST)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3Jjt-0001JZ-7V
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 09:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k3Jiq-0000jL-Tm; Wed, 05 Aug 2020 09:44:48 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:46875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1k3Jin-0004Ky-1x; Wed, 05 Aug 2020 09:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=8QCcUP3ef+csm/XYFm9OrXf4WRlBdBRpb2Im0OB/ee0=; 
 b=NPZ5M8/BqO0Bl4lKVg8//ePjXG6d7mUNjb1M+sT3QnVoQmZZ2im9C8GY6lliHWQdf2GHny+YilZ/IbA81opENcc4jDMpq/AKlJ/s4ewEqcGmHlZ1z/LraQN7Kei3Dl1+aKv16KSafdmV1RAB77UI2xAzAiprxVOlwL+0AVX7uUKSqWH7M4WiZ72RM9yCaEr3ISsR8WZv6rBeXGTVDVBzOs+ZnC5GuKzUyTkbcfGYEw9ZjamxilTfMgHHJIt1eSUd6uGX18NpE+0mB7+MBnxoCBh4yVVyuWVnvgsoZYTEz3HaAPr+F7M8OSvsDB6UziQKtU+CvAw/fxy+WcCEgMwiAw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1k3JiC-0007Qj-NP; Wed, 05 Aug 2020 15:44:08 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1k3JiC-00031G-CI; Wed, 05 Aug 2020 15:44:08 +0200
From: Alberto Garcia <berto@igalia.com>
To: Tuguoyi <tu.guoyi@h3c.com>, "kwolf\@redhat.com" <kwolf@redhat.com>,
 "mreitz\@redhat.com" <mreitz@redhat.com>,
 "qemu-block\@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: [PATCH] qcow2-cluster: Fix integer left shift error in
 qcow2_alloc_cluster_link_l2()
In-Reply-To: <81ba90fe0c014f269621c283269b42ad@h3c.com>
References: <81ba90fe0c014f269621c283269b42ad@h3c.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 05 Aug 2020 15:44:08 +0200
Message-ID: <w51imdxb42f.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 09:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Chengchiwen <chengchiwen@h3c.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Gaoliang <liang_gao@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 05 Aug 2020 11:22:58 AM CEST, Tuguoyi wrote:
> This patch fix it by casting @i to uint64_t before doing left shift
> operation

The patch seems fine and I also think that it's perhaps worth a test
case (although it only seems to happen with preallocation=falloc or full
so the test would need to generate very large files).

But I also wonder if there are other cases where this can happen.

nb_clusters is an int and there are more cases of

    nb_clusters << s->cluster_bits

I can see at least these: handle_alloc(), qcow2_free_any_clusters(),
qcow2_alloc_cluster_abort().

Berto

