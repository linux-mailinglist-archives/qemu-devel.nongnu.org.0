Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235043792D5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:35:49 +0200 (CEST)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7wg-0007Lt-Jr
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7ul-000595-Fn; Mon, 10 May 2021 11:33:47 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lg7uf-0005Ym-Nf; Mon, 10 May 2021 11:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=M0Kl2WhzH6oTbJ+OuomZ0YkqSmX4JDk9b67VZh51jcU=; 
 b=mnU0hHFDGcy4tzzivSvzG1SibBwHFJxWZSrsXg01BnwdryajW1SYtSznNY5dL7JhTARCqm+gOFCjyChcAl1/HCHbkAEYsLJ4zUJXy5uCM7LiuKfmRB+iz9ihdZR5QJuWS84m0Gx7G8K9+3WqJAZ3YAZsY0YfJP5j61r9i1VUY6duG7LwKBwutE6cqEU6GeNGdwUzJDZeSnpO/d3yF1Toa8tJgKTUktw11gJwPXdZtGvBMrm1H13x/y1xxh6FTJ57f8YDu8CyztbwKtGZQv7D+P5fVwp9iwFkRiSQkXEPcOka3lt+xA/9oGlhCy3i8K/2i2omkBgxiwDx9KZ+tdwrvg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lg7ud-00033u-S3; Mon, 10 May 2021 17:33:39 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lg7ud-0001J3-IN; Mon, 10 May 2021 17:33:39 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 4/5] block: simplify bdrv_child_user_desc()
In-Reply-To: <20210504094510.25032-5-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 10 May 2021 17:33:39 +0200
Message-ID: <w51im3qwqlo.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 04 May 2021 11:45:09 AM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> All existing parent types (block nodes, block devices, jobs) has the
> realization. So, drop unreachable code.

s/has/have/ , and I'm not sure what "have the realization" means

>  static char *bdrv_child_user_desc(BdrvChild *c)
>  {
> -    if (c->klass->get_parent_desc) {
> -        return c->klass->get_parent_desc(c);
> -    }
> -
> -    return g_strdup("another user");
> +    return c->klass->get_parent_desc(c);
>  }

Should we also assert(c->klass->get_parent_desc) ?

Berto

