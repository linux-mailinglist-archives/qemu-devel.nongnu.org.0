Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8119310AD4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 13:04:07 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zqI-0003Hs-Gb
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 07:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7znl-0002Yh-4s; Fri, 05 Feb 2021 07:01:32 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7zng-00057O-NV; Fri, 05 Feb 2021 07:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=abEhxL2ioOVOserXFe0KfGvky7ZbGIBWUWdtJfk6WYQ=; 
 b=m0cpPJRZvPoqDVOagWws+pS6LxFyO3cdmoWm9aXkJ2cam8hiv0IgTvbIBqNeSpo+D4+fxiJvV5pDAAlkuBrYqCIY2Wcchy27nuAMnVzEAdDFpjS107orpeulg6PJlyl1zozIZBM18pqkzAkt60QiGgsHiKJmxxryFLtbvdj3NwlVQ+6Jzl8nMs5GD/krXH+/qNfp0mcBn2MsOjPqHCFrMXYYbrEcJPZe/tmQn00Oxy24lkJFF/TbgeVqDqbBwlEfSOYxXM6SNSMwePAWGG3rgeQHEkU0KUbdAw7vR4Po3wea//cima8QZz1wjhGDHL3LagJXdExYYSLVavk+cDgyAw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l7znb-0006O9-Di; Fri, 05 Feb 2021 13:01:19 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l7znb-0003zJ-3J; Fri, 05 Feb 2021 13:01:19 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v7 08/14] block/qcow2: qcow2_get_specific_info(): drop
 error propagation
In-Reply-To: <f5c4c064-166f-a2bd-8d86-1c25a3c26646@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-9-vsementsov@virtuozzo.com>
 <w51lfc2bv08.fsf@maestria.local.igalia.com>
 <f5c4c064-166f-a2bd-8d86-1c25a3c26646@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 05 Feb 2021 13:01:19 +0100
Message-ID: <w51im76bu5s.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 05 Feb 2021 12:52:03 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> However the new code only uses and updates 'info_list' and it does not
>> keep the head anywhere, so what the caller gets is a pointer to the
>> tail.
>> 
>
> No. *info_list is modified only on the first loop iteration. And than
> info_list is switched to &(*(info_list))->next, so on second iteration
> we will modify @next field of first element, not original *info_list.

Right, I see!

I find it a bit confusing, 'info_list' is at the same time a return
value and a local variable that you use to iterate over the list.

Anyway,

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

