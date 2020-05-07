Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3461C953A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 17:37:57 +0200 (CEST)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWiay-0000yE-8I
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 11:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWiXZ-0005wK-1j; Thu, 07 May 2020 11:34:25 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jWiXW-0002ic-Kj; Thu, 07 May 2020 11:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=hmc9d8LEjTGku7G2S1gQx/HH3T+y7yzQi1vHDFfqxmk=; 
 b=OwNv70lA/ZRDaDGP+3XwPr4mqcdktml9jSWuosczMoSXKXyjtotcBIcFovB2ru8IGvpwC7nGrH/m9y4ZAPo1sT0KiGVZLrBb0wLo++leT777kEIpgg3qMTErhYq6djCPpc0fb2r9L7kxOkqqvqF+8ohOoN7xszFprPWRZkrdR7n1pUWMus5oMx/+hon5+sqEPPfqkYXq9wxkmmC9DDtvusDtQAoA6oWCPpbKAhBXky+7UTFaFFyVGixGBRm1I0tnnj3+6AUqDwsQ33bpk08Gyv8EEzc9GLVa4gTHVLck7z6iX+11bXGKfWYiJOsjFD+WpiBzANGRB/0NjjVTdGIlfw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jWiXS-000803-NY; Thu, 07 May 2020 17:34:18 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jWiXS-0008GV-E1; Thu, 07 May 2020 17:34:18 +0200
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 19/31] qcow2: Add subcluster support to
 calculate_l2_meta()
In-Reply-To: <9478ac11-8cae-4576-345e-3acf9e287119@redhat.com>
References: <cover.1588699789.git.berto@igalia.com>
 <907ab6846b93b441a27eb6853ff3058f1c821bf9.1588699789.git.berto@igalia.com>
 <12569151-2f16-f136-6928-2a915b25120b@redhat.com>
 <w517dxp9ea6.fsf@maestria.local.igalia.com>
 <9478ac11-8cae-4576-345e-3acf9e287119@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 07 May 2020 17:34:18 +0200
Message-ID: <w51a72jn4hx.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 10:37:24
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 06 May 2020 07:39:48 PM CEST, Eric Blake wrote:
>   In fact, if we rely on 20/31 checking for invalid subclusters when
> computing nb_clusters, we could probably assert that the start and end
> cluster in this function are not invalid, instead of adding the fail:
> label.

I think you're right with that, good catch! There's no need to return an
error code in this function.

Berto

