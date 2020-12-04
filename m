Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEC2CF068
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 16:09:59 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCib-0007I6-W8
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 10:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klChe-0006m4-1b; Fri, 04 Dec 2020 10:08:58 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:41312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1klChb-0002SI-Tf; Fri, 04 Dec 2020 10:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=AlFU2E+8U3TNC1n1bIwPKPXZjDZ0RWuyT/+YSIK0SVY=; 
 b=Ca7Oyg8+zK1S9o8FuzHjcIGzCE+4EXM4M2ocGr8BPs0Be01b5YUIoSXILpCr0mEwBte0/WUsHNsaRrEgiNum2OHI+JXOeeWPSbcNXwtZu/0GaHOKXFiXGhelcXYwqTd43PWLdOrV2RCUTAxby2cHzQqgFWTFdhxIRcnkOtdxgOwgc+fQXtwguJ5/w4GZsX+0iKgXbgUkZk0o6vX6D5RsPh5YJ8l0VSsevEJIlEBeYF9sfTk7pgmQTP1ldprEd10hTIn5YZev2qjsQQaKz7+Js9h9UknoVrei8Viy9oQ2DK30iRYg+dy8MxtdUxZlcmlUrLn0+FNg6Tw/3nkZW+g9aw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1klChV-0002oe-2j; Fri, 04 Dec 2020 16:08:49 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1klChU-00007j-PK; Fri, 04 Dec 2020 16:08:48 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 2/4] block/io: bdrv_refresh_limits(): use ERRP_GUARD
In-Reply-To: <20201203222713.13507-3-vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 04 Dec 2020 16:08:48 +0100
Message-ID: <w51360lr4lb.fsf@maestria.local.igalia.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 03 Dec 2020 11:27:11 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> This simplifies following commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

